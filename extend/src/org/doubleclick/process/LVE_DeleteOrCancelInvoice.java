/* Product: Adempiere ERP & CRM Smart Business Solution                       *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * Copyright (C) 2003-2007 e-Evolution,SC. All Rights Reserved.               *
 * Contributor(s): Rafael Tomás Salazar Colmenárez www.dcsla.com    		  *
 *****************************************************************************/
package org.doubleclick.process;


import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.logging.Level;


import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;

import org.compiere.util.Env;


/**
 *	Venezuela 
 *  LVE_DeleteOrCancelInvoice
 *  @author Rafael Tomás Salazar Colmenárez rsalazar@dcsla.com - rtsc08@gmail.com
 *  @version $Id: LVE_DeleteOrCancelInvoice  2011/08/01  $
 */
public class LVE_DeleteOrCancelInvoice extends SvrProcess
{
	
	/**	Org						*/
	private int			p_AD_Org_ID = 0;	
	/** Client                  */
	private int         p_AD_Client_ID=0;
	/**	Invoice		*/
	private int 	    p_C_Invoice_ID = 0;
	/** BPartner				*/
	private int			p_C_BPartner_ID = 0;
	/** Action				*/
	private String		p_Action = null;
	/** Description				*/
	private String		p_Description = null;

	
	
	
	/**
	 *  Prepare - e.g., get Parameters.
	 */
	protected void prepare()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (para[i].getParameter() == null)
				;
			else if (name.equals("AD_Org_ID"))
				p_AD_Org_ID = para[i].getParameterAsInt();
			else if (name.equals("AD_Client_ID"))
				p_AD_Client_ID = para[i].getParameterAsInt();
			else if (name.equals("C_BPartner_ID"))
				p_C_BPartner_ID = para[i].getParameterAsInt();
			else if (name.equals("C_Invoice_ID"))
				p_C_Invoice_ID = para[i].getParameterAsInt();
			else if (name.equals("Action"))
				p_Action = ((String) para[i].getParameter());
			else if (name.equals("Description"))
				p_Description = ((String) para[i].getParameter());
			
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}

	}	

	/**
	 *	@return info
	 *	@throws Exception
	 */
	protected String doIt () throws Exception
	{
		String msg="Error...";
		String sql = ""
			+ "SELECT a.payDocumente , a.order "
			+ "FROM   (SELECT ci.c_order_id as order , cp.documentno as payDocumente , ci.* "
			+ "        FROM   c_invoice ci "
			+ "               INNER JOIN c_payment cp "
			+ "                 ON ci.c_invoice_id = cp.c_invoice_id "
			+ "        UNION ALL "
			+ "        SELECT cin.c_order_id as order , cpt.documentno as payDocumente  , cin.*  "
			+ "        FROM   c_invoice cin "
			+ "               INNER JOIN c_paymentallocate ca "
			+ "                 ON cin.c_invoice_id = ca.c_invoice_id" 
			+ "               INNER JOIN c_payment cpt " 
			+ "                 ON cpt.c_payment_id= ca.c_invoice_id "
			+ "                                                      ) a "
			+ "WHERE  a.ad_org_id = '"+p_AD_Org_ID+"' "
			+ "       AND a.ad_client_id = '"+p_AD_Client_ID+"' "
			+ "       AND a.c_invoice_id = '"+p_C_Invoice_ID+"' "
			+ "       AND a.c_bpartner_id = '"+p_C_BPartner_ID+"'";

		
		String sqlmatchi=  "SELECT mm.m_matchinv_id "
						+ "FROM   m_matchinv mm "
						+ "       INNER JOIN c_invoiceline cil "
						+ "         ON mm.c_invoiceline_id = cil.c_invoiceline_id "
						+ "       INNER JOIN c_invoice ci "
						+ "         ON cil.c_invoice_id = ci.c_invoice_id "
						+ "WHERE  ci.c_invoice_id = '"+p_C_Invoice_ID+"' "
						+ " 	   AND ci.ad_org_id = '"+p_AD_Org_ID+"' "
						+ " 	   AND ci.ad_client_id = '"+p_AD_Client_ID+"' ";
		

		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, null);
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				
				return "No se puede eliminar la factura esta relacionada al pago " + rs.getString(1);
			}else{
				
				int user= Env.getContextAsInt(getCtx(), "#AD_User_ID");
				
				String sqlres= ""
							+	" INSERT INTO LVE_CInvoiceDelete ( "
                            +   " SELECT  *  , " 
                            +   "         now() AS deleted, " 
                            +   "         '" + user + "' AS deletedby " 
                            +   " FROM c_invoice " 
                            +   " WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
    						+   "       AND ad_client_id = '"+p_AD_Client_ID+"' "
    						+   "       AND c_invoice_id = '"+p_C_Invoice_ID+"' "
    						+   "       AND c_bpartner_id = '"+p_C_BPartner_ID+"' )";
				
				int nores = DB.executeUpdate(sqlres, null);
				log.fine("LVE_DeleteOrCancelInvoice -> LVE_CInvoiceDelete insert #" + nores);
				
				
				
				String sqlres2= ""
					+	" INSERT INTO LVE_FactAcctDelete ( "
                    +   " SELECT  *  , " 
                    +   "         now() AS deleted, " 
                    +   "         '" + user + "' AS deletedby " 
                    +   " FROM fact_acct " 
                	+   " WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
					+   "       AND ad_client_id = '"+p_AD_Client_ID+"' "
					+ 	"       AND  record_id= '"+p_C_Invoice_ID+"' "
					+ 	"       AND c_bpartner_id = '"+p_C_BPartner_ID+"'"
				    + 	"       AND ad_table_id = '318' ) ";

		
				int nores2 = DB.executeUpdate(sqlres2, null);
				log.fine("LVE_DeleteOrCancelInvoice -> LVE_FactAcctDelete insert #" + nores2);
	
		
				String sqldel2 = ""
					+ "DELETE FROM fact_acct "
					+ "WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
					+ "       AND ad_client_id = '"+p_AD_Client_ID+"' "
					+ "       AND  record_id= '"+p_C_Invoice_ID+"' "
					+ "       AND c_bpartner_id = '"+p_C_BPartner_ID+"'"
				    + "       AND ad_table_id = '318' ";

				int no2 = DB.executeUpdate(sqldel2, null);
				log.fine("LVE_DeleteOrCancelInvoice -> fact_acct deleted #" + no2);
				
				sqlres2= ""
					+	" INSERT INTO LVE_FactAcctDelete ( "
                    +   " SELECT  *  , " 
                    +   "         now() AS deleted, " 
                    +   "         '" + user + "' AS deletedby " 
                    +   " FROM fact_acct " 
                	+   " WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
					+   "       AND ad_client_id = '"+p_AD_Client_ID+"' "
					+ 	"       AND  record_id in ( " 
					+   sqlmatchi
					+ 	"       AND c_bpartner_id = '"+p_C_BPartner_ID+"'"
				    + 	"       AND ad_table_id = '472' ) ";

		
				nores2 = DB.executeUpdate(sqlres2, null);
				log.fine("LVE_DeleteOrCancelInvoice -> LVE_FactAcctDelete insert #" + nores2);
	
		
				sqldel2 = ""
					+ "DELETE FROM fact_acct "
					+ "WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
					+ "       AND ad_client_id = '"+p_AD_Client_ID+"' "
					+ "       AND  record_id in ( " 
					+ sqlmatchi
					+ ")      AND c_bpartner_id = '"+p_C_BPartner_ID+"'"
				    + "       AND ad_table_id = '472' ";

				no2 = DB.executeUpdate(sqldel2, null);
				log.fine("LVE_DeleteOrCancelInvoice -> fact_acct deleted #" + no2);
				
				sqldel2 = ""
					+ " DELETE FROM m_matchinv "
					+ " WHERE  m_matchinv_id in ( " 
					+ sqlmatchi +" )";

				no2 = DB.executeUpdate(sqldel2, null);
				log.fine("LVE_DeleteOrCancelInvoice -> m_matchinv deleted #" + no2);
				
				
				String sqlmatchpo = ""
					+ " DELETE FROM m_matchpo "
					+ " WHERE  m_matchpo_id in ( "
								+ "SELECT mp.m_matchpo_id "
								+ "FROM   m_matchpo mp "
								+ "       INNER JOIN c_invoiceline cil "
								+ "         ON mp.c_invoiceline_id = cil.c_invoiceline_id "
								+ "       INNER JOIN c_invoice ci "
								+ "         ON cil.c_invoice_id = ci.c_invoice_id "
								+ " WHERE  ci.c_invoice_id = '"+p_C_Invoice_ID+"' " 
								+ " 	   AND ci.ad_org_id = '"+p_AD_Org_ID+"' "
								+ " 	   AND ci.ad_client_id = '"+p_AD_Client_ID+"' "
								+" )";

				no2 = DB.executeUpdate(sqlmatchpo, null);
				log.fine("LVE_DeleteOrCancelInvoice -> m_matchpo deleted #" + no2);
				
				String sqlcostd = ""
					+ " DELETE FROM m_costdetail " 
					+ " WHERE  c_invoiceline_id in ( "
					+ "					SELECT cil.c_invoiceline_id "
					+ "					FROM   c_invoiceline cil "
					+ "  					     INNER JOIN c_invoice ci "
					+ "       					  ON cil.c_invoice_id = ci.c_invoice_id "
					+ " 				WHERE  ci.c_invoice_id = '"+p_C_Invoice_ID+"' " 
					+ " 	   					AND ci.ad_org_id = '"+p_AD_Org_ID+"' "
					+ " 	   					AND ci.ad_client_id = '"+p_AD_Client_ID+"' "
					+" )";


				no2 = DB.executeUpdate(sqlcostd, null);
				log.fine("LVE_DeleteOrCancelInvoice -> m_costdetail deleted #" + no2);
				
				String sqlinout = ""
					+ " DELETE FROM m_inout " 
					+ " 	WHERE  ci.c_invoice_id = '"+p_C_Invoice_ID+"' " 
					+ " 	   	AND ci.ad_org_id = '"+p_AD_Org_ID+"' "
					+ " 	   	AND ci.ad_client_id = '"+p_AD_Client_ID+"' ";
				
				no2 = DB.executeUpdate(sqlinout, null);
				log.fine("LVE_DeleteOrCancelInvoice -> m_inout deleted #" + no2);
				
				String sqlupd = ""
					+ "UPDATE c_orderline "
					+ "SET    qtyinvoiced = 0 "
					+ "WHERE  c_order_id IN (SELECT co.c_order_id "
					+ "                      FROM   c_invoice ci "
					+ "                             INNER JOIN c_order co "
					+ "                               ON ci.c_order_id = co.c_order_id "
					+ "                      WHERE  ci.c_invoice_id = '"+p_C_Invoice_ID+"') "
					+ "       AND ad_org_id = '"+p_AD_Org_ID+"' "
					+ "       AND ad_client_id = '"+p_AD_Client_ID+"' "
					+ "       AND c_bpartner_id = '"+p_C_BPartner_ID+"'";

				int no3 = DB.executeUpdate(sqlupd, null);
				log.fine("LVE_DeleteOrCancelInvoice -> c_orderline Update #" + no3);
				
				if (p_Action.equals("D")){
					
					String sqldel3 = ""
						+ "DELETE FROM lco_invoicewithholding "
						+ "WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
						+ "       AND ad_client_id = '"+p_AD_Client_ID+"' "
						+ "       AND c_invoice_id = '"+p_C_Invoice_ID+"' ";
	
					no3 = DB.executeUpdate(sqldel3, null);
					log.fine("LVE_DeleteOrCancelInvoice -> lco_invoicewithholding  deleted #" + no3);
					
					String sqldel1 = ""
						+ "DELETE FROM c_invoice "
						+ "WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
						+ "       AND ad_client_id = '"+p_AD_Client_ID+"' "
						+ "       AND c_invoice_id = '"+p_C_Invoice_ID+"' "
						+ "       AND c_bpartner_id = '"+p_C_BPartner_ID+"'";
	
					int no1 = DB.executeUpdate(sqldel1, null);
					msg=" Factura(s) eliminada(s): " + no1 ;
					log.fine("LVE_DeleteOrCancelInvoice -> c_invoice  deleted #" + no1);
					
				}else{
					
					
				
				
					String sqlupd2 = ""
						+ "UPDATE c_invoice "
						+ "SET    description = isnull(description, '')  || ' -> " + p_Description + "' , isactive='N', c_order_id=null "
						+ "WHERE  ad_org_id = '"+p_AD_Org_ID+"' "
						+ "       AND ad_client_id = '"+p_AD_Client_ID+"' "
						+ "       AND c_invoice_id = '"+p_C_Invoice_ID+"' "
						+ "       AND c_bpartner_id = '"+p_C_BPartner_ID+"'";

					int no4 = DB.executeUpdate(sqlupd2, null);
					msg=" Factura(s) Anuladas(s): " + no4 ;
					log.fine("LVE_DeleteOrCancelInvoice -> c_Invoice Update #" + no4);
				}
				
							
			}
			pstmt.close();

		}
		
		catch (Exception e)
		{
			log.log(Level.SEVERE, sql, e);
		}
		
		return "Proceso completado. " + msg;
	}	
	
	
		
	
}	

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

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MBankStatement;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MClient;
import org.compiere.model.MCurrency;
import org.compiere.model.MDocType;
import org.compiere.model.MInOut;
import org.compiere.model.MInOutLine;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MInvoicePaySchedule;
import org.compiere.model.MInvoiceSchedule;
import org.compiere.model.MLocation;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderPaySchedule;
import org.compiere.model.MPayment;
import org.compiere.model.PO;
import org.compiere.process.DocAction;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.Language;

/**
 *	Venezuela 
 *  LVE_DeletePayment
 *  @author Rafael Tomás Salazar Colmenárez rsalazar@dcsla.com - rtsc08@gmail.com
 *  @version $Id: LVE_DeleteOrCancelInvoice  2011/08/01  $
 */
public class LVE_DeletePayment extends SvrProcess
{
	
	/**	Org						*/
	private int			p_AD_Org_ID = 0;	
	/** Client                  */
	private int         p_AD_Client_ID=0;
	/**	Payment		*/
	private int 	    p_C_Payment_ID = 0;
	/** BPartner				*/
	private int			p_C_BPartner_ID = 0;


	
	
	
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
			else if (name.equals("C_Payment_ID"))
				p_C_Payment_ID = para[i].getParameterAsInt();
						
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
		String msg="";
		
		MPayment pay = new MPayment(getCtx(), p_C_Payment_ID, get_TrxName());
		
		if (pay.isReconciled()){
			String sql = "Select Name from C_BankStatementLine bl "
					+ "inner join c_BankStatement b on bl.C_BankStatement_ID = b.C_BankStatement_ID "
					+ "where bl.C_Payment_ID = "+p_C_Payment_ID
					+ " and b.DocStatus in ('CO','CL') ";
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String NameBankStatement = null;
			try
			{
				pstmt = DB.prepareStatement(sql, null);
				rs = pstmt.executeQuery();
				if (rs.next()){
					NameBankStatement = rs.getString(1);
				}
			}
			catch (Exception e)
			{
				log.log(Level.SEVERE, sql, e);
			}
			
			rs.close();
			pstmt.close();
			
			msg = "Error Pago ya fue conciliado en : "+NameBankStatement;
			return msg;
		}
		
		String sql = ""
			+ "SELECT C_Invoice_ID FROM C_Payment " 
			+ " Where C_Payment_ID= '" +p_C_Payment_ID+"'";

		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String  invoices="";
		try
		{
			pstmt = DB.prepareStatement(sql, null);
			rs = pstmt.executeQuery();
			if (rs.next() && Integer.valueOf(rs.getInt(1)) !=0)
			{
				invoices= "'"+String.valueOf((rs.getInt(1)))+"'"; 
			}else{
				
				String sql2 = ""
					+ "SELECT C_Invoice_ID FROM c_allocationline " 
					+ " Where C_Payment_ID= '" +p_C_Payment_ID+"'";

				
				PreparedStatement pstmt2 = null;
				ResultSet rs2 = null;
				pstmt2 = DB.prepareStatement(sql2, null);
				rs2 = pstmt2.executeQuery();
				while (rs2.next()){
			    	invoices+= "'"+String.valueOf((rs2.getInt(1)))+"',";
			    }
			    invoices+="'0'";
			    pstmt2.close();
			}
			String sqlupd = ""
				+ "UPDATE c_invoice "
				+ "SET    ispaid='N' "
				+ "WHERE c_invoice_id in (" + invoices+ ")";
			
		    int no1 = DB.executeUpdate(sqlupd, null);
			log.fine("LVE_DeletePaymente -> c_invoice Update #" + no1);
			msg+= (no1<0) ?" Error... LVE_DeletePaymente." :"";

			String sqldel= ""
							+ "DELETE FROM lco_invoicewithholding "
							+ "WHERE  lco_invoicewithholding_id IN (SELECT lco_invoicewithholding_id "
							+ "                                     FROM   lve_paymentwithholding "
							+ "                                     WHERE  c_payment_id = '"+p_C_Payment_ID+"') ";

			 int no2 = DB.executeUpdate(sqldel, null);
			 log.fine("LVE_DeletePaymente -> lco_invoicewithholding Delete #" + no2);
			 msg+= (no2<0) ?" Error... LVE_DeletePaymente." :"";

			 
			 String sqldelFacAcc= ""
					+ "DELETE FROM fact_acct "
					+ "WHERE   ad_table_id= '735' and record_id in ( "
					+ 							"SELECT c_allocationhdr_id "
					+ 							"FROM   c_allocationline "
					+ 							"WHERE  c_payment_id =  '"+p_C_Payment_ID+"') ";

			 int no3 = DB.executeUpdate(sqldelFacAcc, null);
			 log.fine("LVE_DeletePaymente -> fact_acct Delete #" + no3);
			 msg+= (no3<0) ?" Error... LVE_DeletePaymente." :"";

		
			 sqldelFacAcc = ""
				 + "DELETE FROM fact_acct "
				 + "WHERE  record_id IN (SELECT c_allocationhdr_id "
				 + "                     FROM   c_allocationline "
				 + "                     WHERE  c_payment_id = '"+p_C_Payment_ID+"') "
				 + "       AND ad_table_id = '735' ";
			 no3 = DB.executeUpdate(sqldelFacAcc, null);
			 log.fine("LVE_DeletePaymente -> fact_acct Delete #" + no3);
			 msg+= (no3<0) ?" Error... LVE_DeletePaymente." :"";

			 
			 String sql3 = ""
				 + "   SELECT c_allocationhdr_id "
				 + "   FROM   c_allocationline "
				 + "    WHERE  c_payment_id = '"+p_C_Payment_ID+"'";

				
			PreparedStatement pstmt3 = null;
			ResultSet rs3 = null;
			pstmt3 = DB.prepareStatement(sql3, null);
			rs3 = pstmt3.executeQuery();
			String allocationhdr="";
			while (rs3.next()){
				allocationhdr+= "'"+String.valueOf((rs3.getInt(1)))+"',";
		    }
			allocationhdr+="'0'";
		    pstmt3.close();
		 
			 sqldel = ""
				 + "DELETE FROM c_allocationline "
				 + "WHERE  c_payment_id = '"+p_C_Payment_ID+"' ";
			 no2 = DB.executeUpdate(sqldel, null);
			 log.fine("LVE_DeletePaymente -> c_allocationline Delete #" + no2);
			 msg+= (no2<0) ?" Error... LVE_DeletePaymente." :"";


			 sqldel = ""
				 + "DELETE FROM  c_allocationhdr "
				 + "WHERE  c_allocationhdr_id IN ("+allocationhdr+") ";

			 no2 = DB.executeUpdate(sqldel, null);
			 log.fine("LVE_DeletePaymente -> c_allocationhdr Delete #" + no2);
			 msg+= (no2<0) ?" Error... LVE_DeletePaymente." :"";

			 
			 sqldel = ""
				 + "DELETE FROM c_payment "
				 + "WHERE  c_payment_id = '"+p_C_Payment_ID+"' ";
			 no2 = DB.executeUpdate(sqldel, null);
			 log.fine("LVE_DeletePaymente -> c_payment Delete #" + no2);
			 msg+= (no2<0) ?" Error... LVE_DeletePaymente." :"";

			 
				
			

		}
		
		catch (Exception e)
		{
			log.log(Level.SEVERE, sql, e);
		}
		
		return (msg=="") ? "Proceso completado. " : msg ;
	
	}	
	
	
		
	
}	

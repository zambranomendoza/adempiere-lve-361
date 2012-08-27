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
import org.compiere.model.MRfQ;
import org.compiere.model.MRfQLine;
import org.compiere.model.MRfQLineQty;
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
public class LVE_RequisitionToRfq extends SvrProcess
{
	/**	Org						*/
	private int			p_AD_Org_ID = 0;	
	/** Client                  */
	private int         p_AD_Client_ID=0;
	/**	Requisition		*/
	private int 	    p_M_Requisition_ID = 0;
	/**	RFQ		*/
	private int 	    p_C_Rfq_ID = 0;
	

	
	
	
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
			else if (name.equals("M_Requisition_ID"))
				p_M_Requisition_ID = para[i].getParameterAsInt();
			else if (name.equals("C_RfQ_ID"))
				p_C_Rfq_ID = para[i].getParameterAsInt();
			
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

		String sql = ""
			+ "SELECT m_product_id, "
			+ "       qty, "
			+ "       description, "
			+ "       line "
			+ "FROM   m_requisitionline "
			+ "WHERE  m_requisition_id = " + p_M_Requisition_ID;


		
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				pstmt = DB.prepareStatement(sql, null);
				rs = pstmt.executeQuery();
				String sqlInsert= "";
				MRfQ mrfq = new MRfQ(getCtx(),p_C_Rfq_ID, null);
				
				while (rs.next()){
					
                    //Copy Lines
					MRfQLine newLine = new MRfQLine ( mrfq);
					newLine.setLine(rs.getInt(4));
					newLine.setDescription(rs.getString(3));
				    newLine.setM_Product_ID(rs.getInt(1));
				    newLine.saveEx();
					//	Copy Qtys
					MRfQLineQty newQty = new MRfQLineQty (newLine);
					newQty.setC_UOM_ID(100);
					newQty.setQty(rs.getBigDecimal(2));
					newQty.saveEx();				
				
			    }
			   
			    pstmt.close();
			    return  "Proceso completado. "  ;
		}
		
	
}	

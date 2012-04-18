/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
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
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.doubleclick.process;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;

import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.doubleclick.model.LVE_MInvoice;
 
/**
 *	LVE_GenerateWithholding
 *
 *  @author Rafael Salazar C. - rtsc08@gmail.com Double Click Sistemas http://www.dcsla.com
 */
public class LVE_GenerateWithholding extends SvrProcess
{

	/** The Record						*/
	private int		p_Record_ID = 0;
	
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
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}
		p_Record_ID =  getRecord_ID();

	}	//	prepare

	/**
	 * 	Process
	 *	@return message
	 *	@throws Exception
	 */
	protected String doIt() throws Exception
	{
		int cnt = 0;
		int c_invoice= 0;
		int c_payment_id = 0;
		

		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try
		{
			if (getTable_ID()==335 ){
				String sql = ""
					+ "SELECT c_invoice_id "
					+ "FROM   c_payment "
					+ "WHERE  c_payment_id = '"+p_Record_ID+"' ";
				pstmt = DB.prepareStatement(sql, null);
				rs = pstmt.executeQuery();
				if (rs.next() ){
					c_invoice=rs.getInt(1);
					c_payment_id=p_Record_ID;
				}
			}	else if (getTable_ID()==812)  {
				String sql2 = ""
					+ "SELECT c_invoice_id, c_payment_id "
					+ "FROM   c_paymentallocate "
					+ "WHERE  c_paymentallocate_id = '"+p_Record_ID+"' ";
				PreparedStatement pstmt2 = null;
				ResultSet rs2 = null; 
				pstmt2 = DB.prepareStatement(sql2, null);
				rs2 = pstmt2.executeQuery();				
				if (rs2.next() ){
					c_invoice=rs2.getInt(1);
					c_payment_id=rs2.getInt(2);
				}
			}
				
		}
		catch (SQLException e)
		{
		log.log(Level.SEVERE, null, e);
		return e.getLocalizedMessage();
		}
		finally
		{
		DB.close(rs, pstmt);
		}

		LVE_MInvoice inv = new LVE_MInvoice(getCtx(), c_invoice , get_TrxName());
		if (inv.getC_Invoice_ID() == 0)
			throw new AdempiereUserError("@No@ @Invoice@");

		cnt = inv.recalcWithholdings(c_payment_id);
		if (cnt>0){
			
		}
		
		if (cnt == -1)
			throw new AdempiereUserError("Error calculating withholding, please check log");

		return "@Inserted@=" + cnt;		
	}	//	doIt
	
	
	
}	//	LVE_GenerateWithholding
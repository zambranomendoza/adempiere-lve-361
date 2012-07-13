
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
 * Contributor(s): Rafael Tomás Salazar Colmenárez www.dcsla.com    		  * 
 *****************************************************************************/

package org.doubleclick.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;

import org.compiere.model.MClient;
import org.compiere.model.MInvoice;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.DB;


/**
 *	Validator for LVE_SolicitudC
 *	
 * @author Rafael Salazar C. - rsalazar@dcsla.com- rtsc08@gmail.com, Double Click Sistemas http://www.dcsla.com
 */
public class LVE_CInvoiceModel implements ModelValidator
{
	/**
	 *	Constructor.
	 *	The class is instantiated when logging in and client is selected/known
	 */
	public LVE_CInvoiceModel ()
	{
		super ();
	}	//	MyValidator
	
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(LVE_CInvoiceModel.class);
	/** Client			*/
	private int		m_AD_Client_ID = -1;
	
	/**
	 *	Initialize Validation
	 *	@param engine validation engine 
	 *	@param client client
	 */
	public void initialize (ModelValidationEngine engine, MClient client)
	{
		//client = null for global validator
		if (client != null) {	
			m_AD_Client_ID = client.getAD_Client_ID();
			log.info(client.toString());
		}
		else  {
			log.info("Initializing global validator: " + this.toString());
		}

			//	Documents to be monitored
			engine.addModelChange(MInvoice.Table_Name, this);

	}	//	initialize

    /**
     *	Model Change of a monitored Table.
     *	Called after PO.

     *	@exception Exception if the recipient wishes the change to be not accept.
     */
	public String modelChange (PO po, int type) throws Exception
	{
		MInvoice mInvoice =  (MInvoice) po;  
		
		if (po.get_TableName().equals(MInvoice.Table_Name) &&
			( type != ModelValidator.TYPE_DELETE  && 
			  type != ModelValidator.TYPE_BEFORE_DELETE  &&
			  type != ModelValidator.TYPE_AFTER_DELETE  	))
		{
			
			String code =  mInvoice.get_ValueAsString("PoReference");
			String LVE_controlNumber =  mInvoice.get_ValueAsString("LVE_controlNumber");
			Integer AD_Client_ID= mInvoice.get_ValueAsInt( "AD_Client_ID");
			Integer AD_Org_ID= mInvoice.get_ValueAsInt( "AD_Client_ID");
			Integer C_BPartner_ID= mInvoice.get_ValueAsInt( "C_BPartner_ID");
			Integer C_DocTypeTarget_ID = mInvoice.get_ValueAsInt("C_DocTypeTarget_ID"); 
			String C_Invoice_ID =  mInvoice.get_ValueAsString("c_invoice_id");
			if (code == null || code.trim().equals(""))
				return "";

			String sql = ""
				+ "SELECT * "
				+ "FROM   c_invoice "
				+ "WHERE  AD_Client_ID = '"+AD_Client_ID+"'"
				+ " AND  AD_Org_ID = '"+AD_Org_ID+"'"
				+ " AND  C_BPartner_ID = '"+C_BPartner_ID+"'"
				+ " AND  C_DocTypeTarget_ID = '"+C_DocTypeTarget_ID+"'"
				+"  AND PoReference= '"+ code +"'"
				+"  AND C_Invoice_ID <> '" + C_Invoice_ID + "'";
			
			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			
			
			String sql2 = ""
				+ "SELECT * "
				+ "FROM   c_invoice "
				+ "WHERE  AD_Client_ID = '"+AD_Client_ID+"'"
				+ " AND  AD_Org_ID = '"+AD_Org_ID+"'"
				+ " AND  C_BPartner_ID = '"+C_BPartner_ID+"'"
				+ " AND  C_DocTypeTarget_ID = '"+C_DocTypeTarget_ID+"'"
				+"  AND LVE_controlNumber= '"+ LVE_controlNumber +"'"
				+"  AND C_Invoice_ID <> '" + C_Invoice_ID + "'";
			
			PreparedStatement pstmt2 = null;
			ResultSet rs2 = null; 
			
			try
			{
				if (C_DocTypeTarget_ID!=1000002){
					pstmt = DB.prepareStatement(sql, null);
					rs = pstmt.executeQuery();
				
					if (rs.next() )
					{
						return "Ya existe el número del proveedor " +code;
							
					}
				}				
				pstmt2 = DB.prepareStatement(sql2, null);
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
				{
					return "Ya existe el número de control " +code;
						
				}
		
					
			}
			catch (SQLException e)
			{
				log.log(Level.SEVERE, sql, e);
				return e.getLocalizedMessage();
			}
			finally
			{
				DB.close(rs, pstmt);
			}


		}
		
	
		return null;
	}	//	modelChange
	
	/**
	 *	Validate Document.
	 *	Called as first step of DocAction.prepareIt 
     *	when you called addDocValidate for the table.
     *	Note that totals, etc. may not be correct.
	 *	@param po persistent object
	 *	@param timing see TIMING_ constants
     *	@return error message or null
	 */
	public String docValidate (PO po, int timing)
	{
		log.info(po.get_TableName() +  " Timing: " + timing);
		
		
		return null;
	}	//	docValidate



	/**
	 *	User Login.
	 *	Called when preferences are set
	 *	@param AD_Org_ID org
	 *	@param AD_Role_ID role
	 *	@param AD_User_ID user
	 *	@return error message or null
	 */
	public String login (int AD_Org_ID, int AD_Role_ID, int AD_User_ID)
	{
		log.info("AD_User_ID=" + AD_User_ID);
		return null;
	}	//	login

	
	/**
	 *	Get Client to be monitored
	 *	@return AD_Client_ID client
	 */
	public int getAD_Client_ID()
	{
		return m_AD_Client_ID;
	}	//	getAD_Client_ID

	
	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString ()
	{
		StringBuffer sb = new StringBuffer ("LVE_C_Invoice");
		return sb.toString ();
	}	//	toString
	
	
	
}	//	LVE_PayrollValidator
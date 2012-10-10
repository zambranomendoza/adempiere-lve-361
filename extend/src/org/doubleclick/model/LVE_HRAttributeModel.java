
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
 * Contributor(s): Jenny Cecilia Rodriguez Alvarado www.dcsla.com             *  
 *****************************************************************************/

package org.doubleclick.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.MClient;

import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.eevolution.model.MHRAttribute;
import org.eevolution.model.MHRProcess;

/**
 *	Validator for LVE_HRAttribute
 *	
 * @author Rafael Salazar C. - rsalazar@dcsla.com, Double Click Sistemas http://www.dcsla.com
 */
public class LVE_HRAttributeModel implements ModelValidator
{
	/**
	 *	Constructor.
	 *	The class is instantiated when logging in and client is selected/known
	 */
	
	private  boolean ejcutionValidation = true;
	public LVE_HRAttributeModel ()
	{
		super ();
	}	//	MyValidator
	
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(LVE_HRAttributeModel.class);
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
		engine.addModelChange(MHRAttribute.Table_Name, this);
		engine.addDocValidate(MHRProcess.Table_Name, this);
	}	//	initialize

    /**
     *	Model Change of a monitored Table.
     *	Called after PO.

     *	@exception Exception if the recipient wishes the change to be not accept.
     */
	public String modelChange (PO po, int type) throws Exception
	{ 
		MHRAttribute attribute = (MHRAttribute) po;
		if (po.get_TableName().equals(MHRAttribute.Table_Name) &&
				( type != ModelValidator.TYPE_BEFORE_DELETE && 
						type != ModelValidator.TYPE_DELETE &&
						type != ModelValidator.TYPE_AFTER_DELETE &&
						ejcutionValidation
					) 
			)
		{
			
			String  sql = ""
				+ "SELECT hr_attribute_id "
				+ "FROM   hr_attribute "
				+ "WHERE  hr_concept_id = "+attribute.get_Value("hr_concept_id")+" "
				+ "       AND c_bpartner_id = "+attribute.get_Value("c_bpartner_id")+" "
				+ "       AND ad_org_id = "+attribute.get_Value("ad_org_id")+" "
	    		+ "       AND hr_attribute_id !="+attribute.get_Value("hr_attribute_id")+" ";
		
			if (attribute.get_Value("validto")!= null )			
				sql+= "       AND ((( '"+attribute.get_Value("validfrom")+"' BETWEEN validfrom AND validto ) "
				    + "       AND ( '"+attribute.get_Value("validto")+"' BETWEEN validfrom AND validto ))  "
				    +"        OR ( '"+attribute.get_Value("validto")+"' >= validfrom  AND validto is null ))";
			
			else
				sql+="       AND ( validto IS NULL "
				    + "              OR '"+attribute.get_Value("validfrom")+"' BETWEEN validfrom AND validto ) ";

			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			try
			{
					pstmt = DB.prepareStatement(sql, null);
					rs = pstmt.executeQuery();
					if (rs.next() )
					{	
						return "Ya Existe un atributo definido para este período";
					
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
		
		
		//validación de atributos no editables 
		if (po.get_TableName().equals(MHRAttribute.Table_Name) &&
				 type == ModelValidator.TYPE_BEFORE_CHANGE &&
				 ejcutionValidation)
			
		{
			String sql = ""
				+ "SELECT * "
				+ "FROM   hr_concept hrc "
				+ "       INNER JOIN hr_attribute hra "
				+ "         ON hrc.hr_concept_id = hra.hr_concept_id "
				+ "       INNER JOIN hr_concept_category hc "
				+ "         ON hrc.hr_concept_category_id = hc.hr_concept_category_id "
				+ "WHERE  TRIM(hc.VALUE) = 'ATR_NO_EDITABLE' "
				+ "       AND hra.hr_attribute_id = '"+attribute.get_Value("hr_attribute_id")+"'  ";

			PreparedStatement pstmt = null;
			ResultSet rs = null; 
			try
			{
					pstmt = DB.prepareStatement(sql, null);
					rs = pstmt.executeQuery();
					if (rs.next() )
					{	
						return "El Atributo es NO EDITABLE";
					
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
		ejcutionValidation=true;
		if (timing == TIMING_BEFORE_PREPARE || timing == TIMING_BEFORE_COMPLETE){
		        ejcutionValidation=false;
		}			
		
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
		StringBuffer sb = new StringBuffer ("LVE_HRAttribute");
		return sb.toString ();
	}	//	toString
	
}	//	LVE_PayrollValidator
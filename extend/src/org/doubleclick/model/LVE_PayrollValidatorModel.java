
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
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import org.compiere.model.MClient;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.model.Query;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.eevolution.model.MHRAttribute;
import org.eevolution.model.MHRConcept;
import org.eevolution.model.MHRMovement;
import org.eevolution.model.MHRPeriod;
import org.eevolution.model.MHRProcess;
/**
 *	Validator for Payroll Venezuela
 *	
 *  @author Carlos Ruiz - globalqss - Quality Systems & Solutions - http://globalqss.com
 *	<li> 
 *  @author Rafael Salazar C. (RTSC) - rsalazar@dcsla.com, Double Click Sistemas http://www.dcsla.com
 *	<li> 
 *  @author Jenny Cecilia Rodriguez A. (JCRA) - jrodriguez@dcsla.com, Double Click Sistemas http://www.dcsla.com
 */

public class LVE_PayrollValidatorModel implements ModelValidator
{
	/**
	 *	Constructor.
	 *	The class is instantiated when logging in and client is selected/known
	 */
	public LVE_PayrollValidatorModel ()
	{
		super ();
	}	//	MyValidator
	
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(LVE_PayrollValidatorModel.class);
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
		engine.addDocValidate(MHRProcess.Table_Name, this);

	}	//	initialize

    /**
     *	Model Change of a monitored Table.
     *	Called after PO.

     *	@exception Exception if the recipient wishes the change to be not accept.
     */
	public String modelChange (PO po, int type) throws Exception
	{
		/*
		log.info(po.get_TableName()  " Type: "type);
		String msg;

		if (po.get_TableName().equals(MInvoice.Table_Name) && type == ModelValidator.TYPE_BEFORE_CHANGE) {
			msg = validateBeforeChangingInvoice((MInvoice) po);
			if (msg != null)
				return msg;
		}
		*/
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
		String msg;
		
		// before prepare a payroll - JCRA (enabling - disabling employees)
		if (po.get_TableName().equals(MHRProcess.Table_Name) && timing == TIMING_BEFORE_PREPARE) {
			MHRProcess process = (MHRProcess) po; 
	    	manageEmployeeStatus(process,false);
		}
		
		// after close a payroll - JCRA (enabling - disabling employees)
		if (po.get_TableName().equals(MHRProcess.Table_Name) && (timing == TIMING_AFTER_CLOSE || timing == TIMING_AFTER_REACTIVATE)) {
			MHRProcess process = (MHRProcess) po; 
	    	manageEmployeeStatus(process,true);
		}
		
		// after complete a payroll
		if (po.get_TableName().equals(MHRProcess.Table_Name) && timing == TIMING_AFTER_COMPLETE) {
			MHRProcess process = (MHRProcess) po; 
	    	/*LVE_ClosingAndOpeningPayroll cloOpePayroll = new LVE_ClosingAndOpeningPayroll();
			msg = cloOpePayroll.addComplete001(process.get_TrxName(), process, 1, this  );*/
			try {
				
				LVE_PayrollVenezuela.ExecutionOfConceptsClosed(process.get_TrxName(),process,"isoption10","Y", process.getHR_Payroll_ID());
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				msg="ERROR";
				e.printStackTrace();
			}
			/*//msg = addClosingConcepts(process, 1);
			if (msg != null)
				return msg;*/
		}
		
		// after complete a payroll
		if (po.get_TableName().equals(MHRProcess.Table_Name) && (timing == TIMING_BEFORE_REACTIVATE || timing == TIMING_BEFORE_VOID) ) {
			MHRProcess process = (MHRProcess) po;
			if (process.isProcessed()) {
				msg = deleteValueConcept( process, "Atributo No Editable", process.getHR_Payroll().getHR_Contract().getValue());
				if (msg != null)
					return msg;
		    }
			
		/*	msg = addClosingConcepts(process, -1);
				if (msg != null)
					return msg;			
			*/
			
		}
		return null;
	}	//	docValidate


	private String addClosingConcepts(MHRProcess process, int multiplier) {
		String msg = null;
		
		// This is an example about how to add/create an accumulated concept
		// In this example we're going to create/add the concept A_ACUM_DIAS_VACACIONES_DISFRUTADOS based on the concept CC_DIAS_BASE_PAGAR_VACACIONES
		msg = addConcept("CC_DIAS_VACACIONES", "A_ACUM_DIAS_VACACIONES_DISFRUTADOS", process, multiplier);
		if (msg != null)
			return msg;
		
		/*msg = addConcept("CC_SUELDO", "A_ACUM_DIAS_VACACIONES_CAUSADAS",  process, multiplier);
		if (msg != null)
			return msg;*/
		
		return null;
	}

	//JCRA (enabling - disabling employees)
	public static String manageEmployeeStatus(MHRProcess process, boolean activate){
		String sql;
		int nRecords;
		if (activate==false){
			sql = ""
				+ "INSERT INTO LVE_ProcessActiveEmployees "
				+ "(ad_client_id, ad_org_id, c_bpartner_id, created, createdby, LVE_ProcessActiveEmployees_ID, "
				+ "hr_process_id, isactive, updated, updatedby) "
				+ "select " + process.getAD_Client_ID() + ", "
				+ process.getAD_Org_ID() + ", "
				+ " e.c_bpartner_id, " 
				+ "getdate(), e.createdby, "
				+ "(select case when max(LVE_processActiveEmployees_id) is null then 1000000 else max(LVE_processActiveEmployees_id) end from LVE_ProcessActiveEmployees) + ROW_NUMBER() over (ORDER BY e.c_bpartner_id), "
				+ process.getHR_Process_ID() + ", "
				+ "e.isactive, "
				+ "getdate(), e.updatedby "
				+ "from hr_employee e inner join hr_process p on e.hr_payroll_id = p.hr_payroll_id "
				+ "where e.isactive='Y' "
				+ "and p.hr_process_id = " + process.getHR_Process_ID() + " "
				+ "and e.c_bpartner_id not in (select c_bpartner_id from LVE_ProcessEmployee where hr_process_id = " + process.getHR_Process_ID() + ")";
			
			nRecords = DB.executeUpdate(sql, process.get_TrxName());
			log.fine("LVE_ProcessActiveEmployees inserted #" + nRecords);
		}
		
		sql = "update hr_employee set isactive = " + (activate==true? "'Y'" : "'N'") + " " +
			  "where c_bpartner_id in (select c_bpartner_id from LVE_ProcessActiveEmployees where hr_process_id = " + process.getHR_Process_ID() + ") " +
			  "and hr_payroll_id in (select hr_payroll_id from hr_process where hr_process_id = " + process.getHR_Process_ID() + ")";
		nRecords = DB.executeUpdate(sql, process.get_TrxName());
		log.fine("hr_employee updated #" + nRecords);
		
		if (activate==true){
			sql = "delete from LVE_ProcessActiveEmployees where hr_process_id = " + process.getHR_Process_ID();
			nRecords = DB.executeUpdate(sql, process.get_TrxName());
			log.fine("hr_employee deleted #" + nRecords);
		}
		
		return "";
	}
	
	//RTSC
	public static String  addConcept(String codeConceptToSearch, String codeConceptToAdd, MHRProcess process, int multiplier) {
		// get the concept to search
		MHRConcept conceptToSearch = new Query(process.getCtx(), MHRConcept.Table_Name, "Value=?", process.get_TrxName())
			.setClient_ID()
			.setOnlyActiveRecords(true)
			.setParameters(codeConceptToSearch)
			.firstOnly();
		if (conceptToSearch == null)
			return "The concept " + codeConceptToSearch + " does not exist";
		
		// Instance concept to add and validate that is an employee attribute
		MHRConcept conceptToAdd = new Query(process.getCtx(), MHRConcept.Table_Name, "Value=?", process.get_TrxName())
			.setClient_ID()
			.setOnlyActiveRecords(true)
			.setParameters(codeConceptToAdd)
			.firstOnly();
		if (conceptToAdd == null)
			return "The concept " + conceptToAdd + " does not exist";
		if (! MHRConcept.TYPE_Concept.equals(conceptToAdd.getType()))
			return "The concept " + codeConceptToAdd + " must be of type Concept";
		String columnType = conceptToAdd.getColumnType();
		if (! (MHRConcept.COLUMNTYPE_Quantity.equals(columnType) || MHRConcept.COLUMNTYPE_Amount.equals(columnType)))
			return "The concept " + codeConceptToAdd + " must have column type Quantity or Amount"; 
		if (! conceptToAdd.isEmployee())
			return "The concept " + codeConceptToAdd + " must be employee type"; 
		if (conceptToAdd.isRegistered())
			return "The concept " + codeConceptToAdd + " must not be registered";
		if (! conceptToAdd.getColumnType().equals(conceptToSearch.getColumnType()))
			return "The column types of " + codeConceptToAdd + " and " + codeConceptToSearch + " must be the same";
		
		BigDecimal bdmultiplier = BigDecimal.valueOf(multiplier);
		MHRPeriod period = (MHRPeriod) process.getHR_Period();
		
		// Iterate on each concept on the payroll
		List<MHRMovement> movements =  new Query(process.getCtx(), MHRMovement.Table_Name, "HR_Process_ID=? AND HR_Concept_ID=?", process.get_TrxName())
			.setOnlyActiveRecords(true)
			.setParameters(process.getHR_Process_ID(), conceptToSearch.getHR_Concept_ID())
			.list();
	
		
		for (MHRMovement movement : movements) {
			if (   (MHRConcept.COLUMNTYPE_Quantity.equals(columnType) && movement.getQty().signum() == 0) 
				|| (MHRConcept.COLUMNTYPE_Amount.equals(columnType) && movement.getAmount().signum() == 0))
				continue;
			
			// get the employee attribute to be added
			String whereClause = "C_BPartner_ID=? AND ValidFrom<=? AND (ValidTo IS NULL OR ValidTo>=?) AND HR_Concept_ID=?"; 
			MHRAttribute attribute = new Query(process.getCtx(), MHRAttribute.Table_Name, whereClause, process.get_TrxName())
				.setParameters(movement.getC_BPartner_ID(), period.getStartDate(), period.getEndDate(), conceptToAdd.getHR_Concept_ID())
				.setOnlyActiveRecords(true)
				.firstOnly();
			if (attribute == null) {
				// it doesn't exist, create a new attribute
				attribute = new MHRAttribute(process.getCtx(), 0, process.get_TrxName());
				attribute.setAD_Org_ID(conceptToAdd.getAD_Org_ID());
				attribute.setValidFrom(period.getStartDate());
				attribute.setC_BPartner_ID(movement.getC_BPartner_ID());
				attribute.setHR_Concept_ID(conceptToAdd.getHR_Concept_ID());
				attribute.setColumnType(conceptToAdd.getColumnType());
			}
			if (MHRConcept.COLUMNTYPE_Quantity.equals(columnType)) {
				attribute.setQty(attribute.getQty().add(movement.getQty().multiply(bdmultiplier)));
				
			} else if (MHRConcept.COLUMNTYPE_Amount.equals(columnType)) {
				attribute.setAmount(attribute.getAmount().add(movement.getAmount().multiply(bdmultiplier)));
			}
			attribute.setDescription(process.getHR_Payroll().getHR_Contract().getValue());
			attribute.saveEx();

		}
		
		return null;
	}
	
	//RTSC
	public static String deleteValueConcept( MHRProcess process, String Categoria, String description ){
		
		MHRPeriod period = (MHRPeriod) process.getHR_Period();
		Timestamp startdate = period.getStartDate();
		startdate.setDate(1);
		Timestamp date = new Timestamp(startdate.getTime()-86400000);
		
		String sql1 = ""
			+ "UPDATE hr_attribute "
			+ "SET    validto = null "
			+ "WHERE  hr_attribute_id IN (SELECT ha.hr_attribute_id "
			+ "                           FROM   hr_concept hc "
			+ "                                  INNER JOIN hr_attribute ha "
			+ "                                    ON hc.hr_concept_id = ha.hr_concept_id "
			+ "                                  INNER JOIN hr_concept_category hcc "
			+ "                                    ON hcc.hr_concept_category_id =  hc.hr_concept_category_id "
			+ "                                       AND hcc.name = '" + Categoria +"'"
			+ "                           WHERE  ha.validto = '" + date +"' "
			+ "									 AND ha.description = '"+ description  +"' )";

		
		int no1 = DB.executeUpdate(sql1, process.get_TrxName());
		log.fine("HR_Process deleted #" + no1);
	    
		String sql2 = ""
			+ "DELETE FROM hr_attribute "
			+ "WHERE  hr_attribute_id IN (SELECT ha.hr_attribute_id "
			+ "         FROM   hr_concept hc "
			+ "                INNER JOIN hr_attribute ha "
			+ "                      ON hc.hr_concept_id = ha.hr_concept_id "
			+ "                INNER JOIN hr_concept_category hcc "
			+ "                      ON hcc.hr_concept_category_id =  hc.hr_concept_category_id "
			+ "                      AND  hcc.name = '" + Categoria +"'"
			+ "        WHERE  ha.validfrom >=  '" + startdate +"' "
			+ "               AND ha.validto IS NULL "
			+ "               AND ha.description = '"+ description  +"') ";

		int no2 = DB.executeUpdate(sql2, process.get_TrxName());
		log.fine("HR_Process deleted #" + no2);
		
		return null;
	}

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
		StringBuffer sb = new StringBuffer ("LVE_PayrollValidator");
		return sb.toString ();
	}	//	toString
	
}	//	LVE_PayrollValidator
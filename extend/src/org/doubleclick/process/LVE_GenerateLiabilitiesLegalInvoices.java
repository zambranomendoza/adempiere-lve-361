/***************************************************************************************
* This file is part of Localization Venezuela project                                  *
* Author: Jenny Cecilia Rodriguez - jrodriguez@dcs.net.ve / jennycecilia24@hotmail.com *
* Double Click Sistemas, C.A. (http://www.dcs.net.ve)                                  *
***************************************************************************************/
package org.doubleclick.process;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import org.compiere.model.MBPartner;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MUser;
import org.compiere.model.Query;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.DB;
import org.eevolution.model.MHREmployee;
import org.eevolution.model.MHRMovement;
import org.eevolution.model.MHRProcess;

public class LVE_GenerateLiabilitiesLegalInvoices  extends SvrProcess {
	
	private int p_HR_LiabilitiesLegal_ID = 0;
	private int p_C_DocType_ID = 0;	
	private Timestamp p_DateInvoiced = null;
	

	/**	Logger							*/
	CLogger log = CLogger.getCLogger (getClass());

	protected void prepare()
	{
		for (ProcessInfoParameter para : getParameter()) {
			String name = para.getParameterName();
			if (name.equals("HR_LiabilitiesLegal_ID"))
				p_HR_LiabilitiesLegal_ID = para.getParameterAsInt();
			else if (name.equals("C_DocType_ID"))
				p_C_DocType_ID = para.getParameterAsInt();
			else if (name.equals("DateInvoiced"))
				p_DateInvoiced = (Timestamp) para.getParameter();
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}
	}
	
	/**
	 * Return getCharge
	  * @param trx_name
	  * @param hr_liabilitieslegal_id
	 */	
	public static Integer getCharge(String trx_name, int hr_liabilitieslegal_id) {
		
		String sConsulta = ""
			+ "SELECT c_charge_id "
			+ "FROM   hr_liabilitieslegal "
			+ "WHERE  hr_liabilitieslegal_id = ? ";
	  	Integer ID= DB.getSQLValue(trx_name ,sConsulta,new Object[] {hr_liabilitieslegal_id });
	
		return ID;			   
	}
	
	/**
	 * Return getC_Bpartner
	  * @param trx_name
	  * @param hr_liabilitieslegal_id
	 */	
	public static Integer getC_Bpartner(String trx_name, int hr_liabilitieslegal_id) {
		
		String sConsulta = ""
			+ "SELECT c_bpartner_id "
			+ "FROM   hr_liabilitieslegal "
			+ "WHERE  hr_liabilitieslegal_id = ? ";
	  	Integer ID= DB.getSQLValue(trx_name ,sConsulta,new Object[] {hr_liabilitieslegal_id });
	  	
	  	if (ID.equals(0))
	  		return null;
	
		return ID;			   
	}
	
	/**
	 * Return get_BPName
	  * @param trx_name
	  * @param c_bpartner_id
	 */	
	public static String get_BPName(String trx_name, int c_bpartner_id) {
		
		String sConsulta = ""
			+ "SELECT name "
			+ "FROM   c_bpartner "
			+ "WHERE  c_bpartner_id = ? ";
	  	String result = DB.getSQLValueString(trx_name ,sConsulta,new Object[] {c_bpartner_id });
	
	  	return result;				   
	}

	/**
	 * Return getHR_ConceptName
	  * @param trx_name
	  * @param c_bpartner_id
	 */	
	public static String getHR_ConceptName(String trx_name, int hr_concept_id) {
		
		String sConsulta = ""
			+ "SELECT value "
			+ "FROM   hr_concept "
			+ "WHERE  hr_concept_id = ? ";
	  	String result = DB.getSQLValueString(trx_name ,sConsulta,new Object[] {hr_concept_id });
	
		return result;			   
	}
	
	protected String doIt() throws Exception
	{
		log.info("HR_LiabilitiesLegal_ID=" + p_HR_LiabilitiesLegal_ID 
				+ ", C_DocType_ID=" + p_C_DocType_ID
				+ ", DateInvoiced=" + p_DateInvoiced
				);
		int created = 0;
		
		/* Validate mandatory parameters */
		if (   p_HR_LiabilitiesLegal_ID <= 0
			|| p_C_DocType_ID <= 0
			|| p_DateInvoiced == null) {
    		throw new IllegalArgumentException ("Fill mandatory parameters");
		}

		List<Object> parameters = new ArrayList<Object>();
		String whereClause = "HR_Concept_ID IN (SELECT c.hr_concept_id FROM hr_conceptsliabilitieslegal c INNER JOIN hr_liabilitieslegal l ON c.hr_liabilitieslegal_id = l.hr_liabilitieslegal_id WHERE c.IsActive='Y' AND l.hr_liabilitieslegal_id = ? )";
		parameters.add(p_HR_LiabilitiesLegal_ID);
		whereClause += " AND C_InvoiceLineLL_ID IS NULL";
		whereClause += " AND (NOT c_invoiceline_id IS NULL OR (c_invoiceline_id IS NULL AND hr_concept_id IN (SELECT hr_concept_id FROM hr_concept WHERE c_charge_id IS NULL)))";
		whereClause += " AND hr_process_id IN (SELECT hr_process_id FROM hr_process WHERE docstatus = 'CL')";		
		
		/* Main query */
		List<MHRMovement> movements = new Query(getCtx(), MHRMovement.Table_Name, whereClause, get_TrxName())
			.setOnlyActiveRecords(true)
			.setParameters(parameters)
			.setOrderBy("C_BPartner_ID,(select seqno from hr_concept where hr_concept.hr_concept_id=hr_movement.hr_concept_id)")
			.list();
		
		// Encontrar el tercero asociado al compromiso legal, en caso de tener asociado uno
		Integer C_BPartner_ID = getC_Bpartner(get_TrxName(), p_HR_LiabilitiesLegal_ID); 
		
		MBPartner bp = (C_BPartner_ID!=null) ? new MBPartner(getCtx(), C_BPartner_ID, get_TrxName()):null;
		MInvoice invoice = null;
		boolean hasLines = false;
		int oldBP = 0;
		int startLine = 0;
		
		for (MHRMovement movement : movements) {
			if (C_BPartner_ID==null) 
				bp = (MBPartner) movement.getC_BPartner(); 
			
			if (oldBP != bp.getC_BPartner_ID()) {
				if (invoice != null) {
					invoice.saveEx();
					addLog("@C_Invoice_ID@: " + invoice.getDocumentNo());
					created++;
				}
				MHRProcess process = (MHRProcess) movement.getHR_Process();				
				MHREmployee em = MHREmployee.getActiveEmployee(getCtx(), movement.getC_BPartner_ID(), get_TrxName());				
				invoice = new MInvoice(getCtx(), 0, get_TrxName());
				invoice.setC_BPartner_ID(bp.getC_BPartner_ID());
				invoice.setC_BPartner_Location_ID(bp.getLocation(0).getC_BPartner_Location_ID());

				int userID = new Query(getCtx(), MUser.Table_Name, "C_BPartner_ID=? AND IsInPayroll=?", get_TrxName())
					.setOnlyActiveRecords(true)
					.setParameters(bp.getC_BPartner_ID(), true)
					.firstId();
				invoice.setAD_User_ID(userID);				
				invoice.setC_DocTypeTarget_ID(p_C_DocType_ID);
				invoice.setAD_Org_ID(em.getAD_Org_ID());
				invoice.setIsSOTrx(false);
				invoice.setPaymentRule(bp.getPaymentRulePO());
				invoice.setDateInvoiced(p_DateInvoiced);
				invoice.setDateAcct(p_DateInvoiced);
				invoice.setDescription(process.getName());
				invoice.saveEx();
				hasLines = false;
				startLine = 10;
				oldBP = bp.getC_BPartner_ID();
			}
			int chargeID = getCharge(get_TrxName(), p_HR_LiabilitiesLegal_ID);
			MInvoiceLine line = new MInvoiceLine(invoice);
			line.setC_Charge_ID(chargeID);
			line.setQty(Env.ONE);
			line.setDescription(movement.getDescription());
			line.setLine(startLine);
			startLine += 10;
			line.setPrice(movement.getAmount());
			line.setAD_OrgTrx_ID(movement.getAD_OrgTrx_ID());
			line.setC_Project_ID(movement.getC_Project_ID());
			line.setC_Campaign_ID(movement.getC_Campaign_ID());
			line.setC_Activity_ID(movement.getC_Activity_ID());
			String C_BPName = get_BPName(get_TrxName(), movement.getC_BPartner_ID());
			String HR_ConceptName = getHR_ConceptName(get_TrxName(), movement.getHR_Concept_ID());			
			line.setDescription("Empleado: " + C_BPName + " Concepto: " + HR_ConceptName + " Proceso: " + movement.getHR_Process_ID());
			line.setUser1_ID(movement.getUser1_ID());
			line.setUser2_ID(movement.getUser2_ID());
			line.saveEx();
			movement.set_ValueOfColumn("C_InvoiceLineLL_ID", line.getC_InvoiceLine_ID());
			movement.saveEx();
			hasLines = true;
		}
		if (invoice != null && hasLines) {
			boolean result = invoice.processIt("CO");
			invoice.saveEx();
			addLog("@C_Invoice_ID@: " + invoice.getDocumentNo());
			created++;
		}
    	return "@Created@=" + created;
	}

}

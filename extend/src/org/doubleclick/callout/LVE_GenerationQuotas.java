package org.doubleclick.callout;

import java.math.BigDecimal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.CalloutEngine;  	//notese que pertenecen al paquete 
import org.compiere.model.GridField;     	// org.compiere.model, si crea el callout en este 
import org.compiere.model.GridTab;  		// paquete, estos import no son necesarios.  

import org.compiere.util.AdempiereSystemError; 	
import org.compiere.util.DB;
import org.compiere.util.Env;
import javax.swing.JOptionPane;

/**
 *	Validator for LVE_GenerationQuotas
 *	
 * @author  Rafael Salazar C. - rsalazar@dcsla.com, Double Click Sistemas http://www.dcsla.com / Orlando Curieles 
 */

public class LVE_GenerationQuotas extends CalloutEngine{

	
	public String test(Properties ctx, int windowNo, GridTab mTab, GridField mField, Object value) throws AdempiereSystemError { 

			  log.fine("test callout"); 
			  log.fine("tab name: " + mTab.getName()); 
			  log.fine("window no: " + windowNo); 
			  log.fine("window name: " + Env.getWindow(windowNo).getName()); 

			  return "this is a return string"; 
			 } 

	public String generationQuotas (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		if (isCalloutActive())
			return "";
		
		//if (mTab.getValue("LVE_LoanEmployee_ID").equals(0))
		if (mTab.getValue("LVE_Loan_Employee_ID").equals(0))
			   return "";
	    	//Elimino las cuotas existentes 
		
		String  sql = ""
			+ "DELETE FROM LVE_Loan_Quotas "
			+ "WHERE  LVE_Loan_Employee_id =  " + mTab.getValue("LVE_loan_Employee_id") 
			+ " AND   ad_client_id = " + mTab.getValue("ad_client_id") 
			+ " AND   ad_org_id = " + mTab.getValue("ad_org_id") ;
		int no2 = DB.executeUpdate(sql, null);
		log.fine("LVE_loan_Quotas deleted #" + no2);
		
		
		
        Integer valor=0;
		BigDecimal amount_loan = (BigDecimal)mTab.getValue("amount_Loan") ;
		BigDecimal taxamt= (BigDecimal)mTab.getValue("taxamt");
		
		Double totPay= ((amount_loan.doubleValue()*taxamt.doubleValue())/100)+amount_loan.doubleValue();
		
		Double amountGenerated= ((BigDecimal)mTab.getValue("amount_Initial_Quota")).doubleValue()+
		                        ( ((BigDecimal)mTab.getValue("quantity_Special_Quota")).doubleValue()
		                        		 * ((BigDecimal)mTab.getValue("amount_Special_Quota")).doubleValue()) +
		                        ( ((BigDecimal)mTab.getValue("quantity_Quota")).doubleValue() *
		                        		 ((BigDecimal)mTab.getValue("amount_Quota")).doubleValue());
		
		if ( totPay < amountGenerated)
		{			 
			return "El monto total de las cuotas supera al monto que debe ser pagado";
		}
		if (totPay > amountGenerated ){
			return "El monto total de las cuotas es menor al monto que debe ser pagado";
		}
	
		sql = "SELECT MAX(LVE_Loan_Quotas_id) FROM LVE_Loan_Quotas";		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try
		{
				pstmt = DB.prepareStatement(sql, null);
				rs = pstmt.executeQuery();
				
				if (rs.next())
				{
					valor= new Integer(rs.getInt(1))+1;
				
				}
	
	
		
		//Generación de la cuota inicial 
		
		sql = ""
				+ "INSERT INTO LVE_Loan_Quotas "
				+ "            (ad_client_id, "
				+ "             ad_org_id, "
				+ "             amount, "
				+ "             created, "
				+ "             createdby, "
				+ "             description, "
				+ "             isactive, "
				+ "             LVE_loan_Employee_id, "
				+ "             qty, "
				+ "             updated, "
				+ "             updatedby, "
				+ "             LVE_loan_Quotas_id ) "
				+ "VALUES      ( "+ mTab.getValue("ad_client_id")  +", "
				+ 					mTab.getValue("ad_org_id") +", "
				+					mTab.getValue("amount_initial_quota")+", '"
				+					mTab.getValue("created")+"', "
				+					mTab.getValue("createdby")+", "
				+					"'CUOTA INICIAL' , "
				+					"'Y' , "
				+					mTab.getValue("LVE_loan_Employee_id")+", "
				+					"1 , '"
				+					mTab.getValue("updated")+"', "
				+					mTab.getValue("updatedby")+", "
				+                   valor++
				+ " ) ";
		
	
	     no2 = DB.executeUpdate(sql, null);
	     log.fine("LVE_Loan_Quotas deleted #" + no2);
	  
         int numberQuota=1;
	     //Generación de las cuotas especiales
	        BigDecimal quantity= (BigDecimal) mTab.getValue("quantity_Special_Quota");
			for (int i = 0; i < quantity.intValue(); i++) {
				
				  
				sql = ""
						+ "INSERT INTO LVE_Loan_Quotas "
						+ "            (ad_client_id, "
						+ "             ad_org_id, "
						+ "             amount, "
						+ "             created, "
						+ "             createdby, "
						+ "             description, "
						+ "             isactive, "
						+ "             LVE_loan_Employee_id, "
						+ "             updated, "
						+ "             updatedby, "
						+ "             qty, "
						+ "             LVE_loan_Quotas_id ) "
						+ "VALUES      ( "+ mTab.getValue("ad_client_id")  +", "
						+ 					mTab.getValue("ad_org_id") +", "
						+					mTab.getValue("amount_Special_Quota")+", '"
						+					mTab.getValue("created")+"', "
						+					mTab.getValue("createdby")+", "
						+					"'CUOTA ESPECIAL' , "
						+					"'Y' , "
						+					mTab.getValue("LVE_loan_Employee_id")+", '"
						+					mTab.getValue("updated")+"', "
						+					mTab.getValue("updatedby")+", "
						+                   ++numberQuota + ", "
						+                   valor++
						+ " ) ";
				
			
			     no2 = DB.executeUpdate(sql, null);
			     log.fine("LVE_Loan_Quotas deleted #" + no2);
			}    
			
	     //Generación de las cuotas regulares 
	    quantity= (BigDecimal) mTab.getValue("quantity_Quota");
		for (int i = 0; i < quantity.intValue(); i++) {
			   
			
			sql = ""
					+ "INSERT INTO LVE_Loan_Quotas "
					+ "            (ad_client_id, "
					+ "             ad_org_id, "
					+ "             amount, "
					+ "             created, "
					+ "             createdby, "
					+ "             description, "
					+ "             isactive, "
					+ "             LVE_loan_Employee_id, "
					+ "             updated, "
					+ "             updatedby, "
					+ "             qty, "
					+ "             LVE_loan_Quotas_id ) "
					+ "VALUES      ( "+ mTab.getValue("ad_client_id")  +", "
					+ 					mTab.getValue("ad_org_id") +", "
					+					mTab.getValue("amount_Quota")+", '"
					+					mTab.getValue("created")+"', "
					+					mTab.getValue("createdby")+", "
					+					"'CUOTA REGULAR' , "
					+					"'Y' , "
					+					mTab.getValue("LVE_loan_Employee_id")+", '"
					+					mTab.getValue("updated")+"', "
					+					mTab.getValue("updatedby")+", "
					+                   ++numberQuota + ", " 
					+                   valor++
					+ " ) ";
			
		
		     no2 = DB.executeUpdate(sql, null);
		     log.fine("LVE_Loan_Quotas deleted #" + no2);
		}    
	   
		   
	
		return "Fueron creadas con éxito las cuotas del préstamo";

		
		
		}catch (SQLException e)
		{
			log.log(Level.SEVERE, sql, e);
			return e.getLocalizedMessage();
		}
		finally
		{
			DB.close(rs, pstmt);
		}

		
	}
	
	
	
}


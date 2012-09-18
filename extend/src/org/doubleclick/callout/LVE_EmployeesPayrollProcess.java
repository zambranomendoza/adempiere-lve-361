package org.doubleclick.callout;
//package org.eevolution.callout;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import org.compiere.model.CalloutEngine;  	//notese que pertenecen al paquete 
import org.compiere.model.GridField;     	// org.compiere.model, si crea el callout en este 
import org.compiere.model.GridTab;  		// paquete, estos import no son necesarios.  
import org.compiere.util.DB;
import javax.swing.JOptionPane;

/**
 *	LVE_Employees_Payroll_Process
 *	
 * @author Jenny Cecilia Rodriguez A - jrodriguez@dcsla.com, Double Click Sistemas http://www.dcsla.com
 */
public class LVE_EmployeesPayrollProcess extends CalloutEngine{
	
	public String refresh_employees(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) throws SQLException
	{
		
		return "";
	}
	
	
	
	public String add_employees(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) throws SQLException
	{
		if (isCalloutActive())
			return "";
		
		if (mTab.getValue("hr_process_id").equals(0))
			   return "";
		
		if (mTab.getValue("hr_process_employee_filters_id")==null)
			   return "Debe guardar los filtros para poder agregar los empleados";
	    	
		// Se agregan los empleados de acuerdo a los parámetros que se especifiquen
		String  sql = "";		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try
		{
			sql = ""
				+ "INSERT INTO hr_process_employee "
				+ "            (ad_client_id, "
				+ "             ad_org_id, "
				+ "             c_bpartner_id, "
				+ "             created, "
				+ "             createdby, "
				+ "             isactive, "
				+ "             hr_process_id, "
				+ "             updated, "
				+ "             updatedby, "
				+ "             hr_process_employee_id ) "
				+ "				(SELECT  " + mTab.getValue("ad_client_id")  + "," 
				+				mTab.getValue("ad_org_id") + ", " 
				+				"e.c_bpartner_id, '" 
				+				mTab.getValue("created")+ "', "
				+				mTab.getValue("createdby")+", "
				+				"'Y' , "
				+				mTab.getValue("hr_process_id")+", '"
				+				mTab.getValue("updated")+"', "
				+				mTab.getValue("updatedby")+", " +
				"				(CASE WHEN (SELECT MAX(hr_process_employee_id) FROM hr_process_employee) IS NULL " +
				"				THEN 1000000 " +
				"				ELSE (SELECT MAX(hr_process_employee_id) FROM hr_process_employee) END) " +
				"				+ROW_NUMBER() over (ORDER BY e.c_bpartner_id) " +
				"	FROM c_bpartner c INNER JOIN hr_employee e ON c.c_bpartner_ID = e.c_bpartner_ID INNER JOIN hr_process p	" +
				"		ON e.hr_payroll_id = p.hr_payroll_id AND p.hr_process_id = " + mTab.getValue("hr_process_id") + 
				"	    INNER JOIN hr_period pe on p.hr_period_id = pe.hr_period_id " +
				"   WHERE  (e.hr_department_id = " + mTab.getValue("hr_department_id") + 
									        " OR " + mTab.getValue("hr_department_id") + " IS NULL) " +
				"	AND (e.hr_job_id = " +  mTab.getValue("hr_job_id") + 
								   " OR " + mTab.getValue("hr_job_id") + " IS NULL) " +
				"	AND (e.c_bpartner_ID = " +  mTab.getValue("c_bpartner_ID") + 
				"     OR e.c_bpartner_ID = " +  mTab.getValue("c_bpartner_ID_F1_ID") + 
				"     OR e.c_bpartner_ID = " +  mTab.getValue("c_bpartner_ID_F2_ID") +
				"     OR (" + mTab.getValue("c_bpartner_ID") + " IS NULL AND " + mTab.getValue("c_bpartner_ID_F1_ID") + " IS NULL AND " + mTab.getValue("c_bpartner_ID_F2_ID") + " IS NULL)) " +
				"	AND e.c_bpartner_ID NOT IN " +
				"		(SELECT c_bpartner_ID FROM hr_process_employee WHERE hr_process_id = " + mTab.getValue("hr_process_id") + ") " +
				"   AND c.isactive = 'Y' AND e.isactive = 'Y' AND c.isemployee = 'Y' " +
				"   AND pe.startdate >= e.startdate " +
				"	AND e.ad_client_id = " +  mTab.getValue("ad_client_id") + 
				"	AND e.ad_org_id = " +  mTab.getValue("ad_org_id") + ")"; 
	
			int no2 = DB.executeUpdate(sql, null);		   
	
			if (no2 > 0)
			{
				JOptionPane.showMessageDialog(null, "Los empleados fueron creados con éxito", "ALERTA", JOptionPane.INFORMATION_MESSAGE);
				return "Los empleados fueron creados con éxito";	
			}
			else
				return "";
		}
		finally
		{
			DB.close(rs, pstmt);
			mTab.dataRefresh();
		}
	}
}

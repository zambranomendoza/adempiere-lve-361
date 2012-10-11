package org.doubleclick.callout;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.logging.Level;
import org.compiere.process.*;

import javax.swing.JOptionPane;

import org.compiere.model.CalloutEngine;  	//notese que pertenecen al paquete 
import org.compiere.model.GridField;     	// org.compiere.model, si crea el callout en este 
import org.compiere.model.GridTab;  		// paquete, estos import no son necesarios. 
import org.compiere.util.AdempiereSystemError; 	
import org.compiere.util.DB;
import org.compiere.util.Env;
/*
*	<li> 
*  @author Rafael Salazar C. (RTSC) - rsalazar@dcsla.com, Double Click Sistemas http://www.dcsla.com
*	<li> 
*  @author Jenny Rodriguez - jrodriguez@dcsla.com, Double Click Sistemas http://www.dcsla.com
*/
public class LVE_Customization extends CalloutEngine{

	
	public String test(Properties ctx, int windowNo, GridTab mTab, GridField mField, Object value) throws AdempiereSystemError { 

			  log.fine("test callout"); 
			  log.fine("tab name: " + mTab.getName()); 
			  log.fine("window no: " + windowNo); 
			  log.fine("window name: " + Env.getWindow(windowNo).getName()); 

			  return "this is a return string"; 
			 } 
	
	public void optionsNotice(Properties ctx, int windowNo, GridTab mTab, GridField mField, Object value) throws AdempiereSystemError 
	{ 	
		mTab.getField("isOption7").setDisplayed(mTab.getValue("isRegistered").equals(true));
		mTab.getField("isOption8").setDisplayed(mTab.getValue("isRegistered").equals(true));	  
	} 
	
	//Funcion que genneradora de codigos con formato SL-L8J
	// RTSC
	public String generationCode (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) throws SQLException
	{
		
		if (isCalloutActive())
			return "";
		String code = (String) value;
		code=code.toUpperCase();
		
		if (code == null || code.length()<6)
			return "";
		
		
		
		String sql1 = "Select * from c_bpartner " +
        				" where value like ('"+code+"')";		
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null; 
		pstmt1 = DB.prepareStatement(sql1, null);
		rs1 = pstmt1.executeQuery();		
		if (rs1.next())
		{
			return "Existe un Tercero con dicho código";
		}
		
		
		String sql = "Select max(substring(VALUE, 7,length(value)-1) ) from c_bpartner " +
                     " where value like ('"+code.substring(0, 6)+"%')";		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try
		{
			if (isCharacter(code.substring(0,2)) && isCharacter(code.substring(3,4))&& isCharacter(code.substring(5,6)) && isNumeric(code.substring(4,5)) && "-".equals(code.substring(2,3)) ){
				pstmt = DB.prepareStatement(sql, null);
				rs = pstmt.executeQuery();
				
				if (rs.next())
				{
					Integer ii = new Integer(rs.getInt(1))+1;
					DecimalFormat format = new DecimalFormat("0000"); 
					String ret = format.format(ii);
					mTab.setValue("value",null);
					mTab.setValue("value", (code.substring(0, 6)+ret));	
				}
	
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

		return "";
	}

	
	 //Funcion que genneradora de RIF con formato J-12345678-9 o Cedula con formato V-11111111 ó E-11111111
	// RTSC
	public String generationTaxID (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value) throws SQLException
	{
		
		if (isCalloutActive())
			return "";
		String code = (String) value;
		code=code.toUpperCase();
				
	
		String sql = ""
			+ "SELECT description "
			+ "FROM   lco_taxidtype "
			+ "WHERE  lco_taxidtype_id = '"+mTab.getValue("lco_taxidtype_id" )+"' ";
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		pstmt = DB.prepareStatement(sql, null);
		rs = pstmt.executeQuery();	
		rs.next();
		
		if (rs.getString(1).equals("RIF")){		
			
			if (code == null || code.length()<10 || code.length()>12 )
				return "Longitud de Identificación no Válida ";
		
			String rif=code; 
			if (!(code.length()==12 && 
				 isCharacter(code.substring(0,1)) && 
				 isNumeric(code.substring(2,10))  && 
				 isNumeric(code.substring(11,12)) && 
				 "-".equals(code.substring(1,2))  &&
				 "-".equals(code.substring(10,11))) ){
					
				if ((code.length()==11 && 
						 isCharacter(code.substring(0,1)) && 
						 isNumeric(code.substring(2,11))  && 
						 "-".equals(code.substring(1,2)) ) ){
					rif= code.substring(0,10)+"-"+code.substring(10,11);
				}else{
					if ((code.length()==11 && 
							 isCharacter(code.substring(0,1)) && 
							 isNumeric(code.substring(1,9))  && 
							 isNumeric(code.substring(10,11)) && 
							 "-".equals(code.substring(9,10))) ){
						
						rif= code.substring(0,1) + "-" +code.substring(1,11);
					}else
						if ((code.length()==10 && 
								 isCharacter(code.substring(0,1)) && 
								 isNumeric(code.substring(1,10))  ) ){
									rif= code.substring(0,1)+"-"+code.substring(1,9)+"-"+code.substring(9,10);
					}else {
						return "Formato de identificación NO VALIDO. ";
					}
				}
				code=rif ;
			}			
		}else 
		
			if (!rs.getString(1).equals("RIF"))		
			{
				String cedula =code;
				if (code.length()==9 && 
						 isCharacter(code.substring(0,1)) && 
						 isNumeric(code.substring(1,9)) ){
					
					cedula=  code.substring(0,1)+ "-" + code.substring(1,9);
					
				}else
					if (code.length()==8 && 
							 isNumeric(code.substring(0,8)) ){
						cedula="V-" + code.substring(0,8);
					}
				
				code=cedula;
				
			}
		 
			
		
		String sql1 = "Select * from c_bpartner " +
		" where taxid like ('"+code+"')";		
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null; 
		pstmt1 = DB.prepareStatement(sql1, null);
		rs1 = pstmt1.executeQuery();		
		if (rs1.next())
			return "Existe un Tercero con dicha identificación";

		mTab.setValue("TaxID",code );
		return "";
	}

	 
	//Funcion que verifica si el string son solo caracters
	//RTSC
	public static boolean isCharacter(String palabra){
		for(int i = 0; i < palabra.length(); i++){
			if(!((palabra.charAt(i) > 64 && palabra.charAt(i) < 91) ||
					(palabra.charAt(i) > 96 && palabra.charAt(i) < 123)))
				return false;
		}
		return true;
	}
	
	//Funcion que verifica si el string es un numero
	//RTSC
   private static boolean isNumeric(String cadena){
       try {
    	   Integer.parseInt(cadena);
    	   return true;
       } catch (NumberFormatException nfe){
    	   return false;
       }
   }
	
	
	//Generación de atributos automático al empleado
	//RTSC
    //JCRA - Mejora incluida: La fecha por defecto de los atributos es la fecha de ingreso
    //JCRA - Se invoca al proceso de comprobar secuencia para actualizar la secuencia de los atributos
	public String generationAttribute (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
	
		if (isCalloutActive())
			return "";	
		if (mTab.getValue("HR_Employee_ID").equals(0))
		   return "";
		if (mTab.getValue("startdate").equals(0))
			   return "";
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); // JCRA
		
		String sql = ""
			+ "SELECT * "
			+ "FROM   ad_user "
			+ "WHERE  c_bpartner_id = '" + mTab.getValue("c_bpartner_id") +"' "
			+ "       AND isinpayroll = 'Y' ";
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try
		{
			// JCRA: Comprobar secuencia
			ProcessInfo pi = new ProcessInfo("Sequence Check", 258);
			pi.setAD_Client_ID(0);
			pi.setAD_User_ID(100);
			SequenceCheck sc = new SequenceCheck();
			sc.startProcess(Env.getCtx(), pi, null);
			System.out.println("Process=" + pi.getTitle() + " Error="+pi.isError() + " Summary=" + pi.getSummary());
			//
		    pstmt = DB.prepareStatement(sql, null);
			rs = pstmt.executeQuery();				
			if (rs.next()){
			
				sql = ""
					+ "SELECT hr_concept_id, "
					+ "       columntype, value "
					+ "FROM   hr_concept "
					+ "WHERE  isrequiredforworker = 'Y' "
					+ "       AND hr_concept_id NOT IN (SELECT hr_concept_id "
					+ "                                 FROM   hr_attribute "
					+ "                                 WHERE  c_bpartner_id ='" + mTab.getValue("c_bpartner_id") +"' ) ";
		
					pstmt = DB.prepareStatement(sql, null);
					rs = pstmt.executeQuery();				
					
					// buscamos el ultimo codigo generado de los atributos
					sql = "select max (hr_attribute_id) from hr_attribute";		
					pstmt = null;
					ResultSet rs2 = null; 
					pstmt = DB.prepareStatement(sql, null);
					rs2 = pstmt.executeQuery();
					rs2.next();
					Double hr_attribute_id= rs2.getDouble(1);
					String nombreConcepto= null;
					String textMsg= null;
					while (rs.next())
					{
						nombreConcepto= rs.getString(3);
						String valor = rs.getString(2);					
						Double hr_concept_id= rs.getDouble(1);	
						
						hr_attribute_id++;
						textMsg=null;
						if (nombreConcepto.equals("A_ESTATUS_EMPLEADO"))
						   textMsg="ACTI";
			
						
						sql = ""
							+ "INSERT INTO hr_attribute "
							+ "            (ad_client_id, "
							+ "             ad_org_id, "
							+ "             c_bpartner_id, "
							+ "             columntype, "
							+ "             created, "
							+ "             createdby, "
							+ "             hr_concept_id, "
							+ "             hr_employee_id, "
							+ "             isactive, "
							+ "             isprinted, "
							+ "             updated, "
							+ "             updatedby, "
							+ "             validfrom, "
							+ "             hr_attribute_id, " 
							+ "		        textmsg ) "
							+ "VALUES      ( '"+ mTab.getValue("ad_client_id")  +"', "
							+ 				 mTab.getValue("ad_org_id") +", "
							+ 				 mTab.getValue("c_bpartner_id") +", "
							+ "              '"+valor+"', "
							+ "              Now()::timestamp, "
							+				 mTab.getValue("createdby")+", "
							+                hr_concept_id+", "
							+				 mTab.getValue("hr_employee_id")+", "
							+ "              'Y', "
							+ "              'Y', "
							+ "              Now()::timestamp, "
							+				 mTab.getValue("updatedby")+", "
							+ "              '"+ sdf.format(mTab.getValue("startdate"))  + "' ," //JCRA
							+                hr_attribute_id +" ," 
							+ "              '"+ textMsg + "' ) ";
			
						int no = DB.executeUpdate(sql, null);
						log.fine("LVE_Customization : generationAttribute insert #" + no);
									
					}
				
				JOptionPane.showMessageDialog(null, "Fueron creados con éxito los atributos del empleado debe asignarle los valores iniciales ", "ALERTA", JOptionPane.INFORMATION_MESSAGE);
				// JCRA: Comprobar secuencia
				pi.setAD_Client_ID(0);
				pi.setAD_User_ID(100);
				sc = new SequenceCheck();
				sc.startProcess(Env.getCtx(), pi, null);
				System.out.println("Process=" + pi.getTitle() + " Error="+pi.isError() + " Summary=" + pi.getSummary());
				return "Fueron creados con éxito los atributos del empleado debe asignarle los valores iniciales ";
			}else {
				JOptionPane.showMessageDialog(null, "El empleado no esta en nómina", "ALERTA", JOptionPane.INFORMATION_MESSAGE);
				return "El empleado no esta en nómina"; 			
			}
			
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


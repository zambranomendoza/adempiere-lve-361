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
 * Contributor(s): Miguel Hernández Giusti www.andsoluciones.com              *
 * Contributor(s): Orlando Curieles Vizcaya www.dcsla.com 					  *
 * Contributor(s): Rafael Tomás Salazar Colmenárez www.dcsla.com    		  *
 * Contributor(s): Jenny Cecilia Rodriguez Alvarado www.dcsla.com             *       
 *****************************************************************************/
package org.eevolution.model;
import org.eevolution.model.MHRProcess;
import java.math.BigDecimal;
import java.sql.*;
import java.sql.Date;
import java.util.*;
import org.compiere.model.Query;
import org.compiere.util.DB;
import org.eevolution.model.*;

/**
 *  Venezuelan Payroll
 *	Support for Payroll Venezuelan payroll rules Clase
 *  @author mhernandez@andsoluciones.com, AND Soluciones http://www.andsoluciones.com
 *			<li> 
 *  @author ocurieles@dcsla.com, Double Click Sistemas http://www.dcsla.com
 *			<li> 
 *  @author Rafael Salazar C. - rsalazar@dcsla.com, rtsc08@gmail.com Double Click Sistemas http://www.dcsla.com
 *			<li> 
 *  @author Jenny Rodriguez - jrodriguez@dcsla.com, jennycecilia24@hotmail.com Double Click Sistemas http://www.dcsla.com
 *			<li> 
 */

public class LVE_Payroll {


	private static long oneDay = 86400000;  //1 day 86400000 seconds
	private static long lastDayOfFirstHalfMonth = 15;
	private static int daysForLastWeek = 7;
	
	/**
	 * Return the number of a weekday on a period
	 * @param _From, _To (period)
	 * @param weekDay 
	 */	
	public static int dayOnPeriod(Timestamp _From, Timestamp _To, int weekDay)
	{
		int dayCount = 0;
		Timestamp day = (Timestamp) _From.clone();
		
		while (day.before(_To) || day.equals(_To))
		{
			if (day.getDay() == weekDay)
			{
				dayCount ++;
			}
			
			day.setTime(day.getTime()+oneDay);
		}
	
		return dayCount;
	}
	
	
	/**
	 * Return the number of days elapsed between 2 dates
	 * @param _From, _To (period)
	 */	
	public static long daysElapsed(Timestamp _From, Timestamp _To)
	{
		long dayCount = 0;

		dayCount = ((_To.getTime() - _From.getTime())/oneDay)+1;

		return dayCount;
	}

	/**
	 * Return the number of years elapsed between 2 dates
	 * @param _From, _To (period)
	 */	
	public static long yearsElapsed(Timestamp _From, Timestamp _To)
	{
		Timestamp From = (Timestamp)  _From.clone();
		Timestamp To = (Timestamp)  _To.clone();
		int Years=0;
		
		Years = monthsOnPeriod(From, To) / 12;
		
		//Day = To.getYear()-From.getYear();
		
		return Years;
	}
	
	/**
	 * Return the first day of month
	 * @param date
	 */	

	public static Timestamp firstDayOfMonth(Timestamp date)
	{
		
		Timestamp firstDay = (Timestamp) date.clone();
		firstDay.setDate(1);

		return firstDay;
	}

	
	/**
	 * Return the last day of month
	 * @param date
	 */	
	public static Timestamp lastDayOfMonth(Timestamp date)
	{
		Timestamp lastDay = (Timestamp) date.clone();
		Calendar cal = GregorianCalendar.getInstance();
		cal.setTime(lastDay);
		lastDay.setDate(cal.getActualMaximum(GregorianCalendar.DAY_OF_MONTH));		
		return lastDay;
	}

	
	/**
	 * Return if parameter "date" is on the last half of the month
	 * @param date
	 */	
	public static boolean isLastHalfMonth(Timestamp date)
	{
		boolean isLastHalfMonth = false;
		
		if(date.getDate() > lastDayOfFirstHalfMonth) isLastHalfMonth = true;
		
		return isLastHalfMonth;
	}

	
	/**
	 * Return if parameter "date" is on the last week of the month
	 * @param date
	 */	
	public static boolean isLastWeek(Timestamp _date)
	{
		boolean isLastWeek = false;
		Timestamp date = (Timestamp) _date.clone();
		Timestamp lastDay = lastDayOfMonth(date);
		
		//int firstDayOfLastWeek = lastDay.getDate() - daysForLastWeek;
		//if (date.getDate() >= firstDayOfLastWeek) isLastWeek = true;
		
		int maxDays = (int)(daysForLastWeek / 2);
        if ((lastDay.getDate() - date.getDate() + 1) < maxDays) isLastWeek = true;
		return isLastWeek;
	}
	
	/**
	 * Return The Quantity of months in a period
	  * @param _From, _To (period)
	 */	
	public static int monthsOnPeriod(Timestamp _From, Timestamp _To)
	{
		
	    Timestamp From = (Timestamp) _From.clone();
	    Timestamp To = (Timestamp) _To.clone();
	    int canYears=To.getYear()-From.getYear();
	    int canMonths=0;
	    
	    if (canYears>0){
	  	  	canMonths= canYears*12;
	    }
	    
	    canMonths+= To.getMonth()-From.getMonth();
	       
	    if (To.getDate()<From.getDate()){
	    	canMonths--;
	    }
		return canMonths; 
	}
	
	/**
	 * Return The Quantity of day of month
	 * @param _From
	 */	
	public static int dayOfMonth(Timestamp _From)
	{
		int valor=0;
		Timestamp From = (Timestamp) _From.clone();
		Timestamp lastDay = (Timestamp)  From;
		Calendar cal = GregorianCalendar.getInstance();
		cal.setTime(lastDay);
		valor=cal.getActualMaximum(GregorianCalendar.DAY_OF_MONTH);
					
		return valor; 
	}
	
	/**
	 * Return lastDateOfProcessGenerated
	  * @param trx_name
	  * @param docstatus
	  * @param ad_org_id
	 */	
	public static Timestamp lastDateOfProcessGenerated(String trx_name, String docstatus,int ad_org_id) {
		
		String sConsulta = ""
			+ "SELECT max (p.updated)  "
			+ "FROM   hr_process p "
			+ "WHERE  p.docstatus = ? "
			+ "   AND p.ad_org_id = ? ";
	  	Timestamp date= DB.getSQLValueTS(  trx_name ,sConsulta,new Object[] {docstatus,ad_org_id });
	
		return date;
							   
	}
	
	/**
	 * Return lastPayrollOfProcessGenerated
	  * @param _c_bpartner_id
	  * @param ad_org_id
	  * @param codContract
	  * @param isClosed
	 * @throws SQLException 
	 */	
	public static Integer lastPayrollOfProcessGenerated(String trx_name, int _c_bpartner_id, int ad_org_id, String codContract, boolean isClosed) throws SQLException {
		
		Integer  c_bpartner_id= (Integer) _c_bpartner_id;
		PreparedStatement pstmt = null;
		Integer Payroll=0;
		
		String sConsulta = ""
			+ "SELECT MAX(pe.enddate), pr.hr_process_id FROM hr_movement mo "
			+ "INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ "INNER JOIN hr_period pe ON pr.hr_period_id = pe.hr_period_id "
			+ "INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id " 
			+ "INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ "INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ "WHERE mo.c_bpartner_id = ? "
			+ "AND pr.ad_org_id = ? "
			+ "AND co.value in (" + codContract + ") ";
		
		sConsulta = sConsulta + (isClosed 
					? "AND pr.docstatus = 'CL' "
				    : "AND pr.docstatus IN ('IP','CO')");
	
		sConsulta = sConsulta + "group by  pr.hr_process_id";
		pstmt= DB.prepareStatement(sConsulta,  trx_name );
		pstmt.setInt(1, c_bpartner_id);
		pstmt.setInt(2, ad_org_id);
		//pstmt.setString(3, codContract);
		java.sql.ResultSet rs =  pstmt.executeQuery();
			
		while (rs.next()) {
			Payroll= rs.getInt(2);		   
		}
		rs.close();
		pstmt.close();
	    return Payroll;							   
	}
	/**
	 * Return lastDateOfProcessGenerated
	  * @param trx_name
	  * @param c_bpartner_id
	  * @param ad_org_id
	  * @param codContract
	  * @param isClosed
	 */
    public static Timestamp lastDateOfProcessGenerated(String trx_name, int _c_bpartner_id, int ad_org_id, String codContract, boolean isClosed) 
    {
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	Timestamp date= null; 
		String sConsulta = ""
			+ "SELECT MAX(pe.enddate) FROM hr_movement mo "
			+ "INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ "INNER JOIN hr_period pe ON pr.hr_period_id = pe.hr_period_id "
			+ "INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id " 
			+ "INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ "INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ "WHERE mo.c_bpartner_id = ? "
			+ "AND pr.ad_org_id = ? "
			+ "AND co.value IN ("+codContract+") ";
		
		sConsulta = sConsulta + (isClosed 
					? "AND pr.docstatus = 'CL' "
				    : "AND pr.docstatus IN ('IP','CO')");
		
	
	   	date= DB.getSQLValueTS(  trx_name ,sConsulta,new Object[] {c_bpartner_id, ad_org_id});
	
			
		return date;
		
	}
    
    /**
	 * Return StartDateOfProcessGenerated
	  * @param trx_name
	  * @param c_bpartner_id
	  * @param ad_org_id
	  * @param codContract
	  * @param isClosed
	 */
    public static Timestamp StartDateOfProcessGenerated(String trx_name, int _c_bpartner_id, int ad_org_id, String codContract, boolean isClosed) 
    {
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	Timestamp date= null; 
		String sConsulta = ""
			+ "SELECT MAX(pe.startdate) FROM hr_movement mo "
			+ "INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ "INNER JOIN hr_period pe ON pr.hr_period_id = pe.hr_period_id "
			+ "INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id " 
			+ "INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ "INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ "WHERE mo.c_bpartner_id = ? "
			+ "AND pr.ad_org_id = ? "
			+ "AND co.value in ( " + codContract + " ) ";
		sConsulta = sConsulta + (isClosed ? "AND pr.docstatus = 'CL' ":  "AND pr.docstatus IN ('IP','CO')");
			date= DB.getSQLValueTS(  trx_name ,sConsulta,new Object[] {c_bpartner_id, ad_org_id});
			
		return date;
							   
	}
	
    /**
	 * Return last Date Of Process Generated
	  * @param trx_name
	  * @param c_bpartner_id
	  * @param ad_org_id
	  * @param hr_payroll_id
	  * @param isClosed
	 */
    public static Timestamp lastDateOfProcessGenerated(String trx_name, int _c_bpartner_id, int ad_org_id, int hr_payroll_id,  boolean isClosed) 
    {
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	Timestamp date= null; 
    	
		String sConsulta = ""
			+ "SELECT MAX(pe.enddate) FROM hr_movement mo "
			+ "INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ "INNER JOIN hr_period pe ON pr.hr_period_id = pe.hr_period_id "
			+ "INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id " 
			+ "INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ "INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ "WHERE mo.c_bpartner_id = ? "
			+ "AND pr.ad_org_id = ? "
			+ "AND pa.hr_payroll_id = ? ";
		
		sConsulta = sConsulta + (isClosed ? "AND pr.docstatus = 'CL' " : "AND pr.docstatus IN ('IP','CO')");
	
	   	date= DB.getSQLValueTS(  trx_name ,sConsulta,new Object[] {c_bpartner_id, ad_org_id, hr_payroll_id});
			
		return date;
							   
	}
        
	/**
	 * Return Amount of the sum of concepts
	  * @param trx_name
	  * @param category
	  * @param _From
	  * @param _To
	  * @param c_bpartner_id
	  * @param codContract
	 */
    public static BigDecimal sumConcept (String trx_name, String category, Timestamp _From, Timestamp _To , int _c_bpartner_id, String codContract) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	BigDecimal value= new BigDecimal(0);
	
		String sConsulta = ""
			+ " SELECT SUM(case when cn.accountsign = 'C' then -mo.amount else mo.amount end) + SUM(case when cn.accountsign = 'C' then -mo.qty else mo.qty end) AS VALOR  FROM "
			+ " hr_movement mo "
			+ " INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ " INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id and em.c_bpartner_id = mo.c_bpartner_id "
			+ " INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ " INNER JOIN hr_period pe ON pe.hr_period_id = pr.hr_period_id "
			+ " INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ " INNER JOIN hr_concept cn ON  cn.hr_concept_id= mo.hr_concept_id "
			+ " WHERE  (pe.startdate>=? OR pe.enddate >= ? ) " 
			+ " AND pe.enddate<=? "   
			+ " AND em.c_bpartner_id=? "
			+ " AND " + category + "='Y' " ;
		if (codContract!=null && !codContract.equals(""))
			sConsulta += " AND co.value in (" + codContract + ") ";
		   	
		value= DB.getSQLValueBDEx(trx_name ,sConsulta,new Object[] {From,From,To,c_bpartner_id });
		return  (value==null ? new BigDecimal(0): value);
	}
    
    
    /**
	 * Return Amount of the sum of concepts
	  * @param trx_name
	  * @param category
	  * @param _From
	  * @param _To
	  * @param c_bpartner_id
	  * @param codContract
	 */
    public static BigDecimal sumConceptMonthly (String trx_name, String category, Timestamp _From, Timestamp _To , int _c_bpartner_id, String codContract, int monthDays) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	BigDecimal value= new BigDecimal(0);
	
		String sConsulta = ""
				+ "SELECT ( SUM(CASE WHEN cn.accountsign = 'C' THEN -mo.amount ELSE mo.amount END) + "
				+ "         SUM(CASE WHEN cn.accountsign = 'C' THEN -mo.qty ELSE mo.qty END) ) / " 
				+ "       ( Date_part('day', MAX(pe.enddate) - MIN(pe.startdate)) + " 
				+ "       ( CASE WHEN MIN(pe.startdate) <> ? AND MAX(pe.enddate) <> ? THEN 1 ELSE 0 END ) ) * ? "
				+ "FROM   hr_movement mo "
				+ "       inner join hr_process pr "
				+ "         ON mo.hr_process_id = pr.hr_process_id "
				+ "       inner join hr_employee em "
				+ "         ON pr.hr_payroll_id = em.hr_payroll_id "
				+ "            AND em.c_bpartner_id = mo.c_bpartner_id "
				+ "       inner join hr_payroll pa "
				+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
				+ "       inner join hr_period pe "
				+ "         ON pe.hr_period_id = pr.hr_period_id "
				+ "       inner join hr_contract co "
				+ "         ON pa.hr_contract_id = co.hr_contract_id "
				+ "       inner join hr_concept cn "
				+ "         ON cn.hr_concept_id = mo.hr_concept_id "
				+ "WHERE  ( pe.startdate >= ? "
				+ "          OR pe.enddate >= ? ) "
				+ "       AND ( pe.enddate <= ? "
				+ "              OR pe.startdate <= ? ) "
				+ "       AND em.c_bpartner_id = ? "
				+ "       AND " + category + " = 'Y' "
				+ "       AND co.VALUE IN ( " + codContract + " ) ";
			
		value= DB.getSQLValueBDEx(trx_name ,sConsulta,new Object[] {From,To,monthDays,From,From,To,To,c_bpartner_id});
	   
		return  (value==null ? new BigDecimal(0): value);
							   
	}
    
    
	/**
	 * Return Amount of the sum of concepts
	  * @param trx_name
	  * @param category
	  * @param _From
	  * @param _To
	  * @param c_bpartner_id 
	  * @param codContract
	 */
    public static BigDecimal sumConcept (String trx_name, String category, Timestamp _From, Timestamp _To , String codContract, int _c_bpartner_id) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	BigDecimal value= new BigDecimal(0);
	
		String sConsulta = ""
			+ " SELECT SUM(case when cn.accountsign = 'C' then -mo.amount else mo.amount end) + SUM(case when cn.accountsign = 'C' then -mo.qty else mo.qty end) AS VALOR  FROM "
			+ " hr_movement mo "
			+ " INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ " INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id and em.c_bpartner_id = mo.c_bpartner_id "
			+ " INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ " INNER JOIN hr_period pe ON pe.hr_period_id = pr.hr_period_id "
			+ " INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ " INNER JOIN hr_concept cn ON  cn.hr_concept_id= mo.hr_concept_id "
			+ " WHERE  (pe.startdate>=? OR pe.enddate >= ?) " 
			+ " AND pe.enddate<=? "   
			+ " AND " + category + "='Y' " ;
		    
		    if (c_bpartner_id!=null)
		    	sConsulta += " AND em.c_bpartner_id= " + c_bpartner_id;
		
			sConsulta += " AND co.value in ("+codContract+")  ";
		   	value= DB.getSQLValueBDEx(trx_name ,sConsulta,new Object[] {From,From,To});
		   	
		return  (value==null ? new BigDecimal(0): value);
		//TODO: JCRA - CASO OBREROS						   
	}
    /**
	 * Return Amount of the sum of concepts
	  * @param trx_name
	  * @param _From
	  * @param _To
	  * @param Concept_Name
	  * @param c_bpartner_id
	  * @param codContract
	 */
    public static BigDecimal sumConcept (String trx_name, Timestamp _From, Timestamp _To, String Concept_Name, int _c_bpartner_id, String codContract) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	BigDecimal value= new BigDecimal(0);

    	String sConsulta = ""
			+ " SELECT SUM(case when cn.accountsign = 'C' then -mo.amount else mo.amount end) + SUM(case when cn.accountsign = 'C' then -mo.qty else mo.qty end) AS VALOR  FROM "
			+ " hr_movement mo "
			+ " INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ " INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id and em.c_bpartner_id = mo.c_bpartner_id "
			+ " INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ " INNER JOIN hr_period pe ON pe.hr_period_id = pr.hr_period_id "
			+ " INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ " INNER JOIN hr_concept cn ON  cn.hr_concept_id= mo.hr_concept_id "
			+ " WHERE  (pe.startdate>=? OR pe.enddate >= ?) " 
			+ " AND pe.enddate<=? "   
			+ " AND cn.value = ? "
			+ " AND em.c_bpartner_id=? ";
		
		if (codContract!=null && !codContract.equals("")){
		   	value= DB.getSQLValueBDEx(trx_name ,sConsulta,new Object[] {From,From,To,Concept_Name,c_bpartner_id });
		}else{
			value= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {From,From,To,Concept_Name,c_bpartner_id });
		}
		return  (value==null ? new BigDecimal(0): value);	
		//TODO: JCRA - CASO OBREROS	
	}
    /**
	 * Return Amount of the sum of concepts
	  * @param trx_name
	  * @param _From
	  * @param _To
	  * @param Concept_Name
	  * @param c_bpartner_id
	 */
    public static BigDecimal sumConcept (String trx_name, Timestamp _From, Timestamp _To, String Concept_Name, String codContract, int _c_bpartner_id) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	BigDecimal value= new BigDecimal(0);
    	String sConsulta = ""
			+ " SELECT SUM(case when cn.accountsign = 'C' then -mo.amount else mo.amount end) + SUM(case when cn.accountsign = 'C' then -mo.qty else mo.qty end) AS VALOR  FROM "
			+ " hr_movement mo "
			+ " INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ " INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id and em.c_bpartner_id = mo.c_bpartner_id "
			+ " INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ " INNER JOIN hr_period pe ON pe.hr_period_id = pr.hr_period_id "
			+ " INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ " INNER JOIN hr_concept cn ON  cn.hr_concept_id= mo.hr_concept_id "
			+ " WHERE  (pe.startdate>=? OR pe.enddate >= ?) " 
			+ " AND pe.enddate<=? "   
			+ " AND cn.value = ? "
			+ " AND em.c_bpartner_id=? ";
		    sConsulta += " AND co.value in ("+codContract+")  ";
			value= DB.getSQLValueBDEx(trx_name ,sConsulta,new Object[] {From,From,To,Concept_Name,c_bpartner_id });
		return  (value==null ? new BigDecimal(0): value);			 
		//TODO: JCRA - CASO OBREROS	
	}
    /**
	 * Return countSumConcept
	  * @param trx_name
	  * @param _From
	  * @param _To
	  * @param Concept_Name
	  * @param c_bpartner_id
	 */
    public static BigDecimal countSumConcept (String trx_name, Timestamp _From, Timestamp _To, String Concept_Name, String codContract, int _c_bpartner_id) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	BigDecimal value= new BigDecimal(0);

    	String sConsulta = ""
			+ " SELECT COUNT(*) FROM "
			+ " hr_movement mo "
			+ " INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
			+ " INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id and em.c_bpartner_id = mo.c_bpartner_id "
			+ " INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ " INNER JOIN hr_period pe ON pe.hr_period_id = pr.hr_period_id "
			+ " INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
			+ " INNER JOIN hr_concept cn ON  cn.hr_concept_id= mo.hr_concept_id "
			+ " WHERE  pe.startdate>=? " 
			+ " AND pe.enddate<=? "   
			+ " AND cn.value = ? "
			+ " AND em.c_bpartner_id=? ";
    	    sConsulta += " AND co.value in ("+codContract+")  ";
			value= DB.getSQLValueBDEx(trx_name ,sConsulta,new Object[] {From,To,Concept_Name,c_bpartner_id });			
			
		return  (value==null ? new BigDecimal(0): value);			   
	}
    
    /**
	 * Return numbers of working days are not holidays - rest (use this function in different payroll "Empleado", "Obrero", "Directivo")
	  * @param trx_name
	  * @param _From
	  * @param _To
	  * @param hr_payroll_id
	  * @param rest
	  * @param _c_bpartner_id
	 */
    public static Double workDays (String trx_name, Timestamp _From, Timestamp _To, int _hr_payroll_id, String rest, int _c_bpartner_id) {
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  hr_payroll_id= (Integer) _hr_payroll_id;
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	Double value= new Double(0);
        String sQuery = ""
    		+ "  SELECT CASE "
    		+ "  WHEN ct.name = 'Mensual' THEN a.qty "
    		+ "  WHEN ct.name = 'Quincenal'  THEN a.qty / 2 "
    		+ "  ELSE Extract(days FROM ( TIMESTAMP '" + To.toString() + "' - TIMESTAMP '" + From.toString() + "' )) + 1 END - "
    		+ "  lve_holidaysinperiod(?, '" + From.toString() + "', '" + To.toString() + "', " + rest + ") - "
    		+ "  lve_daysrest('" + From.toString() + "', '" + To.toString() + "', " + rest + ") "
    		+ "  FROM hr_attribute a INNER JOIN hr_concept c "
    		+ "  ON a.hr_concept_id = c.hr_concept_id AND c.VALUE = 'C_DIAS_DEL_MES' "
    		+ "  CROSS JOIN hr_employee e INNER JOIN hr_payroll p "
    		+ "  ON e.c_bpartner_id = " + c_bpartner_id + " and e.hr_payroll_id = p.hr_payroll_id "
    		+ "  INNER JOIN hr_contract ct ON p.hr_contract_id = ct.hr_contract_id "
    		+ "  AND ct.name in ('Quincenal', 'Semanal', 'Mensual')";
        value= DB.getSQLValueBDEx(trx_name, sQuery, new Object[] {hr_payroll_id}).doubleValue();
		return value;		   
	}
    
    /**
	 * Return numbers of working days of the month are not holidays - rest 
	  * @param trx_name
	  * @param _From
	  * @param _To
	  * @param hr_payroll_id
	  * @param rest
	  * @param _c_bpartner_id
	 */
    public static Double workingDaysMonth(String trx_name, Timestamp _From, Timestamp _To, int _hr_payroll_id, String rest, int _c_bpartner_id) {
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  hr_payroll_id= (Integer) _hr_payroll_id;
    	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
    	Double value= new Double(0);
        String sQuery = ""
    		+ "  SELECT Extract(days FROM ( TIMESTAMP '" + To.toString() + "' - TIMESTAMP '" + From.toString() + "' )) + 1 - "
    		+ "  lve_holidaysinperiod(?, '" + From.toString() + "', '" + To.toString() + "', " + rest + ") - "
    		+ "  lve_daysrest('" + From.toString() + "', '" + To.toString() + "', " + rest + ") "
    		+ "  FROM hr_attribute a INNER JOIN hr_concept c "
    		+ "  ON a.hr_concept_id = c.hr_concept_id AND c.VALUE = 'C_DIAS_DEL_MES' "
    		+ "  CROSS JOIN hr_employee e INNER JOIN hr_payroll p "
    		+ "  ON e.c_bpartner_id = " + c_bpartner_id + " and e.hr_payroll_id = p.hr_payroll_id "
    		+ "  INNER JOIN hr_contract ct ON p.hr_contract_id = ct.hr_contract_id "
    		+ "  AND ct.name in ('Quincenal', 'Semanal', 'Mensual')";
        value= DB.getSQLValueBDEx(trx_name, sQuery, new Object[] {hr_payroll_id}).doubleValue();
		return value;		   
	}
    
    /**
	 * Return numbers of working days are not holidays - rest
	  * @param trx_name
	  * @param _From
	  * @param _To
	  * @param hr_payroll_id
	  * @param rest
	  * @param _c_bpartner_id
	 */
    public static Integer workDays (String trx_name, Timestamp _From, Timestamp _To, int _hr_payroll_id, String rest, String codContract) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  hr_payroll_id= (Integer) _hr_payroll_id;
    	Integer value= new Integer(0);
        String sQuery = ""
    		+ "  SELECT CASE "
    		+ "  WHEN '" + codContract + "' = 'Mensual' THEN a.qty "
    		+ "  WHEN '" + codContract + "' = 'Quincenal'  THEN a.qty / 2 "
    		+ "  ELSE Extract(days FROM ( TIMESTAMP '" + To.toString() + "' - TIMESTAMP '" + From.toString() + "' )) + 1 END - "
    		+ "  lve_holidaysinperiod(?, '" + From.toString() + "', '" + To.toString() + "', " + rest + ") - "
    		+ "  lve_daysrest('" + From.toString() + "', '" + To.toString() + "', " + rest + ") "
    		+ "  FROM hr_attribute a INNER JOIN hr_concept c "
    		+ "  ON a.hr_concept_id = c.hr_concept_id AND c.VALUE = 'C_DIAS_DEL_MES' ";
        value= DB.getSQLValue(trx_name, sQuery, new Object[] {hr_payroll_id});
		return value;		   
	}
    
    /**
	 * Return numbers of Holidays in Period
	  * @param trx_name
	  * @param _From
	  * @param _To
	  * @param hr_payroll_id
	  * @param rest
	 */
    public static Integer Holidaysinperiod (String trx_name, Timestamp _From, Timestamp _To, int _hr_payroll_id, String rest) {
    	
    	Timestamp From= (Timestamp) _From.clone();
    	Timestamp To= (Timestamp) _To.clone();
    	Integer  hr_payroll_id= (Integer) _hr_payroll_id;
    	Integer value= new Integer(0);
        String sQuery = ""
        	+ "SELECT * FROM "
        	+ "  Lve_holidaysinperiod(?, '" + From.toString() + "', '" + To.toString() + "', " + rest + ")  ";
    	 value= DB.getSQLValue(trx_name, sQuery, new Object[] {hr_payroll_id});
		return value;		   
	}
   	/**
	 * Return DateInitialEmployee
	  * @param trx_name
	  * @param c_bpartner_id
	  * @param ad_org_id
	  * @param codContract
	 * @return 
	 */
	  public static Timestamp DateInitialEmployee(String trx_name, int _c_bpartner_id, int ad_org_id, String codContract) 
	  { 	
	   	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
	   	Timestamp date= null;
		String sConsulta = ""
			+ "SELECT em.startdate "
			+ "FROM   hr_employee em "
			+ "       INNER JOIN hr_payroll pa "
			+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
			+ "       INNER JOIN hr_contract co "
			+ "         ON pa.hr_contract_id = co.hr_contract_id "
			+ " WHERE em.c_bpartner_id = ? " 
			+ " AND (pa.ad_org_id = ? OR  pa.ad_org_id = 0) " 
			+" AND em.isactive = 'Y'" ;
		
			sConsulta += codContract == null ?  " AND TRIM(co.value) in ('Quincenal','Semanal', 'Mensual' ) " : " AND TRIM(co.value) in ( " + codContract + " ) ";
						
		date = DB.getSQLValueTS(trx_name, sConsulta, new Object[] {c_bpartner_id, ad_org_id});
		return date;					   
	  }
	
	  /**
		 * Return DateEndEmployee
		  * @param trx_name
		  * @param c_bpartner_id
		  * @param ad_org_id
		  * @param codContract
		 * @return 
		 */
		  public static Timestamp DateEndEmployee(String trx_name, int _c_bpartner_id, int ad_org_id, String codContract) 
		  { 
		   	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
		   	Timestamp date= null;
			String sConsulta = ""
				+ " SELECT em.enddate FROM "
				+ " hr_process pr  "
				+ " INNER JOIN hr_period pe ON pr.hr_period_id = pe.hr_period_id "
				+ " INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id "
				+ " INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
				+ " INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
				+ " WHERE em.c_bpartner_id = ? " 
				+ " AND pr.ad_org_id = ? "   
				+ " AND em.isactive = 'Y'" ;
			
			sConsulta += codContract == null ?  " AND co.value in ('Quincenal','Semanal', 'Mensual' ) " : " AND co.value in ( " + codContract + " ) ";
			
			date = DB.getSQLValueTS(trx_name, sConsulta, new Object[] {c_bpartner_id, ad_org_id });
			return date;					   
		  }
		  
		  
	 /**
	  * Return PreviousDateOfPayroll
	  * @param trx_name
	  * @param _From
	  * @param _c_bpartner_id
	  * @param _Payroll
	  * @return 
	  */
	  public static Timestamp PreviousDateOfPayroll(String trx_name, Timestamp _From, int _c_bpartner_id, int _Payroll) 
	  { 	
		Timestamp From= (Timestamp)_From.clone();
	   	Integer  c_bpartner_id= (Integer) _c_bpartner_id;
	   	Integer  payroll_id= (Integer) _Payroll;
	   	Timestamp date= null;
	   	String sQuery = ""
					   + "SELECT MAX(d.enddate) FROM hr_process p "
					   + "INNER JOIN hr_employee e ON p.hr_payroll_id = e.hr_payroll_id "
					   + "INNER JOIN hr_payroll r ON r.hr_payroll_id = e.hr_payroll_id "
					   + "INNER JOIN hr_contract c ON r.hr_contract_id = c.hr_contract_id "
					   + "INNER JOIN hr_period d ON d.hr_period_id = p.hr_period_id "
					   + "WHERE r.hr_payroll_id = ? "
					   + "AND d.enddate < ? "
					   + "AND e.c_bpartner_id = ? ";
	   	
		date = DB.getSQLValueTS(trx_name, sQuery, new Object[] {payroll_id, From, c_bpartner_id});
		return date;	
		
		
	}
		  
    
    public static Vector<Timestamp> startAndEndDateLastPayroll(String trx_name, Integer c_bpartner_id, String contract) throws SQLException
	{
		PreparedStatement pstmt = null;

		Vector <Timestamp> vector= null;
		String sConsulta = ""
			+ " SELECT max(pe.startdate) , max(pe.enddate) FROM " 
			+ " hr_movement mo " 
			+ " INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id " 
			+ " INNER JOIN hr_period pe ON pr.hr_process_id= pe.hr_period_id "
			+ " INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id and em.c_bpartner_id = mo.c_bpartner_id "
			+ " INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
			+ " INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id  "
			+ " WHERE em.c_bpartner_id =? "
			+ " AND  co.value in  (?) ";
	
		pstmt= DB.prepareStatement(sConsulta,  trx_name );
		pstmt.setInt(1, c_bpartner_id);
		pstmt.setString(2, contract);
		java.sql.ResultSet rs =  pstmt.executeQuery();
		vector= new Vector<Timestamp> ();	
		
		while (rs.next()) {
			
		   vector.add(0, rs.getTimestamp(1));
		   vector.add(1, rs.getTimestamp(2));
		   
		}
		rs.close();
		pstmt.close();
		return vector;		
	
	}
    
    /**
	  * Return GeneratedConcepts
	  * @param trx_name
	  * @param process
	  * @param option
	  * @param isOption
	  * @param _From
	  * @param _To
	  * @param _C_BPartner_ID
	  * @param CodContract
	  * @param isacactive
	  * @return 
	  */
   public static BigDecimal GeneratedConcepts(String trx_name, MHRProcess process, String option, String isOption, Timestamp _From, Timestamp _To, 
		                                      int _C_BPartner_ID, String CodContract, String isacactive ) throws SQLException
	{
	   BigDecimal resultValue;
		Timestamp From = (Timestamp)_From.clone();
		Timestamp To = (Timestamp)_To.clone();
		String sConsulta = ""
			+ "SELECT SUM(CASE mo.amount "
			+ "             WHEN 0 THEN mo.qty "
			+ "             ELSE mo.amount "
			+ "           END) "
			+ "FROM   hr_concept co "
			+ "       INNER JOIN hr_movement mo "
			+ "         ON co.hr_concept_id = mo.hr_concept_id "
			+ "       INNER JOIN hr_process pr "
			+ "         ON mo.hr_process_id = pr.hr_process_id "
			+ "       INNER JOIN hr_employee em "
			+ "         ON pr.hr_payroll_id = em.hr_payroll_id "
			+ "            AND em.c_bpartner_id = mo.c_bpartner_id "
			+ "       INNER JOIN hr_payroll pa "
			+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
			+ "       INNER JOIN hr_contract con "
			+ "         ON pa.hr_contract_id = con.hr_contract_id "
			+ " WHERE co.isactive = 'Y' "
			+ " AND co." + option + " = ? "
			+ " AND ? <= mo.validfrom "
			+ " AND mo.validto <= ? "
			+ " AND mo.c_bpartner_id= ? "
			+ " AND con.value in (" + CodContract + ") "
			+ " AND pr.isactive=? ";
		resultValue= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {isOption,From, To , _C_BPartner_ID ,isacactive});
	
        return resultValue == null ?   new BigDecimal(0): resultValue;
	}
    /**
	  * Return GeneratedConcepts
	  * @param trx_name
	  * @param process
	  * @param option
	  * @param isOption
	  * @param _From
	  * @param _To
	  * @param _C_BPartner_ID
	  * @param process_id
	  * @return 
	  */
   public static BigDecimal GeneratedConcepts(String trx_name, MHRProcess process, String option, String isOption, Timestamp _From, Timestamp _To, 
		                                      int _C_BPartner_ID, int process_id) throws SQLException
	{
		BigDecimal resultValue = new BigDecimal(0);
		Timestamp From = (Timestamp)_From.clone();
		Timestamp To = (Timestamp)_To.clone();

		String sConsulta = ""
			+ " SELECT SUM( CASE mo.amount WHEN 0 THEN mo.qty ELSE mo.amount END ) FROM hr_concept co   "
			+ " INNER JOIN hr_movement mo "
			+ " ON co.hr_concept_id = mo.hr_concept_id " 
			+ " WHERE co.isactive = 'Y' "
			+ " AND co." + option + " = ? "
			+ " AND ? >= mo.validfrom "
			+ " AND mo.validto <= ? "
			+ " AND mo.c_bpartner_id= ? "
			+ " AND mo.hr_process_id = ? ";
		
		resultValue= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {isOption,From, To , _C_BPartner_ID,process_id });
	
		return resultValue == null ?   new BigDecimal(0): resultValue;
	}
   /**
	  * Return AllocationOfLoan
	  * @param trx_name
	  * @param ad_org_id
	  * @param _C_BPartner_ID
	  * @param typeLoan
	  * @param _From
	  * @param _To
	  * @return 
	  */
 public static BigDecimal AllocationOfLoan(String trx_name,  Integer ad_org_id, Integer c_bpartner_id, String typeLoan, Timestamp _From, Timestamp _To ) throws SQLException
	{
		BigDecimal resultValue = new BigDecimal(0);
		Timestamp From = (Timestamp)_From.clone();
		Timestamp To = (Timestamp)_To.clone();

		String sConsulta = ""
			+ "SELECT le.amount_loan "
			+ "FROM   lve_loan_employee le "
			+ "WHERE  le.ad_org_id = ? "
			+ "       AND le.c_bpartner_id = ? "
			+ "       AND ( le.isactive = 'Y' ) "
			+ "       AND le.name IN ( ? ) "
			+ "       AND le.dateloan between ? AND  ? ";
		resultValue= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {ad_org_id,c_bpartner_id,typeLoan,From,To});
	
		return resultValue == null ?   new BigDecimal(0): resultValue;
	} 
    /**
	  * Return Execution Of Concepts
	  * @param trx_name
	  * @param process
	  * @param option
	  * @param isOption
	  * @return 
	  */
   public static double ExecutionOfConcepts(String trx_name, MHRProcess process, String option, String isOption) throws SQLException
	{
		PreparedStatement pstmt = null;
		double resultValue = 0;

		String sConsulta = ""
			+ " SELECT value, co.accountsign FROM hr_concept co "
			+ " WHERE co.isactive = 'Y' "
			+ " AND co." + option + " = ? ";
	
		pstmt= DB.prepareStatement(sConsulta,  trx_name);
		pstmt.setString(1, isOption);
		java.sql.ResultSet rs =  pstmt.executeQuery();
		while (rs.next()) {
			if (rs.getString(2) == null || rs.getString(2).equals("D"))
				resultValue +=  process.getConcept(rs.getString(1));
			else
				resultValue -=  process.getConcept(rs.getString(1));
		}
		rs.close();
		pstmt.close();
		return resultValue;
	}
   /**
	  * Return Execution Of Concepts
	  * @param trx_name
	  * @param process
	  * @param option
	  * @param isOption
	  * @param _Payroll
	  * @return 
	  */
public static double ExecutionOfConcepts(String trx_name, MHRProcess process, String option, String isOption, int _Payroll) throws SQLException
	{
		PreparedStatement pstmt = null;
		double resultValue = 0;

		String sConsulta = ""
			+ "SELECT value, co.accountsign "
			+ "FROM   hr_concept co "
			+ "       INNER JOIN hr_payrollconcept pc "
			+ "         ON co.hr_concept_id = pc.hr_concept_id "
			+ "WHERE  co.isactive = 'Y' "
			+ "       AND pc.hr_payroll_id = ? "
			+ "       AND co." + option + " = ? ";
		pstmt= DB.prepareStatement(sConsulta,  trx_name);
		pstmt.setInt(1, _Payroll);
		pstmt.setString(2, isOption);
		java.sql.ResultSet rs =  pstmt.executeQuery();
		while (rs.next()) {
			if (rs.getString(2) == null || rs.getString(2).equals("D"))
				resultValue +=  process.getConcept(rs.getString(1));
		    else
		    	resultValue -=  process.getConcept(rs.getString(1));
		}
		rs.close();
		pstmt.close();
	
		return resultValue;
	}

/**
 * Return Execution Of ConceptsClosed
 * @param trx_name
 * @param process
 * @param option
 * @param isOption
 * @param _Payroll
 * @return 
 */
public static double ExecutionOfConceptsClosed(String trx_name, MHRProcess process, String option, String isOption, int _Payroll) throws SQLException
{
	PreparedStatement pstmt = null;
	double resultValue = 0;

	String sConsulta = ""
		+ "SELECT VALUE "
		+ "FROM   hr_concept co "
		+ "       INNER JOIN lve_payrollconceptclosed pc "
		+ "         ON co.hr_concept_id = pc.hr_concept_id "
		+ "WHERE  co.isactive = 'Y' "
		+ "       AND pc.hr_payroll_id = ? "
		+ "       AND co." + option + " = ? ";
	pstmt= DB.prepareStatement(sConsulta,  trx_name);
	pstmt.setInt(1, _Payroll);
	pstmt.setString(2, isOption);
	java.sql.ResultSet rs =  pstmt.executeQuery();
		
	while (rs.next()) {
		resultValue += process.getConcept(rs.getString(1));	
		}
	rs.close();
	pstmt.close();
	return resultValue;
}
    /**
	  * Return next Payroll
	  * @param trx_name
	  * @param _Payroll
	  * @param codContract
	  * @param _To
	  * @param _C_BPartner_ID
	  * @return 
	  */
	  public static Timestamp nextPayroll(String trx_name, int _Payroll, String codContract, Timestamp _To, int _C_BPartner_ID) 
	  { 	
		Timestamp To= (Timestamp)_To.clone();
	   	Integer  payroll_id= (Integer) _Payroll;
	   	Timestamp date= null;
	   	Integer C_BPartner_ID = (Integer) _C_BPartner_ID;
	   	String sQuery = ""
	   		+ "SELECT MIN(pe.enddate) "
	   		+ "FROM   hr_contract co "
	   		+ "       INNER JOIN hr_payroll pa "
	   		+ "         ON co.hr_contract_id = pa.hr_contract_id "
	   		+ "       INNER JOIN hr_period pe "
	   		+ "         ON pa.hr_payroll_id = pe.hr_payroll_id "
	   		+ "       INNER JOIN hr_employee em "
	   		+ "         ON pa.hr_payroll_id = em.hr_payroll_id "
	   		+ "WHERE  pa.hr_payroll_id = ? "
	   		+ "       AND co.VALUE in (" + codContract + ") "
	   		+ "       AND pe.startdate > ? "
	   		+ "       AND em.c_bpartner_id = ? "  ;


		date = DB.getSQLValueTS(trx_name, sQuery, new Object[] {payroll_id,To,C_BPartner_ID});
		
		return date;					   
	}
	  
	  /**
		  * Return salary Top
		  * @param trx_name
		  * @param _From
		  * @param month
		  * @param conceptName
		  * @param top
		  * @param _C_BPartner_ID
		  * @param codContract
		  * @return 
		  */
	    public static boolean salaryTop(String trx_name, int _AD_Client_ID, int _C_BPartner_ID, Timestamp _From, double month) throws SQLException
		{
			String sConsulta = "SELECT lve_variablesalarytopexceeded(?, ?, ?, ?)";
			boolean resultValue = DB.getSQLValue(trx_name, sConsulta, new Object[] {_AD_Client_ID,_C_BPartner_ID, _From , month})!=0;
			return resultValue;
		}	    
	    
        
		/**
		 * Return Amount of the sum of sumNotice
		  * @param trx_name
		  * @param category
		  * @param c_bpartner_id
		  * @param conceptName
		  * @param option
		 */
	    public static BigDecimal sumNotice (String trx_name, int _Payroll, int _C_BPartner_ID , String conceptName,String option) {
	    	
	   
	    	BigDecimal value= new BigDecimal(0);
			String sConsulta = ""
				+ "SELECT SUM(mo.qty + mo.amount) "
				+ "FROM   hr_movement mo "
				+ "       INNER JOIN hr_process pr "
				+ "         ON mo.hr_process_id = pr.hr_process_id "
				+ "       INNER JOIN hr_employee em "
				+ "         ON pr.hr_payroll_id = em.hr_payroll_id "
				+ "            AND em.c_bpartner_id = mo.c_bpartner_id "
				+ "       INNER JOIN hr_payroll pa "
				+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
				+ "       INNER JOIN hr_period pe "
				+ "         ON pe.hr_period_id = pr.hr_period_id "
				+ "       INNER JOIN hr_contract co "
				+ "         ON pa.hr_contract_id = co.hr_contract_id "
				+ "       INNER JOIN hr_concept cn "
				+ "         ON cn.hr_concept_id = mo.hr_concept_id "
				+ "WHERE   cn.isregistered='Y'" 
				+"         AND pa.hr_payroll_id = ? "
				+ "       AND em.c_bpartner_id = ? "
				+ "       AND cn.VALUE = ? ";
			
			if (option!=null) {
				sConsulta += "AND cn." + option + " = ?";
			 	value= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {_Payroll,_C_BPartner_ID, conceptName , "Y"});
				
			}else
			 	value= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {_Payroll,_C_BPartner_ID, conceptName });
			
			return (BigDecimal) (value ==null ? new BigDecimal(0) : value);
								   
		}
	    
		/**
		 * Return Amount of the sum of sumNotice
		  * @param trx_name
		  * @param _Payroll
		  * @param option
		  * @param optionValue
		  * @param nameConceptCategory
		  * @param _C_BPartner_ID
		 */
	    public static BigDecimal sumNotice (String trx_name, int _Payroll, String option, Boolean optionValue, String nameConceptCategory, int _C_BPartner_ID) {
	    	
	   
	    	BigDecimal value= new BigDecimal(0);
			String sConsulta = ""
				+ "SELECT SUM(mo.qty + mo.amount) "
				+ "FROM   hr_movement mo "
				+ "       INNER JOIN hr_process pr "
				+ "         ON mo.hr_process_id = pr.hr_process_id "
				+ "       INNER JOIN hr_employee em "
				+ "         ON pr.hr_payroll_id = em.hr_payroll_id "
				+ "            AND em.c_bpartner_id = mo.c_bpartner_id "
				+ "       INNER JOIN hr_payroll pa "
				+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
				+ "       INNER JOIN hr_period pe "
				+ "         ON pe.hr_period_id = pr.hr_period_id "
				+ "       INNER JOIN hr_contract co "
				+ "         ON pa.hr_contract_id = co.hr_contract_id "
				+ "       INNER JOIN hr_concept cn "
				+ "         ON cn.hr_concept_id = mo.hr_concept_id "
				+ "       INNER JOIN hr_concept_category cc " 
				+ "         ON cn.hr_concept_category_id=cc.hr_concept_category_id "
				+ "WHERE  cn.isregistered='Y'" 
				+ "       AND pa.hr_payroll_id = ? "
				+ "       AND em.c_bpartner_id = ? ";
			    
			
			if (option!=null) {
				sConsulta += "AND cn." + option + (optionValue==true ? " = 'Y'" : " != 'Y'");
			}
			if (nameConceptCategory!=null) {
				sConsulta +=  " AND cc.value IN (" + nameConceptCategory + ") ";
			}
			
			value= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {_Payroll,_C_BPartner_ID});
			 	
			
			return (BigDecimal) (value ==null ? new BigDecimal(0) : value);
								   
		}
	    
	    
		/**
		 * Return count sumNotice
		  * @param trx_name
		  * @param _Payroll
		  * @param option
		  * @param nameConceptCategory
		  * @param _C_BPartner_ID 
		  * @param control
		 */
	    public static BigDecimal countNotice (String trx_name, int _Payroll ,String option, String nameConceptCategory, int _C_BPartner_ID, int control, String symbol) {
	    	
	    	
	    	BigDecimal value= new BigDecimal(0);
			String sConsulta = ""
				+ "SELECT COUNT(*) FROM (SELECT COUNT(*) "
				+ "FROM   hr_movement mo "
				+ "       INNER JOIN hr_process pr "
				+ "         ON mo.hr_process_id = pr.hr_process_id "
				+ "       INNER JOIN hr_employee em "
				+ "         ON pr.hr_payroll_id = em.hr_payroll_id "
				+ "            AND em.c_bpartner_id = mo.c_bpartner_id "
				+ "       INNER JOIN hr_payroll pa "
				+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
				+ "       INNER JOIN hr_period pe "
				+ "         ON pe.hr_period_id = pr.hr_period_id "
				+ "       INNER JOIN hr_contract co "
				+ "         ON pa.hr_contract_id = co.hr_contract_id "
				+ "       INNER JOIN hr_concept cn "
				+ "         ON cn.hr_concept_id = mo.hr_concept_id "
				+ "       INNER JOIN hr_concept_category cc " 
				+ "         ON cn.hr_concept_category_id=cc.hr_concept_category_id "
				+ "WHERE   cn.isregistered='Y'" 
				+"         AND pa.hr_payroll_id = ? "
				+ "       AND em.c_bpartner_id = ? ";
			    
			
			if (option!=null) {
				sConsulta += "AND cn." + option + " = 'Y'";
			}
			if (nameConceptCategory!=null) {
				sConsulta +=  " AND cc.value IN ("+nameConceptCategory+") ";
			}
			sConsulta +=  " GROUP BY mo.validfrom " +
			              " HAVING SUM(mo.qty + mo.amount) "+ symbol +" "+ control+") tt ";
			value= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] {_Payroll,_C_BPartner_ID});
			 	
			
			return (BigDecimal) (value ==null ? new BigDecimal(0) : value);
								   
		}
		/**
		 * Return Amount of the sum of Notice
		  * @param trx_name
		  * @param option
		  * @param naturaleza
		  * @param _Payroll
		  * @param _From
		  * @param _To
		  * @param _C_BPartner_ID
		  * @param _Process
		  * @param nameConceptCategory
		  *     
			 */
	    public static BigDecimal sumNotice (String trx_name, String option, String naturaleza , Timestamp _From, Timestamp _To , 
	    		                            int _C_BPartner_ID , int _Process, String nameConceptCategory  ) {

	    	BigDecimal value= new BigDecimal(0);
	    	Timestamp From = (Timestamp)_From.clone();
			Timestamp To = (Timestamp)_To.clone();
			
			String sConsulta = ""
				+ "SELECT SUM(mo.qty + mo.amount) "
				+ "FROM   hr_movement mo "
				+ "       INNER JOIN hr_process pr "
				+ "         ON mo.hr_process_id = pr.hr_process_id "
				+ "       INNER JOIN hr_employee em "
				+ "         ON pr.hr_payroll_id = em.hr_payroll_id "
				+ "            AND em.c_bpartner_id = mo.c_bpartner_id "
				+ "       INNER JOIN hr_payroll pa "
				+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
				+ "       INNER JOIN hr_period pe "
				+ "         ON pe.hr_period_id = pr.hr_period_id "
				+ "       INNER JOIN hr_contract co "
				+ "         ON pa.hr_contract_id = co.hr_contract_id "
				+ "       INNER JOIN hr_concept cn "
				+ "         ON cn.hr_concept_id = mo.hr_concept_id "
				+ "       INNER JOIN hr_concept_category cc " 
				+ "         ON cn.hr_concept_category_id=cc.hr_concept_category_id "
				+ "WHERE  cn.isregistered='Y'  " 
				+ "       AND mo.validfrom Between ? AND ?" 
				+ "       AND em.c_bpartner_id = ? "
				+ "       AND cn.accountsign= ?"
				+ "       AND pr.hr_process_id= ?"
				+ "       AND cc.value IN ("+nameConceptCategory+") ";
			
			if (option!=null) {
				sConsulta += "AND cn." + option + " = ?";
			   	value= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] { From, To ,_C_BPartner_ID, naturaleza, _Process, "Y"  });
			
			}
			else
							
			   	value= DB.getSQLValueBDEx(  trx_name ,sConsulta,new Object[] { _From, _To ,_C_BPartner_ID, naturaleza, _Process  });
	
		   		
			return (BigDecimal) (value ==null ? new BigDecimal(0) : value);
								   
		}
	    /**
		 * Return numbers of holidays
		  * @param trx_name
		  * @param _From
		  * @param _To
		  * @param hr_payroll_id
		  * @param rest
		 */
	    public static Integer holidays (String trx_name, Timestamp _From, Timestamp _To, int _hr_payroll_id, String rest) {
	    	
	    	Timestamp From= (Timestamp) _From.clone();
	    	Timestamp To= (Timestamp) _To.clone();
	    	Integer  hr_payroll_id= (Integer) _hr_payroll_id;
	    	Integer value= new Integer(0);
	    	
			String sQuery = ""
					+ " SELECT COUNT(nb.date1) "
					+ " FROM hr_payroll pa "
					+ " INNER JOIN hr_year ye ON pa.hr_payroll_id = ye.hr_payroll_id "
					+ " INNER JOIN c_calendar ca ON ye.c_calendar_id = ca.c_calendar_id"
					+ " INNER JOIN c_nonbusinessday nb ON ca.c_calendar_id = nb.c_calendar_id "
					+ " WHERE date1 BETWEEN ? AND ? "
					+ " AND nb.isactive = 'Y' "
					+ " AND pa.hr_payroll_id = ? "
				    + " AND date_part('dow',nb.date1) NOT IN (" + rest + ") ";
			
			
			value= DB.getSQLValue(trx_name, sQuery, new Object[] {From, To, hr_payroll_id});
		   		
			return value;		   
		}
	    
	    /**
		 * Return numbers of holidays without the days of absence
		  * @param trx_name
		  * @param HR_process_id
		  * @param C_BPartner_ID
		  * @param Cod_CategoryDedDays
		  * @param rest
		 */
	    public static Integer legalHolidays (String trx_name, int HR_process_id, int C_BPartner_ID, String Cod_CategoryDedDays, String rest) {
	    	Integer value= new Integer(0);
			String sQuery = ""
							+ "SELECT COUNT(nb.date1) "
							+ "FROM   hr_movement mo "
							+ "       INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id "
							+ "       INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id "
							+ "            AND em.c_bpartner_id = mo.c_bpartner_id "
							+ "       INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
							+ "       INNER JOIN hr_year ye ON pa.hr_payroll_id = ye.hr_payroll_id "
							+ "       INNER JOIN c_calendar ca ON ye.c_calendar_id = ca.c_calendar_id "
							+ "       INNER JOIN c_nonbusinessday nb ON ca.c_calendar_id = nb.c_calendar_id "
							+ "       INNER JOIN hr_period pe ON pe.hr_period_id = pr.hr_period_id "
							+ "       INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "
							+ "       INNER JOIN hr_concept cn ON cn.hr_concept_id = mo.hr_concept_id AND cn.isregistered = 'Y' "
							+ "       INNER JOIN hr_concept_category cc ON cn.hr_concept_category_id = cc.hr_concept_category_id "
							+ "WHERE  ( ( mo.validfrom BETWEEN pe.startdate AND pe.enddate ) "
							+ "          OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN pe.startdate AND pe.enddate ) "
							+ "          OR ( pe.startdate BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) "
							+ "          OR ( pe.enddate BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) "
							+ "       AND nb.isactive = 'Y' "
							+ "       AND nb.date1 BETWEEN pe.startdate AND pe.enddate "
							+ "       AND nb.date1 BETWEEN mo.validfrom AND mo.validfrom + mo.qty - 1 "
							+ "       AND pr.hr_process_id = ? " 
							+ "       AND em.c_bpartner_id = ? "
							+ "       AND cc.value = ? "
							+ "       AND date_part('dow',nb.date1) NOT IN (" + rest + ") "
							+ "GROUP  BY nb.date1 ";
		
			value= DB.getSQLValue(trx_name, sQuery, new Object[] {HR_process_id, C_BPartner_ID, Cod_CategoryDedDays});
		   	return value;		   
		}
	    
	    /**
		 * Return Hours Work Bond
		  * @param trx_name
		  * @param process
		  * @param _From
		  * @param _To
		  * @param hr_payroll_id
		  * @param rest
		  * @param codContract
		 */
	    public static Double hoursWorkBond (String trx_name,MHRProcess process, Timestamp _From, Timestamp _To, int _hr_payroll_id, Double rest, String codContract) {
	    	
	    	Timestamp From = (Timestamp)_From.clone();
			Timestamp To = (Timestamp)_To.clone();
			
	    	Integer hourWork = (Integer)(workDays(trx_name, From, To, _hr_payroll_id, "0," + rest.toString(), codContract));
	      	if ((process.getAttributeString("A_PAGO_BONO_ALIMENTACION_VACACIONES")).equals("N")){
	    		hourWork-=  holidays (trx_name,  From,  To, _hr_payroll_id,  "0," + rest.toString()) ;
	    		}	 
	      
			return (hourWork*process.getConcept("C_HORAS_JORNADA_DIURNA"));		   
		}
	    
	    
	    /**
		 * Return number of dependent 
		  * @param trx_name
		  * @param _C_BPartner_ID
		  * @param familyDependent
		  * @param minorTo
		 */
	    public static Integer numberDependent (String trx_name, int _C_BPartner_ID, String familyDependent, int minorTo) {

	    	Integer  c_bpartner_id= (Integer)_C_BPartner_ID;
	    	Integer value= new Integer(0);
	    	
			String sQuery = ""
					+ "SELECT COUNT (*) "
					+ "FROM   hr_family fa "
					+ "       INNER JOIN hr_family_dependent fd "
					+ "         ON fd.hr_family_dependent_id = fa.hr_family_dependent_id "
					+ "WHERE  EXTRACT(YEAR FROM Age(Now(), fa.birthday)) < ? "
					+ "       AND fa.c_bpartner_id = ? ";
			
			
			// Family Dependent 
			
			if ( familyDependent != null){
				sQuery+= "AND  fd.name in (?)" ; 
				value= DB.getSQLValue(trx_name, sQuery, new Object[] {minorTo,c_bpartner_id, familyDependent});
			} else
			    value= DB.getSQLValue(trx_name, sQuery, new Object[] {minorTo,c_bpartner_id});
			
			return value;	
		}
	    /**
		 * Return Period execution contract
		  * @param trx_name
		  * @param _C_BPartner_ID
		  * @param contractName
		  *  @param format
		  *  @param process
		 */
	    public static Integer  periodExecutionContract (String trx_name, int _C_BPartner_ID, String contractName, String format,MHRProcess process) {

	    	Integer  c_bpartner_id= (Integer)_C_BPartner_ID;
	    	BigDecimal value= new BigDecimal(0);
	    	
			String sQuery = ""
					+ "SELECT co.netdays "
					+ "FROM   hr_payroll pa "
					+ "       INNER JOIN hr_contract co "
					+ "         ON pa.hr_contract_id = co.hr_contract_id "
					+ "       INNER JOIN hr_employee em "
					+ "         ON em.hr_payroll_id = pa.hr_payroll_id "
					+ "WHERE  em.c_bpartner_id = ? "
					+ "       AND co.name = ? ";
					
				value=  DB.getSQLValueBDEx(trx_name, sQuery, new Object[] {c_bpartner_id,contractName});
			
		   if ("M".equals(format))
			   return  (int) (value.doubleValue()/process.getAttribute("C_DIAS_DEL_MES"));
		   else
			return value.intValue(); 
		}
	    
	    /**
		 * Return  Quotas For Paying
		  * @param trx_name
		  * @param ad_org_id
		  * @param c_bpartner_id
		  *  @param typeLoan
		  *  @param _Process
		  *  @param paymentDate
		 */
	    
	    public static  ResultSet QuotasForPaying(String trx_name, Integer ad_org_id, Integer c_bpartner_id, String typeLoan, Integer _Process , Date _paymentDate) throws SQLException
		{
			PreparedStatement pstmt = null;
			Date paymentDate=(Date) _paymentDate.clone();
			String sConsulta = ""
					+ "SELECT lq.lve_loan_quotas_id, "
					+ "       lq.qty, "
					+ "       lq.amount," 
					+ "       le.lve_loan_employee_id, "
					+ "       le.isactive "
					+ "FROM   lve_loan_employee le "
					+ "       INNER JOIN lve_loan_quotas lq "
					+ "         ON le.lve_loan_employee_id = lq.lve_loan_employee_id "
					+ "WHERE  le.ad_org_id = ? "
					+ "       AND le.c_bpartner_id = ? "
					+ "       AND ( le.isactive = 'Y' OR ( le.isactive = 'N' AND lq.hr_process_id = ? ) )  "
					+ "       AND lq.isactive = 'Y' "
					+ "       AND le.name in ( ? ) "
					+ "       AND (lq.hr_process_id = ? OR lq.hr_process_id is null )  "
					+ "       AND le.datestart <= ? "
					+ "ORDER BY lq.qty ASC";

			pstmt= DB.prepareStatement(sConsulta,  trx_name );
			pstmt.setInt(1, ad_org_id);
			pstmt.setInt(2, c_bpartner_id);
			pstmt.setInt(3, _Process );
			pstmt.setString(4, typeLoan);
			pstmt.setInt(5,_Process );
			pstmt.setDate(6, paymentDate);
			return  pstmt.executeQuery();
									
		}
	    	    
	    /**
		 * Return  Payment Of Quota
		  * @param trx_name
		  * @param ad_org_id
		  * @param c_bpartner_id
		  *  @param typeLoan
		  *  @param paymentDate
		  *  @param _Process
		 */
	    
	    public static Double PaymentOfQuota (String trx_name,  Integer ad_org_id, Integer c_bpartner_id, String typeLoan, Date _paymentDate, Integer _Process ) throws SQLException {
	    
	    
	    	Date paymentDate= (Date) _paymentDate.clone();
	    	String  sConsulta1="";
	    	String  sConsulta2="";
	    	ResultSet rs = QuotasForPaying( trx_name,  ad_org_id, c_bpartner_id,typeLoan,_Process , paymentDate);
	    	PreparedStatement pstmt1 = null;
	    	PreparedStatement pstmt2 = null;
	    	Double monto=(double) 0 ; 
	    	Integer idLoan=0; 
	    	if (!rs.next()){
	    		
	    		return monto; 
	    	}	    	
	    	sConsulta2 = ""
	    		+ "UPDATE lve_loan_employee "
	    		+ "SET    payment = ? "
	    		+ "WHERE  lve_loan_employee_id = ? ";
	    	pstmt2= DB.prepareStatement(sConsulta2,  trx_name );
	    	
	    	// Payment Quota
	    	if (rs.getString(5).equals("Y")) { 
	    		sConsulta1 = ""
		    		+ "UPDATE lve_loan_quotas "
		    		+ "SET    date1 = ? , "
		    		+ "       payment = ?, "
		    		+ "       hr_process_id = ? "
		    		+ "WHERE  lve_loan_quotas_id = ? ";
		    	pstmt1= DB.prepareStatement(sConsulta1,  trx_name );
		    	pstmt1.setDate(1, paymentDate);
		    	pstmt1.setString(2, "Y");
				pstmt1.setInt(3, _Process );
				pstmt1.setInt(4, rs.getInt(1));
				monto= rs.getDouble(3);
				idLoan= rs.getInt(4);
				pstmt1.executeUpdate();
				// Payment Loan 
		 		if (!rs.next()){
		 			pstmt2.setString(1, "Y");
					pstmt2.setInt(2, idLoan);
					pstmt2.executeUpdate();
				}
		 		rs.close();	
				return monto;
	    	}else{
	    		sConsulta1 = ""
		    		+ "UPDATE lve_loan_quotas "
		    		+ "SET    date1 = null , "
		    		+ "       payment = 'N', "
		    		+ "       hr_process_id = null "
		    		+ "WHERE  lve_loan_quotas_id = ? ";
		    	pstmt1= DB.prepareStatement(sConsulta1,  trx_name );
	    	    pstmt1.setInt(1, rs.getInt(1));
				monto= rs.getDouble(3);
				idLoan= rs.getInt(4);
				pstmt1.executeUpdate();
				// Payment Loan 
		 		if (!rs.next()){
		 			pstmt2.setString(1, "N");
					pstmt2.setInt(2, idLoan);
					pstmt2.executeUpdate();			
		 		}
		 		rs.close();	
				return monto;
			}    
		}
	    
	    /**
		 * Return  Payment Of Quota
		  * @param trx_name
		  * @param ad_org_id
		  * @param c_bpartner_id
		  *  @param typeLoan
		  *  @param paymentDate
		  *  @param _Process
		 */
	    public static Double PaymentOfQuotaLiquidation (String trx_name,  Integer ad_org_id, Integer c_bpartner_id, String typeLoan, Date _paymentDate, Integer _Process ) throws SQLException {

	    	Date paymentDate= (Date) _paymentDate.clone();
	    	String  sConsulta1="";
	    	ResultSet rs = QuotasForPaying( trx_name,  ad_org_id, c_bpartner_id,typeLoan,_Process , paymentDate);
	    	PreparedStatement pstmt1 = null;
	    	Double monto=(double) 0 ; 
	    	
			while (rs.next()) {    	
	    	    	
		    	// Payment Quota
		    	if (rs.getString(5).equals("Y")) { 
		    		sConsulta1 = ""
			    		+ "UPDATE lve_loan_quotas "
			    		+ "SET    date1 = ? , "
			    		+ "       payment = ?, "
			    		+ "       hr_process_id = ? "
			    		+ "WHERE  lve_loan_quotas_id = ? ";
			    	pstmt1= DB.prepareStatement(sConsulta1,  trx_name );
			    	pstmt1.setDate(1, paymentDate);
			    	pstmt1.setString(2, "Y");
					pstmt1.setInt(3, _Process );
					pstmt1.setInt(4, rs.getInt(1));
					monto+= rs.getDouble(3);
					pstmt1.executeUpdate();
					// Payment Loan 
			 	
			 		rs.close();	
					
		    	}
	    	}
			return monto;
		}
	    
	    /**
		 * Return tributary Unit  
		  * @param trx_name
		  * @param org
		  * @param _From
		  * @param _To
		 */
	    public static Integer tributaryUnit (String trx_name, int org, Timestamp _From, Timestamp _To) {

	    	Timestamp From= (Timestamp) _From.clone(); 
	    	Timestamp To = (Timestamp) _To.clone();
	    	Integer value= new Integer(0);
	    	
			String sQuery = ""
					+ "SELECT tu.tributaryvalue "
					+ "FROM   lve_tributary_unit tu "
					+ "WHERE  ad_org_id = ? AND"
					+ "(? BETWEEN validfrom AND validto OR ((validfrom<=?) AND (? <= validto OR validto IS NULL)))";
			value= DB.getSQLValue(trx_name, sQuery, new Object[] {org,From, From, To});
			return value;	
		}
	    
	    /**
		 * Return Retroactive Value  
		  * @param trx_name
		  * @param _C_BPartner_ID
		  * @param _Department
		  * @param _From
		  * @param _To
		 */
	    public static Double retroactiveValue (String trx_name, int _C_BPartner_ID , int _Department , Timestamp _From, Timestamp _To) {

	    	Timestamp From= (Timestamp) _From.clone(); 
	    	Timestamp To = (Timestamp) _To.clone();
	    	
	    	BigDecimal value;
	    	
			String sQuery = ""
					+ "SELECT SUM(Lve_retroactivevalue(m.hr_process_id, m.hr_department_id, "
					+ "           m.c_bpartner_id, "
					+ "                      m.amount, m.validto, m.ad_org_id)) "
					+ "FROM   hr_movement m "
					+ "       INNER JOIN hr_concept c "
					+ "         ON m.hr_concept_id = c.hr_concept_id "
					+ "       INNER JOIN hr_process p "
					+ "         ON m.hr_process_id = p.hr_process_id "
					+ "WHERE  m.c_bpartner_id = ? "
					+ "       AND c.VALUE = 'CC_SUELDO_MENSUAL' "
					+ "       AND m.isactive = 'Y' " 			
					+ "       AND p.isactive = 'Y' "
					+ "       AND m.hr_department_id = ? "
					+ "       AND p.docstatus = 'CL' "
					+ "       AND ( m.validfrom BETWEEN ? AND ? "
					+ "              OR m.validto BETWEEN ? AND ? ) "
					+ "       AND Lve_retroactivevalue(m.hr_process_id, m.hr_department_id, "
					+ "           m.c_bpartner_id, "
					+ "               m.amount, m.validto, m.ad_org_id) > 0 ";

			value= DB.getSQLValueBD(trx_name, sQuery, new Object[] {_C_BPartner_ID ,_Department , From, To, From, To});
			
			return value==null ?  new Double(0) : value.doubleValue();	
		}
	    
	    /**
		 * Return type End Employee  
		  * @param trx_name
		  * @param org
		  * @param _C_BPartner_ID
		  * @param _Payroll
		  * @param motive
		 */
	    public static boolean  typeEndEmployee (String trx_name, int org, int _C_BPartner_ID, String contract, String motive) {

	
	    	Integer value= new Integer(0);
	    	
			String sQuery = ""
					+ "SELECT COUNT(*) "
					+ "FROM   hr_employee em "
					+ "INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id "
					+ "INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id "	
					+ "WHERE  em.c_bpartner_id = ? "
					+ "       AND co.value IN ( " + contract + " ) "
					+ "       AND em.ad_org_id = ? "
					+ "       AND em.motiveofexit= ? "
					+ " 	  AND co.isactive = 'Y' ";

			
			value= DB.getSQLValue(trx_name, sQuery, new Object[] {_C_BPartner_ID, org, motive});
			if (value > 0)
			  return true;
			else
			  return false;
		}
	    
	    
	    /**
		 * Return Generated  Value 
		  * @param trx_name
		  * @param _Process
		  * @param _Department
		  * @param _C_BPartner_ID
		  * @param conceptName
		 */
	    public static Double  generatedValue (String trx_name, int _Process , int _Department ,int _C_BPartner_ID, String conceptName ) {
	
	    	BigDecimal value=null;
	    	
			String sQuery = ""
			        + "SELECT Lve_valueconcept (?,?,?,?) ";

			value= DB.getSQLValueBD(trx_name, sQuery, new Object[] {_Process,_Department,conceptName,_C_BPartner_ID});
		
			  return value!= null ? value.doubleValue(): new Double(0);
		}

	    /**
		 * Return Generated  Value 
		  * @param trx_name
		  * @param _C_BPartner_ID
		  * @param conceptName
		  * @param org
		  * @param date
		 */
	    public static Double  generatedValue (String trx_name ,int _C_BPartner_ID, String conceptName,  int org, Timestamp date  ) {
	
	    	BigDecimal value=null;
	    	
	    	String sQuery = ""
	    		+ "SELECT Lve_valueconcept (hpc.hr_process_id, he.hr_department_id, ? , he.c_bpartner_id) "
	    		+ "FROM   hr_payroll hp "
	    		+ "       INNER JOIN hr_employee he "
	    		+ "         ON hp.hr_payroll_id = he.hr_payroll_id "
	    		+ "       INNER JOIN hr_process hpc "
	    		+ "         ON hpc.hr_payroll_id = he.hr_payroll_id "
	    		+ "       INNER JOIN hr_period hpe "
	    		+ "         ON hpe.hr_payroll_id = hp.hr_payroll_id AND hpe.hr_period_id=hpc.hr_period_id "
	    		+ "		  INNER JOIN hr_movement mov "
	    		+ "         ON HPC.hr_process_id = MOV.hr_process_id "
	    		+ "       INNER JOIN hr_concept conc "
	    		+ "         ON conc.hr_concept_id = mov.hr_concept_id  and conc.value = ? "
	    		+ "WHERE  he.c_bpartner_id = ? "
	    		+ "       AND hpe.startdate = ? "
	    		+ "       AND he.ad_org_id = ? "
	    		+ "GROUP BY hpc.hr_process_id,he.hr_department_id,he.c_bpartner_id ";
//ojo startdate por enddate
			value= DB.getSQLValueBD(trx_name, sQuery, new Object[] {conceptName, conceptName, _C_BPartner_ID, date, org});
		
			  return value!= null ? value.doubleValue(): new Double(0);
		}
	        

	    /**
		 * Return Generated  Value 
		  * @param trx_name
		  * @param _C_BPartner_ID
		  * @param conceptName
		  * @param org
		  * @param _From
		  * @param _To
		 */
	    public static Double  generatedValue (String trx_name ,int _C_BPartner_ID, String conceptName,  int org, Timestamp _From, Timestamp _To  ) {
	
	    	BigDecimal value=null;
	    	Timestamp From= (Timestamp) _From.clone();
	    	Timestamp To = (Timestamp) _To.clone();
	    	
	    	String sQuery = ""
	    		+ "SELECT sum(Lve_valueconcept (hpc.hr_process_id, he.hr_department_id, "
	    		+ "              ? , he.c_bpartner_id)) "
	    		+ "FROM   hr_payroll hp "
	    		+ "       INNER JOIN hr_employee he "
	    		+ "         ON hp.hr_payroll_id = he.hr_payroll_id "
	    		+ "       INNER JOIN hr_process hpc "
	    		+ "         ON hpc.hr_payroll_id = he.hr_payroll_id "
	    		+ "       INNER JOIN hr_period hpe "
	    		+ "         ON hpe.hr_payroll_id = hp.hr_payroll_id AND hpe.hr_period_id=hpc.hr_period_id "
	    		+ "WHERE  he.c_bpartner_id = ? "
	    		+ "       AND hpe.startdate between ? AND ?  "
	    		+ "       AND hpe.enddate between ? AND ?  "
	    		+ "       AND he.ad_org_id = ? " ;

			value= DB.getSQLValueBD(trx_name, sQuery, new Object[] {conceptName,_C_BPartner_ID, From, To, From, To, org});
		
			  return value!= null ? value.doubleValue(): new Double(0);
		}
	    
	    /**
		  * Return Generated  Value 
		  * @param trx_name
		  * @param _C_BPartner_ID
		  * @param _From
		  * @param _To
		 */
	    public static Double daysOfVacation (String trx_name,int _C_BPartner_ID,  Timestamp _From,  Timestamp _To  ) {
	
	    	BigDecimal value=null;
	    	Timestamp From= (Timestamp) _From.clone();
	    	Timestamp To= (Timestamp) _To.clone();
	    	String sQuery =  ""
	    			+ "SELECT Lve_daysvaconperiod (cp.ad_client_id, ?, ?, ?) "
	    			+ "FROM   c_bpartner cp "
	    			+ "WHERE  cp.c_bpartner_id = ? ";

			value= DB.getSQLValueBD(trx_name, sQuery, new Object[] {_C_BPartner_ID, From, To,_C_BPartner_ID});
		
			  return value!= null ? value.doubleValue(): new Double(0);
		}
	    
	    /**
		  * Return Generated  Value 
		  * @param trx_name
		  * @param org
		  * @param nameConcept
		  * @param days
		 */
	    public static Double daysPreWarn (String trx_name,int org,  String nameConcept, int days  ) {
	
	    	BigDecimal value=null;
	    
	    	String sQuery =  ""
	    			+ "SELECT ha.qty "
	    			+ "FROM   hr_attribute ha "
	    			+ "       INNER JOIN hr_concept hc "
	    			+ "         ON ha.hr_concept_id = hc.hr_concept_id "
	    			+ "WHERE  hc.value = ? "
	    			+ "       AND ? BETWEEN ha.minvalue AND ha.maxvalue " 
	    			+ "       AND ha.ad_org_id = ?  ";

			value= DB.getSQLValueBD(trx_name, sQuery, new Object[] {nameConcept, days, org});		
			  return value!= null ? value.doubleValue(): new Double(0);
		}
	    
	    /**
		  * Return Amount Retention  
		  * @param _C_BPartner_ID
		  * @param process
		  * @param conceptName
		  * @param topSalaryMinimum
		  * @param percent
		  * @param cantMonday
		  * @param nameRetentionMonday
	     * @throws SQLException 
		 */
	    public static Double amountRetention ( int _C_BPartner_ID, MHRProcess process ,String conceptName, Double topSalaryMinimum, 
	    		                               Double percent, Integer cantMonday, String nameRetentionMonday  ) throws SQLException {

	    	Timestamp To =  process.getHR_Period().getEndDate();
	    	Timestamp From =process.getHR_Period().getStartDate();
	    	Integer org = process.getAD_Org_ID();
	    	String codContract = "'" + process.getHR_Payroll().getHR_Contract().getValue() + "'";
	    	String trx_name=process.get_TrxName();
	    	Integer _Payroll= process.getHR_Payroll_ID();
	
	    	Timestamp lastFrom = StartDateOfProcessGenerated( trx_name, _C_BPartner_ID, org, codContract, true) ;
	    	Timestamp lastTo = lastDateOfProcessGenerated(trx_name, _C_BPartner_ID, org, codContract, true) ;
	    	lastFrom = lastFrom ==null ? From : lastFrom;
	        lastTo = lastTo==null ? To : lastTo;   
	        
	        Double amountRetained=(double) 0;
	    	Double previousSalary=(double) 0;   	
	    	
	    	if  (isLastHalfMonth(To)){	    
	    	      amountRetained= generatedValue (trx_name , _C_BPartner_ID, conceptName,   org,  lastFrom, lastTo  ) ;
	    	      previousSalary=  GeneratedConcepts(trx_name,process,"isoption1","Y", lastFrom, lastTo,_C_BPartner_ID,codContract, "Y").doubleValue();
	    	} 	
	    	
	    	//Monthly salary calculation 
	    	Double salarytToRetain = previousSalary + LVE_Payroll.ExecutionOfConcepts(trx_name,process,"isoption1","Y",_Payroll);
	       	salarytToRetain= salarytToRetain < topSalaryMinimum ? salarytToRetain : topSalaryMinimum ; 
	    	Double retention = (((salarytToRetain*12)/52)*(percent))* cantMonday;
	  	 	
			return retention > amountRetained ? (retention-amountRetained): new Double(0);
		}
	   
	    
	    
	    /**
		  * Return add Value DateConcept  
		  * @param codeConceptToAdd
		  * @param process
		  * @param date
		  * @param _C_BPartner_ID
		*/	    
	    public static String addValueDateConcept( String codeConceptToAdd, MHRProcess process,Timestamp date, Integer _C_BPartner_ID){
						
			MHRConcept conceptToAdd = new Query(process.getCtx(), MHRConcept.Table_Name, "Value=?", process.get_TrxName())
				.setClient_ID()
				.setOnlyActiveRecords(true)
				.setParameters(codeConceptToAdd)
				.firstOnly();
			if (conceptToAdd == null)
				return "The concept " + conceptToAdd + " does not exist";
			if (! MHRConcept.TYPE_Concept.equals(conceptToAdd.getType()))
				return "The concept " + codeConceptToAdd + " must be of type Concept";
			if (! conceptToAdd.isEmployee())
				return "The concept " + codeConceptToAdd + " must be employee type"; 
			
			MHRPeriod period = (MHRPeriod) process.getHR_Period();
			Timestamp startdate = period.getStartDate();
			startdate.setDate(1);
			String whereClause = "C_BPartner_ID=? AND ValidFrom<>? AND ValidTo IS NULL AND HR_Concept_ID=?";
			MHRAttribute attribute = new Query(process.getCtx(), MHRAttribute.Table_Name, whereClause, process.get_TrxName())
				.setParameters(_C_BPartner_ID, startdate, conceptToAdd.getHR_Concept_ID())
				.setOnlyActiveRecords(true)
				.firstOnly();
			if (attribute != null) {
				// it exist, update a last attribute
				attribute.setValidTo(new Timestamp(startdate.getTime() - oneDay));
				attribute.saveEx();
			}
			
			// Create a new attribute
			whereClause = "C_BPartner_ID=? AND ValidFrom<=? AND ValidTo IS NULL AND HR_Concept_ID=?";
			attribute = new Query(process.getCtx(), MHRAttribute.Table_Name, whereClause, process.get_TrxName())
				.setParameters(_C_BPartner_ID, startdate, conceptToAdd.getHR_Concept_ID())
				.setOnlyActiveRecords(true)
				.firstOnly();
		
			if (attribute == null) {
				// it doesn't exist, create a new attribute
				attribute = new MHRAttribute(process.getCtx(), 0, process.get_TrxName());
				attribute.setAD_Org_ID(conceptToAdd.getAD_Org_ID());
				attribute.setValidFrom(startdate);
				attribute.setC_BPartner_ID(process.getC_BPartner_ID());
				attribute.setHR_Concept_ID(conceptToAdd.getHR_Concept_ID());
				attribute.setColumnType(conceptToAdd.getColumnType());
				attribute.setC_BPartner_ID(_C_BPartner_ID);
			}
			attribute.setServiceDate(date);
			attribute.setDescription(process.getHR_Payroll().getHR_Contract().getValue());
			attribute.saveEx();
		
			return null; 
		}
		
	    
	    /**
		  * Return add Value String Concept 
		  * @param codeConceptToAdd
		  * @param process
		  * @param TextMsg
		  * @param _C_BPartner_ID
		 */
		public static String addValueStringConcept( String codeConceptToAdd, MHRProcess process,String TextMsg, Integer _C_BPartner_ID){
			
			MHRConcept conceptToAdd = new Query(process.getCtx(), MHRConcept.Table_Name, "Value=?", process.get_TrxName())
				.setClient_ID()
				.setOnlyActiveRecords(true)
				.setParameters(codeConceptToAdd)
				.firstOnly();
			if (conceptToAdd == null)
				return "The concept " + conceptToAdd + " does not exist";
			if (! MHRConcept.TYPE_Concept.equals(conceptToAdd.getType()))
				return "The concept " + codeConceptToAdd + " must be of type Concept";
			if (! conceptToAdd.isEmployee())
				return "The concept " + codeConceptToAdd + " must be employee type"; 
				
			MHRPeriod period = (MHRPeriod) process.getHR_Period();
			Timestamp startdate = period.getStartDate();
			startdate.setDate(1);
			
			String whereClause = "C_BPartner_ID=? AND ValidFrom<>? AND ValidTo IS NULL AND HR_Concept_ID=?";
			MHRAttribute attribute = new Query(process.getCtx(), MHRAttribute.Table_Name, whereClause, process.get_TrxName())
				.setParameters(_C_BPartner_ID, startdate, conceptToAdd.getHR_Concept_ID())
				.setOnlyActiveRecords(true)
				.firstOnly();
			if (attribute != null) {
				// it exist, update a last attribute
				attribute.setValidTo(new Timestamp(startdate.getTime() - oneDay));
				attribute.saveEx();
			}
			
			// Create a new attribute
			whereClause = "C_BPartner_ID=? AND ValidFrom<=? AND ValidTo IS NULL AND HR_Concept_ID=?";
			attribute = new Query(process.getCtx(), MHRAttribute.Table_Name, whereClause, process.get_TrxName())
				.setParameters(_C_BPartner_ID, startdate, conceptToAdd.getHR_Concept_ID())
				.setOnlyActiveRecords(true)
				.firstOnly();
		
			if (attribute == null) {
				// it doesn't exist, create a new attribute
				attribute = new MHRAttribute(process.getCtx(), 0, process.get_TrxName());
				attribute.setAD_Org_ID(conceptToAdd.getAD_Org_ID());
				attribute.setValidFrom(startdate);
				attribute.setC_BPartner_ID(process.getC_BPartner_ID());
				attribute.setHR_Concept_ID(conceptToAdd.getHR_Concept_ID());
				attribute.setColumnType(conceptToAdd.getColumnType());
				attribute.setC_BPartner_ID(_C_BPartner_ID);
			}
			attribute.setTextMsg(TextMsg);
			attribute.setDescription(process.getHR_Payroll().getHR_Contract().getValue());
			attribute.saveEx();			
			return null; 
		}
		
		 /**
		  * Return add Value Concept  
		  * @param codeConceptToAdd
		  * @param process
		  * @param valor
		  * @param _C_BPartner_ID
		 */		
		public static String addValueConcept( String codeConceptToAdd, MHRProcess process,BigDecimal valor, Integer _C_BPartner_ID){

			MHRConcept conceptToAdd = new Query(process.getCtx(), MHRConcept.Table_Name, "Value=?", process.get_TrxName())
				.setClient_ID()
				.setOnlyActiveRecords(true)
				.setParameters(codeConceptToAdd)
				.firstOnly();
			if (conceptToAdd == null)
				return "The concept " + conceptToAdd + " does not exist";
			if (! MHRConcept.TYPE_Concept.equals(conceptToAdd.getType()))
				return "The concept " + codeConceptToAdd + " must be of type Concept";
			if (! conceptToAdd.isEmployee())
				return "The concept " + codeConceptToAdd + " must be employee type"; 
		/*	if (conceptToAdd.isRegistered())
				return "The concept " + codeConceptToAdd + " must not be registered";*/
			
			MHRPeriod period = (MHRPeriod) process.getHR_Period();
			Timestamp startdate = period.getStartDate();
			startdate.setDate(1);
			
			String whereClause = "C_BPartner_ID=? AND ValidFrom<>? AND ValidTo IS NULL AND HR_Concept_ID=?";
			MHRAttribute attribute = new Query(process.getCtx(), MHRAttribute.Table_Name, whereClause, process.get_TrxName())
				.setParameters(_C_BPartner_ID, startdate, conceptToAdd.getHR_Concept_ID())
				.setOnlyActiveRecords(true)
				.firstOnly();
			if (attribute != null) {
				// it exist, update a last attribute
				attribute.setValidTo(new Timestamp(startdate.getTime() - oneDay));
				attribute.saveEx();
			}
			
			// Create a new attribute
			whereClause = "C_BPartner_ID=? AND ValidFrom<=? AND ValidTo IS NULL AND HR_Concept_ID=?";
			attribute = new Query(process.getCtx(), MHRAttribute.Table_Name, whereClause, process.get_TrxName())
				.setParameters(_C_BPartner_ID, startdate, conceptToAdd.getHR_Concept_ID())
				.setOnlyActiveRecords(true)
				.firstOnly();
		
			if (attribute == null) {
				// it doesn't exist, create a new attribute
				attribute = new MHRAttribute(process.getCtx(), 0, process.get_TrxName());
				attribute.setAD_Org_ID(conceptToAdd.getAD_Org_ID());
				attribute.setValidFrom(startdate);
				attribute.setC_BPartner_ID(process.getC_BPartner_ID());
				attribute.setHR_Concept_ID(conceptToAdd.getHR_Concept_ID());
				attribute.setColumnType(conceptToAdd.getColumnType());
				attribute.setC_BPartner_ID(_C_BPartner_ID);
			}
			if ("A".equals(attribute.getColumnType()))
			      attribute.setAmount(valor);
			else 
				  attribute.setQty(valor);
			attribute.setDescription(process.getHR_Payroll().getHR_Contract().getValue());
			attribute.saveEx();
		
			return null;
		}
	    
}
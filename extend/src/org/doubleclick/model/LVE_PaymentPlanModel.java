
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

package org.eevolution.model;

import java.math.*;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.Formatter.BigDecimalLayoutForm;
import java.util.GregorianCalendar;

import org.compiere.model.MClient;
import org.compiere.model.MPaySchedule;
import org.compiere.model.MPaymentTerm;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;


/**
 *	Validator for LVE_Cita
 *	
 * @author Rafael Salazar C. - rsalazar@dcsla.com, Double Click Sistemas http://www.dcsla.com
 */
public class LVE_PaymentPlanModel implements ModelValidator
{
	
	/**
	 *	Constructor.
	 *	The class is instantiated when logging in and client is selected/known
	 */
	private static long oneDay = 86400000;  //1 day 86400000 seconds
	public LVE_PaymentPlanModel ()
	{
		super ();
	}	//	MyValidator
	
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(LVE_PaymentPlanModel.class);
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

		//	Tables to be monitored
		// engine.addModelChange(MInvoice.Table_Name, this);

		//	Documents to be monitored
			engine.addModelChange(LVE_MPaymenPlan.Table_Name, this);

	}	//	initialize

    /**
     *	Model Change of a monitored Table.
     *	Called after PO.

     *	@exception Exception if the recipient wishes the change to be not accept.
     */
	public String modelChange (PO po, int type) throws Exception
	{
		if (po.get_TableName().equals(X_LVE_PaymentPlan.Table_Name) &&
				 type == ModelValidator.TYPE_BEFORE_CHANGE) 	{
			
			X_LVE_PaymentPlan paymentPlan =  (X_LVE_PaymentPlan) po;
	        
			
			//Delete C_PaymentTerm old
			String sql = 
				"DELETE FROM c_payschedule "
				+ " where C_PaymentTerm_ID = " + paymentPlan.getC_PaymentTerm_ID();
			int no = DB.executeUpdate(sql, null);
		
			sql = 
				"DELETE FROM C_PaymentTerm "
				+ " where C_PaymentTerm_ID = " + paymentPlan.getC_PaymentTerm_ID();
			no = DB.executeUpdate(sql, null);
			//**************************************
	
			java.math.MathContext mc = new MathContext(8, RoundingMode.CEILING);
			//Payment Term Create
			MPaymentTerm pt = new MPaymentTerm(paymentPlan.getCtx(), null, null);
			pt.setName(paymentPlan.getName());
			pt.setAD_Org_ID(paymentPlan.getAD_Org_ID());			
			pt.setAfterDelivery (false);
			pt.setC_PaymentTerm_ID (0);
			pt.setDiscount (Env.ZERO);
			pt.setDiscount2 (Env.ZERO);
			pt.setDiscountDays (0);
			pt.setDiscountDays2 (0);
			pt.setGraceDays (0);
			pt.setIsDueFixed (false);
			pt.setIsValid (false);			
			pt.setNetDays (0);
			pt.setPaymentTermUsage ("B");			
			pt.save();
			//**************************************
				// Pay Schedule Create
				
			
			Date now = new Date();//
		
			
			BigDecimal dayCourt= paymentPlan.getLVE_dayCourt();
			Integer days =dayCourt.intValue()- now.getDate();
			Integer cantMoth = paymentPlan.isLVE_startNextMonth() || days < 0 ? now.getMonth()+1:now.getMonth();
			
			Date nextDateCourt = (Date) now.clone();	
			int year = nextDateCourt.getYear();
			nextDateCourt.setDate(1);
			nextDateCourt.setMonth(cantMoth);
			nextDateCourt.setYear(year);
			
			Integer lastDay= lastDayOfMonth(new Timestamp (nextDateCourt.getTime())).getDate(); //			
			nextDateCourt.setDate( lastDay<dayCourt.intValue()? lastDay:dayCourt.intValue());
			
			days= (int) daysElapsed(new Timestamp(now.getTime()),new Timestamp(nextDateCourt.getTime()));//
			
				
			//Primera Cuota
			MPaySchedule ps = new MPaySchedule(paymentPlan.getCtx(), null, null);
			ps.setPercentage (paymentPlan.getLVE_firstpaymentpercentage().round(mc));
			ps.setDiscount (Env.ZERO);
			ps.setDiscountDays (0);
			ps.setGraceDays (0);
			ps.setNetDays (days);
			ps.setIsValid (true);
			ps.setC_PaymentTerm_ID(pt.get_ID());
			ps.save();
			
			//Cuotas Iniciales
			 MPaySchedule ps2 = null;
			 BigDecimal percentage=paymentPlan.getLVE_initialFee().doubleValue()>0.0 ?paymentPlan.getLVE_initialPercentage().divide( paymentPlan.getLVE_initialFee(),mc):new BigDecimal(0.0);
			 for (int i = 0; i < paymentPlan.getLVE_initialFee().intValue(); i++) {	
				    
				 	
					nextDateCourt.setDate(1);
					nextDateCourt.setMonth(++cantMoth);
					year+= nextDateCourt.getMonth()==0 ? 1 :0;
					nextDateCourt.setYear(year);
					
				    lastDay= lastDayOfMonth(new Timestamp(nextDateCourt.getTime())).getDate();
					nextDateCourt.setDate( lastDay<dayCourt.intValue()? lastDay:dayCourt.intValue());
					
					days= (int) daysElapsed(new Timestamp(now.getTime()),new Timestamp(nextDateCourt.getTime()));
				   
				    ps2 = new MPaySchedule(paymentPlan.getCtx(), null, null);
					ps2.setPercentage ( percentage.round(mc));
					ps2.setDiscount (Env.ZERO);
					ps2.setDiscountDays (0);
					ps2.setGraceDays (0);
					ps2.setNetDays (days);
					ps2.setIsValid (true);
					ps2.setC_PaymentTerm_ID(pt.get_ID());
					ps2.save();
					
			 }
			 
			//Cuotas regulares y especiales
			 ps2 = null;
			 Integer specialFee= paymentPlan.getLVE_specialFee().intValue();
		
			 BigDecimal percentageR=  (paymentPlan.getLVE_ordinaryPercentage().multiply( paymentPlan.getLVE_fundingPercentage(), mc )).divide(new BigDecimal(100.0), mc );
			 percentage=paymentPlan.getLVE_ordinaryFee().doubleValue()>0.0 ?percentageR.divide(paymentPlan.getLVE_ordinaryFee(), mc ):new BigDecimal(0.0);
			 
			 percentageR=  (paymentPlan.getLVE_specialPercentage().multiply( paymentPlan.getLVE_fundingPercentage(), mc )).divide(new BigDecimal(100.0), mc );
			 BigDecimal precentageSpecial= paymentPlan.getLVE_specialFee().doubleValue()>0.0 ?percentageR.divide( paymentPlan.getLVE_specialFee(), mc ):new BigDecimal(0.0);
				 for (int i = 0; i < paymentPlan.getLVE_ordinaryFee().intValue(); i++) {	
				 
					 nextDateCourt.setDate(1);
					 cantMoth++;
					 nextDateCourt.setMonth(cantMoth);
					 year+= nextDateCourt.getMonth()==0 ? 1 :0;
					 nextDateCourt.setYear(year);
					 
					lastDay= lastDayOfMonth(new Timestamp(nextDateCourt.getTime())).getDate();
					nextDateCourt.setDate( lastDay<dayCourt.intValue()? lastDay:dayCourt.intValue());
					
					days= (int) daysElapsed(new Timestamp(now.getTime()),new Timestamp(nextDateCourt.getTime()));
				   
						  
				    ps2 = new MPaySchedule(paymentPlan.getCtx(), null, null);
					ps2.setPercentage (percentage.round(mc) );
					ps2.setDiscount (Env.ZERO);
					ps2.setDiscountDays (0);
					ps2.setGraceDays (0);
					ps2.setNetDays (days);
					ps2.setIsValid (true);
					ps2.setC_PaymentTerm_ID(pt.get_ID());
					ps2.save();
					if ((i+1)%3==0 && specialFee>0 ){
						
						 nextDateCourt.setDate(1);
						 nextDateCourt.setMonth(++cantMoth);
						 year+= nextDateCourt.getMonth()==0 ? 1 :0;
						 nextDateCourt.setYear(year);
						 
						 
						lastDay= lastDayOfMonth(new Timestamp(nextDateCourt.getTime())).getDate();
						nextDateCourt.setDate( lastDay<dayCourt.intValue()? lastDay:dayCourt.intValue());
						days= (int) daysElapsed(new Timestamp(now.getTime()),new Timestamp(nextDateCourt.getTime()));	
						year+= nextDateCourt.getMonth()==0 ? 1 :0;
						nextDateCourt.setYear(year);
						 
						  
					    ps2 = new MPaySchedule(paymentPlan.getCtx(), null, null);
						ps2.setPercentage ( precentageSpecial.round(mc));
						ps2.setDiscount (Env.ZERO);
						ps2.setDiscountDays (0);
						ps2.setGraceDays (0);
						ps2.setNetDays (days);
						ps2.setIsValid (true);
						ps2.setC_PaymentTerm_ID(pt.get_ID());
						ps2.save();
						specialFee--;
					}
					
			 }
			 //Cuotas especiales restantes 
			 
			 for (int i = 0; i < specialFee; i++) {	
				 
						nextDateCourt.setDate(1);
						nextDateCourt.setMonth(++cantMoth);
						year+= nextDateCourt.getMonth()==0 ? 1 :0;
						nextDateCourt.setYear(year);
						 
						 
						lastDay= lastDayOfMonth(new Timestamp(nextDateCourt.getTime())).getDate();
						nextDateCourt.setDate( lastDay<dayCourt.intValue()? lastDay:dayCourt.intValue());
						days= (int) daysElapsed(new Timestamp(now.getTime()),new Timestamp(nextDateCourt.getTime()));	
						
							
					    ps2 = new MPaySchedule(paymentPlan.getCtx(), null, null);
						ps2.setPercentage (precentageSpecial.round(mc));
						ps2.setDiscount (Env.ZERO);
						ps2.setDiscountDays (0);
						ps2.setGraceDays (0);
						ps2.setNetDays (days);
						ps2.setIsValid (true);
						ps2.setC_PaymentTerm_ID(pt.get_ID());
						ps2.save();
					
					
					
			 }
			 
			 //Cuotas finales 
			 percentage=paymentPlan.getLVE_endFee().doubleValue()>0.0 ?paymentPlan.getLVE_endPercentage().divide( paymentPlan.getLVE_endFee(),mc):new BigDecimal(0.0);
			 
			
			 ps=null;
					
			 for (int i = 0; i < paymentPlan.getLVE_endFee().intValue(); i++) {	
				 
				        nextDateCourt.setDate(1);
					    nextDateCourt.setMonth(++cantMoth);
					    year+= nextDateCourt.getMonth()==0 ? 1 :0;
						nextDateCourt.setYear(year);
						 
						 
						lastDay= lastDayOfMonth(new Timestamp(nextDateCourt.getTime())).getDate();
						nextDateCourt.setDate( lastDay<dayCourt.intValue()? lastDay:dayCourt.intValue());
						days= (int) daysElapsed(new Timestamp(now.getTime()),new Timestamp(nextDateCourt.getTime()));	
						
					    ps = new MPaySchedule(paymentPlan.getCtx(), null, null);
						ps.setPercentage ( percentage.round(mc));
						ps.setDiscount (Env.ZERO);
						ps.setDiscountDays (0);
						ps.setGraceDays (0);
						ps.setNetDays (days);
						ps.setIsValid (true);
						ps.setC_PaymentTerm_ID(pt.get_ID());
						ps.save();
					
					
					
			 }
			 
			 String sConsulta = ""
					+ "SELECT  SUM (percentage) FROM c_payschedule WHERE  c_paymentterm_id=" + pt.get_ID();
				
		     BigDecimal value= DB.getSQLValueBDEx(  null ,sConsulta,new Object[] {});
		    
			 ps2.setPercentage(ps2.getPercentage().subtract(value.subtract(new BigDecimal(100.0), mc ),mc));
			 ps2.save();
			//update C_PaymentTerm old
				sql = 
					"update  c_payschedule set isvalid='Y' "
					+ " where C_PaymentTerm_ID = " + pt.get_ID();
				no = DB.executeUpdate(sql, null);
				
				sql = 
					"update  C_PaymentTerm  set isvalid='Y' "
					+ " where C_PaymentTerm_ID = " +pt.get_ID();
				no = DB.executeUpdate(sql, null);
		
			//Add relation with C_PaymentTerm
			sql = 
				"UPDATE LVE_PaymentPlan "
				+ " SET C_PaymentTerm_ID = " + pt.get_ID()
				+ " WHERE LVE_PaymentPlan_ID= " + paymentPlan.getLVE_PaymentPlan_ID();
			no = DB.executeUpdate(sql, null);
			//**************************************
	
		
		
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
		StringBuffer sb = new StringBuffer ("LVE_cita");
		return sb.toString ();
	}	//	toString
	
	 	
		public static Timestamp lastDayOfMonth(Timestamp date)
		{
			Timestamp lastDay = (Timestamp) date.clone();
			Calendar cal = GregorianCalendar.getInstance();
			cal.setTime(lastDay);
			lastDay.setDate(cal.getActualMaximum(GregorianCalendar.DAY_OF_MONTH));		
			return lastDay;
		}

		 
		public static long daysElapsed(Timestamp _From, Timestamp _To)
		{
			long dayCount = 0;

			dayCount = ((_To.getTime() - _From.getTime())/oneDay)+1;

			return dayCount-1;
		}

}	
package org.doubleclick.callout;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.model.MPayment;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.doubleclick.model.MLVEDeposit;

public class LVE_CalloutDeposit extends CalloutEngine {
	
	/*************************************************************************
	 *	Bank Deposit - LVE_Deposit.
	 *		- C_Payment_ID
	 *
	 *  @param ctx context
	 *  @param WindowNo current Window No
	 *  @param mTab Grid Tab
	 *  @param mField Grid Field
	 *  @param value New Value
	 *  @return null or error message
	 */
	public String paymentamt (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		Integer C_Payment_ID = (Integer)value;
		if (isCalloutActive() || C_Payment_ID == null || C_Payment_ID.intValue() == 0){
			mTab.setValue("Amount", Env.ZERO);
			mTab.setValue("C_BankAccount_ID", null);
			return "";
		}
		//
		MPayment payment = new MPayment (ctx, C_Payment_ID, null);
		mTab.setValue("Amount", payment.getPayAmt());
		mTab.setValue("C_BankAccount_ID", null);
	
		return "";
	}	//	paymentamt
	
	public String clean (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		
		if (isCalloutActive()){
			return "";
		}
		
		mTab.setValue("C_Payment_ID", null);
		mTab.setValue("C_BankAccount_ID", null);
		mTab.setValue("Amount", Env.ZERO);
					
		return "";
	}	//	clean
	
	/*************************************************************************
	 *	Bank Deposit - LVE_Deposit.
	 *		- C_BankAccount_ID
	 *
	 *  @param ctx context
	 *  @param WindowNo current Window No
	 *  @param mTab Grid Tab
	 *  @param mField Grid Field
	 *  @param value New Value
	 *  @return null or error message
	 */
	public String cashamt (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		Integer C_BankAccount_ID = (Integer)value;
		Integer LVE_Deposit_ID = (Integer) mTab.getValue("LVE_Deposit_ID");
		
		BigDecimal amount = Env.ZERO;
		
		if (isCalloutActive() || C_BankAccount_ID == null || C_BankAccount_ID.intValue() == 0){
			mTab.setValue("Amount", Env.ZERO);			
			mTab.setValue("C_BankAccount_ID", null);
			mTab.setValue("C_Payment_ID", null);
			return "";
		}
		
		MLVEDeposit deposit = new MLVEDeposit(Env.getCtx(), LVE_Deposit_ID, null);
		
		
		String sql = "SELECT COALESCE(SUM(CASE WHEN IsReceipt = 'Y' THEN (PayAmt) ELSE (PayAmt * -1) END),0) FROM C_Payment WHERE DocStatus IN ('CO','CL') AND TenderType = 'X' AND C_BPartner_ID IS NOT NULL AND C_BankAccount_ID = ? AND DateTrx <= ?";
		
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql,null);
			pstmt.setInt(1, C_BankAccount_ID);
			pstmt.setTimestamp(2, deposit.getDateTrx());
			rs = pstmt.executeQuery();
			if (rs.next())
			{
				amount = rs.getBigDecimal(1);
				
			}
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, sql, e);
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}
		
		mTab.setValue("CashAmount",amount);
		mTab.setValue("C_Payment_ID", null);
		mTab.setValue("Amount", Env.ZERO);
	
		return "";
	} //	paymentamt
	

}

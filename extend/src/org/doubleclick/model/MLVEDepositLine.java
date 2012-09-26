package org.doubleclick.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.I_C_Payment;
import org.compiere.model.MPayment;
import org.compiere.model.Query;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;

public class MLVEDepositLine extends X_LVE_DepositLine{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**	Static Logger	*/
	private static CLogger	s_log	= CLogger.getCLogger (MLVEDepositLine.class);

	/**************************************************************************
	 * 	Default Constructor
	 *	@param ctx context
	 *	@param LVE_DepositLine_ID id
	 *	@param trxName transaction
	 */
	public MLVEDepositLine(Properties ctx, int LVE_DepositLine_ID,
			String trxName) {
		super(ctx, LVE_DepositLine_ID, trxName);
	} 	//	MLVEDepositLine
	
	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MLVEDepositLine(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLVEDepositLine
	
	/** Parent						*/
	private MLVEDeposit m_parent = null;
	
	/**
	 * 	After Delete
	 *	@param success
	 *	@return true/false
	 */
	protected boolean afterDelete (boolean success)
	{
		if (!success)
			return success;
		
		return updateHeader();
	}	//	afterDelete
	
	/**************************************************************************
	 * 	Before Delete
	 *	@return true/false
	 */
	protected boolean beforeDelete ()
	{
		//	Cannot Delete generated Invoices
		if (getPrepareToOrConciliate().compareTo("N") != 0)
		{
			log.saveError("Error", Msg.getMsg(getCtx(), "CannotDeleteDepositLine"));
			return false;
		}
		return true;
	}	//	beforeDelete
	
	/**
	 * 	After Save
	 *	@param newRecord new
	 *	@param success success
	 *	@return saved
	 */
	protected boolean afterSave (boolean newRecord, boolean success)
	{
		if (!success)
			return success;
		
		return updateHeader();
	}	//	afterSave
	
	/**
	 * 	Update Deposit Header.
	 * 	Amount
	 *	@return true if success
	 */
	private boolean updateHeader()
	{
		String sql = "UPDATE LVE_Deposit dp"
			+ " SET DepositAmt="
			//replace null with 0 there is no difference with this
				+ "(SELECT COALESCE(SUM(dpl.Amount),0) "
				+ "FROM LVE_DepositLine dpl "
				+ "WHERE dpl.LVE_Deposit_ID=dp.LVE_Deposit_ID"
				+ " AND dpl.IsActive='Y'"
				+") "
			+ "WHERE LVE_Deposit_ID=" + getLVE_Deposit_ID();
		int no = DB.executeUpdate(sql, get_TrxName());
		if (no != 1)
			log.warning("Difference #" + no);
		
		return no == 1;
	}	//	updateHeader
	
	public MPayment[] getPayments (){
		
		String whereClauseFinal = "LVE_DepositLine_ID=? ";
		
		List<MPayment> list = new Query(getCtx(), I_C_Payment.Table_Name, whereClauseFinal, get_TrxName())
										.setParameters(getLVE_DepositLine_ID())
										.list();			
		
		return list.toArray(new MPayment[list.size()]);
	}// getPayments
	
	/**
	 * 	Get Parent
	 *	@return parent
	 */
	public MLVEDeposit getParent()
	{
		if (m_parent == null)
			m_parent = new MLVEDeposit(getCtx(), getLVE_Deposit_ID(), get_TrxName());
		return m_parent;
	}	//	getParent
	
	public boolean isConciliate(){
		if (getPrepareToOrConciliate().compareTo("C") == 0){
			return true;
		}
		return false;
	}
	
	public boolean isVoid(){
		if (getPrepareToOrConciliate().compareTo("V") == 0){
			return true;
		}
		return false;
	}
	
	/**************************************************************************
	 * 	Before Save
	 *	@return true/false
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		
		if (isCash() && getPrepareToOrConciliate().equals("N")){
			
			BigDecimal amount = Env.ZERO;
			
			String sql = "SELECT COALESCE(SUM(CASE WHEN IsReceipt = 'Y' THEN (PayAmt) ELSE (PayAmt * -1) END),0) FROM C_Payment WHERE DocStatus IN ('CO','CL') AND TenderType = 'X' AND C_BPartner_ID IS NOT NULL AND C_BankAccount_ID = ? AND DateTrx <= ?";
					
			PreparedStatement pstmt = null; 
			ResultSet rs = null;
			try
			{
				pstmt = DB.prepareStatement(sql,null);
				pstmt.setInt(1, getC_BankAccount_ID());
				pstmt.setTimestamp(2, getParent().getDateTrx());
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
			
			setCashAmount(amount);
			
			if (getAmount().compareTo(getCashAmount()) == 1){
				log.saveError("Error", Msg.getMsg(getCtx(), "AmountgreatherthantCashAmount"));
				return false;
			}
		}
		
		return true;
	}	//	beforeDelete

}

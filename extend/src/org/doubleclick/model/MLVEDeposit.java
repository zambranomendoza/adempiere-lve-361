package org.doubleclick.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MBankAccount;
import org.compiere.model.MBankStatement;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MPayment;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.Query;
import org.compiere.process.DocAction;
import org.compiere.process.DocumentEngine;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.TimeUtil;

public class MLVEDeposit extends X_LVE_Deposit implements DocAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1059261225029953753L;
	
	/**	Process Message 			*/
	private String		m_processMsg = null;
	/**	Just Prepared Flag			*/
	private boolean		m_justPrepared = false;
	
	private int BankAccount_ID = 0;		
	private int C_BPartner_ID = 0;
	private String TenderType = null;
	private int C_ConversionType_ID = 0;
	private int C_Currency_ID = 205;
	private int C_Charge_ID = 999;

	public MLVEDeposit(Properties ctx, int LVE_Deposit_ID, String trxName) {
		super(ctx, LVE_Deposit_ID, trxName);
		if (LVE_Deposit_ID == 0)
		{
			setDepositAmt(Env.ZERO);
			setDocAction(DOCACTION_Prepare);
			setDocStatus(DOCSTATUS_Drafted);
			//
			setC_DocType_ID(DocType_Standard);
			Timestamp today = TimeUtil.getDay(System.currentTimeMillis());
			setDateTrx(today);	// @#Date@
			setIsApproved(false);
			setProcessed (false);
		}
	}
	
	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MLVEDeposit (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MCash
	
	/**	Lines					*/
	private MLVEDepositLine[]		m_lines = null;
	
	/**
	 * 	Get Lines
	 *	@param requery requery
	 *	@return lines
	 */
	public MLVEDepositLine[] getLines (boolean requery)
	{
		if (m_lines != null && !requery) {
			set_TrxName(m_lines, get_TrxName());
			return m_lines;
		}
		
		final String whereClause =MLVEDepositLine.COLUMNNAME_LVE_Deposit_ID+"=?"; 
		List<MLVEDepositLine> list = new Query(getCtx(),I_LVE_DepositLine.Table_Name,  whereClause, get_TrxName())
								.setParameters(getLVE_Deposit_ID())
								.setOrderBy(I_LVE_DepositLine.COLUMNNAME_Line)
								.setOnlyActiveRecords(true)
								.list();
		
		m_lines =  list.toArray(new MLVEDepositLine[list.size()]);
		return m_lines;
	}	//	getLines
	
	/*************************************************************************/

	/** Sales Order Sub Type - SO	*/
	public static final String		DocType_Standard = "LVE_Deposit";
	
	/**
	 * 	Set Target Sales Document Type
	 * 	@param DocType_x - see DocType_*
	 */
	public void setC_DocType_ID (String DocType_x)
	{
		String sql = "SELECT C_DocType_ID FROM C_DocType "
			+ "WHERE AD_Client_ID=? AND AD_Org_ID IN (0," + getAD_Org_ID()
			+ ") AND Name=? "
			+ " AND IsActive='Y' "
			+ "ORDER BY AD_Org_ID DESC, IsDefault DESC";
		int C_DocType_ID = DB.getSQLValue(null, sql, getAD_Client_ID(), DocType_x);
		if (C_DocType_ID <= 0)
			log.severe ("Not found for AD_Client_ID=" + getAD_Client_ID () + ", Type=" + DocType_x);
		else
		{
			log.fine("(SO) - " + DocType_x);
			setC_DocType_ID (C_DocType_ID);
		}
	}	//	setC_DocType_ID

	/**************************************************************************
	 * 	Process document
	 *	@param processAction document action
	 *	@return true if performed
	 */
	public boolean processIt (String processAction)
	{
		m_processMsg = null;
		DocumentEngine engine = new DocumentEngine (this, getDocStatus());
		return engine.processIt (processAction, getDocAction());
	}	//	process

	/**
	 * 	Unlock Document.
	 * 	@return true if success 
	 */
	public boolean unlockIt()
	{
		log.info(toString());
		setProcessing(false);
		return true;
	}	//	unlockIt

	/**
	 * 	Invalidate Document
	 * 	@return true if success 
	 */
	public boolean invalidateIt()
	{
		log.info(toString());
		setDocAction(DOCACTION_Prepare);
		return true;
	}	//	invalidateIt

	/**
	 *	Prepare Document
	 * 	@return new status (In Progress or Invalid) 
	 */
	public String prepareIt()
	{
		log.info(toString());
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_PREPARE);
		if (m_processMsg != null)
			return DocAction.STATUS_NotApproved;
		
		MLVEDepositLine[] lines = getLines(false);
		if (lines.length == 0)
		{
			m_processMsg = "@NoLines@";
			return DocAction.STATUS_NotApproved;
		}
		
		if (!isPreparate()){
			
			for (int i = 0; i < lines.length; i++)
			{
				MLVEDepositLine line = lines[i];
				
				if (line.isCash())
				{
					BankAccount_ID = line.getC_BankAccount_ID();
					C_BPartner_ID = getDepositUser_ID();
					TenderType = MPayment.TENDERTYPE_Cash;
				}
				else{
					BankAccount_ID = line.getC_Payment().getC_BankAccount_ID();
					C_BPartner_ID = line.getC_Payment().getC_BPartner_ID();
					TenderType = line.getC_Payment().getTenderType();
				}
	
				MBankAccount mBankFrom = new MBankAccount(getCtx(),BankAccount_ID, get_TrxName());
				MBankAccount mBankTo = new MBankAccount(getCtx(),getC_BankAccount_ID(), get_TrxName());
				
				MPayment paymentBankFrom = new MPayment(getCtx(), 0 ,  get_TrxName());
				paymentBankFrom.setC_BankAccount_ID(mBankFrom.getC_BankAccount_ID());
				paymentBankFrom.setDescription(Msg.getMsg(Env.getAD_Language(getCtx()), "DocumentNo")+getDocumentNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "DepositNo")+" "+getDepositNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "Line")+" "+line.getLine());
				paymentBankFrom.setDateAcct(getDateTrx());
				paymentBankFrom.setDateTrx(getDateTrx());
				paymentBankFrom.setTenderType(TenderType);
				paymentBankFrom.setC_BPartner_ID (C_BPartner_ID);
				paymentBankFrom.setC_Currency_ID(C_Currency_ID);
				if (C_ConversionType_ID > 0)
					paymentBankFrom.setC_ConversionType_ID(C_ConversionType_ID);	
				paymentBankFrom.setPayAmt(line.getAmount());
				paymentBankFrom.setOverUnderAmt(Env.ZERO);
				paymentBankFrom.setC_DocType_ID(false);
				paymentBankFrom.setC_Charge_ID(C_Charge_ID);
				paymentBankFrom.setLVE_DepositLine_ID(line.getLVE_DepositLine_ID());
				
				paymentBankFrom.saveEx();
				
				if(!paymentBankFrom.processIt(MPayment.DOCACTION_Complete)) {
					log.warning("Payment Process Failed: " + paymentBankFrom + " - " + paymentBankFrom.getProcessMsg());
					throw new AdempiereException("Payment Process Failed: " + paymentBankFrom + " - " + paymentBankFrom.getProcessMsg());
				}
				
				paymentBankFrom.saveEx();
				
				MPayment paymentBankTo = new MPayment(getCtx(), 0 ,  get_TrxName());
				paymentBankTo.setC_BankAccount_ID(mBankTo.getC_BankAccount_ID());
				paymentBankTo.setDescription(Msg.getMsg(Env.getAD_Language(getCtx()), "Document No")+getDocumentNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "Deposit No")+" "+getDepositNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "Line")+" "+line.getLine());
				paymentBankTo.setDateAcct(getDateTrx());
				paymentBankTo.setDateTrx(getDateTrx());
				paymentBankTo.setTenderType(MPayment.TENDERTYPE_DirectDeposit);
				paymentBankTo.setC_BPartner_ID (C_BPartner_ID);
				paymentBankTo.setC_Currency_ID(C_Currency_ID);
				if (C_ConversionType_ID > 0)
					paymentBankFrom.setC_ConversionType_ID(C_ConversionType_ID);	
				paymentBankTo.setPayAmt(line.getAmount());
				paymentBankTo.setOverUnderAmt(Env.ZERO);
				paymentBankTo.setC_DocType_ID(true);
				paymentBankTo.setC_Charge_ID(C_Charge_ID);
				paymentBankTo.setLVE_DepositLine_ID(line.getLVE_DepositLine_ID());
				paymentBankTo.saveEx();
				
				if (!paymentBankTo.processIt(MPayment.DOCACTION_Complete)) {
					log.warning("Payment Process Failed: " + paymentBankTo + " - " + paymentBankTo.getProcessMsg());
					throw new AdempiereException("Payment Process Failed: " + paymentBankTo + " - " + paymentBankTo.getProcessMsg());
				}
				paymentBankTo.saveEx();
				
				line.setPrepareToOrConciliate("P");
				
				if (!line.save())
				{
					m_processMsg = "Could not update Deposit Line";
					return DocAction.STATUS_Invalid;
				}
				
				
			}
			
			setIsPreparate(true);
			
		}
		
		
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_PREPARE);
		if (m_processMsg != null)
			return DocAction.STATUS_NotApproved;
		
		m_justPrepared = true;

		if (!DOCACTION_Complete.equals(getDocAction()))
			setDocAction(DOCACTION_Complete);
		return DocAction.STATUS_InProgress;
	}	//	prepareIt

	/**
	 * 	Approve Document
	 * 	@return true if success 
	 */
	public boolean  approveIt()
	{
		log.info(toString());
		setIsApproved(true);
		return true;
	}	//	approveIt

	/**
	 * 	Reject Approval
	 * 	@return true if success 
	 */
	public boolean rejectIt()
	{
		log.info(toString());
		setIsApproved(false);
		return true;
	}	//	rejectIt

	/**
	 * 	Complete Document
	 * 	@return new status (Complete, In Progress, Invalid, Waiting ..)
	 */
	public String completeIt() {
		
		//		Re-Check
		if (!m_justPrepared)
		{
			String status = prepareIt();
			if (!DocAction.STATUS_InProgress.equals(status))
				return status;
		}
		
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_COMPLETE);
		if (m_processMsg != null)
			return DocAction.STATUS_Invalid;
		
		//	Implicit Approval
		if (!isApproved())
			approveIt();
		
		//
		log.info(toString());
		
		/*List<MBankStatement> cashbooksorbanks = new ArrayList<MBankStatement>();
		
		MBankStatement actual = null;
		
		MLVEDepositLine[] lines = getLines(false);
		
		for (MLVEDepositLine line : lines) {
			
			if (!line.getPrepareToOrConciliate().equals("V") && !line.getPrepareToOrConciliate().equals("C")){
				
				MPayment[] Paylines = line.getPayments();
				
				for (MPayment mPayment : Paylines) {
					
					if (!mPayment.isReconciled()){
						
						if (!cashbooksorbanks.isEmpty()){
							
							if (mPayment.getC_BankAccount_ID() != actual.getC_BankAccount_ID()){							
									
								Iterator<MBankStatement> i = cashbooksorbanks.iterator();
								boolean found = false; 
								while (i.hasNext()) {
										
									MBankStatement cashbookorbank = i.next();
										
									if (cashbookorbank.getC_BankAccount_ID() == mPayment.getC_BankAccount_ID()){
										actual = cashbookorbank;
										found = true;
										break;
									}
								}
									
								if (!found){
									MBankAccount ch = new MBankAccount(getCtx(), mPayment.getC_BankAccount_ID(), get_TrxName());
									actual = new MBankStatement(ch, true);
									
									actual.setName("Deposit "+actual.getName());
									
									actual.setDescription(Msg.getMsg(Env.getAD_Language(getCtx()), "DocumentNo")+" "+line.getLVE_Deposit().getDocumentNo()+" - "+Msg.getMsg(Env.getAD_Language(getCtx()), "DepositNo")+" "+line.getLVE_Deposit().getDepositNo()+" - "+Msg.getMsg(Env.getAD_Language(getCtx()), "Line")+" "+line.getLine()+" - "+Msg.getMsg(Env.getAD_Language(getCtx()), "Amount")+" "+line.getAmount());
									
									actual.saveEx();
									
									cashbooksorbanks.add(actual);
								}
													
							}
							else{
								continue;
							}
								
						}
						else{
							MBankAccount ch = new MBankAccount(getCtx(), mPayment.getC_BankAccount_ID(), get_TrxName());
							actual = new MBankStatement(ch, true);
							
							actual.setName("Deposit "+actual.getName());
							
							actual.setDescription(Msg.getMsg(Env.getAD_Language(getCtx()), "DocumentNo")+" "+line.getLVE_Deposit().getDocumentNo()+" - "+Msg.getMsg(Env.getAD_Language(getCtx()), "DepositNo")+" "+line.getLVE_Deposit().getDepositNo()+" - "+Msg.getMsg(Env.getAD_Language(getCtx()), "Line")+" "+line.getLine()+" - "+Msg.getMsg(Env.getAD_Language(getCtx()), "Amount")+" "+line.getAmount());
								
							actual.saveEx();
								
							cashbooksorbanks.add(actual);						
						}
							
						MBankStatementLine bkline = new MBankStatementLine(getCtx(), 0, get_TrxName());
						bkline.setStatementLineDate(actual.getStatementDate());
						bkline.setDateAcct(mPayment.getDateAcct());
						bkline.setValutaDate(new Timestamp(System.currentTimeMillis()));
						bkline.setPayment(mPayment);				 
						bkline.setStmtAmt(mPayment.getPayAmt(true));
						bkline.setTrxAmt(mPayment.getPayAmt(true));
						bkline.setC_BankStatement_ID(actual.getC_BankStatement_ID());
						bkline.saveEx();
					}
					
				}
				
			}
			
			line.setPrepareToOrConciliate("C");
			
			if (!line.save())
			{
				m_processMsg = "Could not update Deposit Line";
				return DocAction.STATUS_Invalid;
			}
			
		}
		
		Iterator<MBankStatement> i = cashbooksorbanks.iterator();
		 
		while (i.hasNext()) {
				
			MBankStatement cashbookorbank = i.next();
				
			if(!cashbookorbank.processIt(MBankStatement.DOCACTION_Complete)) {
				log.warning("BankStatement Process Failed: " + cashbookorbank + " - " + cashbookorbank.getProcessMsg());
				throw new AdempiereException("Bank Statement Process Failed: " + cashbookorbank + " - " + cashbookorbank.getProcessMsg());
			}
			
			cashbookorbank.saveEx();
		}*/
			
		//	User Validation
		String valid = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_COMPLETE);
		if (valid != null)
		{
			m_processMsg = valid;
			return DocAction.STATUS_Invalid;
		}
		//
		setProcessed(true);
		setDocAction(DOCACTION_Close);
		return DocAction.STATUS_Completed;
	}
	
	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString ()
	{
		StringBuffer sb = new StringBuffer ("MLVEDeposit[");
		sb.append (get_ID ())
			.append ("-").append (getDepositNo())
			.append(", Deposit Amt=").append(getDepositAmt())
			.append ("]");
		return sb.toString ();
	}	//	toString

	/**
	 * 	Void Document.
	 * 	Same as Close.
	 * 	@return true if success 
	 */
	public boolean voidIt()
	{
		log.info(toString());
		// Before Void
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_VOID);
		if (m_processMsg != null)
			return false;

		if (DOCSTATUS_Closed.equals(getDocStatus())
				|| DOCSTATUS_Reversed.equals(getDocStatus())
				|| DOCSTATUS_Voided.equals(getDocStatus()))
			{
				m_processMsg = "Document Closed: " + getDocStatus();
				setDocAction(DOCACTION_None);
				return false;
			}
		
			MLVEDepositLine[] lines = getLines(false);
		
			for (MLVEDepositLine line : lines) {
				
				if (!line.isVoid()){
					
					MPayment[] Paylines = line.getPayments();
					
					for (MPayment mPayment : Paylines) {
						
						if (!mPayment.isReconciled()){
							
							if(!mPayment.processIt(MPayment.DOCACTION_Void)) {
								log.warning("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
								throw new AdempiereException("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
							}
							
							mPayment.saveEx();
							
						}
						else{
							
							log.warning("Payment Process Failed: " + mPayment + " - " + " Pago Conciliado ");
							throw new AdempiereException("Payment Process Failed: " + mPayment + " - " + " Pago Conciliado ");
							
							/*MBankStatement bkst = mPayment.getBankStatementAssociated();
							
							if(!bkst.processIt(MPayment.DOCACTION_Void)) {
								log.warning("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
								throw new AdempiereException("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
							}
							
							bkst.saveEx();
							
							if(!mPayment.processIt(MPayment.DOCACTION_Void)) {
								log.warning("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
								throw new AdempiereException("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
							}
							
							mPayment.saveEx();*/
							
						}
					}
					
					line.setPrepareToOrConciliate("V");
					line.saveEx();
				}
				
			}
		
		
			m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_VOID);
			if (m_processMsg != null)
				return false;		
			setDocAction(DOCACTION_None);

	      return true;
	}	//	voidIt

	/**
	 * 	Close Document.
	 * 	Cancel not delivered Quantities
	 * 	@return true if success 
	 */
	public boolean closeIt()
	{
		log.info(toString());
		// Before Close
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_CLOSE);
		if (m_processMsg != null)
			return false;
		
		setDocAction(DOCACTION_None);

		// After Close
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_CLOSE);
		if (m_processMsg != null)
			return false;
		return true;
	}	//	closeIt

	/**
	 * 	Reverse Correction
	 * 	@return true if success 
	 */
	public boolean reverseCorrectIt()
	{
		log.info(toString());
		// Before reverseCorrect
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_REVERSECORRECT);
		if (m_processMsg != null)
			return false;
		
		//if (retValue) {
			// After reverseCorrect
			m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_REVERSECORRECT);
			if (m_processMsg != null)
				return false;		
		//}
		
		//return retValue;
		return true;
	}	//	reverseCorrectionIt

	/**
	 * 	Reverse Accrual - none
	 * 	@return true if success 
	 */
	public boolean reverseAccrualIt()
	{
		log.info(toString());
		// Before reverseAccrual
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_REVERSEACCRUAL);
		if (m_processMsg != null)
			return false;
		
		// After reverseAccrual
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_REVERSEACCRUAL);
		if (m_processMsg != null)
			return false;
				
		return false;
	}	//	reverseAccrualIt

	/** 
	 * 	Re-activate
	 * 	@return true if success 
	 */
	public boolean reActivateIt()
	{
		log.info(toString());
		// Before reActivate
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_REACTIVATE);
		if (m_processMsg != null)
			return false;	
				
		setProcessed(false);
		if (reverseCorrectIt())
			return true;

		// After reActivate
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_REACTIVATE);
		if (m_processMsg != null)
			return false;		
		return false;
	}	//	reActivateIt

	/*************************************************************************
	 * 	Get Summary
	 *	@return Summary of Document
	 */
	public String getSummary()
	{
		StringBuffer sb = new StringBuffer();
		sb.append(Msg.translate(getCtx(),"AccountNo")+" : "+getC_BankAccount().getAccountNo()+" - "+Msg.translate(getCtx(),"DepositNo")+" : "+getDepositNo());
		//	: Total Lines = 123.00 (#1)
		sb.append(": ")
			.append(Msg.translate(getCtx(),"DepositAmmount")).append("=").append(getDepositAmt())
			.append(",")
			.append(" (#").append(getLines(false).length).append(")");
		//	 - Description
		if (getDescription() != null && getDescription().length() > 0)
			sb.append(" - ").append(getDescription());
		return sb.toString();
	}	//	getSummary

	/**
	 * 	Get Document Info
	 *	@return document info (untranslated)
	 */
	public String getDocumentInfo() {
		return Msg.getElement(getCtx(), "LVE_Deposit_ID") + " " + getDocumentNo();
	} // getDocumentInfo

	@Override
	public File createPDF() {
		try
		{
			File temp = File.createTempFile(get_TableName()+get_ID()+"_", ".pdf");
			return createPDF (temp);
		}
		catch (Exception e)
		{
			log.severe("Could not create PDF - " + e.getMessage());
		}
		return null;
	}   //	getPDF
	
	/**
	 * 	Create PDF file
	 *	@param file output file
	 *	@return file if success
	 */
	public File createPDF (File file)
	{
	//	ReportEngine re = ReportEngine.get (getCtx(), ReportEngine.INVOICE, getC_Invoice_ID());
	//	if (re == null)
			return null;
	//	return re.getPDF(file);
	}	//	createPDF

	/**
	 * 	Get Process Message
	 *	@return clear text error message
	 */
	public String getProcessMsg()
	{
		return m_processMsg;
	}	//	getProcessMsg

	/**
	 * 	Get Document Owner (Responsible)
	 *	@return AD_User_ID
	 */
	public int getDoc_User_ID()
	{
		return getCreatedBy();
	}	//	getDoc_User_ID

	/**
	 * 	Get Currency
	 *	@return Currency
	 */
	public int getC_Currency_ID ()
	{
		return 0;
	}	//	getC_Currency_ID

	/**
	 * 	Get Document Approval Amount
	 *	@return amount difference
	 */
	public BigDecimal getApprovalAmt()
	{
		return getDepositAmt();
	}	//	getApprovalAmt
	
	/**************************************************************************
	 * 	Before Delete
	 *	@return true/false
	 */
	protected boolean beforeDelete ()
	{
		//	Cannot Delete generated Invoices
		if (getDocStatus().compareTo(DOCSTATUS_NotApproved) != 0 && getDocStatus().compareTo(DOCSTATUS_Drafted) != 0)
		{
			log.saveError("Error", Msg.getMsg(getCtx(), "CannotDeleteDeposit"));
			return false;
		}
		
		MLVEDepositLine[] lines = getLines(false);
		if (lines.length > 0){
			log.saveError("Error", Msg.getMsg(getCtx(), "CannotDeleteDepositWithLines"));
			return false;
		}
		return true;
	}	//	beforeDelete
	
	/**
	 * 	Get Deposit Lines of Deposit
	 * 	@param whereClause starting with AND
	 * 	@return lines
	 */
	public MLVEDepositLine[] getLines (String whereClause)
	{
		String whereClauseFinal = "LVE_Deposit_ID=? ";
		if (whereClause != null)
			whereClauseFinal += whereClause;
		List<MLVEDepositLine> list = new Query(getCtx(), I_LVE_DepositLine.Table_Name, whereClauseFinal, get_TrxName())
										.setParameters(getLVE_Deposit_ID())
										.setOrderBy(I_LVE_DepositLine.COLUMNNAME_Line)
										.list();
		return list.toArray(new MLVEDepositLine[list.size()]);
	}	//	getLines

}

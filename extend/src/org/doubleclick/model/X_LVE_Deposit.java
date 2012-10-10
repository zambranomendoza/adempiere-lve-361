/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
/** Generated Model - DO NOT CHANGE */
package org.doubleclick.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;

/** Generated Model for LVE_Deposit
 *  @author Adempiere (generated) 
 *  @version 3.6.0LTS+P20120111 - $Id$ */
public class X_LVE_Deposit extends PO implements I_LVE_Deposit, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120830L;

    /** Standard Constructor */
    public X_LVE_Deposit (Properties ctx, int LVE_Deposit_ID, String trxName)
    {
      super (ctx, LVE_Deposit_ID, trxName);
      /** if (LVE_Deposit_ID == 0)
        {
			setC_BankAccount_ID (0);
			setC_DocType_ID (0);
			setDateTrx (new Timestamp( System.currentTimeMillis() ));
// @#Date@
			setDepositAmt (Env.ZERO);
// 0
			setDepositNo (null);
			setDocAction (null);
// PR
			setDocStatus (null);
// DR
			setDocumentNo (null);
			setIsApproved (false);
// N
			setIsPreparate (false);
			setIsReconciled (false);
			setLVE_Deposit_ID (0);
			setProcessed (false);
        } */
    }

    /** Load Constructor */
    public X_LVE_Deposit (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 3 - Client - Org 
      */
    protected int get_AccessLevel()
    {
      return accessLevel.intValue();
    }

    /** Load Meta Data */
    protected POInfo initPO (Properties ctx)
    {
      POInfo poi = POInfo.getPOInfo (ctx, Table_ID, get_TrxName());
      return poi;
    }

    public String toString()
    {
      StringBuffer sb = new StringBuffer ("X_LVE_Deposit[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Cash Amount.
		@param CashAmt Cash Amount	  */
	public void setCashAmt (BigDecimal CashAmt)
	{
		throw new IllegalArgumentException ("CashAmt is virtual column");	}

	/** Get Cash Amount.
		@return Cash Amount	  */
	public BigDecimal getCashAmt () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_CashAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	public I_C_BankAccount getC_BankAccount() throws RuntimeException
    {
		return (I_C_BankAccount)MTable.get(getCtx(), I_C_BankAccount.Table_Name)
			.getPO(getC_BankAccount_ID(), get_TrxName());	}

	/** Set Bank Account.
		@param C_BankAccount_ID 
		Account at the Bank
	  */
	public void setC_BankAccount_ID (int C_BankAccount_ID)
	{
		if (C_BankAccount_ID < 1) 
			set_Value (COLUMNNAME_C_BankAccount_ID, null);
		else 
			set_Value (COLUMNNAME_C_BankAccount_ID, Integer.valueOf(C_BankAccount_ID));
	}

	/** Get Bank Account.
		@return Account at the Bank
	  */
	public int getC_BankAccount_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BankAccount_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_DocType getC_DocType() throws RuntimeException
    {
		return (I_C_DocType)MTable.get(getCtx(), I_C_DocType.Table_Name)
			.getPO(getC_DocType_ID(), get_TrxName());	}

	/** Set Document Type.
		@param C_DocType_ID 
		Document type or rules
	  */
	public void setC_DocType_ID (int C_DocType_ID)
	{
		if (C_DocType_ID < 0) 
			set_Value (COLUMNNAME_C_DocType_ID, null);
		else 
			set_Value (COLUMNNAME_C_DocType_ID, Integer.valueOf(C_DocType_ID));
	}

	/** Get Document Type.
		@return Document type or rules
	  */
	public int getC_DocType_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_DocType_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Check Amount.
		@param CheckAmt Check Amount	  */
	public void setCheckAmt (BigDecimal CheckAmt)
	{
		throw new IllegalArgumentException ("CheckAmt is virtual column");	}

	/** Get Check Amount.
		@return Check Amount	  */
	public BigDecimal getCheckAmt () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_CheckAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Create lines from.
		@param CreateFrom 
		Process which will generate a new document lines based on an existing document
	  */
	public void setCreateFrom (String CreateFrom)
	{
		set_Value (COLUMNNAME_CreateFrom, CreateFrom);
	}

	/** Get Create lines from.
		@return Process which will generate a new document lines based on an existing document
	  */
	public String getCreateFrom () 
	{
		return (String)get_Value(COLUMNNAME_CreateFrom);
	}

	/** Set Transaction Date.
		@param DateTrx 
		Transaction Date
	  */
	public void setDateTrx (Timestamp DateTrx)
	{
		set_Value (COLUMNNAME_DateTrx, DateTrx);
	}

	/** Get Transaction Date.
		@return Transaction Date
	  */
	public Timestamp getDateTrx () 
	{
		return (Timestamp)get_Value(COLUMNNAME_DateTrx);
	}

	/** Set Deposit Amt.
		@param DepositAmt Deposit Amt	  */
	public void setDepositAmt (BigDecimal DepositAmt)
	{
		set_Value (COLUMNNAME_DepositAmt, DepositAmt);
	}

	/** Get Deposit Amt.
		@return Deposit Amt	  */
	public BigDecimal getDepositAmt () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_DepositAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Deposit No.
		@param DepositNo Deposit No	  */
	public void setDepositNo (String DepositNo)
	{
		set_Value (COLUMNNAME_DepositNo, DepositNo);
	}

	/** Get Deposit No.
		@return Deposit No	  */
	public String getDepositNo () 
	{
		return (String)get_Value(COLUMNNAME_DepositNo);
	}

	public I_AD_User getDepositUser() throws RuntimeException
    {
		return (I_AD_User)MTable.get(getCtx(), I_AD_User.Table_Name)
			.getPO(getDepositUser_ID(), get_TrxName());	}

	/** Set DepositUser_ID.
		@param DepositUser_ID DepositUser_ID	  */
	public void setDepositUser_ID (int DepositUser_ID)
	{
		if (DepositUser_ID < 1) 
			set_Value (COLUMNNAME_DepositUser_ID, null);
		else 
			set_Value (COLUMNNAME_DepositUser_ID, Integer.valueOf(DepositUser_ID));
	}

	/** Get DepositUser_ID.
		@return DepositUser_ID	  */
	public int getDepositUser_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_DepositUser_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Description.
		@param Description 
		Optional short description of the record
	  */
	public void setDescription (String Description)
	{
		set_Value (COLUMNNAME_Description, Description);
	}

	/** Get Description.
		@return Optional short description of the record
	  */
	public String getDescription () 
	{
		return (String)get_Value(COLUMNNAME_Description);
	}

	/** DocAction AD_Reference_ID=135 */
	public static final int DOCACTION_AD_Reference_ID=135;
	/** Complete = CO */
	public static final String DOCACTION_Complete = "CO";
	/** Approve = AP */
	public static final String DOCACTION_Approve = "AP";
	/** Reject = RJ */
	public static final String DOCACTION_Reject = "RJ";
	/** Post = PO */
	public static final String DOCACTION_Post = "PO";
	/** Void = VO */
	public static final String DOCACTION_Void = "VO";
	/** Close = CL */
	public static final String DOCACTION_Close = "CL";
	/** Reverse - Correct = RC */
	public static final String DOCACTION_Reverse_Correct = "RC";
	/** Reverse - Accrual = RA */
	public static final String DOCACTION_Reverse_Accrual = "RA";
	/** Invalidate = IN */
	public static final String DOCACTION_Invalidate = "IN";
	/** Re-activate = RE */
	public static final String DOCACTION_Re_Activate = "RE";
	/** <None> = -- */
	public static final String DOCACTION_None = "--";
	/** Prepare = PR */
	public static final String DOCACTION_Prepare = "PR";
	/** Unlock = XL */
	public static final String DOCACTION_Unlock = "XL";
	/** Wait Complete = WC */
	public static final String DOCACTION_WaitComplete = "WC";
	/** Set Document Action.
		@param DocAction 
		The targeted status of the document
	  */
	public void setDocAction (String DocAction)
	{

		set_Value (COLUMNNAME_DocAction, DocAction);
	}

	/** Get Document Action.
		@return The targeted status of the document
	  */
	public String getDocAction () 
	{
		return (String)get_Value(COLUMNNAME_DocAction);
	}

	/** DocStatus AD_Reference_ID=131 */
	public static final int DOCSTATUS_AD_Reference_ID=131;
	/** Drafted = DR */
	public static final String DOCSTATUS_Drafted = "DR";
	/** Completed = CO */
	public static final String DOCSTATUS_Completed = "CO";
	/** Approved = AP */
	public static final String DOCSTATUS_Approved = "AP";
	/** Not Approved = NA */
	public static final String DOCSTATUS_NotApproved = "NA";
	/** Voided = VO */
	public static final String DOCSTATUS_Voided = "VO";
	/** Invalid = IN */
	public static final String DOCSTATUS_Invalid = "IN";
	/** Reversed = RE */
	public static final String DOCSTATUS_Reversed = "RE";
	/** Closed = CL */
	public static final String DOCSTATUS_Closed = "CL";
	/** Unknown = ?? */
	public static final String DOCSTATUS_Unknown = "??";
	/** In Progress = IP */
	public static final String DOCSTATUS_InProgress = "IP";
	/** Waiting Payment = WP */
	public static final String DOCSTATUS_WaitingPayment = "WP";
	/** Waiting Confirmation = WC */
	public static final String DOCSTATUS_WaitingConfirmation = "WC";
	/** Set Document Status.
		@param DocStatus 
		The current status of the document
	  */
	public void setDocStatus (String DocStatus)
	{

		set_Value (COLUMNNAME_DocStatus, DocStatus);
	}

	/** Get Document Status.
		@return The current status of the document
	  */
	public String getDocStatus () 
	{
		return (String)get_Value(COLUMNNAME_DocStatus);
	}

	/** Set Document No.
		@param DocumentNo 
		Document sequence number of the document
	  */
	public void setDocumentNo (String DocumentNo)
	{
		set_Value (COLUMNNAME_DocumentNo, DocumentNo);
	}

	/** Get Document No.
		@return Document sequence number of the document
	  */
	public String getDocumentNo () 
	{
		return (String)get_Value(COLUMNNAME_DocumentNo);
	}

	/** Set Approved.
		@param IsApproved 
		Indicates if this document requires approval
	  */
	public void setIsApproved (boolean IsApproved)
	{
		set_Value (COLUMNNAME_IsApproved, Boolean.valueOf(IsApproved));
	}

	/** Get Approved.
		@return Indicates if this document requires approval
	  */
	public boolean isApproved () 
	{
		Object oo = get_Value(COLUMNNAME_IsApproved);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Is Preparate.
		@param IsPreparate Is Preparate	  */
	public void setIsPreparate (boolean IsPreparate)
	{
		set_Value (COLUMNNAME_IsPreparate, Boolean.valueOf(IsPreparate));
	}

	/** Get Is Preparate.
		@return Is Preparate	  */
	public boolean isPreparate () 
	{
		Object oo = get_Value(COLUMNNAME_IsPreparate);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Reconciled.
		@param IsReconciled 
		Payment is reconciled with bank statement
	  */
	public void setIsReconciled (boolean IsReconciled)
	{
		set_Value (COLUMNNAME_IsReconciled, Boolean.valueOf(IsReconciled));
	}

	/** Get Reconciled.
		@return Payment is reconciled with bank statement
	  */
	public boolean isReconciled () 
	{
		Object oo = get_Value(COLUMNNAME_IsReconciled);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Bank Deposit.
		@param LVE_Deposit_ID Bank Deposit	  */
	public void setLVE_Deposit_ID (int LVE_Deposit_ID)
	{
		if (LVE_Deposit_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LVE_Deposit_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LVE_Deposit_ID, Integer.valueOf(LVE_Deposit_ID));
	}

	/** Get Bank Deposit.
		@return Bank Deposit	  */
	public int getLVE_Deposit_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LVE_Deposit_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Processed.
		@param Processed 
		The document has been processed
	  */
	public void setProcessed (boolean Processed)
	{
		set_Value (COLUMNNAME_Processed, Boolean.valueOf(Processed));
	}

	/** Get Processed.
		@return The document has been processed
	  */
	public boolean isProcessed () 
	{
		Object oo = get_Value(COLUMNNAME_Processed);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Process Now.
		@param Processing Process Now	  */
	public void setProcessing (boolean Processing)
	{
		set_Value (COLUMNNAME_Processing, Boolean.valueOf(Processing));
	}

	/** Get Process Now.
		@return Process Now	  */
	public boolean isProcessing () 
	{
		Object oo = get_Value(COLUMNNAME_Processing);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}
}
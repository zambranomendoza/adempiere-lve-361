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
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;

/** Generated Model for LVE_DepositLine
 *  @author Adempiere (generated) 
 *  @version 3.6.0LTS+P20120111 - $Id$ */
public class X_LVE_DepositLine extends PO implements I_LVE_DepositLine, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120906L;

    /** Standard Constructor */
    public X_LVE_DepositLine (Properties ctx, int LVE_DepositLine_ID, String trxName)
    {
      super (ctx, LVE_DepositLine_ID, trxName);
      /** if (LVE_DepositLine_ID == 0)
        {
			setAmount (Env.ZERO);
			setIsCash (true);
// 'Y'
			setLine (0);
// @SQL=SELECT COALESCE(MAX(Line),0)+10 FROM LVE_DepositLine WHERE LVE_Deposit_ID=@LVE_Deposit_ID@
			setLVE_Deposit_ID (0);
			setLVE_DepositLine_ID (0);
			setPrepareToOrConciliate (null);
// 'N'
        } */
    }

    /** Load Constructor */
    public X_LVE_DepositLine (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LVE_DepositLine[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Amount.
		@param Amount 
		Amount in a defined currency
	  */
	public void setAmount (BigDecimal Amount)
	{
		set_Value (COLUMNNAME_Amount, Amount);
	}

	/** Get Amount.
		@return Amount in a defined currency
	  */
	public BigDecimal getAmount () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Amount);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Cash Amount.
		@param CashAmount Cash Amount	  */
	public void setCashAmount (BigDecimal CashAmount)
	{
		set_Value (COLUMNNAME_CashAmount, CashAmount);
	}

	/** Get Cash Amount.
		@return Cash Amount	  */
	public BigDecimal getCashAmount () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_CashAmount);
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

	public I_C_BankStatement getC_BankStatement() throws RuntimeException
    {
		return (I_C_BankStatement)MTable.get(getCtx(), I_C_BankStatement.Table_Name)
			.getPO(getC_BankStatement_ID(), get_TrxName());	}

	/** Set Bank Statement.
		@param C_BankStatement_ID 
		Bank Statement of account
	  */
	public void setC_BankStatement_ID (int C_BankStatement_ID)
	{
		if (C_BankStatement_ID < 1) 
			set_Value (COLUMNNAME_C_BankStatement_ID, null);
		else 
			set_Value (COLUMNNAME_C_BankStatement_ID, Integer.valueOf(C_BankStatement_ID));
	}

	/** Get Bank Statement.
		@return Bank Statement of account
	  */
	public int getC_BankStatement_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BankStatement_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Conciliate.
		@param Conciliate Conciliate	  */
	public void setConciliate (String Conciliate)
	{
		set_Value (COLUMNNAME_Conciliate, Conciliate);
	}

	/** Get Conciliate.
		@return Conciliate	  */
	public String getConciliate () 
	{
		return (String)get_Value(COLUMNNAME_Conciliate);
	}

	public I_C_Payment getC_Payment() throws RuntimeException
    {
		return (I_C_Payment)MTable.get(getCtx(), I_C_Payment.Table_Name)
			.getPO(getC_Payment_ID(), get_TrxName());	}

	/** Set Payment.
		@param C_Payment_ID 
		Payment identifier
	  */
	public void setC_Payment_ID (int C_Payment_ID)
	{
		if (C_Payment_ID < 1) 
			set_Value (COLUMNNAME_C_Payment_ID, null);
		else 
			set_Value (COLUMNNAME_C_Payment_ID, Integer.valueOf(C_Payment_ID));
	}

	/** Get Payment.
		@return Payment identifier
	  */
	public int getC_Payment_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Payment_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Is Cash.
		@param IsCash Is Cash	  */
	public void setIsCash (boolean IsCash)
	{
		set_Value (COLUMNNAME_IsCash, Boolean.valueOf(IsCash));
	}

	/** Get Is Cash.
		@return Is Cash	  */
	public boolean isCash () 
	{
		Object oo = get_Value(COLUMNNAME_IsCash);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Line No.
		@param Line 
		Unique line for this document
	  */
	public void setLine (int Line)
	{
		set_Value (COLUMNNAME_Line, Integer.valueOf(Line));
	}

	/** Get Line No.
		@return Unique line for this document
	  */
	public int getLine () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Line);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public org.doubleclick.model.I_LVE_Deposit getLVE_Deposit() throws RuntimeException
    {
		return (org.doubleclick.model.I_LVE_Deposit)MTable.get(getCtx(), org.doubleclick.model.I_LVE_Deposit.Table_Name)
			.getPO(getLVE_Deposit_ID(), get_TrxName());	}

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

	/** Set Deposit Line.
		@param LVE_DepositLine_ID Deposit Line	  */
	public void setLVE_DepositLine_ID (int LVE_DepositLine_ID)
	{
		if (LVE_DepositLine_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LVE_DepositLine_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LVE_DepositLine_ID, Integer.valueOf(LVE_DepositLine_ID));
	}

	/** Get Deposit Line.
		@return Deposit Line	  */
	public int getLVE_DepositLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LVE_DepositLine_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** PrepareToOrConciliate AD_Reference_ID=1000013 */
	public static final int PREPARETOORCONCILIATE_AD_Reference_ID=1000013;
	/** None = N */
	public static final String PREPARETOORCONCILIATE_None = "N";
	/** Prepare To = P */
	public static final String PREPARETOORCONCILIATE_PrepareTo = "P";
	/** Conciliate = C */
	public static final String PREPARETOORCONCILIATE_Conciliate = "C";
	/** Canceled = D */
	public static final String PREPARETOORCONCILIATE_Canceled = "D";
	/** Set Prepare To Or Conciliate.
		@param PrepareToOrConciliate Prepare To Or Conciliate	  */
	public void setPrepareToOrConciliate (String PrepareToOrConciliate)
	{

		set_Value (COLUMNNAME_PrepareToOrConciliate, PrepareToOrConciliate);
	}

	/** Get Prepare To Or Conciliate.
		@return Prepare To Or Conciliate	  */
	public String getPrepareToOrConciliate () 
	{
		return (String)get_Value(COLUMNNAME_PrepareToOrConciliate);
	}
}
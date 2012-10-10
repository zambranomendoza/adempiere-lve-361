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
package org.doubleclick.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for LVE_DepositLine
 *  @author Adempiere (generated) 
 *  @version 3.6.0LTS+P20120111
 */
public interface I_LVE_DepositLine 
{

    /** TableName=LVE_DepositLine */
    public static final String Table_Name = "LVE_DepositLine";

    /** AD_Table_ID=1000031 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 3 - Client - Org 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(3);

    /** Load Meta Data */

    /** Column name AD_Client_ID */
    public static final String COLUMNNAME_AD_Client_ID = "AD_Client_ID";

	/** Get Client.
	  * Client/Tenant for this installation.
	  */
	public int getAD_Client_ID();

    /** Column name AD_Org_ID */
    public static final String COLUMNNAME_AD_Org_ID = "AD_Org_ID";

	/** Set Organization.
	  * Organizational entity within client
	  */
	public void setAD_Org_ID (int AD_Org_ID);

	/** Get Organization.
	  * Organizational entity within client
	  */
	public int getAD_Org_ID();

    /** Column name Amount */
    public static final String COLUMNNAME_Amount = "Amount";

	/** Set Amount.
	  * Amount in a defined currency
	  */
	public void setAmount (BigDecimal Amount);

	/** Get Amount.
	  * Amount in a defined currency
	  */
	public BigDecimal getAmount();

    /** Column name CashAmount */
    public static final String COLUMNNAME_CashAmount = "CashAmount";

	/** Set Cash Amount	  */
	public void setCashAmount (BigDecimal CashAmount);

	/** Get Cash Amount	  */
	public BigDecimal getCashAmount();

    /** Column name C_BankAccount_ID */
    public static final String COLUMNNAME_C_BankAccount_ID = "C_BankAccount_ID";

	/** Set Bank Account.
	  * Account at the Bank
	  */
	public void setC_BankAccount_ID (int C_BankAccount_ID);

	/** Get Bank Account.
	  * Account at the Bank
	  */
	public int getC_BankAccount_ID();

	public I_C_BankAccount getC_BankAccount() throws RuntimeException;

    /** Column name C_BankStatement_ID */
    public static final String COLUMNNAME_C_BankStatement_ID = "C_BankStatement_ID";

	/** Set Bank Statement.
	  * Bank Statement of account
	  */
	public void setC_BankStatement_ID (int C_BankStatement_ID);

	/** Get Bank Statement.
	  * Bank Statement of account
	  */
	public int getC_BankStatement_ID();

	public I_C_BankStatement getC_BankStatement() throws RuntimeException;

    /** Column name Conciliate */
    public static final String COLUMNNAME_Conciliate = "Conciliate";

	/** Set Conciliate	  */
	public void setConciliate (String Conciliate);

	/** Get Conciliate	  */
	public String getConciliate();

    /** Column name C_Payment_ID */
    public static final String COLUMNNAME_C_Payment_ID = "C_Payment_ID";

	/** Set Payment.
	  * Payment identifier
	  */
	public void setC_Payment_ID (int C_Payment_ID);

	/** Get Payment.
	  * Payment identifier
	  */
	public int getC_Payment_ID();

	public I_C_Payment getC_Payment() throws RuntimeException;

    /** Column name Created */
    public static final String COLUMNNAME_Created = "Created";

	/** Get Created.
	  * Date this record was created
	  */
	public Timestamp getCreated();

    /** Column name CreatedBy */
    public static final String COLUMNNAME_CreatedBy = "CreatedBy";

	/** Get Created By.
	  * User who created this records
	  */
	public int getCreatedBy();

    /** Column name IsActive */
    public static final String COLUMNNAME_IsActive = "IsActive";

	/** Set Active.
	  * The record is active in the system
	  */
	public void setIsActive (boolean IsActive);

	/** Get Active.
	  * The record is active in the system
	  */
	public boolean isActive();

    /** Column name IsCash */
    public static final String COLUMNNAME_IsCash = "IsCash";

	/** Set Is Cash	  */
	public void setIsCash (boolean IsCash);

	/** Get Is Cash	  */
	public boolean isCash();

    /** Column name Line */
    public static final String COLUMNNAME_Line = "Line";

	/** Set Line No.
	  * Unique line for this document
	  */
	public void setLine (int Line);

	/** Get Line No.
	  * Unique line for this document
	  */
	public int getLine();

    /** Column name LVE_Deposit_ID */
    public static final String COLUMNNAME_LVE_Deposit_ID = "LVE_Deposit_ID";

	/** Set Bank Deposit	  */
	public void setLVE_Deposit_ID (int LVE_Deposit_ID);

	/** Get Bank Deposit	  */
	public int getLVE_Deposit_ID();

	public org.doubleclick.model.I_LVE_Deposit getLVE_Deposit() throws RuntimeException;

    /** Column name LVE_DepositLine_ID */
    public static final String COLUMNNAME_LVE_DepositLine_ID = "LVE_DepositLine_ID";

	/** Set Deposit Line	  */
	public void setLVE_DepositLine_ID (int LVE_DepositLine_ID);

	/** Get Deposit Line	  */
	public int getLVE_DepositLine_ID();

    /** Column name PrepareToOrConciliate */
    public static final String COLUMNNAME_PrepareToOrConciliate = "PrepareToOrConciliate";

	/** Set Prepare To Or Conciliate	  */
	public void setPrepareToOrConciliate (String PrepareToOrConciliate);

	/** Get Prepare To Or Conciliate	  */
	public String getPrepareToOrConciliate();

    /** Column name Updated */
    public static final String COLUMNNAME_Updated = "Updated";

	/** Get Updated.
	  * Date this record was updated
	  */
	public Timestamp getUpdated();

    /** Column name UpdatedBy */
    public static final String COLUMNNAME_UpdatedBy = "UpdatedBy";

	/** Get Updated By.
	  * User who updated this records
	  */
	public int getUpdatedBy();
}

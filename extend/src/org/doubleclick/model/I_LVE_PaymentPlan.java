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
package org.eevolution.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for LVE_PaymentPlan
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS
 */
public interface I_LVE_PaymentPlan 
{

    /** TableName=LVE_PaymentPlan */
    public static final String Table_Name = "LVE_PaymentPlan";

    /** AD_Table_ID=1000086 */
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

    /** Column name C_PaymentTerm_ID */
    public static final String COLUMNNAME_C_PaymentTerm_ID = "C_PaymentTerm_ID";

	/** Set Payment Term.
	  * The terms of Payment (timing, discount)
	  */
	public void setC_PaymentTerm_ID (int C_PaymentTerm_ID);

	/** Get Payment Term.
	  * The terms of Payment (timing, discount)
	  */
	public int getC_PaymentTerm_ID();

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

    /** Column name LVE_dayCourt */
    public static final String COLUMNNAME_LVE_dayCourt = "LVE_dayCourt";

	/** Set LVE_dayCourt	  */
	public void setLVE_dayCourt (BigDecimal LVE_dayCourt);

	/** Get LVE_dayCourt	  */
	public BigDecimal getLVE_dayCourt();

    /** Column name LVE_endFee */
    public static final String COLUMNNAME_LVE_endFee = "LVE_endFee";

	/** Set LVE_endFee	  */
	public void setLVE_endFee (BigDecimal LVE_endFee);

	/** Get LVE_endFee	  */
	public BigDecimal getLVE_endFee();

    /** Column name LVE_endPercentage */
    public static final String COLUMNNAME_LVE_endPercentage = "LVE_endPercentage";

	/** Set LVE_endPercentage.
	  * LVE_endPercentage
	  */
	public void setLVE_endPercentage (BigDecimal LVE_endPercentage);

	/** Get LVE_endPercentage.
	  * LVE_endPercentage
	  */
	public BigDecimal getLVE_endPercentage();

    /** Column name LVE_firstpaymentpercentage */
    public static final String COLUMNNAME_LVE_firstpaymentpercentage = "LVE_firstpaymentpercentage";

	/** Set LVE_firstpaymentpercentage.
	  * LVE_firstpaymentpercentage
	  */
	public void setLVE_firstpaymentpercentage (BigDecimal LVE_firstpaymentpercentage);

	/** Get LVE_firstpaymentpercentage.
	  * LVE_firstpaymentpercentage
	  */
	public BigDecimal getLVE_firstpaymentpercentage();

    /** Column name LVE_fundingPercentage */
    public static final String COLUMNNAME_LVE_fundingPercentage = "LVE_fundingPercentage";

	/** Set LVE_fundingPercentage.
	  * LVE_fundingPercentage
	  */
	public void setLVE_fundingPercentage (BigDecimal LVE_fundingPercentage);

	/** Get LVE_fundingPercentage.
	  * LVE_fundingPercentage
	  */
	public BigDecimal getLVE_fundingPercentage();

    /** Column name LVE_initialFee */
    public static final String COLUMNNAME_LVE_initialFee = "LVE_initialFee";

	/** Set LVE_initialFee.
	  * LVE_initialFee
	  */
	public void setLVE_initialFee (BigDecimal LVE_initialFee);

	/** Get LVE_initialFee.
	  * LVE_initialFee
	  */
	public BigDecimal getLVE_initialFee();

    /** Column name LVE_initialPercentage */
    public static final String COLUMNNAME_LVE_initialPercentage = "LVE_initialPercentage";

	/** Set LVE_initialPercentage.
	  * LVE_initialPercentage
	  */
	public void setLVE_initialPercentage (BigDecimal LVE_initialPercentage);

	/** Get LVE_initialPercentage.
	  * LVE_initialPercentage
	  */
	public BigDecimal getLVE_initialPercentage();

    /** Column name LVE_ordinaryFee */
    public static final String COLUMNNAME_LVE_ordinaryFee = "LVE_ordinaryFee";

	/** Set LVE_ordinaryFee.
	  * LVE_ordinaryFee
	  */
	public void setLVE_ordinaryFee (BigDecimal LVE_ordinaryFee);

	/** Get LVE_ordinaryFee.
	  * LVE_ordinaryFee
	  */
	public BigDecimal getLVE_ordinaryFee();

    /** Column name LVE_ordinaryPercentage */
    public static final String COLUMNNAME_LVE_ordinaryPercentage = "LVE_ordinaryPercentage";

	/** Set LVE_ordinaryPercentage.
	  * LVE_ordinaryPercentage
	  */
	public void setLVE_ordinaryPercentage (BigDecimal LVE_ordinaryPercentage);

	/** Get LVE_ordinaryPercentage.
	  * LVE_ordinaryPercentage
	  */
	public BigDecimal getLVE_ordinaryPercentage();

    /** Column name LVE_PaymentPlan_ID */
    public static final String COLUMNNAME_LVE_PaymentPlan_ID = "LVE_PaymentPlan_ID";

	/** Set LVE_PaymentPlan_ID	  */
	public void setLVE_PaymentPlan_ID (int LVE_PaymentPlan_ID);

	/** Get LVE_PaymentPlan_ID	  */
	public int getLVE_PaymentPlan_ID();

    /** Column name LVE_specialFee */
    public static final String COLUMNNAME_LVE_specialFee = "LVE_specialFee";

	/** Set LVE_specialFee.
	  * LVE_specialFee
	  */
	public void setLVE_specialFee (BigDecimal LVE_specialFee);

	/** Get LVE_specialFee.
	  * LVE_specialFee
	  */
	public BigDecimal getLVE_specialFee();

    /** Column name LVE_specialPercentage */
    public static final String COLUMNNAME_LVE_specialPercentage = "LVE_specialPercentage";

	/** Set LVE_specialPercentage.
	  * LVE_specialPercentage
	  */
	public void setLVE_specialPercentage (BigDecimal LVE_specialPercentage);

	/** Get LVE_specialPercentage.
	  * LVE_specialPercentage
	  */
	public BigDecimal getLVE_specialPercentage();

    /** Column name LVE_startNextMonth */
    public static final String COLUMNNAME_LVE_startNextMonth = "LVE_startNextMonth";

	/** Set LVE_startNextMonth.
	  * LVE_startNextMonth
	  */
	public void setLVE_startNextMonth (boolean LVE_startNextMonth);

	/** Get LVE_startNextMonth.
	  * LVE_startNextMonth
	  */
	public boolean isLVE_startNextMonth();

    /** Column name Name */
    public static final String COLUMNNAME_Name = "Name";

	/** Set Name.
	  * Name
	  */
	public void setName (String Name);

	/** Get Name.
	  * Name
	  */
	public String getName();

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

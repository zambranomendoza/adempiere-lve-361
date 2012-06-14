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
package org.eevolution.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;

/** Generated Model for LVE_PaymentPlan
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS - $Id$ */
public class X_LVE_PaymentPlan extends PO implements I_LVE_PaymentPlan, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120530L;

    /** Standard Constructor */
    public X_LVE_PaymentPlan (Properties ctx, int LVE_PaymentPlan_ID, String trxName)
    {
      super (ctx, LVE_PaymentPlan_ID, trxName);
      /** if (LVE_PaymentPlan_ID == 0)
        {
			setLVE_PaymentPlan_ID (0);
			setLVE_startNextMonth (false);
			setName (null);
        } */
    }

    /** Load Constructor */
    public X_LVE_PaymentPlan (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LVE_PaymentPlan[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Payment Term.
		@param C_PaymentTerm_ID 
		The terms of Payment (timing, discount)
	  */
	public void setC_PaymentTerm_ID (int C_PaymentTerm_ID)
	{
		if (C_PaymentTerm_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_C_PaymentTerm_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_C_PaymentTerm_ID, Integer.valueOf(C_PaymentTerm_ID));
	}

	/** Get Payment Term.
		@return The terms of Payment (timing, discount)
	  */
	public int getC_PaymentTerm_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_PaymentTerm_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LVE_dayCourt.
		@param LVE_dayCourt LVE_dayCourt	  */
	public void setLVE_dayCourt (BigDecimal LVE_dayCourt)
	{
		set_Value (COLUMNNAME_LVE_dayCourt, LVE_dayCourt);
	}

	/** Get LVE_dayCourt.
		@return LVE_dayCourt	  */
	public BigDecimal getLVE_dayCourt () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_dayCourt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_endFee.
		@param LVE_endFee LVE_endFee	  */
	public void setLVE_endFee (BigDecimal LVE_endFee)
	{
		set_Value (COLUMNNAME_LVE_endFee, LVE_endFee);
	}

	/** Get LVE_endFee.
		@return LVE_endFee	  */
	public BigDecimal getLVE_endFee () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_endFee);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_endPercentage.
		@param LVE_endPercentage 
		LVE_endPercentage
	  */
	public void setLVE_endPercentage (BigDecimal LVE_endPercentage)
	{
		set_Value (COLUMNNAME_LVE_endPercentage, LVE_endPercentage);
	}

	/** Get LVE_endPercentage.
		@return LVE_endPercentage
	  */
	public BigDecimal getLVE_endPercentage () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_endPercentage);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_firstpaymentpercentage.
		@param LVE_firstpaymentpercentage 
		LVE_firstpaymentpercentage
	  */
	public void setLVE_firstpaymentpercentage (BigDecimal LVE_firstpaymentpercentage)
	{
		set_Value (COLUMNNAME_LVE_firstpaymentpercentage, LVE_firstpaymentpercentage);
	}

	/** Get LVE_firstpaymentpercentage.
		@return LVE_firstpaymentpercentage
	  */
	public BigDecimal getLVE_firstpaymentpercentage () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_firstpaymentpercentage);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_fundingPercentage.
		@param LVE_fundingPercentage 
		LVE_fundingPercentage
	  */
	public void setLVE_fundingPercentage (BigDecimal LVE_fundingPercentage)
	{
		set_Value (COLUMNNAME_LVE_fundingPercentage, LVE_fundingPercentage);
	}

	/** Get LVE_fundingPercentage.
		@return LVE_fundingPercentage
	  */
	public BigDecimal getLVE_fundingPercentage () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_fundingPercentage);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_initialFee.
		@param LVE_initialFee 
		LVE_initialFee
	  */
	public void setLVE_initialFee (BigDecimal LVE_initialFee)
	{
		set_Value (COLUMNNAME_LVE_initialFee, LVE_initialFee);
	}

	/** Get LVE_initialFee.
		@return LVE_initialFee
	  */
	public BigDecimal getLVE_initialFee () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_initialFee);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_initialPercentage.
		@param LVE_initialPercentage 
		LVE_initialPercentage
	  */
	public void setLVE_initialPercentage (BigDecimal LVE_initialPercentage)
	{
		set_Value (COLUMNNAME_LVE_initialPercentage, LVE_initialPercentage);
	}

	/** Get LVE_initialPercentage.
		@return LVE_initialPercentage
	  */
	public BigDecimal getLVE_initialPercentage () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_initialPercentage);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_ordinaryFee.
		@param LVE_ordinaryFee 
		LVE_ordinaryFee
	  */
	public void setLVE_ordinaryFee (BigDecimal LVE_ordinaryFee)
	{
		set_Value (COLUMNNAME_LVE_ordinaryFee, LVE_ordinaryFee);
	}

	/** Get LVE_ordinaryFee.
		@return LVE_ordinaryFee
	  */
	public BigDecimal getLVE_ordinaryFee () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_ordinaryFee);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_ordinaryPercentage.
		@param LVE_ordinaryPercentage 
		LVE_ordinaryPercentage
	  */
	public void setLVE_ordinaryPercentage (BigDecimal LVE_ordinaryPercentage)
	{
		set_Value (COLUMNNAME_LVE_ordinaryPercentage, LVE_ordinaryPercentage);
	}

	/** Get LVE_ordinaryPercentage.
		@return LVE_ordinaryPercentage
	  */
	public BigDecimal getLVE_ordinaryPercentage () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_ordinaryPercentage);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_PaymentPlan_ID.
		@param LVE_PaymentPlan_ID LVE_PaymentPlan_ID	  */
	public void setLVE_PaymentPlan_ID (int LVE_PaymentPlan_ID)
	{
		if (LVE_PaymentPlan_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LVE_PaymentPlan_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LVE_PaymentPlan_ID, Integer.valueOf(LVE_PaymentPlan_ID));
	}

	/** Get LVE_PaymentPlan_ID.
		@return LVE_PaymentPlan_ID	  */
	public int getLVE_PaymentPlan_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LVE_PaymentPlan_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LVE_specialFee.
		@param LVE_specialFee 
		LVE_specialFee
	  */
	public void setLVE_specialFee (BigDecimal LVE_specialFee)
	{
		set_Value (COLUMNNAME_LVE_specialFee, LVE_specialFee);
	}

	/** Get LVE_specialFee.
		@return LVE_specialFee
	  */
	public BigDecimal getLVE_specialFee () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_specialFee);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_specialPercentage.
		@param LVE_specialPercentage 
		LVE_specialPercentage
	  */
	public void setLVE_specialPercentage (BigDecimal LVE_specialPercentage)
	{
		set_Value (COLUMNNAME_LVE_specialPercentage, LVE_specialPercentage);
	}

	/** Get LVE_specialPercentage.
		@return LVE_specialPercentage
	  */
	public BigDecimal getLVE_specialPercentage () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LVE_specialPercentage);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set LVE_startNextMonth.
		@param LVE_startNextMonth 
		LVE_startNextMonth
	  */
	public void setLVE_startNextMonth (boolean LVE_startNextMonth)
	{
		set_Value (COLUMNNAME_LVE_startNextMonth, Boolean.valueOf(LVE_startNextMonth));
	}

	/** Get LVE_startNextMonth.
		@return LVE_startNextMonth
	  */
	public boolean isLVE_startNextMonth () 
	{
		Object oo = get_Value(COLUMNNAME_LVE_startNextMonth);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Name.
		@param Name 
		Name
	  */
	public void setName (String Name)
	{
		set_Value (COLUMNNAME_Name, Name);
	}

	/** Get Name.
		@return Name
	  */
	public String getName () 
	{
		return (String)get_Value(COLUMNNAME_Name);
	}

    /** Get Record ID/ColumnName
        @return ID/ColumnName pair
      */
    public KeyNamePair getKeyNamePair() 
    {
        return new KeyNamePair(get_ID(), getName());
    }
}
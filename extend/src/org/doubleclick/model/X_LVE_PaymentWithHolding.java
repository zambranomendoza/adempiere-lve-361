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

import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.*;

/** Generated Model for LVE_PaymentWithHolding
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS - $Id$ */
public class X_LVE_PaymentWithHolding extends PO implements I_LVE_PaymentWithHolding, I_Persistent 
{
	/**
	 *
	 */
	
	private static final long serialVersionUID = 20111114L;

    /** Standard Constructor */
    public X_LVE_PaymentWithHolding (Properties ctx, int LVE_PaymentWithHolding_ID, String trxName)
    {
      super (ctx, LVE_PaymentWithHolding_ID, trxName);
      /** if (LVE_PaymentWithHolding_ID == 0)
        {
			setC_Payment_ID (0);
			setLCO_InvoiceWithholding_ID (0);
			setLVE_PaymentWithHolding_ID (0);
        } */
    }

    /** Load Constructor */
    public X_LVE_PaymentWithHolding (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LVE_PaymentWithHolding[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Payment.
		@param C_Payment_ID 
		Payment identifier
	  */
	public void setC_Payment_ID (int C_Payment_ID)
	{
		if (C_Payment_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_C_Payment_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_C_Payment_ID, Integer.valueOf(C_Payment_ID));
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

	/** Set Invoice Withholding.
		@param LCO_InvoiceWithholding_ID Invoice Withholding	  */
	public void setLCO_InvoiceWithholding_ID (int LCO_InvoiceWithholding_ID)
	{
		if (LCO_InvoiceWithholding_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LCO_InvoiceWithholding_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LCO_InvoiceWithholding_ID, Integer.valueOf(LCO_InvoiceWithholding_ID));
	}

	/** Get Invoice Withholding.
		@return Invoice Withholding	  */
	public int getLCO_InvoiceWithholding_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_InvoiceWithholding_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LVE_PaymentWithHolding.
		@param LVE_PaymentWithHolding_ID LVE_PaymentWithHolding	  */
	public void setLVE_PaymentWithHolding_ID (int LVE_PaymentWithHolding_ID)
	{
		if (LVE_PaymentWithHolding_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LVE_PaymentWithHolding_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LVE_PaymentWithHolding_ID, Integer.valueOf(LVE_PaymentWithHolding_ID));
	}

	/** Get LVE_PaymentWithHolding.
		@return LVE_PaymentWithHolding	  */
	public int getLVE_PaymentWithHolding_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LVE_PaymentWithHolding_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}
}
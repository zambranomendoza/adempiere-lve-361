package org.doubleclick.callout;

import java.util.Properties;

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.util.Env;

public class LVE_CalloutInvoice extends CalloutEngine {
	
	/*************************************************************************
	 *	Invoice - Header.
	 *		- C_DoctypeTarget_ID
	 *
	 *  @param ctx context
	 *  @param WindowNo current Window No
	 *  @param mTab Grid Tab
	 *  @param mField Grid Field
	 *  @param value New Value
	 *  @return null or error message
	 */
	public String controlno (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		Integer C_Doctype_ID = (Integer)value;
		if (isCalloutActive() || C_Doctype_ID == null || C_Doctype_ID.intValue() == 0){
			mTab.setValue("Value", null);
			mTab.setValue("LVE_ControlNo", null);
			return "";
		}
		
		boolean issotrx = "Y".equals(Env.getContext(ctx, WindowNo, "IsSOTrx"))?true:false;
		
		if (!issotrx){
			mTab.setValue("Value", 0);
			mTab.setValue("LVE_ControlNo", 0);
		}else{
			if (C_Doctype_ID != 1000002){
				mTab.setValue("Value", 0);
				mTab.setValue("LVE_ControlNo", 0);
			}else{
				mTab.setValue("Value", null);
				mTab.setValue("LVE_ControlNo", null);
			}
		}
		
		return "";
	}	//	paymentamt

}

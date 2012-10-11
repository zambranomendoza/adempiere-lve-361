/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.doubleclick.process;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MBankAccount;
import org.compiere.model.MBankStatement;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MPayment;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.doubleclick.model.MLVEDepositLine;
import org.doubleclick.model.X_LVE_Deposit;

/**
 *	Create Bank Statement or Void From Deposit Line
 *	
 *  @author Ads. Angel Parra - Double Click Sistemas C.A.
 */
public class LVE_CreateBankStatementFromDepositOrVoid extends SvrProcess
{

	/**	Shipment				*/
	private int 	p_LVE_DepositLine_ID = 0;
	/**	Confirmation Type		*/
	private String		p_ConciliateOrVoid = null;
	
	/**
	 *  Prepare - e.g., get Parameters.
	 */
	protected void prepare()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (para[i].getParameter() == null)
				;
			else if (name.equals("LVE_ConciliateOrVoid"))
				p_ConciliateOrVoid = (String)para[i].getParameter();
			else
				log.log(Level.SEVERE, "prepare - Unknown Parameter: " + name);
		}
		p_LVE_DepositLine_ID = getRecord_ID();
	}	//	prepare

	/**
	 *  Perform process.
	 *  @return Message 
	 *  @throws Exception if not successful
	 */
	protected String doIt() throws Exception
	{
		boolean confirm = false;
		String message = "";
		
		log.info("LVE_DepositLine_ID=" + p_LVE_DepositLine_ID + ", ConcicliateOrVoid=" + p_ConciliateOrVoid);
		MLVEDepositLine depositline = new MLVEDepositLine(getCtx(), p_LVE_DepositLine_ID, get_TrxName());
		
		if (p_ConciliateOrVoid.compareTo("C") == 0){
				
			List<MBankStatement> cashbooksorbanks = new ArrayList<MBankStatement>();
				
			MBankStatement actual = null;
			
			MPayment[] Paylines = depositline.getPayments();
				
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
								
								actual.setName("Deposito "+actual.getName());
								
								actual.setDescription(Msg.getMsg(Env.getAD_Language(getCtx()), "Document No")+depositline.getLVE_Deposit().getDocumentNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "Deposit No")+" "+depositline.getLVE_Deposit().getDepositNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "Line")+" "+depositline.getLine());
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
						
						actual.setName("Deposito "+actual.getName());
						
						actual.setDescription(Msg.getMsg(Env.getAD_Language(getCtx()), "Document No")+depositline.getLVE_Deposit().getDocumentNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "Deposit No")+" "+depositline.getLVE_Deposit().getDepositNo()+" "+Msg.getMsg(Env.getAD_Language(getCtx()), "Line")+" "+depositline.getLine());
							
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
				
			Iterator<MBankStatement> i = cashbooksorbanks.iterator();
				 
			while (i.hasNext()) {
					
				MBankStatement cashbookorbank = i.next();
					
				if(!cashbookorbank.processIt(MBankStatement.DOCACTION_Complete)) {
					log.warning("BankStatement Process Failed: " + cashbookorbank + " - " + cashbookorbank.getProcessMsg());
					throw new AdempiereException("Bank Statement Process Failed: " + cashbookorbank + " - " + cashbookorbank.getProcessMsg());
				}
				
				cashbookorbank.saveEx();
			}
			
			depositline.setPrepareToOrConciliate("C");
			depositline.saveEx();
			
			MLVEDepositLine[] lines = depositline.getParent().getLines("");
			boolean depositcomplete = true;
			
			for (MLVEDepositLine line : lines) {
				
				if (!line.isConciliate() && !line.isVoid()){
					depositcomplete = false;
					break;
				}
				
			}
			
			if (depositcomplete){
				depositline.getParent().setDocStatus(X_LVE_Deposit.DOCACTION_Complete);
				depositline.getParent().setDocAction(X_LVE_Deposit.DOCACTION_Close);
				depositline.getParent().setProcessed(true);
			}
			
			depositline.getParent().saveEx();
			
		}else if (p_ConciliateOrVoid.compareTo("V") == 0) {
			
			MPayment[] Paylines = depositline.getPayments();
			
			for (MPayment mPayment : Paylines) {
				
				if (!mPayment.isReconciled()){
					
					if(!mPayment.processIt(MPayment.DOCACTION_Void)) {
						log.warning("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
						throw new AdempiereException("Payment Process Failed: " + mPayment + " - " + mPayment.getProcessMsg());
					}
					
					mPayment.saveEx();
					
				}
				else{
					log.warning("Payment Process Failed Deposit Line is Conciliated: " + mPayment + " - " + mPayment.getProcessMsg());
					throw new AdempiereException("Payment Process Failed Deposit Line is Conciliated: " + mPayment + " - " + mPayment.getProcessMsg());
				}
			}
			
			depositline.setPrepareToOrConciliate("V");
			depositline.saveEx();
			
			MLVEDepositLine[] lines = depositline.getParent().getLines("");
			boolean depositcomplete = true;
			Integer voidno = 0;
			
			for (MLVEDepositLine line : lines) {
				
				if (!line.isConciliate()){
					
					if (line.isVoid()) {
						voidno++;
					}
					else{
						depositcomplete = false;
						break;
					}
				}
				
			}
			
			if (voidno == lines.length){
				depositline.getParent().setDocStatus(X_LVE_Deposit.DOCACTION_None);
				depositline.getParent().setDocAction(X_LVE_Deposit.DOCACTION_Void);
				depositline.getParent().setProcessed(true);
			}else{
				if (depositcomplete){
					depositline.getParent().setDocStatus(X_LVE_Deposit.DOCACTION_Complete);
					depositline.getParent().setDocAction(X_LVE_Deposit.DOCACTION_Close);
					depositline.getParent().setProcessed(true);
				}
			}
			
			depositline.getParent().saveEx();
			
		}
		
		confirm = true;
		
		if (!confirm)
			throw new Exception ("Cannot create Confirmation for " + depositline.getLVE_Deposit().getDepositNo() +" Line "+depositline.getLine());
		
		return message;
	}	//	doIt

}	//	 LVE_CreateBankStatementFromDepositOrVoid

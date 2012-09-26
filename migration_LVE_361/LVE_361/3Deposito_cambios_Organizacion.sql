-- 18/09/2012 12:01:36 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',100,'N',1000000,1000000,'N','Y',(select max(ad_sequence_ID)+1 from ad_sequence),'LVE_Deposit',0,1000000,CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,'Y')
;

-- 18/09/2012 12:03:40 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO C_DocType (DocNoSequence_ID,GL_Category_ID,IsChargeOrProductMandatory,C_DocType_ID,IsDefault,GenerateWithholding,IsDocNoControlled,DocBaseType,IsSOTrx,DocumentCopies,HasCharges,HasProforma,IsCreateCounter,IsSplitWhenDifference,IsDefaultCounterDoc,IsInTransit,IsPickQAConfirm,IsIndexed,IsShipConfirm,IsOverwriteSeqOnComplete,IsOverwriteDateOnComplete,IsPrepareSplitDocument,PrintName,Name,CreatedBy,UpdatedBy,Updated,AD_Org_ID,Created,IsActive,AD_Client_ID) VALUES ((select max(ad_sequence_ID) from ad_sequence),1000001,'N',(SELECT MAX(C_DOCTYPE_ID)+1 FROM C_DOCTYPE),'N','N','Y','DEP','Y',1,'N','N','Y','N','N','N','N','Y','N','N','N','Y','Bank Deposit','LVE_Deposit',100,100,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,'Y',1000000)
;

-- 18/09/2012 12:03:40 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO C_DocType_Trl (AD_Language,C_DocType_ID, DocumentNote,PrintName,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_DocType_ID, t.DocumentNote,t.PrintName,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_DocType t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_DocType_ID=(SELECT MAX(C_DOCTYPE_ID) FROM C_DOCTYPE) AND NOT EXISTS (SELECT * FROM C_DocType_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_DocType_ID=t.C_DocType_ID)
;

-- 18/09/2012 12:08:23 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO C_ChargeType (C_ChargeType_ID,Name,Value,Created,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Updated,UpdatedBy) VALUES (999,'Depósito Bancario (Puente)','DEP_BANC_P',CURRENT_TIMESTAMP,100,1000000,0,'Y',CURRENT_TIMESTAMP,100)
;

-- 18/09/2012 12:08:56 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,C_ChargeType_ID,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) VALUES ('N','N',5000006,0,999,'N',999,'Depósito Bancario (Puente)',0,100,'Y',CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,1000000)
;

-- 18/09/2012 12:08:56 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_Charge_ID=999 AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
;

-- 18/09/2012 12:08:56 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) SELECT 999, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=1000000 AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID AND e.C_Charge_ID=999)
;

UPDATE C_DOCTYPE_TRL SET NAME = 'Depósito Bancario', printname = 'Depósito Bancario' where name = 'LVE_Deposit'

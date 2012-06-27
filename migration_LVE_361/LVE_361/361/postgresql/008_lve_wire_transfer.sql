-- 26-jun-2012 15:01:57 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,CreatedBy,Updated,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID) VALUES ((select max(AD_Ref_List_ID)+1 from AD_Ref_List ),195,'DCS','W','Wire Transfer',100,CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,0,'Y',0)
;

-- 26-jun-2012 15:01:57 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(select max(AD_Ref_List_ID) from AD_Ref_List ) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 26-jun-2012 15:02:45 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Transferencia Bancaria',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(select max(AD_Ref_List_ID) from AD_Ref_List ) AND AD_Language='es_VE'
;

INSERT INTO LVE_SqlScript
(LVE_SqlScript_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Date1,
LastScript,ScriptUser) VALUES
((select case when max(LVE_SqlScript_ID) is null then 1000000 else max(LVE_SqlScript_ID)+1 end from LVE_SqlScript),0,0,'Y',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,
'008_lve_wire_transfer.sql',
'Angel Parra')
;

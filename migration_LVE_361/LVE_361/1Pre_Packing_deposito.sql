-- 18/09/2012 11:25:39 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_SysConfig SET Value='Y',Updated=TO_TIMESTAMP('2012-09-18 11:25:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_SysConfig_ID=50031
;

-- 18/09/2012 11:25:47 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_SysConfig SET Value='Y',Updated=TO_TIMESTAMP('2012-09-18 11:25:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_SysConfig_ID=50028
;

-- 18/09/2012 11:59:20 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,CreatedBy,Updated,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID) VALUES ((select max(ad_ref_list_id)+1 from ad_ref_list),183,'DCS','DEP','Bank Deposit',100,CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,0,'Y',0)
;

-- 18/09/2012 11:59:20 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(select max(ad_ref_list_id) from ad_ref_list) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 18/09/2012 11:59:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Depósito Bancario' WHERE AD_Ref_List_ID=(select max(ad_ref_list_id) from ad_ref_list) AND AD_Language='es_VE'
;


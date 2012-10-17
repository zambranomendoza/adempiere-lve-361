-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.
-- Contribution by Miguel Hernández Giusti - mhernandez@ghintech.com
-- Contribution by Ads. Angel Parra - Double Click Sistemas C.A. - Agosto 2012 - Barquisimeto - Lara - Venezuela


update ad_column set callout='org.doubleclick.callout.LVE_Customization.generationTaxID'  where AD_Column_ID=2909;

INSERT INTO adempiere.ad_entitytype(entitytype, ad_client_id, ad_org_id, ad_entitytype_id, isactive, created, createdby, updated, updatedby, name, description, help, version, modelpackage, classpath, processing) 
    VALUES('DCS', 0, 0, (select max(ad_entitytype_id)+1 from ad_entitytype), 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'DoubleClickSistemas', 'DoubleClickSistemas', 'DoubleClickSistemas', '0.1', 'org.doubleclick.model', '', 'N');

INSERT INTO ad_sysconfig(
            ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, 
            updatedby, isactive, name, value, description, entitytype, configurationlevel)
    VALUES ((select max( ad_sysconfig_id) +1 from ad_sysconfig),0,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,0,0,'Y','URL_SENIAT','http://contribuyente.seniat.gob.ve/getContribuyente/getrif?rif=','Url para consulta del Rif del Seniat','U','S');

UPDATE AD_ReportView SET WhereClause='docstatus not in (''VO'',''WC'', ''IN'') ',Updated=CURRENT_TIMESTAMP,UpdatedBy=0 WHERE AD_ReportView_ID=119
;

update C_Currency set iso_code='Bs.' where  C_Currency_ID=205;

INSERT INTO adempiere.AD_SysConfig 
(Name,AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,
UpdatedBy,IsActive) VALUES ('skip_validation_tab',(SELECT coalesce(MAX(AD_SysConfig_ID),1000000)+1 FROM adempiere.AD_SysConfig),'DCS','O','','Insert all windows you want to skip the validation of tabs, please separate each window with the character semicolon ";"',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,0,0,100,100,'Y')
;

update ad_sysconfig set value = 'N' where name = 'ProductUOMConversionRateValidate';

--Nomina

delete from ad_menu where ad_menu_id=53109;
delete from ad_column where ad_column_id=54740;


ALTER TABLE c_invoice ADD COLUMN value character varying(20) DEFAULT NULL::character varying;

-- 17/10/2012 11:25:41 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM AD_Column),318,'DCS',0,'N','N','N','A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).','N',20,'Y',10,'N',620,'N','Y','N','Search key for the record in the format required - must be unique','Search Key','Value',100,CURRENT_TIMESTAMP,0,0,'Y',CURRENT_TIMESTAMP,100)
;

-- 17/10/2012 11:25:41 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/10/2012 11:27:02 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (SortNo,IsEncrypted,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,AD_Field_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES (0,'N',0,'Y','N','N',(SELECT MAX(AD_Column_ID) FROM AD_Column),'N',440,'N',263,(SELECT MAX(AD_Field_ID)+1 FROM AD_Field),'N','DCS','Value',100,0,'Y',CURRENT_TIMESTAMP,0,100,CURRENT_TIMESTAMP)
;

-- 17/10/2012 11:27:02 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/10/2012 11:47:53 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=(SELECT AD_Field_ID FROM AD_Field WHERE Name = 'Control Number' AND AD_Tab_ID = 263)
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field)
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=2962
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=2959
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=2954
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=6565
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=2958
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=2776
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2766
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=2767
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2765
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2961
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2770
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=8648
;

-- 17/10/2012 11:27:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=2763
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3273
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=2953
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2956
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3112
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=2774
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2786
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 17/10/2012 11:27:27 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- 17/10/2012 11:29:26 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Nro. Control',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND AD_Language='es_VE'
;

-- 17/10/2012 11:30:53 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET Callout='org.compiere.model.CalloutInvoice.docType, org.doubleclick.callout.LVE_CalloutInvoice.controlno',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Column_ID=3781
;


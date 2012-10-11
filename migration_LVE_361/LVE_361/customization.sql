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


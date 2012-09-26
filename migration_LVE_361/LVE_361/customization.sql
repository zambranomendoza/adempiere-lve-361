-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.
-- Contribution by by Miguel Hernández Giusti - mhernandez@ghintech.com

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

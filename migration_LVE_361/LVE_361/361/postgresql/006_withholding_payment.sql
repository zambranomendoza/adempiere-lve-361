-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.

INSERT INTO adempiere.AD_Process(ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess)
  VALUES((select max(ad_Process_id)+1 from adempiere.ad_Process), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_GenerateWithholding', 'Generate Withholding', NULL, NULL, '3', 'DCS', NULL, 'N', 'N', NULL, 'org.doubleclick.process.LVE_GenerateWithholding', 192, 682, NULL, NULL, NULL, 'N', 'N', 'Y', NULL, NULL, NULL)
;


INSERT INTO adempiere.AD_Process_Trl(ad_process_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_Process_id) from adempiere.ad_Process), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Genera Retenciones', NULL, NULL, 'N')
;

INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_Process_id) from adempiere.ad_Process), 0, 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Y')
;

INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_Process_id) from adempiere.ad_Process), 50001, 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Y')
;

INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_Process_id) from adempiere.ad_Process), 102, 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Y')
;
INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_Process_id) from adempiere.ad_Process), 103, 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Y')
;
INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_Process_id) from adempiere.ad_Process), 50002, 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Y')
;


INSERT INTO adempiere.ad_column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from adempiere.ad_column ) , 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Generate Withholding', NULL, NULL, 0, 'DCS', 'GenerateWithholding', 335, 28, NULL, NULL, 20, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N',(select ad_element_id from adempiere.ad_element WHERE columnname ='GenerateWithholding' AND entitytype='QSS_LCO'), (select max(ad_Process_id) from adempiere.ad_Process), 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from adempiere.ad_column) , 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generar Retención', 'N')
;

INSERT INTO adempiere.ad_field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generate Withholding', NULL, NULL, 'Y', 330, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', NULL, 20, 'N', 680, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
;

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generar Retenciones', NULL, NULL, 'N')
;

ALTER TABLE adempiere.c_payment ADD COLUMN GenerateWithholding       	character(20) DEFAULT NULL::bpchar;

---------------------------

INSERT INTO adempiere.ad_column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from adempiere.ad_column ) , 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Generate Withholding', NULL, NULL, 0, 'DCS', 'GenerateWithholding', 812, 28, NULL, NULL, 20, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N',(select ad_element_id from adempiere.ad_element WHERE columnname ='GenerateWithholding' AND entitytype='QSS_LCO'), (select max(ad_Process_id) from adempiere.ad_Process), 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from adempiere.ad_column) , 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Generar Retención', 'N')
;

INSERT INTO adempiere.ad_field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generate Withholding', NULL, NULL, 'Y', 755, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', NULL, 20, 'N', 680, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
;

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generar Retenciones', NULL, NULL, 'N')
;

ALTER TABLE adempiere.c_paymentallocate ADD COLUMN GenerateWithholding       	character(20) DEFAULT NULL::bpchar;

update  AD_Field set isdisplayed='N' where name = 'Generate Withholding' and ad_tab_id='263';

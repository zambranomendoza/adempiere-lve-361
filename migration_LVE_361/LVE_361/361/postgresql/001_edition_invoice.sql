-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.


ALTER TABLE adempiere.c_invoice ADD COLUMN LVE_controlNumber       	varchar(20) NULL;
ALTER TABLE adempiere.c_invoice ADD COLUMN LVE_invoiceAffected_id  	numeric(10,0) NULL DEFAULT NULL::numeric;





INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_controlNumber', 'DCS', 'LVE_controlNumber', 'LVE_controlNumber', 'LVE_controlNumber', 'LVE_controlNumber', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Control Number', 'Control Number', 'Control Number', 'Control Number', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0, 100, 'LVE_controlNumber', NULL, NULL, 0, 'DCS', 'LVE_controlNumber', 318, 10, NULL, NULL, 20, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'Y', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'Y', NULL, NULL, NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Control Number', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Control Number', NULL, NULL, 'Y', 263, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '', 20, 'N', 60, -1, 'Y', 'N', 'N', 'N', 'DCS', NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Numero de Control', 'Numero de Control', 'Numero de Control', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Control Number', NULL, NULL, 'Y', 290, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '', 20, 'N', 60, -1, 'Y', 'N', 'N', 'N', 'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Numero de Control', 'Numero de Control', 'Numero de Control', 'N');




INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_invoiceAffected_ID', 'DCS', 'LVE_invoiceAffected_ID', 'LVE_invoiceAffected_ID', 'LVE_invoiceAffected_ID', 'LVE_invoiceAffected_ID', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Invoice Affected', 'Invoice Affected', 'Invoice Affected', 'Invoice Affected', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_invoiceAffected_ID', NULL, NULL, 0, 'DCS', 'LVE_invoiceAffected_ID', 318, 30, 336, NULL, 10, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, '@C_DocTypeTarget_ID=1000004 | @C_DocTypeTarget_ID=1000170 | @C_DocTypeTarget_ID=1000006 | @C_DocTypeTarget_ID=1000169', NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Invoice Affected', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'LVE_invoiceAffected_ID', NULL, NULL, 'Y', 263, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '', 10, 'N', 470, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Factura Afectada', 'Factura Afectada', 'Factura Afectada', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'LVE_invoiceAffected_ID', NULL, NULL, 'Y', 290, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '', 10, 'N', 450, 0, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Factura Afectada', 'Factura Afectada', 'Factura Afectada', 'N');



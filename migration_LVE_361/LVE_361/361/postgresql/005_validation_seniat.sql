-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.

ALTER TABLE adempiere.c_bpartner ADD COLUMN acctionbutton               char(1) NULL DEFAULT NULL::bpchar;
ALTER TABLE adempiere.c_bpartner ADD COLUMN LVE_nameSeniat            	varchar(60) NULL DEFAULT NULL::character varying;
ALTER TABLE adempiere.c_bpartner ADD COLUMN LVE_rifSeniat             	varchar(12) NULL DEFAULT NULL::character varying;
ALTER TABLE adempiere.c_bpartner ADD COLUMN LVE_isValidationSeniat	char(1) NULL DEFAULT 'N'::bpchar;
ALTER TABLE adempiere.c_bpartner ADD COLUMN LVE_descriptionSeniat     	varchar(255) NULL DEFAULT NULL::character varying;
ALTER TABLE adempiere.c_bpartner ADD COLUMN LVE_acctionButtonYes      	char(1) NULL DEFAULT NULL::bpchar;
ALTER TABLE adempiere.c_bpartner ADD COLUMN LVE_acctionButtonNo       	char(1) NULL DEFAULT NULL::bpchar;

ALTER TABLE adempiere.c_bpartner
    ADD CONSTRAINT c_bpartner_lve_isvalidationseniat_check
	CHECK (lve_isvalidationseniat = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))
;

INSERT INTO adempiere.lco_taxidtype(lco_taxidtype_id, ad_client_id, ad_org_id, created, createdby, description, isactive, isdefault, updated, updatedby, name, isdigitchecked, lco_taxcodedian, isusetaxiddigit, isdetailednames)
  VALUES((select case when  max(lco_taxidtype_id) is null  then 1000000 else max(lco_taxidtype_id)+1  end  from lco_taxidtype), 0, 0, getdate(), 100, 'RIF', 'Y', 'Y', getdate(), 100, 'RIF', 'N', NULL, 'N', 'N');

INSERT INTO adempiere.lco_taxidtype(lco_taxidtype_id, ad_client_id, ad_org_id, created, createdby, description, isactive, isdefault, updated, updatedby, name, isdigitchecked, lco_taxcodedian, isusetaxiddigit, isdetailednames)
  VALUES((select max(lco_taxidtype_id)+1 from lco_taxidtype), 0, 0, getdate(), 100, 'CEDULA DE IDENTIDAD', 'Y', 'N', getdate(), 100, 'CI', 'N', NULL, 'N', 'N');

INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_ActionButon', 'DCS', 'LVE_ActionButon', 'LVE_ActionButon', 'LVE_ActionButon', 'LVE_ActionButon', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'AcctionButton', NULL, NULL, 0, 'DCS', 'AcctionButton', 291, 28, NULL, NULL, 1, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', 'org.doubleclick.callout.LVE_ValidationSENIAT.validation', NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'AccionBoton', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'AcctionButton', 'AcctionButton', 'AcctionButton', 'Y', 220, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '', 1, 'N', 51, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Validar Seniat', 'Validar Seniat', 'Validar Seniat', 'N');


 

INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_nameSeniat', 'DCS', 'LVE_nameSeniat', 'LVE_nameSeniat', 'LVE_nameSeniat', 'LVE_nameSeniat', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Nombre Seniat', 'Nombre Seniat', 'Nombre Seniat', 'Nombre Seniat', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_nameSeniat', 'LVE_nameSeniat', 'LVE_nameSeniat', 0, 'DCS', 'LVE_nameSeniat', 291, 10, NULL, NULL, 60, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Nombre Seniat', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Name Seniat', 'Name Seniat', 'Name Seniat', 'Y', 220, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '@LVE_IsValidationSeniat=Y', 60, 'N', 52, NULL, 'Y', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Nombre Seniat', 'Nombre Seniat', 'Nombre Seniat', 'N');





INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_rifSeniat', 'DCS', 'LVE_rifSeniat', 'LVE_rifSeniat', 'LVE_rifSeniat', 'LVE_rifSeniat', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'RIF Seniat', 'RIF Seniat', 'RIF Seniat', 'RIF Seniat', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_rifSeniat', 'LVE_rifSeniat', 'LVE_rifSeniat', 0, 'DCS', 'LVE_rifSeniat', 291, 10, NULL, NULL, 12, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
 VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'RIF Seniat', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Rif Seniat', 'Rif Seniat', 'LVE_rifSeniat', 'Y', 220, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '@LVE_IsValidationSeniat=Y', 12, 'N', 53, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'RIF Seniat', 'RIF Seniat', 'RIF Seniat', 'N');






INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_IsValidationSeniat', 'DCS', 'LVE_IsValidationSeniat', 'LVE_IsValidationSeniat', 'LVE_IsValidationSeniat', 'LVE_IsValidationSeniat', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'IsValidationSeniat', 'IsValidationSeniat', 'IsValidationSeniat', 'IsValidationSeniat', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_IsValidationSeniat', NULL, NULL, 0, 'DCS', 'LVE_IsValidationSeniat', 291, 20, NULL, NULL, 1, 'N', 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
 VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'RIF Seniat', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass, isallowcopy)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_IsValidationSeniat', 'LVE_IsValidationSeniat', 'LVE_IsValidationSeniat', 'Y', 220, (select max(ad_column_id) from adempiere.ad_column), NULL, 'N', NULL, 1, 'N', 0, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Validacion Seniat', 'Validacion Seniat', 'Validacion Seniat', 'N');




INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_descriptionSeniat', 'DCS', 'LVE_descriptionSeniat', 'LVE_descriptionSeniat', 'LVE_descriptionSeniat', 'LVE_descriptionSeniat', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Description Seniat', 'Description Seniat', 'Description Seniat', 'Description Seniat', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_descriptionSeniat', 'LVE_descriptionSeniat', 'LVE_descriptionSeniat', 0, 'DCS', 'LVE_descriptionSeniat', 291, 10, NULL, NULL, 255, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
 VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Description Seniat', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y',CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Description Seniat', 'Description Seniat', 'Description Seniat', 'Y', 220, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '@LVE_IsValidationSeniat=Y', 255, 'N', 54, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Descripción Seniat', 'Descripción Seniat', 'Descripción Seniat', 'N');






INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_acctionButtonYes', 'DCS', 'LVE_acctionButtonYes', 'LVE_acctionButtonYes', 'LVE_acctionButtonYes', 'LVE_acctionButtonYes', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Acction Button Yes', 'Acction Button Yes', 'Acction Button Yes', 'Acction Button Yes', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_acctionButtonYes', 'LVE_acctionButtonYes', 'LVE_acctionButtonYes', 0, 'DCS', 'LVE_acctionButtonYes', 291, 28, NULL, NULL, 1, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', 'org.doubleclick.callout.LVE_ValidationSENIAT.validationYes', NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
 VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Acction Button Yes', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Acction Button Yes', 'Acction Button Yes', 'Acction Button Yes', 'Y', 220, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '@LVE_IsValidationSeniat=Y', 1, 'N', 55, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'SI', 'SI', 'SI', 'N');





INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_acctionButtonNo', 'DCS', 'LVE_acctionButtonNo', 'LVE_acctionButtonNo', 'LVE_acctionButtonNo', 'LVE_acctionButtonNo', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Acction Button No', 'Acction Button No', 'Acction Button No', 'Acction Button No', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_acctionButtonNo', 'LVE_acctionButtonNo', 'LVE_acctionButtonNo', 0, 'DCS', 'LVE_acctionButtonNo', 291, 28, NULL, NULL, 1, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', 'org.doubleclick.callout.LVE_ValidationSENIAT.validationNo', NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);


INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
 VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Acction Button No', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Acction Button No', 'Acction Button No', 'Acction Button No', 'Y', 220, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', '@LVE_IsValidationSeniat=Y', 1, 'N', 56, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'NO', 'NO', 'NO', 'N');



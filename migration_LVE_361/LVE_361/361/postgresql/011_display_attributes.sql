at-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcs.net.ve --- rtsc08@gmail.com and Edickson Martinez - emartinez@dcs.net.ve  for Double Click Sistemas C.A.
-- 01/08/2012


INSERT INTO adempiere.AD_Tab(ad_tab_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_table_id, ad_window_id, seqno, tablevel, issinglerow, isinfotab, istranslationtab, isreadonly, ad_column_id, hastree, whereclause, orderbyclause, commitwarning, ad_process_id, processing, ad_image_id, importfields, ad_columnsortorder_id, ad_columnsortyesno_id, issorttab, entitytype, included_tab_id, readonlylogic, displaylogic, isinsertrecord, isadvancedtab, parent_column_id)
  VALUES((select max(ad_tab_id)+1 from ad_tab), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Atributs', NULL, NULL, 561, 140, 11, 1, 'N', 'N', 'N', 'Y', 8499, 'N', NULL, NULL, NULL, NULL, 'N', NULL, 'N', NULL, NULL, 'N', 'DCS', NULL, NULL, '@M_AttributeSetInstance_ID>0', 'N', 'N', 8418);


INSERT INTO adempiere.AD_Tab_Trl(ad_tab_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, commitwarning, istranslated)
  VALUES((select max(ad_tab_id) from ad_tab), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Atributos', NULL, NULL, NULL, 'Y');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Attribute Set Instance', 'Product Attribute Set Instance', 'The values of the actual Product Attribute Instances.  The product level attributes are defined on Product level.', 'Y', (select max(ad_tab_id) from ad_tab), 8499, NULL, 'N', NULL, 22, 'N', 0, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 'Y', (select max(ad_tab_id) from ad_tab), 8500, NULL, 'Y', NULL, 22, 'N', 10, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Search Key', 'Search key for the record in the format required - must be unique', 'A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).', 'Y', (select max(ad_tab_id) from ad_tab), 8501, NULL, 'Y', NULL, 40, 'N', 50, NULL, 'Y', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 'Y', (select max(ad_tab_id) from ad_tab), 8503, NULL, 'Y', NULL, 22, 'N', 20, NULL, 'Y', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Attribute Value', 'Product Attribute Value', 'Individual value of a product attribute (e.g. green, large, ..)', 'Y', (select max(ad_tab_id) from ad_tab), 8504, NULL, 'N', NULL, 22, 'N', 0, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');



INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 'Y', (select max(ad_tab_id) from ad_tab), 8505, NULL, 'Y', NULL, 1, 'N', 30, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Attribute', 'Product Attribute', 'Product Attribute like Color, Size', 'Y', (select max(ad_tab_id) from ad_tab), 8506, NULL, 'Y', NULL, 22, 'N', 40, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');



INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(AD_Field_id)+1 from AD_Field), 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Value', 'Numeric Value', NULL, 'Y', (select max(ad_tab_id) from ad_tab), 12661, NULL, 'N', NULL, 22, 'N', 0, NULL, 'Y', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(AD_Field_id) from AD_Field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'x', 'x', 'x', 'N');


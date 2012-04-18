// Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.
INSERT INTO  adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
  VALUES((select max(ad_process_para_id)+1  from AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Product Category', NULL, NULL, 193, 60, 18, 163, NULL, 'm_product_category', 'Y', 0, 'N', 'N', NULL, NULL, NULL, NULL, NULL, 453, 'DCS', NULL, NULL);


INSERT INTO  adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id)  from AD_Process_Para), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Categoría del Producto', NULL, NULL, 'N');


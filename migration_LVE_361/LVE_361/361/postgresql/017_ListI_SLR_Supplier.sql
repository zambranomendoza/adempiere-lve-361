
-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.



CREATE OR REPLACE VIEW lve_retentionislrlist AS 
 SELECT ci.ad_org_id AS ad, ci.ad_client_id, ci.c_bpartner_id, ao.name AS namemp, aoi.taxid AS rifemp, lve_addres(aoi.c_location_id) AS addresemp, (bp.name::text || ' '::text) || "isnull"(bp.name2::text, ''::text) AS namepro, bp.taxid AS rifpro, iw.dateacct AS fecha, 
        CASE
            WHEN dt.docbasetype = ANY (ARRAY['API'::bpchar, 'ARI'::bpchar]) THEN 'FACT'::text
            WHEN dt.docbasetype = ANY (ARRAY['APD'::bpchar, 'ARD'::bpchar]) THEN 'NOTD'::text
            WHEN dt.docbasetype = ANY (ARRAY['APC'::bpchar, 'ARC'::bpchar]) THEN 'NOTC'::text
            ELSE ''::text
        END AS tip, 
        CASE
            WHEN ci.poreference IS NOT NULL THEN ci.poreference
            ELSE ci.documentno
        END AS nrodoc, ci.grandtotal AS mondoc, iw.taxbaseamt AS impuesto, ct.rate AS tarifa, iw.taxamt AS retemido, dt.docbasetype, iw.lco_invoicewithholding_id, ci.lve_controlnumber
   FROM lco_invoicewithholding iw
   JOIN c_invoice ci ON iw.c_invoice_id = ci.c_invoice_id
   JOIN lco_withholdingtype wt ON iw.lco_withholdingtype_id = wt.lco_withholdingtype_id AND wt.lve_isislr = 'Y'::bpchar
   JOIN c_tax ct ON ct.c_tax_id = iw.c_tax_id
   JOIN c_doctype dt ON ci.c_doctype_id = dt.c_doctype_id AND (dt.docbasetype = ANY (ARRAY['API'::bpchar, 'APC'::bpchar, 'APD'::bpchar, 'ARI'::bpchar, 'ARD'::bpchar, 'ARC'::bpchar]))
   JOIN c_bpartner bp ON bp.c_bpartner_id = ci.c_bpartner_id
   JOIN ad_org ao ON ao.ad_org_id = ci.ad_org_id
   JOIN ad_orginfo aoi ON aoi.ad_org_id = ao.ad_org_id;

ALTER TABLE lve_retentionislrlist
 OWNER TO adempiere;




INSERT INTO adempiere.AD_Process(ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess)
  VALUES((select max(ad_process_id)+1  from adempiere.AD_Process), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_Lista_ISLR_Ret_Proveedores', 'LVE_Lista_ISLR_Ret_Proveedores', 'LVE_Lista_ISLR_Ret_Proveedores', NULL, '3', 'DCS', NULL, 'Y', 'N', NULL, NULL, 19, 19, NULL, NULL, NULL, 'N', 'N', 'Y', '005LVE_ListISLRSupplier.jasper', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Trl(ad_process_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_id)  from adempiere.AD_Process), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Listado de ISLR Retenido a Proveedores', 'Listado de ISLR Retenido a Proveedores', NULL, 'N')

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

INSERT INTO adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
  VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'AD_Ogr_ID', 'Organizacion', 'Organizacion', (select max(ad_process_id)  from adempiere.AD_Process), 10, 19, NULL, NULL, 'AD_Org_ID', 'Y', 0, 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl (ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id)  from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Organización', 'Organización', 'Organización', 'N')

;

INSERT INTO adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Business Partner ', 'Identifies a Business Partner', 'A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson', (select max(ad_process_id)  from adempiere.AD_Process), 11, 30, NULL, NULL, 'C_BPartner_ID', 'Y', 0, 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id)  from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Tercero', 'Identifica un Tercero', 'Un tercero es cualquiera con quien usted realiza transacciones. Este puede incluir Proveedores, Clientes, Empleados o Vendedores.', 'Y')

;


INSERT INTO adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
  VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'from', NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), 20, 16, NULL, NULL, 'from', 'Y', 0, 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl (ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id) from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Fecha Desde', NULL, NULL, 'N')

;


INSERT INTO adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
  VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'to', NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), 30, 16, NULL, NULL, 'to', 'Y', 0, 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl (ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id)  from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y',CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Fecha Hasta', NULL, NULL, 'N')

;

INSERT INTO adempiere.AD_Menu(ad_menu_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, issummary, issotrx, isreadonly, action, ad_window_id, ad_workflow_id, ad_task_id, ad_process_id, ad_form_id, ad_workbench_id, entitytype, iscentrallymaintained)
  VALUES((select max(ad_menu_id)+1  from adempiere.AD_Menu), 0, 0, 'Y',CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'Listado de ISLR Retenido a Proveedores', 100, 'Listado de ISLR Retenido a Proveedores', 'N', 'N', 'N', 'R', NULL, NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), NULL, NULL, 'DCS', 'Y')

;

INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.AD_Menu_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=(select max(ad_menu_id)  from adempiere.AD_Menu)

;

INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, (select max(ad_menu_id)  from adempiere.AD_Menu), 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=(select max(ad_menu_id)  from adempiere.AD_Menu))

;


INSERT INTO LVE_SqlScript
(LVE_SqlScript_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Date1,
LastScript,ScriptUser) VALUES
((select case when max(LVE_SqlScript_ID) is null then 1000000 else max(LVE_SqlScript_ID)+1 end from LVE_SqlScript),0,0,'Y',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,
'017_List_ISLR_Supplier.sql',
'Rafael Salazar C.')
;



-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.



CREATE OR REPLACE VIEW lve_retention_iva2 AS 
         SELECT ci.ad_org_id AS ad, ci.ad_client_id, ci.c_bpartner_id, iw.nroreten, bp.name, bp.taxid, ao.name AS nameorg, iw.lco_invoicewithholding_id AS operacion, ci.dateinvoiced AS fecha, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['ARI'::bpchar]) THEN ci.documentno
                    WHEN dt.docbasetype = ANY (ARRAY['API'::bpchar]) THEN ci.poreference
                    ELSE ''::character varying
                END AS factura, ci.lve_controlnumber AS control, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['APD'::bpchar, 'ARD'::bpchar]) THEN ci.documentno
                    ELSE ''::character varying
                END AS notadebito, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['APC'::bpchar, 'ARC'::bpchar]) THEN ci.documentno
                    ELSE ''::character varying
                END AS notacredito, '01-reg' AS trans, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['APD'::bpchar, 'ARD'::bpchar, 'APC'::bpchar, 'ARC'::bpchar]) THEN lve_documentinvoice(ci.lve_invoiceaffected_id)
                    ELSE ''::text
                END AS docafectado, 0 AS exento, lve_impbase('bf'::bpchar, ci.c_invoice_id, ct.rate) AS baseimponible, ct.rate AS alic, iw.taxbaseamt AS impuesto, iw.taxamt AS retemido, ci.c_invoice_id, iw.dateacct AS dateretention, dt.docbasetype
           FROM c_invoice ci
      JOIN lco_invoicewithholding iw ON ci.c_invoice_id = iw.c_invoice_id
   JOIN lco_withholdingtype wt ON iw.lco_withholdingtype_id = wt.lco_withholdingtype_id AND wt.LVE_isiva = 'Y'::bpchar
   JOIN lco_withholdingrule wr ON iw.lco_withholdingrule_id = wr.lco_withholdingrule_id
   JOIN lco_withholdingcalc wc ON wc.lco_withholdingcalc_id = wr.lco_withholdingcalc_id
   JOIN c_tax ct ON ct.c_tax_id = wc.c_basetax_id
   JOIN c_doctype dt ON ci.c_doctype_id = dt.c_doctype_id AND (dt.docbasetype = ANY (ARRAY['API'::bpchar, 'APC'::bpchar, 'APD'::bpchar, 'ARI'::bpchar, 'ARD'::bpchar, 'ARC'::bpchar]))
   JOIN c_bpartner bp ON bp.c_bpartner_id = ci.c_bpartner_id
   JOIN ad_org ao ON ao.ad_org_id = ci.ad_org_id
UNION ALL 
         SELECT ci.ad_org_id AS ad, ci.ad_client_id, ci.c_bpartner_id, '' AS nroreten, '' AS name, '' AS taxid, '' AS nameorg, iw.lco_invoicewithholding_id AS operacion, ci.dateinvoiced AS fecha, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['API'::bpchar, 'ARI'::bpchar]) THEN ci.documentno
                    ELSE ''::character varying
                END AS factura, ci.lve_controlnumber AS control, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['APD'::bpchar, 'ARD'::bpchar]) THEN ci.documentno
                    ELSE ''::character varying
                END AS notadebito, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['APC'::bpchar, 'ARC'::bpchar]) THEN ci.documentno
                    ELSE ''::character varying
                END AS notacredito, '01-reg' AS trans, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['APD'::bpchar, 'ARD'::bpchar, 'APC'::bpchar, 'ARC'::bpchar]) THEN lve_documentinvoice(ci.lve_invoiceaffected_id)
                    ELSE ''::text
                END AS docafectado, lve_calcexento(ci.c_invoice_id) AS exento, 0 AS baseimponible, 0 AS alic, 0 AS impuesto, 0 AS retemido, ci.c_invoice_id, iw.dateacct AS dateretention, dt.docbasetype
           FROM c_invoice ci
      JOIN lco_invoicewithholding iw ON ci.c_invoice_id = iw.c_invoice_id
   JOIN lco_withholdingtype wt ON iw.lco_withholdingtype_id = wt.lco_withholdingtype_id AND wt.lve_isiva = 'Y'::bpchar
   JOIN c_doctype dt ON ci.c_doctype_id = dt.c_doctype_id AND (dt.docbasetype = ANY (ARRAY['API'::bpchar, 'APC'::bpchar, 'APD'::bpchar, 'ARI'::bpchar, 'ARD'::bpchar, 'ARC'::bpchar]))
  GROUP BY ci.ad_org_id, ci.ad_client_id, ci.c_bpartner_id, iw.lco_invoicewithholding_id, ci.dateinvoiced, dt.docbasetype, ci.documentno, ci.lve_controlnumber, ci.lve_invoiceaffected_id, ci.c_invoice_id, iw.dateacct
 HAVING lve_calcexento(ci.c_invoice_id) > 0::numeric;

ALTER TABLE lve_retention_iva2
 OWNER TO adempiere;

CREATE OR REPLACE VIEW lve_sales_book AS 
         SELECT ci.ad_org_id, ci.ad_client_id, ci.dateacct AS dateinvoice, cb.taxid AS rif, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN cb.name
                    ELSE 'ANULADA'::character varying
                END AS name, lri.nroreten AS number_voucher, 
                CASE
                    WHEN cd.docbasetype = 'ARI'::bpchar THEN ci.documentno
                    ELSE ''::character varying
                END AS nrofac, ci.lve_controlnumber AS numbre_control, 
                CASE
                    WHEN cd.docbasetype = 'ARD'::bpchar THEN ci.documentno
                    ELSE ''::character varying
                END AS numbre_debit_note, 
                CASE
                    WHEN cd.docbasetype = 'ARC'::bpchar THEN ci.documentno
                    ELSE ''::character varying
                END AS numbre_credit_note, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN '01-reg'::text
                    ELSE '03-anu'::text
                END AS tipe_transcc, 
                CASE
                    WHEN cd.docbasetype = ANY (ARRAY['ARC'::bpchar, 'ARD'::bpchar]) THEN lve_documentinvoice(ci.lve_invoiceaffected_id)
                    ELSE ''::text
                END AS number_invoice_affected, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN 
                    CASE
                        WHEN cd.docbasetype = 'ARC'::bpchar THEN - round(cit.taxbaseamt + cit.taxamt, 2)
                        ELSE round(cit.taxbaseamt + cit.taxamt, 2)
                    END
                    ELSE 0::numeric
                END AS total, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN round(lve_calcexento(ci.c_invoice_id), 2)
                    ELSE 0::numeric
                END AS nosale, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN 
                    CASE
                        WHEN cd.docbasetype = 'ARC'::bpchar THEN - round(cit.taxbaseamt, 2)
                        ELSE round(cit.taxbaseamt, 2)
                    END
                    ELSE 0::numeric
                END AS base, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN round(ct.rate, 2)
                    ELSE 0::numeric
                END AS rate, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN 
                    CASE
                        WHEN cd.docbasetype = 'ARC'::bpchar THEN - round(cit.taxamt, 2)
                        ELSE round(cit.taxamt, 2)
                    END
                    ELSE 0::numeric
                END AS total_tax, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN 
                    CASE
                        WHEN cd.docbasetype = 'ARC'::bpchar THEN - round(lri.retemido, 2)
                        ELSE round(lri.retemido, 2)
                    END
                    ELSE 0::numeric
                END AS retained_tax, 
                CASE
                    WHEN lri.dateretention IS NULL THEN ci.dateacct
                    ELSE lri.dateretention
                END AS datefilter
           FROM c_bpartner cb
      JOIN c_invoice ci ON cb.c_bpartner_id = ci.c_bpartner_id
   JOIN ad_org ao ON ci.ad_org_id = ao.ad_org_id
   JOIN ad_orginfo aoi ON aoi.ad_org_id = ao.ad_org_id
   JOIN c_invoiceline cil ON ci.c_invoice_id = cil.c_invoice_id
   JOIN c_tax ct ON cil.c_tax_id = ct.c_tax_id
   JOIN c_doctype cd ON cd.c_doctype_id = ci.c_doctype_id
   LEFT JOIN c_invoicetax cit ON cit.c_tax_id = ct.c_tax_id AND cit.c_invoice_id = ci.c_invoice_id
   LEFT JOIN lve_retention_iva2 lri ON lri.c_invoice_id = ci.c_invoice_id AND date_part('month'::text, ci.dateacct) = date_part('month'::text, lri.dateretention) AND date_part('year'::text, ci.dateacct) = date_part('year'::text, lri.dateretention)
  WHERE (ci.grandtotal = lve_calcexento(ci.c_invoice_id) OR ct.rate <> 0::numeric) AND (cd.docbasetype = ANY (ARRAY['ARC'::bpchar, 'ARD'::bpchar, 'ARI'::bpchar]))
  GROUP BY ct.rate, ci.ad_org_id, ci.ad_client_id, ci.dateacct, cb.taxid, ci.isactive, cb.name, cd.docbasetype, ci.documentno, ci.lve_controlnumber, ci.lve_invoiceaffected_id, cit.taxbaseamt, cit.taxamt, ci.c_invoice_id, lri.nroreten, lri.retemido, lri.dateretention
UNION ALL 
         SELECT ci.ad_org_id, ci.ad_client_id, ci.dateacct AS dateinvoice, cb.taxid AS rif, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN cb.name
                    ELSE 'ANULADA'::character varying
                END AS name, lri.nroreten AS number_voucher, 
                CASE
                    WHEN cd.docbasetype = 'ARI'::bpchar THEN ci.documentno
                    ELSE ''::character varying
                END AS nrofac, ci.lve_controlnumber AS numbre_control, 
                CASE
                    WHEN cd.docbasetype = 'ARD'::bpchar THEN ci.documentno
                    ELSE ''::character varying
                END AS numbre_debit_note, 
                CASE
                    WHEN cd.docbasetype = 'ARC'::bpchar THEN ci.documentno
                    ELSE ''::character varying
                END AS numbre_credit_note, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN '01-reg'::text
                    ELSE '03-anu'::text
                END AS tipe_transcc, 
                CASE
                    WHEN cd.docbasetype = 'ARI'::bpchar THEN ci.documentno
                    ELSE ''::character varying
                END AS number_invoice_affected, 0 AS total, 0 AS nosale, 0 AS base, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN round(ct.rate, 2)
                    ELSE 0::numeric
                END AS rate, 0 AS total_tax, 
                CASE
                    WHEN ci.isactive = 'Y'::bpchar THEN round(lri.retemido, 2)
                    ELSE 0::numeric
                END AS retained_tax, 
                CASE
                    WHEN lri.dateretention IS NULL THEN ci.dateacct
                    ELSE lri.dateretention
                END AS datefilter
           FROM c_bpartner cb
      JOIN c_invoice ci ON cb.c_bpartner_id = ci.c_bpartner_id
   JOIN ad_org ao ON ci.ad_org_id = ao.ad_org_id
   JOIN ad_orginfo aoi ON aoi.ad_org_id = ao.ad_org_id
   JOIN c_invoiceline cil ON ci.c_invoice_id = cil.c_invoice_id
   JOIN c_tax ct ON cil.c_tax_id = ct.c_tax_id
   JOIN c_doctype cd ON cd.c_doctype_id = ci.c_doctype_id
   LEFT JOIN c_invoicetax cit ON cit.c_tax_id = ct.c_tax_id AND cit.c_invoice_id = ci.c_invoice_id
   JOIN lve_retention_iva2 lri ON lri.c_invoice_id = ci.c_invoice_id AND date_part('month'::text, ci.dateacct) <> date_part('month'::text, lri.dateretention)
  WHERE (ci.grandtotal = lve_calcexento(ci.c_invoice_id) OR ct.rate <> 0::numeric) AND (cd.docbasetype = ANY (ARRAY['ARC'::bpchar, 'ARD'::bpchar, 'ARI'::bpchar]))
  GROUP BY ct.rate, ci.ad_org_id, ci.ad_client_id, ci.dateacct, cb.taxid, ci.isactive, cb.name, cd.docbasetype, ci.documentno, ci.lve_controlnumber, ci.lve_invoiceaffected_id, cit.taxbaseamt, cit.taxamt, ci.c_invoice_id, lri.nroreten, lri.retemido, lri.dateretention;

ALTER TABLE lve_sales_book
  OWNER TO adempiere;



INSERT INTO adempiere.AD_Process(ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess)
  VALUES((select max(ad_process_id)+1  from adempiere.AD_Process), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_sales_book', 'Sales Book', 'Sales Book', NULL, '3', 'DCS', NULL, 'Y', 'N', NULL, NULL, 19, 19, NULL, NULL, NULL, 'N', 'N', 'Y', '004LVE_SalesBook.jasper', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Trl(ad_process_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_id)  from adempiere.AD_Process), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Libro de Ventas', 'Libro de Ventas', NULL, 'N')

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
  VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'from', NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), 20, 16, NULL, NULL, 'from', 'Y', 0, 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl (ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id) from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Fecha Desde', NULL, NULL, 'N')

;


INSERT INTO adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
  VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'to', NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), 30, 16, NULL, NULL, 'to', 'Y', 0, 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl (ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id)  from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y',CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Fecha Hasta', NULL, NULL, 'N')

;

INSERT INTO adempiere.AD_Menu(ad_menu_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, issummary, issotrx, isreadonly, action, ad_window_id, ad_workflow_id, ad_task_id, ad_process_id, ad_form_id, ad_workbench_id, entitytype, iscentrallymaintained)
  VALUES((select max(ad_menu_id)+1  from adempiere.AD_Menu), 0, 0, 'Y',CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'Libro de Ventas', 100, 'Libro de Ventas', 'N', 'N', 'N', 'R', NULL, NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), NULL, NULL, 'DCS', 'Y')

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
'016_sales_book.sql',
'Rafael Salazar C.')
;


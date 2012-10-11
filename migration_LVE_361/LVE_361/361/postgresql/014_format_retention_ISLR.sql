
-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.




CREATE OR REPLACE FUNCTION lve_addres(p_c_location_id numeric)
  RETURNS character varying AS
$BODY$
DECLARE valor varchar;
BEGIN	
    select into valor  
       case  when cl.city is null then '' else cl.city  || '. '  end
       ||
       case  when cl.address1 is null then '' else cl.address1  || '. ' end
       ||
       case  when cl.address2 is null then '' else cl.address2 || '. '  end
       ||
       case  when cl.address3 is null then '' else cl.address3  || '. '  end
       ||
       case  when cl.address4 is null then '' else cl.address4  || '. ' end
       ||
       case  when cl.regionname is null then '' else cl.regionname || '. '    end
       ||
       case  when cl.postal is null then '' else cl.postal end as direccion 
    from c_location cl where  cl.c_location_id= p_c_location_id limit 1;
     IF valor is null then 
           valor:='';
     END IF ;
     return valor;
END;	
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION lve_addres(numeric)
  OWNER TO adempiere;







CREATE OR REPLACE FUNCTION "isnull"(text, text)
  RETURNS text AS
$BODY$
SELECT (CASE (SELECT $1
is null) WHEN true THEN $2 ELSE $1 END) AS RESULT
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION "isnull"(text, text)
  OWNER TO adempiere;
COMMENT ON FUNCTION "isnull"(text, text) IS 'Devuelve el segundo argumento cuando el primero es Nulo';




CREATE OR REPLACE VIEW lve_retention_islr AS 
         SELECT ci.ad_org_id AS ad, ci.ad_client_id, ci.c_bpartner_id, ao.name AS namemp, aoi.taxid AS rifemp, lve_addres(aoi.c_location_id) AS addresemp, (bp.name::text || ' '::text) || "isnull"(bp.name2::text, ''::text) AS namepro, bp.taxid AS rifpro, lve_addres(cbl.c_bpartner_location_id) AS addrespro, iw.dateacct AS fecha, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['API'::bpchar, 'ARI'::bpchar]) THEN 'FACT'::text
                    WHEN dt.docbasetype = ANY (ARRAY['APD'::bpchar, 'ARD'::bpchar]) THEN 'NOTD'::text
                    WHEN dt.docbasetype = ANY (ARRAY['APC'::bpchar, 'ARC'::bpchar]) THEN 'NOTC'::text
                    ELSE ''::text
                END AS tip, 
                CASE
                    WHEN ci.poreference IS NOT NULL THEN ci.poreference
                    ELSE ci.documentno
                END AS nrodoc, ci.grandtotal AS mondoc, 
                CASE
                    WHEN cp.payamt = 0::numeric THEN cp.writeoffamt
                    ELSE cp.payamt
                END AS monabo, iw.taxbaseamt AS impuesto, ct.rate AS tarifa, wr.name AS nameret, iw.taxamt AS retemido, dt.docbasetype
           FROM c_invoice ci
      JOIN c_payment cp ON ci.c_invoice_id = cp.c_invoice_id AND (cp.docstatus = ANY (ARRAY['CO'::bpchar, 'CL'::bpchar]))
   JOIN lco_invoicewithholding iw ON ci.c_invoice_id = iw.c_invoice_id
   JOIN lco_withholdingtype wt ON iw.lco_withholdingtype_id = wt.lco_withholdingtype_id AND wt.LVE_isislr = 'Y'::bpchar
   JOIN lco_withholdingrule wr ON iw.lco_withholdingrule_id = wr.lco_withholdingrule_id
   JOIN lco_withholdingcalc wc ON wc.lco_withholdingcalc_id = wr.lco_withholdingcalc_id
   JOIN c_tax ct ON ct.c_tax_id = wc.c_tax_id
   JOIN c_doctype dt ON ci.c_doctype_id = dt.c_doctype_id AND (dt.docbasetype = ANY (ARRAY['API'::bpchar, 'APC'::bpchar, 'APD'::bpchar, 'ARI'::bpchar, 'ARD'::bpchar, 'ARC'::bpchar]))
   JOIN c_bpartner bp ON bp.c_bpartner_id = ci.c_bpartner_id
   JOIN c_bpartner_location cbl ON cbl.c_bpartner_id = bp.c_bpartner_id
   JOIN ad_org ao ON ao.ad_org_id = ci.ad_org_id
   JOIN ad_orginfo aoi ON aoi.ad_org_id = ao.ad_org_id
UNION ALL 
         SELECT ci.ad_org_id AS ad, ci.ad_client_id, ci.c_bpartner_id, ao.name AS namemp, aoi.taxid AS rifemp, lve_addres(aoi.c_location_id) AS addresemp, (bp.name::text || ' '::text) || "isnull"(bp.name2::text, ''::text) AS namepro, bp.taxid AS rifpro, lve_addres(cbl.c_bpartner_location_id) AS addrespro, iw.dateacct AS fecha, 
                CASE
                    WHEN dt.docbasetype = ANY (ARRAY['API'::bpchar, 'ARI'::bpchar]) THEN 'FACT'::text
                    WHEN dt.docbasetype = ANY (ARRAY['APD'::bpchar, 'ARD'::bpchar]) THEN 'NOTD'::text
                    WHEN dt.docbasetype = ANY (ARRAY['APC'::bpchar, 'ARC'::bpchar]) THEN 'NOTC'::text
                    ELSE ''::text
                END AS tip, 
                CASE
                    WHEN ci.poreference IS NOT NULL THEN ci.poreference
                    ELSE ci.documentno
                END AS nrodoc, ci.grandtotal AS mondoc, 
                CASE
                    WHEN cp.payamt = 0::numeric THEN cp.writeoffamt
                    ELSE cp.payamt
                END AS monabo, iw.taxbaseamt AS impuesto, ct.rate AS tarifa, wr.name AS nameret, iw.taxamt AS retemido, dt.docbasetype
           FROM c_invoice ci
      JOIN c_paymentallocate cpa ON ci.c_invoice_id = cpa.c_invoice_id
   JOIN c_payment cp ON cp.c_payment_id = cpa.c_payment_id AND (cp.docstatus = ANY (ARRAY['CO'::bpchar, 'CL'::bpchar]))
   JOIN lco_invoicewithholding iw ON ci.c_invoice_id = iw.c_invoice_id
   JOIN lco_withholdingtype wt ON iw.lco_withholdingtype_id = wt.lco_withholdingtype_id AND wt.LVE_isislr = 'Y'::bpchar
   JOIN lco_withholdingrule wr ON iw.lco_withholdingrule_id = wr.lco_withholdingrule_id
   JOIN lco_withholdingcalc wc ON wc.lco_withholdingcalc_id = wr.lco_withholdingcalc_id
   JOIN c_tax ct ON ct.c_tax_id = wc.c_tax_id
   JOIN c_doctype dt ON ci.c_doctype_id = dt.c_doctype_id AND (dt.docbasetype = ANY (ARRAY['API'::bpchar, 'APC'::bpchar, 'APD'::bpchar, 'ARI'::bpchar, 'ARD'::bpchar, 'ARC'::bpchar]))
   JOIN c_bpartner bp ON bp.c_bpartner_id = ci.c_bpartner_id
   JOIN c_bpartner_location cbl ON cbl.c_bpartner_id = bp.c_bpartner_id
   JOIN ad_org ao ON ao.ad_org_id = ci.ad_org_id
   JOIN ad_orginfo aoi ON aoi.ad_org_id = ao.ad_org_id;

ALTER TABLE lve_retention_islr
  OWNER TO adempiere;




INSERT INTO adempiere.AD_Process(ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess)
 VALUES((select max(ad_process_id)+1  from adempiere.AD_Process) , 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_retentionISLR', 'Retenciones de ISLR', 'Retenciones de ISLR', NULL, '3', 'DCS', NULL, 'Y', 'N', NULL, NULL, 19, 19, NULL, NULL, NULL, 'N', 'N', 'Y', '002LVE_VoucherRelationISLR.jasper', NULL, NULL) 

;

INSERT INTO adempiere.AD_Process_Trl(ad_process_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
 VALUES((select max(ad_process_id)  from adempiere.AD_Process), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Retenciones de ISLR', 'Retenciones de ISLR', NULL, 'N')

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
VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Business Partner ', 'Identifies a Business Partner', 'A Business Partner is anyone with whom you transact.  This can include Vendor, Customer, Employee or Salesperson', (select max(ad_process_id)  from adempiere.AD_Process), 10, 30, NULL, NULL, 'C_BPartner_ID', 'Y', 0, 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_process_para_id)  from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Tercero', 'Identifica un Tercero', 'Un tercero es cualquiera con quien usted realiza transacciones. Este puede incluir Proveedores, Clientes, Empleados o Vendedores.', 'Y')

;

INSERT INTO adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
 VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'desde', NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), 20, 16, NULL, NULL, 'desde', 'Y', 0, 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
 VALUES((select max(ad_process_para_id) from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y',  CURRENT_TIMESTAMP, 100,  CURRENT_TIMESTAMP, 100, 'Fecha Desde', NULL, NULL, 'N')

;

INSERT INTO adempiere.AD_Process_Para(ad_process_para_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_process_id, seqno, ad_reference_id, ad_reference_value_id, ad_val_rule_id, columnname, iscentrallymaintained, fieldlength, ismandatory, isrange, defaultvalue, defaultvalue2, vformat, valuemin, valuemax, ad_element_id, entitytype, readonlylogic, displaylogic)
  VALUES((select max(ad_process_para_id)+1  from adempiere.AD_Process_Para), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'hasta', NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), 30, 16, NULL, NULL, 'hasta', 'Y', 0, 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, 'DCS', NULL, NULL)

;

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
 VALUES((select max(ad_process_para_id)  from adempiere.AD_Process_Para), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Fecha Hasta', NULL, NULL, 'N')

;


INSERT INTO adempiere.AD_Menu(ad_menu_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, issummary, issotrx, isreadonly, action, ad_window_id, ad_workflow_id, ad_task_id, ad_process_id, ad_form_id, ad_workbench_id, entitytype, iscentrallymaintained)
 VALUES((select max(ad_menu_id)+1  from adempiere.AD_Menu), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'Retenciones de ISLR', 100, 'Retenciones de ISLR', 'N', 'N', 'N', 'R', NULL, NULL, NULL, (select max(ad_process_id)  from adempiere.AD_Process), NULL, NULL, 'DCS', 'Y')
 
;

INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.AD_Menu_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=(select max(ad_menu_id)  from adempiere.AD_Menu)

;

INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, (select max(ad_menu_id)  from adempiere.AD_Menu), 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=(select max(ad_menu_id)  from adempiere.AD_Menu))

;



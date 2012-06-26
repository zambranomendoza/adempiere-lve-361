-- Original contribution by Rafael Tom?s Salazar Colmen?rez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.
-- Date:      22/08/2011 
-- Updated: 16/09/2011
-- Note: if you want to run script , you must  replaced all occurrences @ID_CLIENT@  the company that is creating
-- Example for GardenAdmin el @ID_CLIENT@ you should change  to 11

BEGIN;

/*INSERT INTO adempiere.AD_Process(ad_process_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, value, name, description, help, accesslevel, entitytype, procedurename, isreport, isdirectprint, ad_reportview_id, classname, statistic_count, statistic_seconds, ad_printformat_id, workflowvalue, ad_workflow_id, isbetafunctionality, isserverprocess, showhelp, jasperreport, ad_form_id, copyfromprocess)
  VALUES((select max(ad_Process_id)+1 from adempiere.ad_Process), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_GenerateWithholding', 'Generate Withholding', NULL, NULL, '3', 'DCS', NULL, 'N', 'N', NULL, 'org.eevolution.process.LVE_GenerateWithholding', 192, 682, NULL, NULL, NULL, 'N', 'N', 'Y', NULL, NULL, NULL)
;*/


/*INSERT INTO adempiere.AD_Process_Trl(ad_process_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_Process_id) from adempiere.ad_Process), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Genera Retenciones', NULL, NULL, 'N')
;*/

/*INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
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
;*/


/*INSERT INTO adempiere.ad_column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from adempiere.ad_column ) , 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Generate Withholding', NULL, NULL, 0, 'DCS', 'GenerateWithholding', 335, 28, NULL, NULL, 20, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N',(select ad_element_id from adempiere.ad_element WHERE columnname ='GenerateWithholding' AND entitytype='QSS_LCO'), (select max(ad_Process_id) from adempiere.ad_Process), 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from adempiere.ad_column) , 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generar Retenci?n', 'N')
;

INSERT INTO adempiere.ad_field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generate Withholding', NULL, NULL, 'Y', 330, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', NULL, 20, 'N', 680, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
;

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generar Retenciones', NULL, NULL, 'N')
;*/
---------------------------

/*INSERT INTO adempiere.ad_column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from adempiere.ad_column ) , 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Generate Withholding', NULL, NULL, 0, 'DCS', 'GenerateWithholding', 812, 28, NULL, NULL, 20, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N',(select ad_element_id from adempiere.ad_element WHERE columnname ='GenerateWithholding' AND entitytype='QSS_LCO'), (select max(ad_Process_id) from adempiere.ad_Process), 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from adempiere.ad_column) , 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Generar Retenci?n', 'N')
;

INSERT INTO adempiere.ad_field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES((select max(ad_field_id)+1 from adempiere.ad_field ), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generate Withholding', NULL, NULL, 'Y', 755, (select max(ad_column_id) from adempiere.ad_column), NULL, 'Y', NULL, 20, 'N', 680, NULL, 'N', 'N', 'N', 'N', 'DCS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
;

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((select max(ad_field_id) from adempiere.ad_field), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Generar Retenciones', NULL, NULL, 'N')
;*/

----------------------------------------------

--delete from adempiere.lco_withholdingrule where  ad_client_id=@ID_CLIENT@ and  ad_org_id=0
--GO
--delete from adempiere.lco_withholdingcalc where  ad_client_id=@ID_CLIENT@ and  ad_org_id=0
--GO
--delete from adempiere.c_tax where  ad_client_id=@ID_CLIENT@ and  ad_org_id=0
--GO
--delete from adempiere.c_taxcategory where  ad_client_id=@ID_CLIENT@ and  ad_org_id=0
--GO
--delete from adempiere.lco_withholdingcategory where  ad_client_id=@ID_CLIENT@ and  ad_org_id=0
--GO
--delete from adempiere.lco_withholdingruleconf where  ad_client_id=@ID_CLIENT@ and  ad_org_id=0
--GO
--delete from adempiere.lco_withholdingtype where  ad_client_id=@ID_CLIENT@ and  ad_org_id=0
--GO 

---------------------------------------------

delete From lco_withholdingrule;

delete From lco_withholdingcategory;

delete From lco_taxpayertype;

delete From lco_withholdingcalc;

delete from c_tax ;

delete from c_taxcategory;

delete From lco_withholdingruleconf;

delete From lco_withholdingtype;


---------------------------------------------

INSERT INTO adempiere.lco_withholdingtype(ad_client_id, ad_org_id, created, createdby, updatedby, isactive, issotrx, lco_withholdingtype_id, description, updated, name, LVE_isiva, LVE_isislr)
  VALUES(@ID_CLIENT@, 0,CURRENT_TIMESTAMP, 100, 100, 'Y', 'Y', 5000000, 'Retenci?n del 75 % del Iva en Ventas', CURRENT_TIMESTAMP, 'Retenci?n 75% IVA en Ventas', 'Y', 'N')
;
INSERT INTO adempiere.lco_withholdingtype(ad_client_id, ad_org_id, created, createdby, updatedby, isactive, issotrx, lco_withholdingtype_id, description, updated, name, LVE_isiva, LVE_isislr)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 100, 'Y', 'N', 5000003, 'Retenci?nes de IVA 75% en Compras', CURRENT_TIMESTAMP, 'Ret. IVA 75% en Compras', 'Y', 'N')
;
INSERT INTO adempiere.lco_withholdingtype(ad_client_id, ad_org_id, created, createdby, updatedby, isactive, issotrx, lco_withholdingtype_id, description, updated, name, LVE_isiva, LVE_isislr)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 100, 'Y', 'Y', 5000004, 'Retenciones de ISLR Venta', CURRENT_TIMESTAMP, 'Retencion de ISLR Venta  ', 'N', 'Y')
;
INSERT INTO adempiere.lco_withholdingtype(ad_client_id, ad_org_id, created, createdby, updatedby, isactive, issotrx, lco_withholdingtype_id, description, updated, name, LVE_isiva, LVE_isislr)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 100, 'Y', 'N', 5000008, 'Retenciones de ISLR Compra', CURRENT_TIMESTAMP, 'Retencion de ISLR Compra', 'N', 'Y')
;



-----------------------------------



INSERT INTO adempiere.lco_withholdingruleconf(ad_client_id, ad_org_id, created, createdby, isactive, isusebpisic, updatedby, isuseorgisic, isuseorgtaxpayertype, isusewithholdingcategory, isuseproducttaxcategory, lco_withholdingtype_id, updated, isusebptaxpayertype, isusebpcity, isuseorgcity)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'Y', 'N', 100, 'N', 'N', 'N', 'N', 5000003, CURRENT_TIMESTAMP, 'N', 'N', 'N')
;
INSERT INTO adempiere.lco_withholdingruleconf(ad_client_id, ad_org_id, created, createdby, isactive, isusebpisic, updatedby, isuseorgisic, isuseorgtaxpayertype, isusewithholdingcategory, isuseproducttaxcategory, lco_withholdingtype_id, updated, isusebptaxpayertype, isusebpcity, isuseorgcity)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'Y', 'N', 100, 'N', 'N', 'Y', 'N', 5000004, CURRENT_TIMESTAMP, 'Y', 'N', 'N')
;
INSERT INTO adempiere.lco_withholdingruleconf(ad_client_id, ad_org_id, created, createdby, isactive, isusebpisic, updatedby, isuseorgisic, isuseorgtaxpayertype, isusewithholdingcategory, isuseproducttaxcategory, lco_withholdingtype_id, updated, isusebptaxpayertype, isusebpcity, isuseorgcity)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'Y', 'N', 100, 'N', 'Y', 'N', 'N', 5000000, CURRENT_TIMESTAMP, 'Y', 'N', 'N')
;
INSERT INTO adempiere.lco_withholdingruleconf(ad_client_id, ad_org_id, created, createdby, isactive, isusebpisic, updatedby, isuseorgisic, isuseorgtaxpayertype, isusewithholdingcategory, isuseproducttaxcategory, lco_withholdingtype_id, updated, isusebptaxpayertype, isusebpcity, isuseorgcity)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'Y', 'N', 100, 'N', 'N', 'Y', 'N', 5000008, CURRENT_TIMESTAMP, 'Y', 'N', 'N')
;


-------------------------------------




INSERT INTO adempiere.c_taxcategory(c_taxcategory_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, commoditycode, isdefault, iswithholding)
  VALUES(5000006, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'EXENTO', 'IMPUESTO EXENTO', NULL, 'N', 'N')
;
INSERT INTO C_TaxCategory_Trl (AD_Language,C_TaxCategory_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,
Updated,UpdatedBy) SELECT l.AD_Language,t.C_TaxCategory_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_TaxCategory t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_TaxCategory_ID=5000006 AND NOT EXISTS (SELECT * FROM C_TaxCategory_Trl tt WHERE tt.AD_Language=l.AD_Language AND 
tt.C_TaxCategory_ID=t.C_TaxCategory_ID)
;
INSERT INTO adempiere.c_taxcategory(c_taxcategory_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, commoditycode, isdefault, iswithholding)
  VALUES(5000009, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'IVA 8 %', 'IVA 8 %', 'IVA', 'N', 'N')
;
INSERT INTO C_TaxCategory_Trl (AD_Language,C_TaxCategory_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,
Updated,UpdatedBy) SELECT l.AD_Language,t.C_TaxCategory_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_TaxCategory t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_TaxCategory_ID=5000009 AND NOT EXISTS (SELECT * FROM C_TaxCategory_Trl tt WHERE tt.AD_Language=l.AD_Language AND 
tt.C_TaxCategory_ID=t.C_TaxCategory_ID)
;
INSERT INTO adempiere.c_taxcategory(c_taxcategory_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, commoditycode, isdefault, iswithholding)
  VALUES(5000000, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'IVA 12 %', 'IVA 12 %', NULL, 'N', 'N')
;
INSERT INTO C_TaxCategory_Trl (AD_Language,C_TaxCategory_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,
Updated,UpdatedBy) SELECT l.AD_Language,t.C_TaxCategory_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_TaxCategory t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_TaxCategory_ID=5000000 AND NOT EXISTS (SELECT * FROM C_TaxCategory_Trl tt WHERE tt.AD_Language=l.AD_Language AND 
tt.C_TaxCategory_ID=t.C_TaxCategory_ID)
;
INSERT INTO adempiere.c_taxcategory(c_taxcategory_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, commoditycode, isdefault, iswithholding)
  VALUES(5000001, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'IVA 12% IMPUESTO', 'IVA 12% IMPUESTO', NULL, 'N', 'N')
;
INSERT INTO C_TaxCategory_Trl (AD_Language,C_TaxCategory_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,
Updated,UpdatedBy) SELECT l.AD_Language,t.C_TaxCategory_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_TaxCategory t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_TaxCategory_ID=5000001 AND NOT EXISTS (SELECT * FROM C_TaxCategory_Trl tt WHERE tt.AD_Language=l.AD_Language AND 
tt.C_TaxCategory_ID=t.C_TaxCategory_ID)
;
INSERT INTO adempiere.c_taxcategory(c_taxcategory_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, commoditycode, isdefault, iswithholding)
  VALUES(5000011, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Retencion ISLR', 'IMPUESTO SOBRE LA RENTA', NULL, 'Y', 'Y')
;
INSERT INTO C_TaxCategory_Trl (AD_Language,C_TaxCategory_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,
Updated,UpdatedBy) SELECT l.AD_Language,t.C_TaxCategory_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_TaxCategory t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_TaxCategory_ID=5000011 AND NOT EXISTS (SELECT * FROM C_TaxCategory_Trl tt WHERE tt.AD_Language=l.AD_Language AND 
tt.C_TaxCategory_ID=t.C_TaxCategory_ID)
;
INSERT INTO adempiere.c_taxcategory(c_taxcategory_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, commoditycode, isdefault, iswithholding)
  VALUES(5000010, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Retencion IVA', 'Retenciones IVA', NULL, 'Y', 'Y')
;
INSERT INTO C_TaxCategory_Trl (AD_Language,C_TaxCategory_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,
Updated,UpdatedBy) SELECT l.AD_Language,t.C_TaxCategory_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_TaxCategory t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_TaxCategory_ID=5000010 AND NOT EXISTS (SELECT * FROM C_TaxCategory_Trl tt WHERE tt.AD_Language=l.AD_Language AND 
tt.C_TaxCategory_ID=t.C_TaxCategory_ID)
;


---------------------------------------------------------------------




INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000101, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PNR', 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PNR)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 1, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000101 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000101, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000101)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000103, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PNR', 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PNR)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 3, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000103 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000103, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000103)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000104, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PJD', 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PJD)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 5, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000104 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000104, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000104)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000006, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'IVA 8%', 100, 'IVA 8%', NULL, 'Y', '2009-04-01 00:00:00.0', 'N', 'N', 8.000000000000, NULL, NULL, NULL, NULL, NULL, 5000009, 'N', 'N', 'B', 'Y', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000006 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000006, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000006)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000110, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PNR', 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PNR)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 3, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000110 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000110, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000110)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000106, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PJD', 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PJD)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 5, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000106 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000106, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000106)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000105, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PNR', 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PNR)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 3, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000105 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000105, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000105)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000107, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 1, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000107 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000107, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000107)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000108, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 3, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000108 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000108, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000108)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000109, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PJD', 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PJD)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 5, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000109 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000109, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000109)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000098, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'IVA 75% Proveedor', 100, 'IVA 75% Proveedor', NULL, 'Y', '2009-04-01 00:00:00.0', 'N', 'N', 75.000000000000, NULL, NULL, NULL, NULL, NULL, 5000010, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000098 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000098, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000098)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000000, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'IVA 12%', 100, 'IVA 12', NULL, 'Y', '2009-04-01 00:00:00.0', 'N', 'N', 12.0, NULL, NULL, NULL, NULL, NULL, 5000001, 'Y', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000000 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000000, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000000)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000007, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'EXENTO', 100, NULL, NULL, 'N', '2009-04-01 00:00:00.0', 'N', 'N', 0, NULL, NULL, NULL, NULL, NULL, 5000006, 'N', 'Y', 'B', 'Y', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000007 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000007, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000007)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000111, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'IVA 75% Cliente', 100, NULL, NULL, 'Y', '2009-04-01 00:00:00.0', 'N', 'N', 75.000000000000, NULL, NULL, NULL, NULL, NULL, 5000010, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000111 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000111, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000111)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000100, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Honorarios Profesionales Mancomunados NoMercantiles PJD', 100, 'ISLR Honorarios Profesionales Mancomunados No Mercantiles (PJD)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 5, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000100 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000100, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000100)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000008, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Honorarios Profesionales Mancomunados NoMercantiles PNR', 100, 'ISLR Honorarios Profesionales Mancomunados No Mercantiles (PNR)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 3, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000008 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000008, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000008)
;
INSERT INTO adempiere.c_tax(c_tax_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, taxindicator, isdocumentlevel, validfrom, issummary, requirestaxcertificate, rate, parent_tax_id, c_country_id, c_region_id, to_country_id, to_region_id, c_taxcategory_id, isdefault, istaxexempt, sopotype, issalestax, ad_rule_id)
  VALUES(5000102, @ID_CLIENT@, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PJD', 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PJD)', NULL, 'Y', '2000-01-01 00:00:00.0', 'N', 'N', 2, NULL, NULL, NULL, NULL, NULL, 5000011, 'N', 'N', 'B', 'N', NULL)
;
INSERT INTO C_Tax_Trl (AD_Language,C_Tax_ID, Description,Name,TaxIndicator, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,
UpdatedBy) SELECT l.AD_Language,t.C_Tax_ID, t.Description,t.Name,t.TaxIndicator, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,
t.Updated,t.UpdatedBy FROM AD_Language l, C_Tax t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND 
t.C_Tax_ID=5000102 AND NOT EXISTS (SELECT * FROM C_Tax_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Tax_ID=t.C_Tax_ID)
;
INSERT INTO C_Tax_Acct (C_Tax_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,T_Credit_Acct,
T_Due_Acct,T_Expense_Acct,T_Liability_Acct,T_Receivables_Acct) SELECT 5000102, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', 
CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.T_Credit_Acct,p.T_Due_Acct,p.T_Expense_Acct,p.T_Liability_Acct,p.T_Receivables_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=11 AND NOT EXISTS (SELECT * FROM C_Tax_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID
 AND e.C_Tax_ID=5000102)
;



---------------------------------------





INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000107, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', 'Y', 'N', 'Y', 'N', 5000021, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000102, CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PJD)', 'Y', 'N', 'Y', 'N', 5000016, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000103, CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PNR)', 'Y', 'N', 'Y', 'N', 5000017, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000109, CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PJD)', 'Y', 'N', 'Y', 'N', 5000024, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000105, CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PNR)', 'Y', 'N', 'Y', 'N', 5000019, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000106, CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PJD)', 'Y', 'N', 'Y', 'N', 5000020, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000105, CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PNR)', 'Y', 'N', 'Y', 'N', 5000026, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000101, CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PNR)', 'Y', 'N', 'Y', 'N', 5000013, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 100, 'L', NULL, 5000008, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profesionales Mancomunados NoMercantiles PNR', 'Y', 'N', 'Y', 'N', 5000015, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Honorarios Profesionales Mancomunados NoMercantiles PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000100, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profecionales Mancomunados No Mercantiles (PJD)', 'Y', 'N', 'Y', 'N', 5000027, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Honorarios Profecionales Mancomunados NoMercantiles PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000008, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profecionales Mancomunados NoMercantiles PNR', 'Y', 'N', 'Y', 'N', 5000028, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Honorarios Profecionales Mancomunados NoMercantiles PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000109, CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PJD)', 'Y', 'N', 'Y', 'N', 5000029, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000110, CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PNR)', 'Y', 'N', 'Y', 'N', 5000030, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000104, CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PJD)', 'Y', 'N', 'Y', 'N', 5000031, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000103, CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PNR)', 'Y', 'N', 'Y', 'N', 5000032, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000102, CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PJD)', 'Y', 'N', 'Y', 'N', 5000033, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000101, CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PNR)', 'Y', 'N', 'Y', 'N', 5000034, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000108, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', 'Y', 'N', 'Y', 'N', 5000035, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 100, 'T', 5000000, 5000111, CURRENT_TIMESTAMP, 100, NULL, 'Y', 'N', 'Y', 'N', 5000000, 5000000, 0, 0, CURRENT_TIMESTAMP, 'RET.75%IVA en Ventas', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 100, 'L', NULL, 5000100, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profesionales Mancomunados No Mercantiles (PJD)', 'Y', 'N', 'Y', 'N', 5000014, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Honorarios Profesionales Mancomunados NoMercantiles PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'T', 5000000, 5000098, CURRENT_TIMESTAMP, 5000010, NULL, 'Y', 'N', 'Y', 'N', 5000003, 5000003, 0, 0, CURRENT_TIMESTAMP, 'Ret. IVA 75% en Compras', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000104, CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PJD)', 'Y', 'N', 'Y', 'N', 5000018, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000108,CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', 'Y', 'N', 'Y', 'N', 5000022, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000040, 'L', NULL, 5000110, CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PNR)', 'Y', 'N', 'Y', 'N', 5000023, 5000008, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PNR', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000106,CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PJD)', 'Y', 'N', 'Y', 'N', 5000025, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PJD', 0, 0)
;
INSERT INTO adempiere.lco_withholdingcalc(ad_client_id, updatedby, basetype, c_basetax_id, c_tax_id, created, createdby, description, isactive, iscalconinvoice, iscalconpayment, ismodifiableonpayment, lco_withholdingcalc_id, lco_withholdingtype_id, ad_org_id, thresholdmin, updated, name, thresholdmax, amountrefunded)
  VALUES(@ID_CLIENT@, 5000000, 'L', NULL, 5000107, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', 'Y', 'N', 'Y', 'N', 5000036, 5000004, 0, 0, CURRENT_TIMESTAMP, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', 0, 0)
;

------------------------------------------------------------



INSERT INTO adempiere.lco_taxpayertype(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_taxpayertype_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, NULL, 100, 'N', 5000002, 'Y', CURRENT_TIMESTAMP, 'EXONERADO')
;
INSERT INTO adempiere.lco_taxpayertype(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_taxpayertype_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, NULL, 100, 'N', 5000000, 'Y', CURRENT_TIMESTAMP, 'CONTRIBUYENTE ESPECIAL ')
;
INSERT INTO adempiere.lco_taxpayertype(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_taxpayertype_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, NULL, 100, 'Y', 5000001, 'Y', CURRENT_TIMESTAMP, 'ORDINARIO JURIDICO')
;
INSERT INTO adempiere.lco_taxpayertype(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_taxpayertype_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, NULL, 100, 'Y', 5000006, 'Y', CURRENT_TIMESTAMP, 'ORDINARIO NATURAL')
;


-------------------------------------------



INSERT INTO adempiere.lco_withholdingcategory(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_withholdingcategory_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'RETENCIONES DEL IVA DE LAS FATURAS DE VENTA', 100, 'N', 5000001, 'Y', CURRENT_TIMESTAMP, 'RETENCIONES DE IVA')
;
INSERT INTO adempiere.lco_withholdingcategory(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_withholdingcategory_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'Ret. ISLR Honorarios Profecionales Mancomunados No Mercantiles ', 100, 'N', 5000002, 'Y', CURRENT_TIMESTAMP, 'Ret. ISLR Honorarios Profecionales Mancomunados No Mercantil')
;
INSERT INTO adempiere.lco_withholdingcategory(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_withholdingcategory_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago', 100, 'N', 5000004, 'Y', CURRENT_TIMESTAMP, 'Ret ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv')
;
INSERT INTO adempiere.lco_withholdingcategory(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_withholdingcategory_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago ', 100, 'N', 5000005, 'Y', CURRENT_TIMESTAMP, 'Ret.ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.')
;
INSERT INTO adempiere.lco_withholdingcategory(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_withholdingcategory_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s', 100, 'N', 5000006, 'Y', CURRENT_TIMESTAMP, 'Ret. ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s')
;
INSERT INTO adempiere.lco_withholdingcategory(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_withholdingcategory_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete', 100, 'N', 5000007, 'Y', CURRENT_TIMESTAMP, 'Ret. ISLR Pago por Gastos Transporte Conformado por Flete')
;
INSERT INTO adempiere.lco_withholdingcategory(ad_client_id, ad_org_id, created, createdby, description, updatedby, isdefault, lco_withholdingcategory_id, isactive, updated, name)
  VALUES(@ID_CLIENT@, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines', 100, 'N', 5000009, 'Y', CURRENT_TIMESTAMP, 'Ret. ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n')
;



-------------------------------------------





INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-12-01 00:00:00.0', CURRENT_TIMESTAMP, 100, NULL, 'Y', 'N', NULL, 5000000, NULL, 5000000, 5000003, NULL, NULL, 5000010, 5000003, 0, CURRENT_TIMESTAMP, 100, 'Ret.75% en Compras', NULL, NULL, NULL)
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profesionales Mancomunados No Mercantiles (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000014, 5000002, 5000011, 5000014, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profesionales Mancomunados NoMercantiles PJD', NULL, NULL, '008')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000013, 5000004, 5000011, 5000025, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PNR', NULL, NULL, '053')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000021, 5000007, 5000011, 5000021, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', NULL, NULL, '071')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000017, 5000005, 5000011, 5000017, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PNR', NULL, NULL, '057')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0',CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000018, 5000005, 5000011, 5000018, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PJD', NULL, NULL, '059')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2011-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (JD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000024, 5000009, 5000011, 5000029, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PJD', NULL, NULL, '084')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, NULL, 'Y', 'N', NULL, 5000000, NULL, 5000000, 5000000, NULL, 5000000, 5000007, 5000000, 0, CURRENT_TIMESTAMP, 100, 'Retiene 75% de IVA en Ventas', NULL, NULL, NULL)
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000022, 5000007, 5000011, 5000022, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', NULL, NULL, '072')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0',CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000025, 5000006, 5000011, 5000030, 5000004, 0,CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PJD', NULL, NULL, '063')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000031, 5000005, 5000011, 5000036, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PJD', NULL, NULL, '059')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000019, 5000006, 5000011, 5000020, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PNR', NULL, NULL, '061')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000020, 5000006, 5000011, 5000019, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PJD', NULL, NULL, '063')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrendamientos de Bines Muebles Situados en el Pa?s  (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000026, 5000006, 5000011, 5000031, 5000004, 0,CURRENT_TIMESTAMP, 100, 'ISLR C?nones de Arrenda. de Bienes Inmu. en el Pa?s  PNR', NULL, NULL, '061')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profecionales Mancomunados No Mercantiles (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000027, 5000002, 5000011, 5000032, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profecionales Mancomunados NoMercantiles PJD', NULL, NULL, '008')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profecionales Mancomunados No Mercantiles (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000028, 5000002, 5000011, 5000033, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profecionales Mancomunados NoMercantiles PNR', NULL, NULL, '006')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2011-01-07 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000030, 5000009, 5000011, 5000035, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PNR', NULL, NULL, '083')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pago de los Administradores de Bines Inmuebles a los Arrendadores de los Bines Inmuebles situados en el pa?s  (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000032, 5000005, 5000011, 5000037, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag Admin. Bienes inmuebles a los Arren bien inmu.  PNR', NULL, NULL, '057')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000029, 5000009, 5000011, 5000034, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PJD', NULL, NULL, '084')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000033, 5000004, 5000011, 5000038, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PJD', NULL, NULL, '055')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', '2011-07-07 10:37:52.0', 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PJD)', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000016, 5000004, 5000011, 5000016, 5000008, 0, '2011-07-08 11:10:53.0', 100, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PJD', NULL, NULL, '055')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2011-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000023, 5000009, 5000011, 5000028, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PNR', NULL, NULL, '083')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, NULL, 'N', 'N', NULL, 5000001, NULL, 5000000, 5000000, NULL, 5000000, 5000000, 5000000, 0, CURRENT_TIMESTAMP, 100, 'Retiene 75% de IVA en Ventas', NULL, NULL, NULL)
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profesionales Mancomunados No Mercantiles (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000015, 5000002, 5000011, 5000013, 5000008, 0, CURRENT_TIMESTAMP, 100, 'ISLR Honorarios Profesionales Mancomunados NoMercantiles PNR', NULL, NULL, '006')
 ;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PNR)', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000034, 5000004, 5000011, 5000039, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PNR', NULL, NULL, '053')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', 'Y', 'N', NULL, 5000001, NULL, NULL, 5000035, 5000007, 5000011, 5000040, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PJD', NULL, NULL, '072')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', 'Y', 'N', NULL, 5000006, NULL, NULL, 5000036, 5000007, 5000011, 5000041, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago por Gastos Transporte Conformado por Flete PNR', NULL, NULL, '071')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos por Servicios de Publicidad y Propaganda y la Cesi?n de la Venta de Espacios para Tales Fines (PJD)', 'Y', 'N', NULL, 5000000, NULL, NULL, 5000029, 5000009, 5000011, 5000043, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pag. por Serv. de Public. y Propag.  y la cesi?n  PJD', NULL, NULL, '084')
;
INSERT INTO adempiere.lco_withholdingrule(ad_client_id, validfrom, created, createdby, description, isactive, isdefault, lco_bp_isic_id, lco_bp_taxpayertype_id, lco_org_isic_id, lco_org_taxpayertype_id, lco_withholdingcalc_id, lco_withholdingcategory_id, c_taxcategory_id, lco_withholdingrule_id, lco_withholdingtype_id, ad_org_id, updated, updatedby, name, lco_bp_city_id, lco_org_city_id, code)
  VALUES(@ID_CLIENT@, '2010-01-01 00:00:00.0', CURRENT_TIMESTAMP, 100, 'ISLR Pagos a Empresas Contratistas o SubContratistas domiciliadas o no en el pa?s, por la ejecuci?n de obras o de la prestaci?n de servicios en base a evaluaciones y ordenes de pago (PJD)', 'Y', 'N', NULL, 5000000, NULL, NULL, 5000033, 5000004, 5000011, 5000044, 5000004, 0, CURRENT_TIMESTAMP, 100, 'ISLR Pago Emp Contra, por Ejecu de Obras o Presta. Serv. PJD', NULL, NULL, '055')
;


COMMIT;

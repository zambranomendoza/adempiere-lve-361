// Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.

INSERT INTO adempiere.AD_Table(ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained)
  VALUES((select max(ad_table_id) + 1 from ad_table), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_PaymentWithHolding', 'LVE_PaymentWithHolding', 'LVE_PaymentWithHolding', 'LVE_PaymentWithHolding', 'N', '3', 'DCS', NULL, NULL, 0, 'N', 'Y', 'Y', 'N', 'Y', 'L', NULL, 'N', 'Y')

;

INSERT INTO adempiere.AD_Table_Trl(ad_table_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_table_id)  from ad_table), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'LVE_PaymentWithHolding', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 1, 'DCS', 'UpdatedBy', (select max(ad_table_id)  from ad_table), 18, 110, NULL, 22, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 608, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Updated By', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 1, 'DCS', 'CreatedBy', (select max(ad_table_id)  from ad_table), 18, 110, NULL, 22, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 246, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Created By', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 1, 'DCS', 'AD_Client_ID', (select max(ad_table_id)  from ad_table), 19, NULL, NULL, 22, '@#AD_Client_ID@', 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 102, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Client', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 1, 'DCS', 'AD_Org_ID', (select max(ad_table_id)  from ad_table), 19, NULL, 104, 22, '@#AD_Org_ID@', 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 113, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y',  CURRENT_TIMESTAMP, 100,  CURRENT_TIMESTAMP, 100, 'Organization', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 1, 'DCS', 'Created', (select max(ad_table_id)  from ad_table), 16, NULL, NULL, 7, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 245, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y',  CURRENT_TIMESTAMP, 100,  CURRENT_TIMESTAMP, 100, 'Created', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 1, 'DCS', 'IsActive', (select max(ad_table_id)  from ad_table), 20, NULL, NULL, 1, 'Y', 'N', 'N', 'Y', 'Y', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 348, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100,CURRENT_TIMESTAMP, 100, 'Active', 'N')

;

INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES((select max(AD_Element_id)+1 from AD_Element), 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_PaymentWithHolding_ID', 'DCS', 'LVE_PaymentWithHolding', 'LVE_PaymentWithHolding', NULL, NULL, NULL, NULL, NULL, NULL)

;

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES((select max(AD_Element_id) from AD_Element), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_PaymentWithHolding', 'LVE_PaymentWithHolding', NULL, NULL, NULL, NULL, NULL, NULL, 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'LVE_PaymentWithHolding', NULL, NULL, 1, 'DCS', 'LVE_PaymentWithHolding_ID', (select max(ad_table_id)  from ad_table), 13, NULL, NULL, 22, NULL, 'Y', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', (select max(AD_Element_id) from AD_Element), NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'LVE_PaymentWithHolding', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 1, 'DCS', 'Updated', (select max(ad_table_id)  from ad_table), 16, NULL, NULL, 7, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 607, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Updated', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Payment', 'Payment identifier', 'The Payment is a unique identifier of this payment.', 1, 'DCS', 'C_Payment_ID', (select max(ad_table_id)  from ad_table), 13, NULL, NULL, 22, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 1384, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Payment', 'N')

;

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES((select max(ad_column_id)+1 from ad_column), 0, 0, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 100, 100, 'Invoice Withholding', NULL, NULL, 1, 'DCS', 'LCO_InvoiceWithholding_ID', (select max(ad_table_id)  from ad_table), 13, NULL, NULL, 22, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', 0, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 1000003, NULL, 'Y', 'N', NULL, NULL, NULL, 'N', 'Y', NULL)

;

INSERT INTO adempiere.AD_Column_Trl (ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES((select max(ad_column_id) from ad_column), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Invoice Withholding', 'N')

;

CREATE TABLE adempiere.lve_paymentwithholding  ( 
    ad_client_id             	numeric(10,0) NOT NULL,
    ad_org_id                	numeric(10,0) NOT NULL,
    c_payment_id             	numeric(10,0) NOT NULL,
    created                  	timestamp NOT NULL,
    createdby                	numeric(10,0) NOT NULL,
    isactive                 	char(1) NOT NULL DEFAULT 'Y'::bpchar,
    lco_invoicewithholding_id	numeric(10,0) NOT NULL,
    lve_paymentwithholding_id	numeric(10,0) NOT NULL,
    updated                  	timestamp NOT NULL,
    updatedby                	numeric(10,0) NOT NULL,
    PRIMARY KEY(lve_paymentwithholding_id)
)
WITHOUT OIDS 
TABLESPACE pg_default

;

ALTER TABLE adempiere.lve_paymentwithholding
    ADD CONSTRAINT lve_paymentwithholding_isactive_check
	CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]))

;

/*Permisos*/

INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment')), 102, 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y')
;
INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment')), 103, 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y');


/*Traducciones*/


delete   from ad_process_para_trl where ad_process_para_id
in ( SELECT ad_process_para_id from ad_process_para where ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment')) );

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'AD_Client_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Compañía', 'Compañía para esta instalación', 'Compañía o entidad legal. No se pueden compartir datos entre diferentes compañías.', 'Y');

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'AD_Org_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment'))), 'es_VE', 0, 0, 'Y',  CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Organización', 'Entidad organizacional dentro de la compañía', 'Una organización es una unidad de la compañía o entidad legal - Ej. Tiendas y departamentos. Es posible compartir datos entre organizaciones.', 'Y');

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'C_BPartner_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Tercero', 'Identifica un Tercero', 'Un tercero es cualquiera con quien usted realiza transacciones. Este puede incluir Proveedores, Clientes, Empleados o Vendedores.', 'Y');


INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'C_Payment_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment'))), 'es_VE', 0, 0, 'Y',  CURRENT_TIMESTAMP, 100,  CURRENT_TIMESTAMP, 100, 'Pago', 'Identificador del pago', 'El pago es un identificador único de este pago.', 'Y');



/*Ubicar en el menu */

update ad_treenodemm set parent_id='236', seqno= (select max(seqno)+1 from adempiere.ad_treenodemm where parent_id='236')
  where node_id=(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deletePayment'));



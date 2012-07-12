-- Original contribution by Rafael Tomás Salazar Colmenárez - rsalazar@dcsla.com --- rtsc08@gmail.com  for Double Click Sistemas C.A.

/*Permisos*/

INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice')), 102, 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y')
;
INSERT INTO adempiere.AD_Process_Access(ad_process_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice')), 103, 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y');

/*Traducciones*/

delete   from ad_process_para_trl where ad_process_para_id
in ( SELECT ad_process_para_id from ad_process_para where ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice')) );


INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'AD_Client_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Compañía', 'Compañía para esta instalación', 'Compañía o entidad legal. No se pueden compartir datos entre diferentes compañías.', 'Y');


INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'AD_Org_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Organización', 'Entidad organizacional dentro de la compañía', 'Una organización es una unidad de la compañía o entidad legal - Ej. Tiendas y departamentos. Es posible compartir datos entre organizaciones.', 'Y');

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'C_BPartner_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Tercero', 'Identifica un Tercero', 'Un tercero es cualquiera con quien usted realiza transacciones. Este puede incluir Proveedores, Clientes, Empleados o Vendedores.', 'Y');

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'C_Invoice_ID' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Factura', 'Identificador de la factura', 'La ID de Factura identifica únicamente un documento de Factura.', 'Y');

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'Action' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Acción', 'Indica la Acción a ser ejecutada', 'El campo Acción es una lista de despliegue hacia abajo que indica la acción a ser ejecutada por esta opción de menú.', 'Y');

INSERT INTO adempiere.AD_Process_Para_Trl(ad_process_para_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES((SELECT ad_process_para_id from ad_process_para where columnname = 'Description' and ad_process_id in 
(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice'))), 'es_VE', 0, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100, 'Descripción', 'Descripción corta opcional del registro', 'Una descripción esta limitada a 255 caracteres', 'Y');


/*Ubicar en el menu*/

update ad_treenodemm set parent_id='236', seqno= (select max(seqno)+1 from adempiere.ad_treenodemm where parent_id='236')
  where node_id=(SELECT ad_process_id FROM ad_process WHERE value like ('LVE_deleteOrCancelInvoice'));
/*Creacion de tablas*/

CREATE TABLE adempiere.LVE_CInvoiceDelete  ( 
    c_invoice_id          	numeric(10,0) NOT NULL,
    ad_client_id          	numeric(10,0) NOT NULL,
    ad_org_id             	numeric(10,0) NOT NULL,
    isactive              	char(1) NOT NULL DEFAULT 'Y'::bpchar,
    created               	timestamp NOT NULL DEFAULT now(),
    createdby             	numeric(10,0) NOT NULL,
    updated               	timestamp NOT NULL DEFAULT now(),
    updatedby             	numeric(10,0) NOT NULL,
    issotrx               	char(1) NOT NULL DEFAULT 'Y'::bpchar,
    documentno            	varchar(30) NOT NULL,
    docstatus             	char(2) NOT NULL,
    docaction             	char(2) NOT NULL,
    processing            	char(1) NULL,
    processed             	char(1) NOT NULL DEFAULT 'N'::bpchar,
    posted                	char(1) NOT NULL DEFAULT 'N'::bpchar,
    c_doctype_id          	numeric(10,0) NOT NULL,
    c_doctypetarget_id    	numeric(10,0) NOT NULL,
    c_order_id            	numeric(10,0) NULL,
    description           	varchar(255) NULL,
    isapproved            	char(1) NOT NULL DEFAULT 'Y'::bpchar,
    istransferred         	char(1) NOT NULL DEFAULT 'N'::bpchar,
    isprinted             	char(1) NOT NULL DEFAULT 'N'::bpchar,
    salesrep_id           	numeric(10,0) NULL,
    dateinvoiced          	timestamp NOT NULL,
    dateprinted           	timestamp NULL,
    dateacct              	timestamp NOT NULL,
    c_bpartner_id         	numeric(10,0) NOT NULL,
    c_bpartner_location_id	numeric(10,0) NOT NULL,
    poreference           	varchar(20) NULL,
    isdiscountprinted     	char(1) NOT NULL DEFAULT 'Y'::bpchar,
    dateordered           	timestamp NULL,
    c_currency_id         	numeric(10,0) NOT NULL,
    paymentrule           	char(1) NOT NULL,
    c_paymentterm_id      	numeric(10,0) NOT NULL,
    c_charge_id           	numeric(10,0) NULL,
    chargeamt             	numeric NULL DEFAULT 0,
    totallines            	numeric NOT NULL DEFAULT 0,
    grandtotal            	numeric NOT NULL DEFAULT 0,
    m_pricelist_id        	numeric(10,0) NOT NULL,
    istaxincluded         	char(1) NOT NULL DEFAULT 'N'::bpchar,
    c_campaign_id         	numeric(10,0) NULL,
    c_project_id          	numeric(10,0) NULL,
    c_activity_id         	numeric(10,0) NULL,
    ispaid                	char(1) NOT NULL DEFAULT 'N'::bpchar,
    c_payment_id          	numeric(10,0) NULL,
    c_cashline_id         	numeric(10,0) NULL,
    createfrom            	char(1) NULL,
    generateto            	char(1) NULL,
    sendemail             	char(1) NOT NULL DEFAULT 'N'::bpchar,
    ad_user_id            	numeric(10,0) NULL,
    copyfrom              	char(1) NULL,
    isselfservice         	char(1) NOT NULL DEFAULT 'N'::bpchar,
    ad_orgtrx_id          	numeric(10,0) NULL,
    user1_id              	numeric(10,0) NULL,
    user2_id              	numeric(10,0) NULL,
    c_conversiontype_id   	numeric(10,0) NULL,
    ispayschedulevalid    	char(1) NOT NULL DEFAULT 'N'::bpchar,
    ref_invoice_id        	numeric(10,0) NULL,
    isindispute           	char(1) NOT NULL DEFAULT 'N'::bpchar,
    invoicecollectiontype 	char(1) NULL,
    m_rma_id              	numeric(10,0) NULL,
    dunninggrace          	date NULL,
    c_dunninglevel_id     	numeric(10,0) NULL,
    reversal_id           	numeric(10,0) NULL,
    processedon           	numeric NULL,
    withholdingamt        	numeric NULL,
    generatewithholding   	char(1) NULL DEFAULT NULL::bpchar,
    c_cashplanline_id     	numeric(10,0) NULL DEFAULT NULL::numeric,
    c_controlnumber       	varchar(20) NULL,
    c_invoiceaffected_id  	numeric(10,0) NULL DEFAULT NULL::numeric,
    deleted               	timestamp NULL DEFAULT now(),
    deletedby             	numeric(10,0) NULL 
    )
WITHOUT OIDS 
TABLESPACE pg_default
;

CREATE TABLE adempiere.LVE_FactAcctDelete  ( 
    fact_acct_id     	numeric(10,0) NOT NULL,
    ad_client_id     	numeric(10,0) NOT NULL,
    ad_org_id        	numeric(10,0) NOT NULL,
    isactive         	char(1) NOT NULL DEFAULT 'Y'::bpchar,
    created          	timestamp NOT NULL DEFAULT now(),
    createdby        	numeric(10,0) NOT NULL,
    updated          	timestamp NOT NULL DEFAULT now(),
    updatedby        	numeric(10,0) NOT NULL,
    c_acctschema_id  	numeric(10,0) NOT NULL,
    account_id       	numeric(10,0) NOT NULL,
    datetrx          	timestamp NOT NULL,
    dateacct         	timestamp NOT NULL,
    c_period_id      	numeric(10,0) NULL,
    ad_table_id      	numeric(10,0) NOT NULL,
    record_id        	numeric(10,0) NOT NULL,
    line_id          	numeric(10,0) NULL,
    gl_category_id   	numeric(10,0) NULL,
    gl_budget_id     	numeric(10,0) NULL,
    c_tax_id         	numeric(10,0) NULL,
    m_locator_id     	numeric(10,0) NULL,
    postingtype      	char(1) NOT NULL,
    c_currency_id    	numeric(10,0) NOT NULL,
    amtsourcedr      	numeric NOT NULL DEFAULT 0,
    amtsourcecr      	numeric NOT NULL DEFAULT 0,
    amtacctdr        	numeric NOT NULL DEFAULT 0,
    amtacctcr        	numeric NOT NULL DEFAULT 0,
    c_uom_id         	numeric(10,0) NULL,
    qty              	numeric NULL DEFAULT 0,
    m_product_id     	numeric(10,0) NULL,
    c_bpartner_id    	numeric(10,0) NULL,
    ad_orgtrx_id     	numeric(10,0) NULL,
    c_locfrom_id     	numeric(10,0) NULL,
    c_locto_id       	numeric(10,0) NULL,
    c_salesregion_id 	numeric(10,0) NULL,
    c_project_id     	numeric(10,0) NULL,
    c_campaign_id    	numeric(10,0) NULL,
    c_activity_id    	numeric(10,0) NULL,
    user1_id         	numeric(10,0) NULL,
    user2_id         	numeric(10,0) NULL,
    description      	varchar(255) NULL,
    a_asset_id       	numeric(10,0) NULL,
    c_subacct_id     	numeric(10,0) NULL,
    userelement1_id  	numeric(10,0) NULL,
    userelement2_id  	numeric(10,0) NULL,
    c_projectphase_id	numeric(10,0) NULL,
    c_projecttask_id 	numeric(10,0) NULL,
    deleted          	timestamp NULL DEFAULT now(),
    deletedby        	numeric(10,0) NULL 
    )
WITHOUT OIDS 
TABLESPACE pg_default
;





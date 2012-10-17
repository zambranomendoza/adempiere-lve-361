/*

Descripción: Consultas para crear los contratos
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
- Ejecutar los scripts

*/
BEGIN;

INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Quincenal', 0, NULL, NULL, NULL, now(), 100, NULL, 1000001, 'Y', 15, now(), 100, NULL, NULL, @ad_client_id, 'Quincenal')
;
INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Semanal', 0, NULL, NULL, NULL, now(), 100, NULL, 1000002, 'Y', 7, now(), 100, NULL, NULL, @ad_client_id, 'Semanal')
;
INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Mensual', 0, NULL, NULL, NULL,now(), 100, NULL, 1000003, 'Y', 30, now(), 100, NULL, NULL, @ad_client_id, 'Mensual')
;
INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Bono_Alimentacion', 0, NULL, NULL, NULL, now(), 100, NULL, 1000004, 'Y', 0, now(), 100, NULL, NULL, @ad_client_id, 'Bono_Alimentacion')
;
INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Prestaciones', 0, NULL, NULL, NULL, now(), 100, NULL, 1000005, 'Y', 0, now(), 100, NULL, NULL, @ad_client_id, 'Prestaciones')
;
INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Vacaciones', 0, NULL, NULL, NULL, now(), 100, NULL, 1000006, 'Y', 0, now(), 100, NULL, NULL, @ad_client_id, 'Vacaciones')
;
INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Utilidades', 0, NULL, NULL, NULL, now(), 100, NULL, 1000007, 'Y', 365, now(), 100, NULL, NULL, @ad_client_id, 'Utilidades')
;
INSERT INTO adempiere.hr_contract(name, ad_org_id, c_bpartner_id, c_campaign_id, c_project_id, created, createdby, description, hr_contract_id, isactive, netdays, updated, updatedby, validfrom, validto, ad_client_id, value) 
VALUES('Liquidación', 0, NULL, NULL, NULL, now(), 100, NULL, 1000008, 'Y', 0, now(), 100, NULL, NULL, @ad_client_id, 'Liquidacion')
;

COMMIT;

/*

Descripción: Consultas para crear las definiciones de nómina
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
- Ejecutar los scripts

*/
BEGIN;


INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina de Prestaciones', 'NOMINA_PRESTACIONES', NULL, NULL, now(), 100, NULL, 1000005, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000012, 0)
;
INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina de Bono de Alimentación', 'NOMINA_BONO_ALIMENTACION', NULL, NULL, now(), 100, NULL, 1000004, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000013, 0)
;
INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina de Utilidades', 'NOMINA_UTILIDADES', NULL, NULL, now(), 100, NULL, 1000007, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000014, 0)
;
INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina de Liquidación', 'NOMINA_LIQUIDACION', NULL, NULL, now(), 100, NULL, 1000008, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000015, 0)
;
INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina de Vacaciones', 'NOMINA_VACACIONES', NULL, NULL, now(), 100, NULL, 1000006, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000016, 0)
;
INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina Quincenal', 'NOMINA_QUINCENAL', NULL, NULL, now(), 100, NULL, 1000001, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000009, 0)
;
INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina Semanal', 'NOMINA_SEMANAL', NULL, NULL, now(), 100, NULL, 1000002, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000010, 0)
;
INSERT INTO adempiere.hr_payroll(name, value, ad_printformat_id, c_charge_id, created, createdby, description, hr_contract_id, ad_client_id, isactive, paymentrule, processed, processing, updated, updatedby, hr_payroll_id, ad_org_id)
  VALUES('Nómina Mensual', 'NOMINA_MENSUAL', NULL, NULL, now(), 100, NULL, 1000003, @ad_client_id, 'Y', 'A', 'N', 'N', now(), 100, 1000011, 0)
;

COMMIT;

/*

Descripción: Consultas para crear las categorias de conceptos
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
- Ejecutar los scripts

*/

INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Asignaciones Basicas', 0, getdate(), 101, NULL, NULL, 1000000, 'Y', 'N', getdate(), 100, @ad_client_id, 'ASG_BAS')
go
INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Deducciones Novedades Horas', 0, getdate(), 100, NULL, NULL, 1000001, 'Y', 'N', getdate(), 100, @ad_client_id, 'DED_NOV_HORAS')
go
INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Atributo No Editable', 0, getdate(), 100, NULL, NULL, 1000002, 'Y', 'N', getdate(), 100, @ad_client_id, 'ATR_NO_EDITABLE')
go
INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Asignaciones Novedades por Hora Extra Nocturna', 0, getdate(), 100, NULL, NULL, 1000003, 'Y', 'N', getdate(), 100, @ad_client_id, 'ASG_HORA_EXT_NOCTURNA')
go
INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Asignaciones Novedades Días Adicionales', 0, getdate(), 100, NULL, NULL, 1000004, 'Y', 'N', getdate(), 100, @ad_client_id, 'ASG_NOV_ADIC')
go
INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Asignaciones Novedades Diarias', 0, getdate(), 101, NULL, NULL, 1000005, 'Y', 'N', getdate(), 100, @ad_client_id, 'ASG_NOV_DIAS')
go
INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Deducciones Novedades Diarias', 0, getdate(), 101, NULL, NULL, 1000006, 'Y', 'N', getdate(), 100, @ad_client_id, 'DED_NOV_DIAS')
go
INSERT INTO adempiere.hr_concept_category(name, ad_org_id, created, createdby, description, hr_concept_acct, hr_concept_category_id, isactive, isdefault, updated, updatedby, ad_client_id, value) 
VALUES('Asignaciones Novedades por Hora Extra', 0, getdate(), 101, NULL, NULL, 1000007, 'Y', 'N', getdate(), 100, @ad_client_id, 'ASG_HORA_EXTRA')
go


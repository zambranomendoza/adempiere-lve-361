/*

Descripción: Consultas para crear reglas de validación usadas en la ventana Proceso de Nómina
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
    @AD_Org_ID por el id de la organización
- Ejecutar los scripts

*/

--Regla de validación para filtrar en el periodo por organización
INSERT INTO AD_Val_Rule (AD_Client_ID,AD_Org_ID,AD_Val_Rule_ID,Code,Created,CreatedBy,EntityType,IsActive,Name,Type,Updated,UpdatedBy) 
VALUES (@ad_client_id,@AD_Org_ID,(SELECT max(AD_Val_Rule_id)+1 FROM AD_Val_Rule),'hr_period.ad_org_id = @AD_Org_ID@ AND hr_period.hr_payroll_id = @HR_Payroll_ID@',
now(),100,'DCS','Y','LVE Period by Organization','S',now(),100)
go
--Asociar la regla 
UPDATE AD_Field SET AD_Reference_ID=18, AD_Val_Rule_ID=(SELECT max(AD_Val_Rule_ID) from ad_val_rule where name = 'LVE Period by Organization'),Updated=now(),UpdatedBy=100 
WHERE AD_Field_ID=(SELECT AD_Field_ID FROM ad_field WHERE name = 'Payroll Period' and ad_tab_id in (select ad_tab_id from ad_tab where name= 'Process'))
go
--Validación para filtrar las nóminas que posean periodos que no esten asociados a procesos abiertos de la organización seleccionada por el usuario
INSERT INTO AD_Val_Rule (AD_Client_ID,AD_Org_ID,AD_Val_Rule_ID,Code,Created,CreatedBy,EntityType,IsActive,Name,Type,Updated,UpdatedBy) 
VALUES (@ad_client_id,@AD_Org_ID,(SELECT max(AD_Val_Rule_id)+1 FROM AD_Val_Rule),'hr_payroll_id IN (select hr_payroll_id from hr_period where hr_period_id not in 
(select distinct pe.hr_period_id from hr_payroll py inner join hr_process p on py.hr_payroll_id = p.hr_payroll_id inner join hr_period pe on py.hr_payroll_id = pe.hr_payroll_id 
where p.docstatus != ''CL'' and p.isactive = ''Y'' and pe.ad_org_id = p.ad_org_id) and ad_org_id =  @AD_Org_ID@)',
now(),100,'DCS','Y','LVE Payroll With Periods','S',now(),100)
go
--Asociar la regla
UPDATE AD_Field SET AD_Reference_ID=18, AD_Val_Rule_ID=(SELECT max(AD_Val_Rule_ID) from ad_val_rule where name = 'LVE Payroll With Periods'),Updated=now(),UpdatedBy=100 
WHERE AD_Field_ID=(SELECT AD_Field_ID FROM ad_field WHERE name = 'Payroll' and ad_tab_id in (select ad_tab_id from ad_tab where name= 'Process'))
go


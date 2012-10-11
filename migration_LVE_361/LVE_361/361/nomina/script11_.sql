/*

Descripción: Consultas varias
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Ejecutar los scripts

*/

-- Actualizar los nombres de los callouts
UPDATE AD_Column SET Callout='org.doubleclick.callout.LVE_EmployeesPayrollProcess.add_employees',Updated=now(),UpdatedBy=100 
WHERE name = 'ActionBoton' and  ad_table_id = (select ad_table_id from ad_table where tablename = 'HR_Process_Employee_Filters')
go
UPDATE AD_Column SET Callout='org.doubleclick.callout.LVE_Customization.generationAttribute',Updated=now(),UpdatedBy=100 
where name = 'AcctionButton' and  ad_table_id = (select ad_table_id from ad_table where tablename = 'HR_Employee')
go
UPDATE AD_Column SET Callout='org.doubleclick.callout.LVE_GenerationQuotas.generationQuotas',Updated=now(),UpdatedBy=100 
where name = 'AcctionButton' and  ad_table_id = (select ad_table_id from ad_table where tablename = 'LVE_Loan_Employee')
go
-- Colocar como identificador el concepto de nómina
UPDATE AD_Column SET IsIdentifier='Y', IsUpdateable='N',Updated=now(),UpdatedBy=100 
WHERE AD_Column_ID=(select ad_column_id from ad_column where name = 'Payroll Concept' 
and ad_table_id = (select ad_table_id from ad_table where tablename = 'HR_Attribute'))
go
-- Colocar la organizacion por defecto por empleado
UPDATE AD_Field SET AD_Val_Rule_ID=202, IsReadOnly='Y', AD_Reference_ID=18, DefaultValue='@AD_Org_ID@',Updated=now(),UpdatedBy=100 
WHERE AD_Field_ID=(select ad_field_id from ad_field WHERE name = 'Organization' and ad_tab_id in 
(select ad_tab_id from ad_tab where ad_window_id in (select ad_window_id from ad_window where name = 'Payroll Employee') and name = 'Employee')) 
go
-- Colocar el campo "Es empleado" por defecto en yes
UPDATE AD_Field SET DefaultValue='Y',Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select ad_field_id from ad_field WHERE name = 'Employee' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Business Partner' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Employee')))
go
-- Quitar el value del concepto como identificador
UPDATE AD_Column SET IsIdentifier='N',Updated=now(),UpdatedBy=100 WHERE AD_Column_ID=
(select ad_column_id from ad_column where name = 'Search Key' and ad_table_id = (select ad_table_id from ad_table where tablename = 'HR_Concept'))
go
-- Actualización de atributos no editables
UPDATE hr_concept SET HR_Concept_Category_ID=(select HR_Concept_Category_id from HR_Concept_Category where name = 'Atributo No Editable'),
Updated=now(),UpdatedBy=100 WHERE value in ('A_NOV_HORAS_EXTRAS_NOCTURNAS', 'A_NOV_HORAS_EXTRAS_DIURNAS', 'A_MONTO_ACUM_PRESTACIONES_SOCIALES', 'A_FECHA_FIN_ULTIMA_VACACIONES_DISF', 'A_FECHA_ULTIMO_BONO_POST_VACACIONAL_PAG', 'A_TOT_MONTO_DISPONIBLE_PRESTACIONES', 'A_MONTO_ACUM_INTERESES_PRESTACIONES', 'A_MONTO_ACUM_ANTICIPO_PREST_SOCIALES', 'A_MONTO_ACUM_ANTICIPO_UTILIDADES', 'A_ACUM_DIAS_ADIC_VACACIONES_CAUSADAS', 'A_ACUM_DIAS_VACACIONES_DISFRUTADOS', 'A_ACUM_DIAS_VACACIONES_INASIST_INJUST', 'A_FECHA_ULTIMO_CALC_INTERESES_PRESTACION', 'A_ACUM_DIAS_BONO_VACACIONAL_PAGADOS', 'A_ACUM_DIAS_ADICIONALES_PRESTACIONES', 'A_MONTO_ACUM_CANCELADO_REPOSO_IVSS', 'A_ACUM_DIAS_PAGAR_REPOSO_IVSS', 'A_ACUM_DIAS_PRESTACIONES_SOCIALES', 'A_ACUM_DIAS_VACACIONES_CAUSADAS', 'A_ACUM_DIAS_BONOS_VACACIONAL_CAUSADO', 'A_MONTO_ACUM_INTERESES_CANCELADOS', '_MONTO_ACUM_FONDO_AHORRO', 'A_TOT_MONTO_DISPONIBLE_INTERESES_PREST', 'A_TOT_DIAS_DISPONIBLES_VACACIONES', 'A_TOT_MONTO_DISPONIBLE_FONDO_AHORRO', 'A_TOT_DIAS_SIN_CANCELAR_BONO_VACACIONAL', 'A_ACUM_DIAS_ADIC_VACA_PAG_SIN_DISFRUT', 'A_FECHA_CORTE_ANUAL_VACACIONES', 'A_FECHA_ULTIMA_NOMINA_UTILIDADES', 'A_FECHA_FIN_ULTIMO_MES_PROC', 'A_FECHA_INICIO_ULTIMO_MES_PROCESADO', 'A_FECHA_MES_ANTERIOR_PRESTACIONES', 'A_ESTATUS_EMPLEADO')
go
-- Quitar el solo lectura en el año en periodo de definicion de nomina
UPDATE AD_Field SET IsReadOnly='N',Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select ad_field_id from ad_field where ad_field_id =
(select ad_field_id from ad_field WHERE name = 'Organization' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Year' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Definition'))))
go
-- Agregar validación para filtrar periodos por organización
INSERT INTO AD_Val_Rule (AD_Client_ID,AD_Org_ID,AD_Val_Rule_ID,Code,Created,CreatedBy,EntityType,IsActive,Name,Type,Updated,UpdatedBy) 
VALUES (0,0,(SELECT max(AD_Val_Rule_id)+1 FROM AD_Val_Rule),'hr_period.ad_org_id = @AD_Org_ID@ AND hr_period.hr_payroll_id = @HR_Payroll_ID@',
now(),100,'DCS','Y','LVE Period by Organization','S',now(),100)
go
-- Asociar validación de periodos por organización en la ventana de proceso de nómina
UPDATE AD_Field SET AD_Reference_ID=18, AD_Val_Rule_ID=(SELECT AD_Val_Rule_ID from ad_val_rule where name = 'LVE Period by Organization'),Updated=now(),UpdatedBy=100 
WHERE AD_Field_ID=(SELECT AD_Field_ID FROM ad_field WHERE name = 'Payroll Period' and ad_tab_id in (select ad_tab_id from ad_tab where name= 'Process'))
go
-- Agregar validación para filtrar por nóminas que posean periodos que no esten asociados a procesos abiertos de la organización seleccionada por el usuario
INSERT INTO AD_Val_Rule (AD_Client_ID,AD_Org_ID,AD_Val_Rule_ID,Code,Created,CreatedBy,EntityType,IsActive,Name,Type,Updated,UpdatedBy) 
VALUES (0,0,(SELECT max(AD_Val_Rule_id)+1 FROM AD_Val_Rule),'hr_payroll_id IN (select hr_payroll_id from hr_period where hr_period_id not in (select distinct pe.hr_period_id from hr_payroll py inner join hr_process p on py.hr_payroll_id = p.hr_payroll_id inner join hr_period pe on py.hr_payroll_id = pe.hr_payroll_id where p.docstatus != ''CL'' and p.isactive = ''Y'' and pe.ad_org_id = p.ad_org_id) and ad_org_id =  @AD_Org_ID@)',
now(),100,'DCS','Y','LVE Payroll With Periods','S',now(),100)
go
-- Asociar validación LVE Payroll With Periods
UPDATE AD_Field SET AD_Reference_ID=18, AD_Val_Rule_ID=(SELECT AD_Val_Rule_ID from ad_val_rule where name = 'LVE Payroll With Periods'),Updated=now(),UpdatedBy=100 
WHERE AD_Field_ID=(SELECT AD_Field_ID FROM ad_field WHERE name = 'Payroll' and ad_tab_id in (select ad_tab_id from ad_tab where name= 'Process'))
go
-- Colacar la organización del proceso por defecto en la ventana de filtros de búsqueda de empleados
UPDATE AD_Field SET DefaultValue='@AD_Org_ID',Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select ad_field_id from ad_field where ad_field_id =
(select ad_field_id from ad_field WHERE name = 'Organization' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Process Employee Filters' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Process'))))
go
--Obligatorio en contacto la fecha de cumpleaños
UPDATE AD_Field SET IsMandatory='Y',Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select ad_field_id from ad_field where ad_field_id =
(select ad_field_id from ad_field WHERE name = 'Birthday' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Contact (User)' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Employee'))))
go
--Traducción de tipo de contrato
UPDATE AD_Ref_List_Trl SET IsTranslated='Y', Name='Temporal',Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND AD_Ref_List_ID=
(select ad_ref_list_id  from ad_ref_list where name = 'Temporary' and value = 'T' order by ad_ref_list_id desc limit 1 offset 0)  
GO
UPDATE AD_Ref_List_Trl SET IsTranslated='Y', Name='Fijo',Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND AD_Ref_List_ID=
(select ad_ref_list_id  from ad_ref_list where name = 'Fixed' and value = 'F' order by ad_ref_list_id desc limit 1 offset 0)  
GO
--Traducir el botón de Generar Cuotas
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select ad_field_id from ad_field where ad_field_id =
(select ad_field_id from ad_field WHERE name = 'AcctionButton' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Loan_Employee' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Employee'))))
GO
UPDATE AD_Field_Trl SET Name='Generar Cuotas',Description=NULL,Help=NULL,Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND AD_Field_ID=
(select ad_field_id from ad_field where ad_field_id =
(select ad_field_id from ad_field WHERE name = 'AcctionButton' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Loan_Employee' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Employee'))))
GO
--Traducción en Grupo Familiar
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select ad_field_id from ad_field where ad_field_id =
(select ad_field_id from ad_field WHERE name = 'Family Dependent' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Family Group' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Employee'))))
GO
UPDATE AD_Field_Trl SET Name='Parentesco Familiar',Description=NULL,Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND AD_Field_ID=
(select ad_field_id from ad_field where ad_field_id =
(select ad_field_id from ad_field WHERE name = 'Family Dependent' and ad_tab_id in 
(select ad_tab_id from ad_tab where name = 'Family Group' and ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Employee'))))
GO 
--Asociar la referencia de Lista de Préstamos en la ventana asociada
UPDATE AD_Column 
SET AD_Reference_Value_ID=(select ad_reference_id from ad_reference where name = 'HR_Loan_Type' and entitytype='DCS'),Updated=now(),UpdatedBy=100 
WHERE AD_Column_ID=(select ad_column_id from ad_column where name = 'Name' 
and ad_table_id = (select ad_table_id from ad_table where tablename = 'LVE_Loan_Employee'))
go

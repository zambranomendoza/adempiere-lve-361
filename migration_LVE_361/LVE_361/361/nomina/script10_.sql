/*
Descripción: Consultas varias
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Ejecutar los scripts
*/

BEGIN; 


-- Valor por defecto en tipo de contribuyente: Ordinario Natural
UPDATE AD_Field SET DefaultValue='5000006',Updated=now(),UpdatedBy=100 
WHERE AD_Field_ID=(select ad_field_id from ad_field where name = 'Tax Payer Type' 
and ad_tab_id = (select ad_tab_id from ad_tab where name = 'Business Partner' and  
ad_window_id = (select ad_window_id from ad_window where name = 'Payroll Employee')))
;
-- Filtrar en beneficio social para que se seleccionen solo los terceros que sean empleados
UPDATE AD_Column SET AD_Val_Rule_ID=(select ad_val_rule_id from ad_val_rule where name = 'HRPayroll Only Employee')
WHERE AD_Column_ID=(select ad_column_id from ad_column where name = 'Partner Parent' and 
ad_table_id = (select ad_table_id from ad_table where tablename = 'HR_SOCIAL_BENEFIT_D'))
;
-- Visualizar las reglas desde el rol de administrador
UPDATE AD_Table SET AccessLevel='6',Updated=now(),UpdatedBy=100 WHERE AD_Table_ID=(select ad_table_id from ad_table where tablename='AD_Rule')
;
-- Traducción sexo masculino
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Masculino',Description=NULL,Updated=now(),UpdatedBy=100 
WHERE AD_Ref_List_ID=(select ad_ref_list_id  from ad_ref_list where name = 'Male' order by ad_ref_list_id desc limit 1 offset 0) AND AD_Language='es_VE'
;
-- Traducción sexo femenino
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Femenino',Description=NULL,Updated=now(),UpdatedBy=100 
WHERE AD_Ref_List_ID=(select ad_ref_list_id  from ad_ref_list where name = 'Female' order by ad_ref_list_id desc limit 1 offset 0) AND AD_Language='es_VE'
;

COMMIT;

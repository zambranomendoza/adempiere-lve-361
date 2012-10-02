/*
Descripción: Consultas para la configuración de los valores por defecto de los campos requeridos 
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Actualizar los valores por defecto que apliquen a todos los empleados y las fechas dependerán al inicio de operaciones de nómina con el sistema
- Ejecutar los scripts
*/

UPDATE HR_Attribute SET TextMsg='D',Updated=now(),UpdatedBy=100         
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_JORNADA_LABORAL'))
GO
UPDATE HR_Attribute SET TextMsg='N',Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_SUELDO_VARIABLE'))
GO
UPDATE HR_Attribute SET TextMsg='S',Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_RETENER_SSO_RP'))  
GO
UPDATE HR_Attribute SET TextMsg='S',Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_RETENER_LRPVH')) 
GO
UPDATE HR_Attribute SET Qty=1.000000000000,Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_PAGAR_100%_REPOSO'))
GO
UPDATE HR_Attribute SET TextMsg='S',Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_PAGAR_BONO_ALIMENTACION')) 
GO
UPDATE HR_Attribute SET TextMsg='S',Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_APLICA_BONO_ALIMENTACION_MEDIO_TURNO')) 
GO
UPDATE HR_Attribute SET TextMsg='S',Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_PAGAR_BONO_ALIMENTACION_POR_DIA'))
GO
UPDATE HR_Attribute SET ServiceDate=TO_TIMESTAMP('2012-08-31','YYYY-MM-DD'),Updated=now(),UpdatedBy=100 
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_FECHA_FIN_ULTIMA_VACACIONES_DISF')) 
GO
UPDATE HR_Attribute SET ServiceDate=TO_TIMESTAMP('2012-08-31','YYYY-MM-DD'),Updated=now(),UpdatedBy=100 
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_FECHA_ULTIMO_CALC_INTERESES_PRESTACION')) 
GO
UPDATE HR_Attribute SET ServiceDate=TO_TIMESTAMP('2012-08-31','YYYY-MM-DD'),Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_FECHA_CORTE_ANUAL_VACACIONES')) 
GO
UPDATE HR_Attribute SET ServiceDate=TO_TIMESTAMP('2011-12-31','YYYY-MM-DD'),Updated=now(),UpdatedBy=100 
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_FECHA_ULTIMA_NOMINA_UTILIDADES'))
GO
UPDATE HR_Attribute SET ServiceDate=TO_TIMESTAMP('2012-08-31','YYYY-MM-DD'),Updated=now(),UpdatedBy=100 
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_FECHA_FIN_ULTIMO_MES_PROC'))
GO
UPDATE HR_Attribute SET ServiceDate=TO_TIMESTAMP('2012-08-01','YYYY-MM-DD'),Updated=now(),UpdatedBy=100 
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_FECHA_INICIO_ULTIMO_MES_PROCESADO'))
GO
UPDATE HR_Attribute SET ServiceDate=TO_TIMESTAMP('2012-08-31','YYYY-MM-DD'),Updated=now(),UpdatedBy=100
WHERE HR_Attribute_ID IN (SELECT hr_attribute_id FROM hr_attribute WHERE hr_concept_id = (select hr_concept_id from hr_concept where value = 'A_FECHA_MES_ANTERIOR_PRESTACIONES'))
GO








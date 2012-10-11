/*

Descripción: Consultas para crear los conceptos asociados a la definición de nómina
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
- Ejecutar los scripts

*/
BEGIN;

INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_MATRIMONIO', 0, NULL, '2011-01-28 11:42:28.0', 100, 1000349, 1001360, 1000010, 'Y', 'Y', 'N', 'N', 280, '2011-03-29 10:29:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIAS_ADIC_PRESTACION', 0, NULL, '2011-03-24 16:29:43.0', 100, 1000325, 1001528, 1000012, 'Y', 'Y', 'N', 'N', 20, '2011-03-28 16:14:39.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RETROACTIVO_SUELDO', 0, NULL, '2011-01-28 09:33:24.0', 100, 1000453, 1001284, 1000009, 'Y', 'Y', 'N', 'N', 320, '2011-03-29 10:09:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_SUELDO', 0, NULL, '2011-01-28 10:03:51.0', 100, 1000358, 1001297, 1000009, 'Y', 'Y', 'N', 'N', 450, '2011-03-29 10:09:35.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_HORA', 0, NULL, '2011-01-28 10:59:17.0', 100, 1000013, 1001312, 1000009, 'Y', 'Y', 'N', 'N', 600, '2011-03-29 10:10:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_VEHICULO_MOTO', 0, NULL, '2011-01-28 11:42:42.0', 100, 1000354, 1001361, 1000010, 'Y', 'Y', 'N', 'N', 290, '2011-03-29 10:29:16.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_PARA_PRESTACIONES', 0, NULL, '2011-03-24 16:29:32.0', 100, 1000321, 1001526, 1000012, 'Y', 'Y', 'N', 'N', 10, '2011-03-24 16:29:32.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_APLICAR_PERIODO', 0, NULL, '2011-01-28 11:00:59.0', 100, 1000004, 1001313, 1000009, 'Y', 'Y', 'N', 'N', 610, '2011-03-29 10:10:12.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_TR', 0, NULL, '2011-01-28 11:06:12.0', 100, 1000140, 1001318, 1000009, 'Y', 'Y', 'N', 'N', 660, '2011-03-29 10:10:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_TR', 0, NULL, '2011-01-28 11:06:36.0', 100, 1000141, 1001319, 1000009, 'Y', 'Y', 'N', 'N', 670, '2011-03-29 10:10:21.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_PA', 0, NULL, '2011-01-28 11:08:49.0', 100, 1000272, 1001322, 1000009, 'Y', 'Y', 'N', 'N', 700, '2011-03-29 10:10:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DESCANSO', 0, NULL, '2011-01-28 11:23:30.0', 100, 1000131, 1001336, 1000010, 'Y', 'Y', 'N', 'N', 30, '2011-03-29 10:28:41.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FERIADO_LEGAL', 0, NULL, '2011-01-28 11:23:45.0', 100, 1000322, 1001337, 1000010, 'Y', 'Y', 'N', 'N', 40, '2011-03-29 10:28:43.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_SUSPENSION', 0, NULL, '2011-01-28 11:32:19.0', 100, 1000382, 1001343, 1000010, 'Y', 'Y', 'N', 'N', 110, '2011-03-29 10:28:52.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RECARGO_DESCANSO_TRABAJADO', 0, NULL, '2011-01-28 11:32:45.0', 100, 1000117, 1001344, 1000010, 'Y', 'Y', 'N', 'N', 120, '2011-03-29 10:28:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RECARGO_FERIADO_TRABAJADO', 0, NULL, '2011-01-28 11:32:48.0', 100, 1000120, 1001345, 1000010, 'Y', 'Y', 'N', 'N', 130, '2011-03-29 10:28:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_DIURNO', 0, NULL, '2011-01-28 11:33:03.0', 100, 1000045, 1001346, 1000010, 'Y', 'Y', 'N', 'N', 140, '2011-03-29 10:28:55.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_NOCTURNO', 0, NULL, '2011-01-28 11:33:25.0', 100, 1000046, 1001347, 1000010, 'Y', 'Y', 'N', 'N', 150, '2011-03-29 10:28:57.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_FER_DIURNO', 0, NULL, '2011-01-28 11:34:28.0', 100, 1000047, 1001348, 1000010, 'Y', 'Y', 'N', 'N', 160, '2011-03-29 10:28:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_FER_NOCTUR', 0, NULL, '2011-01-28 11:34:44.0', 100, 1000048, 1001349, 1000010, 'Y', 'Y', 'N', 'N', 170, '2011-03-29 10:29:00.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_HORAS_EXTRAS_DIURNAS', 0, NULL, '2011-01-28 11:36:35.0', 100, 1000027, 1001350, 1000010, 'Y', 'Y', 'N', 'N', 180, '2011-03-29 10:29:02.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_HORAS_EXTRAS_NOCTURNAS', 0, NULL, '2011-01-28 11:36:48.0', 100, 1000028, 1001351, 1000010, 'Y', 'Y', 'N', 'N', 190, '2011-03-29 10:29:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_CARACTER_SALARIAL', 0, NULL, '2011-01-28 11:39:18.0', 100, 1000331, 1001352, 1000010, 'Y', 'Y', 'N', 'N', 200, '2011-03-29 10:29:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_ASISTENCIA_PUNTUAL', 0, NULL, '2011-01-28 11:40:46.0', 100, 1000340, 1001355, 1000010, 'Y', 'Y', 'N', 'N', 230, '2011-03-29 10:29:09.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_CUMPLEAÑOS', 0, NULL, '2011-01-28 11:41:29.0', 100, 1000342, 1001356, 1000010, 'Y', 'Y', 'N', 'N', 240, '2011-03-29 10:29:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_AÑOS_EMPRESA', 0, NULL, '2011-01-28 11:41:40.0', 100, 1000344, 1001357, 1000010, 'Y', 'Y', 'N', 'N', 250, '2011-03-29 10:29:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_POR_GRADUACION', 0, NULL, '2011-01-28 11:42:01.0', 100, 1000345, 1001358, 1000010, 'Y', 'Y', 'N', 'N', 260, '2011-03-29 10:29:12.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_POST_VACACIONAL', 0, NULL, '2011-01-28 11:42:16.0', 100, 1000348, 1001359, 1000010, 'Y', 'Y', 'N', 'N', 270, '2011-03-29 10:29:14.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DESCANSO', 0, NULL, '2011-05-12 15:10:03.0', 100, 1000131, 1001727, 1000011, 'Y', 'Y', 'N', 'N', 20, '2011-05-12 15:10:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FERIADO_LEGAL', 0, NULL, '2011-05-12 15:10:16.0', 100, 1000322, 1001728, 1000011, 'Y', 'Y', 'N', 'N', 30, '2011-05-12 15:10:16.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PORCION_DIARIA_UTIL_PRESTACI', 0, NULL, '2011-03-24 16:29:48.0', 100, 1000339, 1001529, 1000012, 'Y', 'Y', 'N', 'N', 30, '2011-03-28 16:14:43.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PORCION_DIARIA_BONO_VAC_PRES', 0, NULL, '2011-03-24 16:29:53.0', 100, 1000341, 1001531, 1000012, 'Y', 'Y', 'N', 'N', 40, '2011-03-28 16:14:49.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_NOCTURNO', 0, NULL, '2011-05-12 15:10:29.0', 100, 1000417, 1001729, 1000011, 'Y', 'Y', 'N', 'N', 40, '2011-05-12 15:10:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DEVENGADO_ANUAL_ADIC_PRESTA', 0, NULL, '2011-03-24 16:30:02.0', 100, 1000324, 1001534, 1000012, 'Y', 'Y', 'N', 'N', 60, '2011-03-28 16:14:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SALARIO_DIARIO_INTEGRAL', 0, NULL, '2011-03-24 16:30:07.0', 100, 1000350, 1001535, 1000012, 'Y', 'Y', 'N', 'N', 70, '2011-03-28 16:14:57.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUEL_PROM_ANUAL_DIA_ADIC_PRE', 0, NULL, '2011-03-24 16:31:34.0', 100, 1000359, 1001540, 1000012, 'Y', 'Y', 'N', 'N', 80, '2011-03-28 16:14:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO', 0, NULL, '2011-01-28 10:59:01.0', 100, 1000003, 1001311, 1000009, 'Y', 'Y', 'N', 'N', 590, '2011-03-29 10:10:06.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO_VARIABLE', 0, NULL, '2011-01-28 11:03:21.0', 100, 1000323, 1001317, 1000009, 'Y', 'Y', 'N', 'N', 650, '2011-03-29 10:10:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_PRODUCCION', 0, NULL, '2011-01-28 11:43:08.0', 100, 1000356, 1001362, 1000010, 'Y', 'Y', 'N', 'N', 300, '2011-03-29 10:29:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RETROACTIVO_SUELDO', 0, NULL, '2011-01-28 11:44:18.0', 100, 1000453, 1001363, 1000010, 'Y', 'Y', 'N', 'N', 310, '2011-03-29 10:29:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_ESTUDIO', 0, NULL, '2011-01-28 11:51:27.0', 100, 1000406, 1001372, 1000010, 'Y', 'Y', 'N', 'N', 420, '2011-03-29 10:29:37.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BASE_INTERES_PRESTA_SOCIALES', 0, NULL, '2011-03-24 16:29:57.0', 100, 1000346, 1001532, 1000012, 'Y', 'Y', 'N', 'N', 240, '2011-04-16 11:49:37.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INTERESES_PREST_SOC_MENSUAL', 0, NULL, '2011-05-12 15:10:40.0', 100, 1000441, 1001730, 1000011, 'Y', 'Y', 'N', 'N', 50, '2011-05-12 15:10:40.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_EMPRESA', 0, NULL, '2011-05-12 15:11:11.0', 100, 1000447, 1001731, 1000011, 'Y', 'Y', 'N', 'N', 60, '2011-05-12 15:11:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_IVSS', 0, NULL, '2011-05-12 15:11:22.0', 100, 1000446, 1001732, 1000011, 'Y', 'Y', 'N', 'N', 70, '2011-05-12 15:11:22.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_EMPRESA_DED', 0, NULL, '2011-05-12 15:15:05.0', 100, 1000475, 1001735, 1000011, 'Y', 'Y', 'N', 'N', 80, '2011-05-12 15:15:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_INASISTENCIA', 0, NULL, '2011-05-12 15:15:17.0', 100, 1000380, 1001736, 1000011, 'Y', 'Y', 'N', 'N', 90, '2011-05-12 15:15:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_DIURNO', 0, NULL, '2011-05-12 15:33:45.0', 100, 1000045, 1001740, 1000011, 'Y', 'Y', 'N', 'N', 130, '2011-05-12 15:33:45.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_NOCTURNO', 0, NULL, '2011-05-12 15:33:56.0', 100, 1000046, 1001741, 1000011, 'Y', 'Y', 'N', 'N', 140, '2011-05-12 15:33:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_FER_DIURNO', 0, NULL, '2011-05-12 15:34:36.0', 100, 1000047, 1001742, 1000011, 'Y', 'Y', 'N', 'N', 150, '2011-05-12 15:34:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_FER_NOCTUR', 0, NULL, '2011-05-12 15:34:48.0', 100, 1000048, 1001743, 1000011, 'Y', 'Y', 'N', 'N', 160, '2011-05-12 15:34:48.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_HORAS_EXTRAS_DIURNAS', 0, NULL, '2011-05-12 15:35:16.0', 100, 1000027, 1001744, 1000011, 'Y', 'Y', 'N', 'N', 170, '2011-05-12 15:35:16.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_HORAS_EXTRAS_NOCTURNAS', 0, NULL, '2011-05-12 15:35:27.0', 100, 1000028, 1001745, 1000011, 'Y', 'Y', 'N', 'N', 180, '2011-05-12 15:35:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_ESTUDIO', 0, NULL, '2011-05-12 15:36:10.0', 100, 1000466, 1001746, 1000011, 'Y', 'Y', 'N', 'N', 190, '2011-05-12 15:36:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_COMPRA_VIVIENDA', 0, NULL, '2011-05-12 15:36:25.0', 100, 1000467, 1001747, 1000011, 'Y', 'Y', 'N', 'N', 200, '2011-05-12 15:36:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_PERSONALES', 0, NULL, '2011-05-12 15:36:44.0', 100, 1000468, 1001748, 1000011, 'Y', 'Y', 'N', 'N', 210, '2011-05-12 15:36:44.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_REMODELACION_VIVIEN', 0, NULL, '2011-05-12 15:37:00.0', 100, 1000469, 1001749, 1000011, 'Y', 'Y', 'N', 'N', 220, '2011-05-12 15:37:00.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_POST_VACACIONAL', 0, NULL, '2011-05-12 15:40:31.0', 100, 1000348, 1001759, 1000011, 'Y', 'Y', 'N', 'N', 320, '2011-05-12 15:40:31.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_MATRIMONIO', 0, NULL, '2011-05-12 15:40:44.0', 100, 1000349, 1001760, 1000011, 'Y', 'Y', 'N', 'N', 330, '2011-05-12 15:40:44.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_VEHICULO_MOTO', 0, NULL, '2011-05-12 15:40:55.0', 100, 1000354, 1001761, 1000011, 'Y', 'Y', 'N', 'N', 340, '2011-05-12 15:40:55.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_PRODUCCION', 0, NULL, '2011-05-12 15:41:04.0', 100, 1000356, 1001762, 1000011, 'Y', 'Y', 'N', 'N', 350, '2011-05-12 15:41:04.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RETROACTIVO_SUELDO', 0, NULL, '2011-05-12 15:41:18.0', 100, 1000453, 1001763, 1000011, 'Y', 'Y', 'N', 'N', 360, '2011-05-12 15:41:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_COMPRA_VIVIEN', 0, NULL, '2011-05-12 15:44:24.0', 100, 1000407, 1001771, 1000011, 'Y', 'Y', 'N', 'N', 440, '2011-05-12 15:44:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_PERSONALES', 0, NULL, '2011-05-12 15:44:32.0', 100, 1000408, 1001772, 1000011, 'Y', 'Y', 'N', 'N', 450, '2011-05-12 15:44:32.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_REMOD_VIVIEND', 0, NULL, '2011-05-12 15:44:44.0', 100, 1000409, 1001773, 1000011, 'Y', 'Y', 'N', 'N', 460, '2011-05-12 15:44:44.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_OTROS', 0, NULL, '2011-05-12 15:44:56.0', 100, 1000410, 1001774, 1000011, 'Y', 'Y', 'N', 'N', 470, '2011-05-12 15:44:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_UNIFORMES', 0, NULL, '2011-05-12 15:47:03.0', 100, 1000386, 1001778, 1000011, 'Y', 'Y', 'N', 'N', 510, '2011-05-12 15:47:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_SINDICAL', 0, NULL, '2011-05-12 15:47:20.0', 100, 1000415, 1001779, 1000011, 'Y', 'Y', 'N', 'N', 520, '2011-05-12 15:47:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_HCM', 0, NULL, '2011-05-12 15:48:03.0', 100, 1000387, 1001780, 1000011, 'Y', 'Y', 'N', 'N', 530, '2011-05-12 15:48:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_HCM_FAMILIARES', 0, NULL, '2011-05-12 15:48:18.0', 100, 1000388, 1001781, 1000011, 'Y', 'Y', 'N', 'N', 540, '2011-05-12 15:48:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_ESTUDIO', 0, NULL, '2011-02-17 15:27:39.0', 100, 1000466, 1001494, 1000009, 'Y', 'Y', 'N', 'N', 810, '2011-03-29 10:10:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_SUSPENSION', 0, NULL, '2011-05-12 15:32:32.0', 100, 1000382, 1001737, 1000011, 'Y', 'Y', 'N', 'N', 100, '2011-05-12 15:32:32.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RECARGO_DESCANSO_TRABAJADO', 0, NULL, '2011-05-12 15:32:48.0', 100, 1000117, 1001738, 1000011, 'Y', 'Y', 'N', 'N', 110, '2011-05-12 15:32:48.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RECARGO_FERIADO_TRABAJADO', 0, NULL, '2011-05-12 15:33:11.0', 100, 1000120, 1001739, 1000011, 'Y', 'Y', 'N', 'N', 120, '2011-05-12 15:33:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_OTROS', 0, NULL, '2011-02-17 11:07:44.0', 100, 1000410, 1001493, 1000009, 'Y', 'Y', 'N', 'N', 410, '2011-03-29 10:09:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_OTROS', 0, NULL, '2011-05-12 15:37:23.0', 100, 1000470, 1001750, 1000011, 'Y', 'Y', 'N', 'N', 230, '2011-05-12 15:37:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_PRESTACIONES_SOC_MES', 0, NULL, '2011-03-24 16:28:54.0', 100, 1000398, 1001521, 1000012, 'Y', 'Y', 'N', 'N', 90, '2011-03-28 16:15:00.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_PRES_SOC_DIAS_ADIC', 0, NULL, '2011-03-24 16:29:08.0', 100, 1000399, 1001523, 1000012, 'Y', 'Y', 'N', 'N', 100, '2011-03-28 16:15:02.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_INTERESES_PRESTACIONES', 0, NULL, '2011-03-24 16:29:22.0', 100, 1000400, 1001525, 1000012, 'Y', 'Y', 'N', 'N', 110, '2011-03-28 16:15:06.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_DIAS_PRESTACIONES_CAU', 0, NULL, '2011-03-28 11:51:45.0', 100, 1000431, 1001541, 1000012, 'Y', 'Y', 'N', 'N', 160, '2011-03-28 16:15:21.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_CARACTER_SALARIAL', 0, NULL, '2011-05-12 15:37:51.0', 100, 1000331, 1001751, 1000011, 'Y', 'Y', 'N', 'N', 240, '2011-05-12 15:37:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ACUM_PREST_SOC_INTERE', 0, NULL, '2011-03-29 09:15:58.0', 100, 1000427, 1001543, 1000012, 'Y', 'Y', 'N', 'N', 180, '2011-03-29 09:18:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_MONT_DISP_PREST_CIERRE_P', 0, NULL, '2011-03-29 09:21:34.0', 100, 1000438, 1001544, 1000012, 'Y', 'Y', 'N', 'N', 190, '2011-03-29 09:21:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_MONT_DISPONI_INTERES_PRE', 0, NULL, '2011-03-29 09:22:15.0', 100, 1000437, 1001545, 1000012, 'Y', 'Y', 'N', 'N', 200, '2011-03-29 09:22:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FEC_INTER_PREST_MENSU', 0, NULL, '2011-03-29 09:23:01.0', 100, 1000433, 1001546, 1000012, 'Y', 'Y', 'N', 'N', 210, '2011-03-29 09:23:01.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_SIN_C_SALARIAL', 0, NULL, '2011-05-12 15:38:07.0', 100, 1000332, 1001752, 1000011, 'Y', 'Y', 'N', 'N', 250, '2011-05-12 15:38:07.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_ASISTENCIA_PUNTUAL', 0, NULL, '2011-05-12 15:38:45.0', 100, 1000340, 1001753, 1000011, 'Y', 'Y', 'N', 'N', 260, '2011-05-12 15:38:45.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DEDUCCION_REPOSO', 0, NULL, '2011-02-14 11:31:45.0', 100, 1000464, 1001487, 1000009, 'Y', 'Y', 'N', 'N', 80, '2011-03-29 10:08:28.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DEDUCCION_INASISTENCIA_INJUSTIFICADA', 0, NULL, '2011-03-18 10:22:36.0', 100, 1000471, 1001502, 1000009, 'Y', 'Y', 'N', 'Y', 20, '2011-03-29 10:08:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VACACIONES_PAGADAS', 0, NULL, '2011-01-28 09:46:01.0', 100, 1000374, 1001288, 1000009, 'Y', 'Y', 'N', 'N', 360, '2011-03-29 10:09:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_MENSUAL', 0, NULL, '2011-01-28 11:03:01.0', 100, 1000002, 1001316, 1000009, 'Y', 'Y', 'N', 'N', 640, '2011-03-29 10:10:16.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_COMPRA_VIVIENDA', 0, NULL, '2011-02-17 15:27:55.0', 100, 1000467, 1001495, 1000009, 'Y', 'Y', 'N', 'N', 820, '2011-03-29 10:10:48.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_PERSONALES', 0, NULL, '2011-02-17 15:28:07.0', 100, 1000468, 1001496, 1000009, 'Y', 'Y', 'N', 'N', 830, '2011-03-29 10:10:49.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_REMODELACION_VIVIEN', 0, NULL, '2011-02-17 15:28:19.0', 100, 1000469, 1001497, 1000009, 'Y', 'Y', 'N', 'N', 840, '2011-03-29 10:10:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_OTROS', 0, NULL, '2011-02-17 15:28:34.0', 100, 1000470, 1001498, 1000009, 'Y', 'Y', 'N', 'N', 850, '2011-03-29 10:10:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO', 0, NULL, '2011-01-28 11:23:12.0', 100, 1000005, 1001335, 1000010, 'Y', 'Y', 'N', 'N', 10, '2011-03-29 10:28:39.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DEDUCCION_INASISTENCIA_INJUSTIFICADA', 0, NULL, '2011-03-18 10:23:01.0', 100, 1000471, 1001503, 1000010, 'Y', 'Y', 'N', 'N', 20, '2011-03-29 10:28:40.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_NOCTURNO', 0, NULL, '2011-01-28 11:29:38.0', 100, 1000417, 1001338, 1000010, 'Y', 'Y', 'N', 'N', 50, '2011-03-29 10:28:45.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INTERESES_PREST_SOC_MENSUAL', 0, NULL, '2011-01-28 11:29:58.0', 100, 1000441, 1001339, 1000010, 'Y', 'Y', 'N', 'N', 60, '2011-03-29 10:28:46.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_REPOSO_EMPRESA', 0, NULL, '2011-01-28 11:30:17.0', 100, 1000424, 1001340, 1000010, 'Y', 'Y', 'N', 'N', 70, '2011-03-29 10:28:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_REPOSO_IVSS', 0, NULL, '2011-01-28 11:30:27.0', 100, 1000425, 1001341, 1000010, 'Y', 'Y', 'N', 'N', 80, '2011-03-29 10:28:48.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_INASISTENCIA', 0, NULL, '2011-01-28 11:30:45.0', 100, 1000380, 1001342, 1000010, 'Y', 'Y', 'N', 'N', 90, '2011-03-29 10:28:49.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_SIN_C_SALARIAL', 0, NULL, '2011-01-28 11:39:46.0', 100, 1000332, 1001353, 1000010, 'Y', 'Y', 'N', 'N', 210, '2011-03-29 10:29:07.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_NACIMIENTO_HIJOS', 0, NULL, '2011-01-28 11:40:14.0', 100, 1000334, 1001354, 1000010, 'Y', 'Y', 'N', 'N', 220, '2011-03-29 10:29:08.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_COMISIONES', 0, NULL, '2011-01-28 11:44:40.0', 100, 1000327, 1001364, 1000010, 'Y', 'Y', 'N', 'N', 320, '2011-03-29 10:29:22.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BECA_ESTUDIO', 0, NULL, '2011-01-28 11:44:53.0', 100, 1000329, 1001365, 1000010, 'Y', 'Y', 'N', 'N', 340, '2011-03-29 10:29:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRIMA_POR_HIJOS', 0, NULL, '2011-01-28 11:45:05.0', 100, 1000330, 1001366, 1000010, 'Y', 'Y', 'N', 'N', 350, '2011-03-29 10:29:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VACACIONES_PAGADAS', 0, NULL, '2011-01-28 11:45:43.0', 100, 1000374, 1001367, 1000010, 'Y', 'Y', 'N', 'N', 360, '2011-03-29 10:29:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_SUEL_PEND_PAG_VAC', 0, NULL, '2011-01-28 11:46:03.0', 100, 1000375, 1001368, 1000010, 'Y', 'Y', 'N', 'N', 380, '2011-03-29 10:29:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DED_CON_CARACTER_SALARIAL', 0, NULL, '2011-01-28 11:50:23.0', 100, 1000367, 1001369, 1000010, 'Y', 'Y', 'N', 'N', 390, '2011-03-29 10:29:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_COMPRA_VIVIEN', 0, NULL, '2011-01-28 11:52:16.0', 100, 1000407, 1001373, 1000010, 'Y', 'Y', 'N', 'N', 430, '2011-03-29 10:29:38.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_SUELDO', 0, NULL, '2011-01-28 11:51:05.0', 100, 1000358, 1001371, 1000010, 'Y', 'Y', 'N', 'N', 410, '2011-03-29 10:29:35.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_REMOD_VIVIEND', 0, NULL, '2011-01-28 11:52:49.0', 100, 1000409, 1001375, 1000010, 'Y', 'Y', 'N', 'N', 450, '2011-03-29 10:29:43.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_PERSONALES', 0, NULL, '2011-01-28 11:52:30.0', 100, 1000408, 1001374, 1000010, 'Y', 'Y', 'N', 'N', 440, '2011-03-29 10:29:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_OTROS', 0, NULL, '2011-01-28 11:53:13.0', 100, 1000410, 1001376, 1000010, 'Y', 'Y', 'N', 'N', 460, '2011-03-29 10:29:44.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_UNIFORMES', 0, NULL, '2011-01-28 11:54:30.0', 100, 1000386, 1001377, 1000010, 'Y', 'Y', 'N', 'N', 470, '2011-03-29 10:29:46.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_HCM', 0, NULL, '2011-01-28 13:49:18.0', 100, 1000387, 1001379, 1000010, 'Y', 'Y', 'N', 'N', 490, '2011-03-29 10:29:52.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_SINDICAL', 0, NULL, '2011-01-28 13:49:02.0', 100, 1000415, 1001378, 1000010, 'Y', 'Y', 'N', 'N', 480, '2011-03-29 10:29:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_H.C', 0, NULL, '2011-01-28 13:49:56.0', 100, 1000389, 1001381, 1000010, 'Y', 'Y', 'N', 'N', 510, '2011-03-29 10:29:57.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_HCM_FAMILIARES', 0, NULL, '2011-01-28 13:49:36.0', 100, 1000388, 1001380, 1000010, 'Y', 'Y', 'N', 'N', 500, '2011-03-29 10:29:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_VIDA', 0, NULL, '2011-01-28 13:50:14.0', 100, 1000390, 1001382, 1000010, 'Y', 'Y', 'N', 'N', 520, '2011-03-29 10:29:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_AUTOMOVILES', 0, NULL, '2011-01-28 13:51:42.0', 100, 1000392, 1001384, 1000010, 'Y', 'Y', 'N', 'N', 540, '2011-03-29 10:30:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_CONTRA_ACCIDENTE', 0, NULL, '2011-01-28 13:50:32.0', 100, 1000391, 1001383, 1000010, 'Y', 'Y', 'N', 'N', 530, '2011-03-29 10:30:04.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_GASTOS_FUNER', 0, NULL, '2011-01-28 13:51:58.0', 100, 1000393, 1001385, 1000010, 'Y', 'Y', 'N', 'N', 550, '2011-03-29 10:30:07.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_GASTOS_ODON', 0, NULL, '2011-01-28 13:53:18.0', 100, 1000394, 1001386, 1000010, 'Y', 'Y', 'N', 'N', 560, '2011-03-29 10:30:07.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_ESCOLAR', 0, NULL, '2011-01-28 13:53:31.0', 100, 1000395, 1001387, 1000010, 'Y', 'Y', 'N', 'N', 570, '2011-03-29 10:30:08.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_EXCESO_CELULAR', 0, NULL, '2011-01-28 14:06:41.0', 100, 1000396, 1001389, 1000010, 'Y', 'Y', 'N', 'N', 590, '2011-03-29 10:30:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTEPIO', 0, NULL, '2011-01-28 14:06:57.0', 100, 1000416, 1001390, 1000010, 'Y', 'Y', 'N', 'N', 600, '2011-03-29 10:30:13.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO', 0, NULL, '2011-01-28 14:07:20.0', 100, 1000003, 1001391, 1000010, 'Y', 'Y', 'N', 'N', 610, '2011-03-29 10:30:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_CUMPLEAÑOS', 0, NULL, '2011-05-12 15:38:53.0', 100, 1000342, 1001754, 1000011, 'Y', 'Y', 'N', 'N', 270, '2011-05-12 15:38:53.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_PRESTACIONES_SOCIAL', 0, NULL, '2011-05-12 15:39:18.0', 100, 1000384, 1001755, 1000011, 'Y', 'Y', 'N', 'N', 280, '2011-05-12 15:39:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_UTILIDADES', 0, NULL, '2011-05-12 15:39:27.0', 100, 1000385, 1001756, 1000011, 'Y', 'Y', 'N', 'N', 290, '2011-05-12 15:39:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_AÑOS_EMPRESA', 0, NULL, '2011-05-12 15:39:58.0', 100, 1000344, 1001757, 1000011, 'Y', 'Y', 'N', 'N', 300, '2011-05-12 15:39:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_POR_GRADUACION', 0, NULL, '2011-05-12 15:40:18.0', 100, 1000345, 1001758, 1000011, 'Y', 'Y', 'N', 'N', 310, '2011-05-12 15:40:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_COMISIONES', 0, NULL, '2011-05-12 15:41:28.0', 100, 1000327, 1001764, 1000011, 'Y', 'Y', 'N', 'N', 370, '2011-05-12 15:41:28.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BECA_ESTUDIO', 0, NULL, '2011-05-12 15:41:39.0', 100, 1000329, 1001765, 1000011, 'Y', 'Y', 'N', 'N', 380, '2011-05-12 15:41:39.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRIMA_POR_HIJOS', 0, NULL, '2011-05-12 15:41:47.0', 100, 1000330, 1001766, 1000011, 'Y', 'Y', 'N', 'N', 390, '2011-05-12 15:41:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VACACIONES_PAGADAS', 0, NULL, '2011-05-12 15:42:05.0', 100, 1000374, 1001767, 1000011, 'Y', 'Y', 'N', 'N', 400, '2011-05-12 15:42:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_CONTRA_ACCIDENTE', 0, NULL, '2011-01-28 10:09:47.0', 100, 1000391, 1001304, 1000009, 'Y', 'Y', 'N', 'N', 520, '2011-03-29 10:09:57.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_AUTOMOVILES', 0, NULL, '2011-01-28 10:15:23.0', 100, 1000392, 1001305, 1000009, 'Y', 'Y', 'N', 'N', 530, '2011-03-29 10:09:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_GASTOS_FUNER', 0, NULL, '2011-01-28 10:15:50.0', 100, 1000393, 1001306, 1000009, 'Y', 'Y', 'N', 'N', 540, '2011-03-29 10:09:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_SUEL_PEND_PAG_VAC', 0, NULL, '2011-05-12 15:42:20.0', 100, 1000375, 1001768, 1000011, 'Y', 'Y', 'N', 'N', 410, '2011-05-12 15:42:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_ESCOLAR', 0, NULL, '2011-01-28 10:16:05.0', 100, 1000395, 1001307, 1000009, 'Y', 'Y', 'N', 'N', 550, '2011-03-29 10:10:01.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DEDUCCION_REPOSO', 0, NULL, '2011-05-12 15:42:36.0', 100, 1000464, 1001769, 1000011, 'Y', 'Y', 'N', 'N', 420, '2011-05-12 15:42:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_HORA', 0, NULL, '2011-01-28 14:07:35.0', 100, 1000013, 1001392, 1000010, 'Y', 'Y', 'N', 'N', 620, '2011-03-29 10:30:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_APLICAR_PERIODO', 0, NULL, '2011-01-28 14:07:51.0', 100, 1000004, 1001393, 1000010, 'Y', 'Y', 'N', 'N', 630, '2011-03-29 10:30:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_ISLR', 0, NULL, '2011-01-28 14:08:19.0', 100, 1000343, 1001394, 1000010, 'Y', 'Y', 'N', 'N', 640, '2011-03-29 10:30:22.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_ESTUDIO', 0, NULL, '2011-05-12 15:44:07.0', 100, 1000406, 1001770, 1000011, 'Y', 'Y', 'N', 'N', 430, '2011-05-12 15:44:07.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_NOCTURNO', 0, NULL, '2011-01-28 09:04:38.0', 100, 1000417, 1001258, 1000009, 'Y', 'Y', 'N', 'N', 50, '2011-03-29 10:08:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_POR_GRADUACION', 0, NULL, '2011-01-28 09:28:38.0', 100, 1000345, 1001279, 1000009, 'Y', 'Y', 'N', 'N', 270, '2011-03-29 10:09:02.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DED_CON_CARACTER_SALARIAL', 0, NULL, '2011-05-12 15:45:46.0', 100, 1000367, 1001775, 1000011, 'Y', 'Y', 'N', 'N', 480, '2011-05-12 15:45:46.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DED_SIN_CARACTER_SALARIAL', 0, NULL, '2011-05-12 15:45:56.0', 100, 1000365, 1001776, 1000011, 'Y', 'Y', 'N', 'N', 490, '2011-05-12 15:45:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_SUELDO', 0, NULL, '2011-05-12 15:46:05.0', 100, 1000358, 1001777, 1000011, 'Y', 'Y', 'N', 'N', 500, '2011-05-12 15:46:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_VIDA', 0, NULL, '2011-05-12 15:49:26.0', 100, 1000390, 1001783, 1000011, 'Y', 'Y', 'N', 'N', 560, '2011-05-12 15:49:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_MENSUAL', 0, NULL, '2011-01-28 14:09:03.0', 100, 1000002, 1001396, 1000010, 'Y', 'Y', 'N', 'N', 660, '2011-03-29 10:30:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_TR', 0, NULL, '2011-01-28 14:09:41.0', 100, 1000140, 1001398, 1000010, 'Y', 'Y', 'N', 'N', 680, '2011-03-29 10:30:33.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_TR', 0, NULL, '2011-01-28 14:09:57.0', 100, 1000141, 1001399, 1000010, 'Y', 'Y', 'N', 'N', 690, '2011-03-29 10:30:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB', 0, NULL, '2011-01-28 14:10:10.0', 100, 1000145, 1001400, 1000010, 'Y', 'Y', 'N', 'N', 700, '2011-03-29 10:30:38.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_IMPUESTO_SOBRE_LA_RENTA', 0, NULL, '2011-01-28 14:10:29.0', 100, 1000397, 1001401, 1000010, 'Y', 'Y', 'N', 'N', 710, '2011-03-29 10:30:41.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_CONTRA_ACCIDENTE', 0, NULL, '2011-05-12 15:49:39.0', 100, 1000391, 1001784, 1000011, 'Y', 'Y', 'N', 'N', 570, '2011-05-12 15:49:39.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_POST_VACACIONAL', 0, NULL, '2011-01-28 09:32:11.0', 100, 1000348, 1001280, 1000009, 'Y', 'Y', 'N', 'N', 280, '2011-03-29 10:09:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_MATRIMONIO', 0, NULL, '2011-01-28 09:32:37.0', 100, 1000349, 1001281, 1000009, 'Y', 'Y', 'N', 'N', 290, '2011-03-29 10:09:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_VEHICULO_MOTO', 0, NULL, '2011-01-28 09:32:50.0', 100, 1000354, 1001282, 1000009, 'Y', 'Y', 'N', 'N', 300, '2011-03-29 10:09:07.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_PRODUCCION', 0, NULL, '2011-01-28 09:33:06.0', 100, 1000356, 1001283, 1000009, 'Y', 'Y', 'N', 'N', 310, '2011-03-29 10:09:09.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_COMISIONES', 0, NULL, '2011-01-28 09:33:38.0', 100, 1000327, 1001285, 1000009, 'Y', 'Y', 'N', 'N', 330, '2011-03-29 10:09:12.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BECA_ESTUDIO', 0, NULL, '2011-01-28 09:38:36.0', 100, 1000329, 1001286, 1000009, 'Y', 'Y', 'N', 'N', 340, '2011-03-29 10:09:14.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_H.C', 0, NULL, '2011-01-28 10:06:23.0', 100, 1000389, 1001300, 1000009, 'Y', 'Y', 'N', 'N', 480, '2011-03-29 10:09:52.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_HCM_FAMILIARES', 0, NULL, '2011-01-28 10:06:29.0', 100, 1000388, 1001301, 1000009, 'Y', 'Y', 'N', 'N', 490, '2011-03-29 10:09:53.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_PARA_LRPVH', 0, NULL, '2011-01-28 14:08:42.0', 100, 1000353, 1001395, 1000010, 'Y', 'Y', 'N', 'N', 650, '2011-03-29 10:30:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_AUTOMOVILES', 0, NULL, '2011-05-12 15:49:59.0', 100, 1000392, 1001785, 1000011, 'Y', 'Y', 'N', 'N', 580, '2011-05-12 15:49:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_GASTOS_FUNER', 0, NULL, '2011-05-12 15:50:17.0', 100, 1000393, 1001786, 1000011, 'Y', 'Y', 'N', 'N', 590, '2011-05-12 15:50:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_GASTOS_ODON', 0, NULL, '2011-05-12 15:50:30.0', 100, 1000394, 1001787, 1000011, 'Y', 'Y', 'N', 'N', 600, '2011-05-12 15:50:30.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_INASISTENCIA', 0, NULL, '2011-01-28 09:08:18.0', 100, 1000380, 1001262, 1000009, 'Y', 'Y', 'N', 'N', 100, '2011-03-29 10:08:34.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_SUSPENSION', 0, NULL, '2011-01-28 09:08:57.0', 100, 1000382, 1001263, 1000009, 'Y', 'Y', 'N', 'N', 110, '2011-03-29 10:08:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_SIN_C_SALARIAL', 0, NULL, '2011-01-28 09:26:03.0', 100, 1000332, 1001274, 1000009, 'Y', 'Y', 'N', 'N', 220, '2011-03-29 10:08:55.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_NACIMIENTO_HIJOS', 0, NULL, '2011-01-28 09:26:53.0', 100, 1000334, 1001275, 1000009, 'Y', 'Y', 'N', 'N', 230, '2011-03-29 10:08:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_ASISTENCIA_PUNTUAL', 0, NULL, '2011-01-28 09:27:16.0', 100, 1000340, 1001276, 1000009, 'Y', 'Y', 'N', 'N', 240, '2011-03-29 10:08:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_CUMPLEAÑOS', 0, NULL, '2011-01-28 09:27:44.0', 100, 1000342, 1001277, 1000009, 'Y', 'Y', 'N', 'N', 250, '2011-03-29 10:08:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_AÑOS_EMPRESA', 0, NULL, '2011-01-28 09:28:07.0', 100, 1000344, 1001278, 1000009, 'Y', 'Y', 'N', 'N', 260, '2011-03-29 10:09:01.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_HCM', 0, NULL, '2011-01-28 10:08:24.0', 100, 1000387, 1001302, 1000009, 'Y', 'Y', 'N', 'N', 500, '2011-03-29 10:09:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_VACACIONES', 0, NULL, '2011-01-28 14:13:35.0', 100, 1000285, 1001410, 1000010, 'Y', 'Y', 'N', 'N', 800, '2011-03-29 10:30:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_BONO_VAC', 0, NULL, '2011-01-28 14:13:50.0', 100, 1000281, 1001411, 1000010, 'Y', 'Y', 'N', 'N', 810, '2011-03-29 10:31:00.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FEC_ULT_MES_PROC', 0, NULL, '2011-01-28 14:14:05.0', 100, 1000277, 1001412, 1000010, 'Y', 'Y', 'N', 'N', 820, '2011-03-29 10:31:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_ESCOLAR', 0, NULL, '2011-05-12 15:50:51.0', 100, 1000395, 1001788, 1000011, 'Y', 'Y', 'N', 'N', 610, '2011-05-12 15:50:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_EXCESO_CELULAR', 0, NULL, '2011-05-12 15:51:20.0', 100, 1000396, 1001790, 1000011, 'Y', 'Y', 'N', 'N', 630, '2011-05-12 15:51:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO_PARA_UTILIDAD', 0, NULL, '2011-05-12 15:52:58.0', 100, 1000338, 1001792, 1000011, 'Y', 'Y', 'N', 'N', 650, '2011-05-12 15:52:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_HORA', 0, NULL, '2011-05-12 15:53:11.0', 100, 1000013, 1001793, 1000011, 'Y', 'Y', 'N', 'N', 660, '2011-05-12 15:53:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_APLICAR_PERIODO', 0, NULL, '2011-05-12 15:53:21.0', 100, 1000004, 1001794, 1000011, 'Y', 'Y', 'N', 'N', 670, '2011-05-12 15:53:21.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_ISLR', 0, NULL, '2011-05-12 15:53:41.0', 100, 1000343, 1001795, 1000011, 'Y', 'Y', 'N', 'N', 680, '2011-05-12 15:53:41.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_H.C', 0, NULL, '2011-05-12 15:49:10.0', 100, 1000389, 1001782, 1000011, 'Y', 'Y', 'N', 'N', 550, '2011-05-12 15:49:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTEPIO', 0, NULL, '2011-05-12 15:51:31.0', 100, 1000416, 1001791, 1000011, 'Y', 'Y', 'N', 'N', 640, '2011-05-12 15:51:31.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_TR', 0, NULL, '2011-05-12 15:55:49.0', 100, 1000140, 1001799, 1000011, 'Y', 'Y', 'N', 'N', 720, '2011-05-12 15:55:49.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_TR', 0, NULL, '2011-05-12 15:55:58.0', 100, 1000141, 1001800, 1000011, 'Y', 'Y', 'N', 'N', 730, '2011-05-12 15:55:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB', 0, NULL, '2011-05-12 15:56:11.0', 100, 1000145, 1001801, 1000011, 'Y', 'Y', 'N', 'N', 740, '2011-05-12 15:56:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_IMPUESTO_SOBRE_LA_RENTA', 0, NULL, '2011-05-12 15:56:26.0', 100, 1000397, 1001802, 1000011, 'Y', 'Y', 'N', 'N', 750, '2011-05-12 15:56:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_PA', 0, NULL, '2011-05-12 15:56:51.0', 100, 1000272, 1001803, 1000011, 'Y', 'Y', 'N', 'N', 760, '2011-05-12 15:56:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_PA', 0, NULL, '2011-05-12 15:57:04.0', 100, 1000273, 1001804, 1000011, 'Y', 'Y', 'N', 'N', 770, '2011-05-12 15:57:04.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB_PA', 0, NULL, '2011-05-12 15:57:25.0', 100, 1000274, 1001805, 1000011, 'Y', 'Y', 'N', 'N', 780, '2011-05-12 15:57:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INCE_PATRONAL', 0, NULL, '2011-05-12 15:57:36.0', 100, 1000460, 1001806, 1000011, 'Y', 'Y', 'N', 'N', 790, '2011-05-12 15:57:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LUNES_PARA_RETENCIONES', 0, NULL, '2011-05-12 15:58:03.0', 100, 1000139, 1001808, 1000011, 'Y', 'Y', 'N', 'N', 810, '2011-05-12 15:58:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_VACACIONES_CAUSADAS', 0, NULL, '2011-05-12 15:58:18.0', 100, 1000284, 1001809, 1000011, 'Y', 'Y', 'N', 'N', 820, '2011-05-12 15:58:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_PENDIENTE', 0, NULL, '2011-06-28 11:47:49.0', 100, 1000310, 1001891, 1000016, 'Y', 'Y', 'N', 'N', 40, '2011-06-28 11:47:49.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VACACIONES_PAGADAS_SIN_DISF', 0, NULL, '2011-06-28 11:48:10.0', 100, 1000294, 1001892, 1000016, 'Y', 'Y', 'N', 'N', 50, '2011-06-28 11:48:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_ESTUDIO', 0, NULL, '2011-06-28 11:48:49.0', 100, 1000466, 1001893, 1000016, 'Y', 'Y', 'N', 'N', 60, '2011-06-28 11:48:49.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_COMPRA_VIVIENDA', 0, NULL, '2011-06-28 11:49:04.0', 100, 1000467, 1001894, 1000016, 'Y', 'Y', 'N', 'N', 70, '2011-06-28 11:49:04.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_PERSONALES', 0, NULL, '2011-06-28 11:49:27.0', 100, 1000468, 1001895, 1000016, 'Y', 'Y', 'N', 'N', 80, '2011-06-28 11:49:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_REMODELACION_VIVIEN', 0, NULL, '2011-06-28 11:49:42.0', 100, 1000469, 1001896, 1000016, 'Y', 'Y', 'N', 'N', 90, '2011-06-28 11:49:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_OTROS', 0, NULL, '2011-06-28 11:49:59.0', 100, 1000470, 1001897, 1000016, 'Y', 'Y', 'N', 'N', 100, '2011-06-28 11:49:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_PA', 0, NULL, '2011-06-28 11:57:54.0', 100, 1000272, 1001913, 1000016, 'Y', 'Y', 'N', 'N', 260, '2011-06-28 11:57:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_PA', 0, NULL, '2011-06-28 11:58:09.0', 100, 1000273, 1001914, 1000016, 'Y', 'Y', 'N', 'N', 270, '2011-06-28 11:58:09.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB_PA', 0, NULL, '2011-06-28 11:58:21.0', 100, 1000274, 1001915, 1000016, 'Y', 'Y', 'N', 'N', 280, '2011-06-28 11:58:21.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FECHA_ULTIMO_MES_PROC', 0, NULL, '2011-06-28 12:00:09.0', 100, 1000423, 1001916, 1000016, 'Y', 'Y', 'N', 'N', 290, '2011-06-28 12:00:09.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_DIAS_VAC_BONO_VAC_CAU', 0, NULL, '2011-06-28 12:01:03.0', 100, 1000430, 1001917, 1000016, 'Y', 'Y', 'N', 'N', 300, '2011-06-28 12:01:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_DIA_VAC_BONO_VAC_USAD', 0, NULL, '2011-06-28 12:01:25.0', 100, 1000445, 1001918, 1000016, 'Y', 'Y', 'N', 'N', 310, '2011-06-28 12:01:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_CAMPO_SUELDO_PAG_VAC_CIE', 0, NULL, '2011-06-28 12:01:41.0', 100, 1000440, 1001919, 1000016, 'Y', 'Y', 'N', 'N', 320, '2011-06-28 12:01:41.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_CAMPO_SUELDO_PAG_VACACIO', 0, NULL, '2011-06-28 12:01:55.0', 100, 1000439, 1001920, 1000016, 'Y', 'Y', 'N', 'N', 330, '2011-06-28 12:01:55.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_DIAS_DISP_VAC_BON_VAC', 0, NULL, '2011-06-28 12:02:36.0', 100, 1000450, 1001921, 1000016, 'Y', 'Y', 'N', 'N', 340, '2011-06-28 12:02:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LUNES_PARA_RETENCIONES', 0, NULL, '2011-06-28 12:03:29.0', 100, 1000139, 1001923, 1000016, 'Y', 'Y', 'N', 'N', 360, '2011-06-28 12:03:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_VACACIONES_CAUSADAS', 0, NULL, '2011-06-28 12:03:59.0', 100, 1000284, 1001924, 1000016, 'Y', 'Y', 'N', 'N', 370, '2011-06-28 12:03:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BONO_VAC_CAUSADO', 0, NULL, '2011-06-28 12:04:10.0', 100, 1000278, 1001925, 1000016, 'Y', 'Y', 'N', 'N', 380, '2011-06-28 12:04:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DESC_VAC_INAS_INJUS', 0, NULL, '2011-06-28 13:34:10.0', 100, 1000444, 1001928, 1000016, 'Y', 'Y', 'N', 'N', 410, '2011-06-28 13:34:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_VACACIONES', 0, NULL, '2011-06-28 13:34:30.0', 100, 1000285, 1001929, 1000016, 'Y', 'Y', 'N', 'N', 420, '2011-06-28 13:34:30.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_BONO_VAC', 0, NULL, '2011-06-28 13:34:42.0', 100, 1000281, 1001930, 1000016, 'Y', 'Y', 'N', 'N', 430, '2011-06-28 13:34:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FEC_ULT_MES_PROC', 0, NULL, '2011-06-28 13:35:07.0', 100, 1000277, 1001931, 1000016, 'Y', 'Y', 'N', 'N', 440, '2011-06-28 13:35:07.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_PA', 0, NULL, '2011-01-28 14:10:51.0', 100, 1000272, 1001402, 1000010, 'Y', 'Y', 'N', 'N', 720, '2011-03-29 10:30:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO_VARIABLE', 0, NULL, '2011-01-28 14:09:21.0', 100, 1000323, 1001397, 1000010, 'Y', 'Y', 'N', 'N', 670, '2011-03-29 10:30:30.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_PA', 0, NULL, '2011-01-28 14:11:07.0', 100, 1000273, 1001403, 1000010, 'Y', 'Y', 'N', 'N', 730, '2011-03-29 10:30:43.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB_PA', 0, NULL, '2011-01-28 14:11:23.0', 100, 1000274, 1001404, 1000010, 'Y', 'Y', 'N', 'N', 740, '2011-03-29 10:30:45.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INCE_PATRONAL', 0, NULL, '2011-01-28 14:11:40.0', 100, 1000460, 1001405, 1000010, 'Y', 'Y', 'N', 'N', 750, '2011-03-29 10:30:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LUNES_PARA_RETENCIONES', 0, NULL, '2011-01-28 14:12:33.0', 100, 1000139, 1001407, 1000010, 'Y', 'Y', 'N', 'N', 770, '2011-03-29 10:30:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_VACACIONES_CAUSADAS', 0, NULL, '2011-01-28 14:12:52.0', 100, 1000284, 1001408, 1000010, 'Y', 'Y', 'N', 'N', 780, '2011-03-29 10:30:53.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BONO_VAC_CAUSADO', 0, NULL, '2011-01-28 14:13:09.0', 100, 1000278, 1001409, 1000010, 'Y', 'Y', 'N', 'N', 790, '2011-03-29 10:30:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_PARA_LRPVH', 0, NULL, '2011-05-12 15:54:06.0', 100, 1000353, 1001796, 1000011, 'Y', 'Y', 'N', 'N', 690, '2011-05-12 15:54:06.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_MENSUAL', 0, NULL, '2011-05-12 15:54:42.0', 100, 1000002, 1001797, 1000011, 'Y', 'Y', 'N', 'N', 700, '2011-05-12 15:54:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO_VARIABLE', 0, NULL, '2011-05-12 15:55:03.0', 100, 1000323, 1001798, 1000011, 'Y', 'Y', 'N', 'N', 710, '2011-05-12 15:55:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PROVISION_MENSUAL_UTILIDADES', 0, NULL, '2011-03-24 16:29:55.0', 100, 1000401, 1001530, 1000012, 'Y', 'Y', 'N', 'N', 140, '2011-03-28 16:15:13.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SALARIO_DIARIO_INTEGRAL', 0, NULL, '2011-06-13 16:01:26.0', 100, 1000350, 1001870, 1000015, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 16:01:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUEL_PROM_ANUAL_DIA_ADIC_PRE', 0, NULL, '2011-06-13 16:01:42.0', 100, 1000359, 1001871, 1000015, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 16:01:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ANTICIPO_PREST_UTIL', 0, NULL, '2011-03-29 10:17:39.0', 100, 1000428, 1001564, 1000009, 'Y', 'Y', 'N', 'N', 920, '2011-03-30 09:58:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_DIAS_VAC_BONO_VAC_CAU', 0, NULL, '2011-03-29 10:19:10.0', 100, 1000430, 1001565, 1000009, 'Y', 'Y', 'N', 'N', 930, '2011-03-30 09:58:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FEC_ANUAL_VACACIONES', 0, NULL, '2011-03-29 10:19:35.0', 100, 1000435, 1001566, 1000009, 'Y', 'Y', 'N', 'N', 940, '2011-03-30 09:58:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FECHA_ULTIMO_MES_PROC', 0, NULL, '2011-03-29 10:20:05.0', 100, 1000423, 1001567, 1000009, 'Y', 'Y', 'N', 'N', 950, '2011-03-30 09:58:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_INTERES_PREST_PAG', 0, NULL, '2011-03-29 10:20:26.0', 100, 1000443, 1001568, 1000009, 'Y', 'Y', 'N', 'N', 960, '2011-03-30 09:58:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FERIADO_LEGAL', 0, NULL, '2011-01-28 09:04:17.0', 100, 1000322, 1001257, 1000009, 'Y', 'Y', 'N', 'N', 40, '2011-03-29 10:08:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_PA', 0, NULL, '2011-06-20 11:34:03.0', 100, 1000273, 1001884, 1000015, 'Y', 'Y', 'N', 'N', 10, '2011-06-20 11:34:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INTERESES_PREST_SOC_MENSUAL', 0, NULL, '2011-01-28 09:04:58.0', 100, 1000441, 1001259, 1000009, 'Y', 'Y', 'N', 'N', 60, '2011-03-29 10:08:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB_PA', 0, NULL, '2011-06-20 11:35:18.0', 100, 1000274, 1001886, 1000015, 'Y', 'Y', 'N', 'N', 10, '2011-06-20 11:35:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LUNES_PARA_RETENCIONES', 0, NULL, '2011-06-20 11:35:27.0', 100, 1000139, 1001887, 1000015, 'Y', 'Y', 'N', 'N', 10, '2011-06-20 11:35:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_PRESTACIONES', 0, NULL, '2011-06-13 15:52:42.0', 100, 1000493, 1001858, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:41:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTACIONES_SOCI_FIDECOMISO', 0, NULL, '2011-06-13 15:55:36.0', 100, 1000379, 1001860, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:58:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INTERESES_PREST_SOC_PAG', 0, NULL, '2011-06-13 15:55:55.0', 100, 1000381, 1001861, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:44:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_COMPRA_VIVIENDA_LIQ', 0, NULL, '2011-06-13 15:58:50.0', 100, 1000455, 1001862, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:45:00.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_DIURNO', 0, NULL, '2011-01-28 09:09:47.0', 100, 1000045, 1001266, 1000009, 'Y', 'Y', 'N', 'N', 140, '2011-03-29 10:08:43.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VACACIONES', 0, NULL, '2011-06-28 11:47:05.0', 100, 1000293, 1001888, 1000016, 'Y', 'Y', 'N', 'N', 10, '2011-06-28 11:47:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_HORAS_EXTRAS_DIURNAS', 0, NULL, '2011-01-28 09:21:26.0', 100, 1000027, 1001270, 1000009, 'Y', 'Y', 'N', 'N', 180, '2011-03-29 10:08:49.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_HORAS_EXTRAS_NOCTURNAS', 0, NULL, '2011-01-28 09:21:40.0', 100, 1000028, 1001271, 1000009, 'Y', 'Y', 'N', 'N', 190, '2011-03-29 10:08:50.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRIMA_POR_HIJOS', 0, NULL, '2011-01-28 09:45:39.0', 100, 1000330, 1001287, 1000009, 'Y', 'Y', 'N', 'N', 350, '2011-03-29 10:09:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_EXCESO_CELULAR', 0, NULL, '2011-01-28 10:17:18.0', 100, 1000396, 1001309, 1000009, 'Y', 'Y', 'N', 'N', 570, '2011-03-29 10:10:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTEPIO', 0, NULL, '2011-01-28 10:48:57.0', 100, 1000416, 1001310, 1000009, 'Y', 'Y', 'N', 'N', 580, '2011-03-29 10:10:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_ISLR', 0, NULL, '2011-01-28 11:01:07.0', 100, 1000343, 1001314, 1000009, 'Y', 'Y', 'N', 'N', 620, '2011-03-29 10:10:14.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_PARA_LRPVH', 0, NULL, '2011-01-28 11:02:46.0', 100, 1000353, 1001315, 1000009, 'Y', 'Y', 'N', 'N', 630, '2011-03-29 10:10:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB', 0, NULL, '2011-01-28 11:06:52.0', 100, 1000145, 1001320, 1000009, 'Y', 'Y', 'N', 'N', 680, '2011-03-29 10:10:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_IMPUESTO_SOBRE_LA_RENTA', 0, NULL, '2011-01-28 11:08:27.0', 100, 1000397, 1001321, 1000009, 'Y', 'Y', 'N', 'N', 690, '2011-03-29 10:10:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_PA', 0, NULL, '2011-01-28 11:09:08.0', 100, 1000273, 1001323, 1000009, 'Y', 'Y', 'N', 'N', 710, '2011-03-29 10:10:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB_PA', 0, NULL, '2011-01-28 11:09:32.0', 100, 1000274, 1001324, 1000009, 'Y', 'Y', 'N', 'N', 720, '2011-03-29 10:10:31.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INCE_PATRONAL', 0, NULL, '2011-01-28 11:09:48.0', 100, 1000460, 1001325, 1000009, 'Y', 'Y', 'N', 'N', 730, '2011-03-29 10:10:33.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LUNES_PARA_RETENCIONES', 0, NULL, '2011-01-28 11:11:31.0', 100, 1000139, 1001329, 1000009, 'Y', 'Y', 'N', 'N', 750, '2011-03-29 10:10:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_VACACIONES_CAUSADAS', 0, NULL, '2011-01-28 11:11:52.0', 100, 1000284, 1001330, 1000009, 'Y', 'Y', 'N', 'N', 760, '2011-03-29 10:10:38.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FEC_ULT_MES_PROC', 0, NULL, '2011-01-28 11:13:11.0', 100, 1000277, 1001334, 1000009, 'Y', 'Y', 'N', 'N', 800, '2011-03-29 10:10:45.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_ACUM_MONTO_PAG_REPO_IVSS', 0, NULL, '2011-03-29 10:14:31.0', 100, 1000448, 1001558, 1000009, 'Y', 'Y', 'N', 'N', 860, '2011-03-30 09:58:22.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_CAMPO_SUELDO_PAG_VACACIO', 0, NULL, '2011-03-29 10:15:00.0', 100, 1000439, 1001559, 1000009, 'Y', 'Y', 'N', 'N', 870, '2011-03-30 09:58:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_DIAS_DISP_VAC_BON_VAC', 0, NULL, '2011-03-29 10:15:20.0', 100, 1000450, 1001560, 1000009, 'Y', 'Y', 'N', 'N', 880, '2011-03-30 09:58:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_FEC_ULTI_BONO_POST_VAC_P', 0, NULL, '2011-03-29 10:15:39.0', 100, 1000432, 1001561, 1000009, 'Y', 'Y', 'N', 'N', 890, '2011-03-30 09:58:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_TOT_DISP_FOND_AHO_CIERRE', 0, NULL, '2011-03-29 10:16:13.0', 100, 1000436, 1001562, 1000009, 'Y', 'Y', 'N', 'N', 900, '2011-03-30 09:58:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ACUM_FONDO_AHORRO', 0, NULL, '2011-03-29 10:16:43.0', 100, 1000451, 1001563, 1000009, 'Y', 'Y', 'N', 'N', 910, '2011-03-30 09:58:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BONO_VAC_CAUSADO', 0, NULL, '2011-05-12 15:58:28.0', 100, 1000278, 1001810, 1000011, 'Y', 'Y', 'N', 'N', 830, '2011-05-12 15:58:28.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_VACACIONES', 0, NULL, '2011-05-12 15:58:46.0', 100, 1000285, 1001811, 1000011, 'Y', 'Y', 'N', 'N', 840, '2011-05-12 15:58:46.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_BONO_VAC', 0, NULL, '2011-05-12 15:59:02.0', 100, 1000281, 1001812, 1000011, 'Y', 'Y', 'N', 'N', 850, '2011-05-12 15:59:02.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FEC_ULT_MES_PROC', 0, NULL, '2011-05-12 15:59:11.0', 100, 1000277, 1001813, 1000011, 'Y', 'Y', 'N', 'N', 860, '2011-05-12 15:59:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO', 0, NULL, '2011-05-12 15:09:45.0', 100, 1000005, 1001726, 1000011, 'Y', 'Y', 'N', 'N', 10, '2011-05-16 11:40:45.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DEDUCCION_INASISTENCIA_INJUSTIFICADA', 0, NULL, '2011-05-26 11:58:11.0', 100, 1000471, 1001826, 1000011, 'Y', 'Y', 'N', 'N', 420, '2011-05-26 11:58:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DESCANSO_TRABAJADO', 0, NULL, '2011-05-26 15:46:06.0', 100, 1000486, 1001827, 1000009, 'Y', 'Y', 'N', 'N', 120, '2011-05-26 15:46:06.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_PRESTACIONES_SOCIAL', 0, NULL, '2011-01-28 09:22:44.0', 100, 1000384, 1001272, 1000009, 'Y', 'Y', 'N', 'N', 200, '2011-03-29 10:08:52.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPO_UTILIDADES', 0, NULL, '2011-01-28 09:22:57.0', 100, 1000385, 1001273, 1000009, 'Y', 'Y', 'N', 'N', 210, '2011-03-29 10:08:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DED_SIN_CARACTER_SALARIAL', 0, NULL, '2011-01-28 11:50:39.0', 100, 1000365, 1001370, 1000010, 'Y', 'Y', 'N', 'N', 400, '2011-03-29 10:29:32.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_DIAS_DISP_VAC_BON_VAC', 0, NULL, '2011-03-29 10:39:02.0', 100, 1000450, 1001571, 1000010, 'Y', 'Y', 'N', 'N', 850, '2011-03-29 10:39:02.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_FEC_ULTI_BONO_POST_VAC_P', 0, NULL, '2011-03-29 10:39:19.0', 100, 1000432, 1001572, 1000010, 'Y', 'Y', 'N', 'N', 860, '2011-03-29 10:39:19.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_TOT_DISP_FOND_AHO_CIERRE', 0, NULL, '2011-03-29 10:39:35.0', 100, 1000436, 1001573, 1000010, 'Y', 'Y', 'N', 'N', 870, '2011-03-29 10:39:35.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ACUM_FONDO_AHORRO', 0, NULL, '2011-03-29 10:39:58.0', 100, 1000451, 1001574, 1000010, 'Y', 'Y', 'N', 'N', 880, '2011-03-29 10:39:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ANTICIPO_PREST_UTIL', 0, NULL, '2011-03-29 10:40:23.0', 100, 1000428, 1001575, 1000010, 'Y', 'Y', 'N', 'N', 890, '2011-03-29 10:40:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_EMPRESA_DED', 0, NULL, '2011-03-30 14:19:05.0', 100, 1000475, 1001580, 1000009, 'Y', 'Y', 'N', 'N', 960, '2011-03-30 14:19:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_EMPRESA_DED', 0, NULL, '2011-03-30 15:49:47.0', 100, 1000475, 1001581, 1000010, 'Y', 'Y', 'N', 'N', 780, '2011-03-30 15:49:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_EMPRESA', 0, NULL, '2011-03-30 15:50:03.0', 100, 1000447, 1001582, 1000010, 'Y', 'Y', 'N', 'N', 780, '2011-03-30 15:50:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DEDUCCION_REPOSO', 0, NULL, '2011-03-30 15:50:36.0', 100, 1000464, 1001583, 1000010, 'Y', 'Y', 'N', 'N', 780, '2011-03-30 15:50:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_IVSS', 0, NULL, '2011-03-30 15:51:42.0', 100, 1000446, 1001584, 1000010, 'Y', 'Y', 'N', 'N', 780, '2011-03-30 15:51:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DESCANSO_TRABAJADO', 0, NULL, '2011-05-26 15:46:42.0', 100, 1000486, 1001828, 1000010, 'Y', 'Y', 'N', 'N', 120, '2011-05-26 15:46:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DESCANSO_TRABAJADO', 0, NULL, '2011-05-26 15:46:55.0', 100, 1000486, 1001829, 1000011, 'Y', 'Y', 'N', 'N', 10, '2011-05-26 15:46:55.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FERIADO_TRABAJADO', 0, NULL, '2011-05-26 15:58:12.0', 100, 1000487, 1001830, 1000011, 'Y', 'Y', 'N', 'N', 10, '2011-05-26 15:58:12.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FERIADO_TRABAJADO', 0, NULL, '2011-05-26 15:58:37.0', 100, 1000487, 1001831, 1000010, 'Y', 'Y', 'N', 'N', 10, '2011-05-26 15:58:37.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FERIADO_TRABAJADO', 0, NULL, '2011-05-26 15:58:53.0', 100, 1000487, 1001832, 1000009, 'Y', 'Y', 'N', 'Y', 10, '2011-05-26 15:58:53.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_VAL_INIC_ANU_SUEL_PRE', 0, NULL, '2011-04-15 16:24:57.0', 100, 1000426, 1001588, 1000012, 'Y', 'Y', 'N', 'N', 230, '2011-04-15 16:24:57.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_ALIMENTACION', 0, NULL, '2011-04-29 10:07:23.0', 100, 1000422, 1001589, 1000013, 'Y', 'Y', 'N', 'N', 10, '2011-04-29 10:07:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_MES_BENEFICIO_PSUIP', 0, NULL, '2011-05-12 11:13:58.0', 100, 1000148, 1001594, 1000012, 'Y', 'Y', 'N', 'N', 120, '2011-05-12 11:13:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BASE_BONO_VAC', 0, NULL, '2011-05-12 11:15:06.0', 100, 1000280, 1001595, 1000012, 'Y', 'Y', 'N', 'N', 120, '2011-05-12 11:15:06.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_UTILIDADES', 0, NULL, '2011-06-13 08:16:31.0', 100, 1000404, 1001833, 1000014, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 12:00:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_APLI_PRES_FEC_ULT_PROCESAMI', 0, NULL, '2011-05-12 11:15:34.0', 100, 1000271, 1001596, 1000012, 'Y', 'Y', 'N', 'N', 120, '2011-05-12 11:15:34.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO', 0, NULL, '2011-01-28 09:03:40.0', 100, 1000005, 1001255, 1000009, 'Y', 'Y', 'N', 'Y', 10, '2011-03-29 10:08:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_ESTUDIO', 0, NULL, '2011-01-28 10:00:39.0', 100, 1000406, 1001291, 1000009, 'Y', 'Y', 'N', 'N', 380, '2011-03-29 10:09:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_COMPRA_VIVIEN', 0, NULL, '2011-01-28 10:01:06.0', 100, 1000407, 1001292, 1000009, 'Y', 'Y', 'N', 'N', 390, '2011-03-29 10:09:21.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_PERSONALES', 0, NULL, '2011-01-28 10:01:34.0', 100, 1000408, 1001293, 1000009, 'Y', 'Y', 'N', 'N', 400, '2011-03-29 10:09:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_REMOD_VIVIEND', 0, NULL, '2011-01-28 10:01:53.0', 100, 1000409, 1001294, 1000009, 'Y', 'Y', 'N', 'N', 420, '2011-03-29 10:09:28.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DED_SIN_CARACTER_SALARIAL', 0, NULL, '2011-01-28 10:03:30.0', 100, 1000365, 1001296, 1000009, 'Y', 'Y', 'N', 'N', 440, '2011-03-29 10:09:33.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_UNIFORMES', 0, NULL, '2011-01-28 10:04:34.0', 100, 1000386, 1001298, 1000009, 'Y', 'Y', 'N', 'N', 460, '2011-03-29 10:09:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_SINDICAL', 0, NULL, '2011-01-28 10:05:37.0', 100, 1000415, 1001299, 1000009, 'Y', 'Y', 'N', 'N', 470, '2011-03-29 10:09:50.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_POLIZA_VIDA', 0, NULL, '2011-01-28 10:08:49.0', 100, 1000390, 1001303, 1000009, 'Y', 'Y', 'N', 'N', 510, '2011-03-29 10:09:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_ACUM_MONTO_PAG_REPO_IVSS', 0, NULL, '2011-03-29 10:38:23.0', 100, 1000448, 1001569, 1000010, 'Y', 'Y', 'N', 'N', 830, '2011-03-29 10:38:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_CAMPO_SUELDO_PAG_VACACIO', 0, NULL, '2011-03-29 10:38:41.0', 100, 1000439, 1001570, 1000010, 'Y', 'Y', 'N', 'N', 840, '2011-03-29 10:38:41.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_DIAS_VAC_BONO_VAC_CAU', 0, NULL, '2011-03-29 10:40:58.0', 100, 1000430, 1001576, 1000010, 'Y', 'Y', 'N', 'N', 900, '2011-03-29 10:40:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FEC_ANUAL_VACACIONES', 0, NULL, '2011-03-29 10:41:19.0', 100, 1000435, 1001577, 1000010, 'Y', 'Y', 'N', 'N', 910, '2011-03-29 10:41:19.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FECHA_ULTIMO_MES_PROC', 0, NULL, '2011-03-29 10:41:35.0', 100, 1000423, 1001578, 1000010, 'Y', 'Y', 'N', 'N', 920, '2011-03-29 10:41:35.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FECHA_ULTIMO_MES_PROC', 0, NULL, '2011-05-12 16:01:06.0', 100, 1000423, 1001814, 1000011, 'Y', 'Y', 'N', 'N', 870, '2011-05-12 16:01:06.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ANTICIPO_PREST_UTIL', 0, NULL, '2011-05-12 16:01:16.0', 100, 1000428, 1001815, 1000011, 'Y', 'Y', 'N', 'N', 880, '2011-05-12 16:01:16.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_DIAS_VAC_BONO_VAC_CAU', 0, NULL, '2011-05-12 16:01:29.0', 100, 1000430, 1001816, 1000011, 'Y', 'Y', 'N', 'N', 890, '2011-05-12 16:01:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_INTERES_PREST_PAG', 0, NULL, '2011-05-12 16:01:40.0', 100, 1000443, 1001817, 1000011, 'Y', 'Y', 'N', 'N', 900, '2011-05-12 16:01:40.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_CAMPO_SUELDO_PAG_VACACIO', 0, NULL, '2011-05-12 16:01:50.0', 100, 1000439, 1001818, 1000011, 'Y', 'Y', 'N', 'N', 910, '2011-05-12 16:01:50.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_DIAS_DISP_VAC_BON_VAC', 0, NULL, '2011-05-12 16:02:02.0', 100, 1000450, 1001819, 1000011, 'Y', 'Y', 'N', 'N', 920, '2011-05-12 16:02:02.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ACUM_FONDO_AHORRO', 0, NULL, '2011-05-12 16:02:14.0', 100, 1000451, 1001820, 1000011, 'Y', 'Y', 'N', 'N', 930, '2011-05-12 16:02:14.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_TOT_DISP_FOND_AHO_CIERRE', 0, NULL, '2011-05-12 16:02:23.0', 100, 1000436, 1001821, 1000011, 'Y', 'Y', 'N', 'N', 940, '2011-05-12 16:02:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_FEC_ANUAL_VACACIONES', 0, NULL, '2011-05-12 16:02:32.0', 100, 1000435, 1001822, 1000011, 'Y', 'Y', 'N', 'N', 950, '2011-05-12 16:02:32.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BONO_ALIMENTACION', 0, NULL, '2011-04-29 10:08:12.0', 100, 1000411, 1001591, 1000013, 'Y', 'Y', 'N', 'N', 30, '2011-05-09 08:33:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BONO_ALIMENTACION', 0, NULL, '2011-04-29 10:08:37.0', 100, 1000316, 1001592, 1000013, 'Y', 'Y', 'N', 'N', 40, '2011-05-12 09:55:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_ACUM_MONTO_PAG_REPO_IVSS', 0, NULL, '2011-05-12 16:02:47.0', 100, 1000448, 1001823, 1000011, 'Y', 'Y', 'N', 'N', 960, '2011-05-12 16:02:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_FEC_ULTI_BONO_POST_VAC_P', 0, NULL, '2011-05-12 16:02:56.0', 100, 1000432, 1001824, 1000011, 'Y', 'Y', 'N', 'N', 970, '2011-05-12 16:02:56.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO_PARA_UTILIDAD', 0, NULL, '2011-06-13 08:21:53.0', 100, 1000338, 1001837, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:21:53.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_DIARIO_DEVENGADO_AÑO', 0, NULL, '2011-06-13 08:22:01.0', 100, 1000337, 1001838, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:22:01.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INCLUIR_ACUM_INIC_UTILIDADES', 0, NULL, '2011-06-13 08:22:23.0', 100, 1000336, 1001839, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:22:23.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SALARIO_ESTIMADO_UTILIDADES', 0, NULL, '2011-06-13 08:22:42.0', 100, 1000335, 1001840, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:22:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_DEVENGADO_PERIODO_UTIL', 0, NULL, '2011-06-13 08:22:58.0', 100, 1000328, 1001841, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:22:58.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INCE_TRABAJADOR', 0, NULL, '2011-06-13 08:23:28.0', 100, 1000459, 1001842, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:23:28.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INCE_PATRONAL', 0, NULL, '2011-06-13 08:23:51.0', 100, 1000460, 1001843, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:23:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_ANTICIP_UTIL_CONT_UTI', 0, NULL, '2011-06-13 08:26:38.0', 100, 1000429, 1001844, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:26:38.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MESES_PARA_UTILIDADES', 0, NULL, '2011-06-13 08:27:02.0', 100, 1000317, 1001845, 1000014, 'Y', 'Y', 'N', 'N', 10, '2011-06-13 08:27:02.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VAC_EN_FESTIVOS_DESCANSO', 0, NULL, '2011-06-28 11:47:22.0', 100, 1000311, 1001889, 1000016, 'Y', 'Y', 'N', 'N', 20, '2011-06-28 11:47:22.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_VACACIONAL', 0, NULL, '2011-06-28 11:47:33.0', 100, 1000295, 1001890, 1000016, 'Y', 'Y', 'N', 'N', 30, '2011-06-28 11:47:33.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_ESTUDIO', 0, NULL, '2011-06-28 11:52:15.0', 100, 1000406, 1001898, 1000016, 'Y', 'Y', 'N', 'N', 110, '2011-06-28 11:52:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_COMPRA_VIVIEN', 0, NULL, '2011-06-28 11:52:27.0', 100, 1000407, 1001899, 1000016, 'Y', 'Y', 'N', 'N', 120, '2011-06-28 11:52:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_PERSONALES', 0, NULL, '2011-06-28 11:52:39.0', 100, 1000408, 1001900, 1000016, 'Y', 'Y', 'N', 'N', 130, '2011-06-28 11:52:39.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_REMOD_VIVIEND', 0, NULL, '2011-06-28 11:52:51.0', 100, 1000409, 1001901, 1000016, 'Y', 'Y', 'N', 'N', 140, '2011-06-28 11:52:51.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CUOTA_PRESTAMO_OTROS', 0, NULL, '2011-06-28 11:53:03.0', 100, 1000410, 1001902, 1000016, 'Y', 'Y', 'N', 'N', 150, '2011-06-28 11:53:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_DIARIO_VAC', 0, NULL, '2011-06-28 11:53:50.0', 100, 1000292, 1001903, 1000016, 'Y', 'Y', 'N', 'N', 160, '2011-06-28 11:53:50.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_MES_ANTERIOR_VAC', 0, NULL, '2011-06-28 11:54:03.0', 100, 1000288, 1001904, 1000016, 'Y', 'Y', 'N', 'N', 170, '2011-06-28 11:54:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PROMEDIO_ANUAL_VAC', 0, NULL, '2011-06-28 11:54:17.0', 100, 1000289, 1001905, 1000016, 'Y', 'Y', 'N', 'N', 180, '2011-06-28 11:54:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_MES_VACACIONES', 0, NULL, '2011-06-28 11:54:28.0', 100, 1000286, 1001906, 1000016, 'Y', 'Y', 'N', 'N', 190, '2011-06-28 11:54:28.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_PARA_LRPVH', 0, NULL, '2011-06-28 11:55:10.0', 100, 1000353, 1001907, 1000016, 'Y', 'Y', 'N', 'N', 200, '2011-06-28 11:55:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_BASE_ISLR', 0, NULL, '2011-06-28 11:55:24.0', 100, 1000343, 1001908, 1000016, 'Y', 'Y', 'N', 'N', 210, '2011-06-28 11:55:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_TR', 0, NULL, '2011-06-28 11:56:15.0', 100, 1000140, 1001909, 1000016, 'Y', 'Y', 'N', 'N', 220, '2011-06-28 11:56:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_TR', 0, NULL, '2011-06-28 11:56:30.0', 100, 1000141, 1001910, 1000016, 'Y', 'Y', 'N', 'N', 230, '2011-06-28 11:56:30.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB', 0, NULL, '2011-06-28 11:56:49.0', 100, 1000145, 1001911, 1000016, 'Y', 'Y', 'N', 'N', 240, '2011-06-28 11:57:09.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_IMPUESTO_SOBRE_LA_RENTA', 0, NULL, '2011-06-28 11:57:27.0', 100, 1000397, 1001912, 1000016, 'Y', 'Y', 'N', 'N', 250, '2011-06-28 11:57:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ACT_FECH_FIN_ULTIMA_VAC_DISF', 0, NULL, '2011-06-28 12:03:04.0', 100, 1000452, 1001922, 1000016, 'Y', 'Y', 'N', 'N', 350, '2011-06-28 12:03:04.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BASE_BONO_VAC', 0, NULL, '2011-06-28 13:33:20.0', 100, 1000280, 1001926, 1000016, 'Y', 'Y', 'N', 'N', 390, '2011-06-28 13:33:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BASE_DISFRUTE_VACAC', 0, NULL, '2011-06-28 13:33:36.0', 100, 1000123, 1001927, 1000016, 'Y', 'Y', 'N', 'N', 400, '2011-06-28 13:33:36.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FEC_FIN_ULT_VAC_DISF', 0, NULL, '2011-06-28 13:35:25.0', 100, 1000276, 1001932, 1000016, 'Y', 'Y', 'N', 'N', 450, '2011-06-28 13:35:25.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PROVISION_MENSUAL_VACACIONES', 0, NULL, '2011-03-24 16:30:16.0', 100, 1000403, 1001536, 1000012, 'Y', 'Y', 'N', 'N', 120, '2011-03-28 16:15:09.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PROVISI_MENSUAL_BONO_FIN_ANO', 0, NULL, '2011-03-24 16:29:43.0', 100, 1000461, 1001527, 1000012, 'Y', 'Y', 'N', 'N', 130, '2011-03-28 16:15:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PROVISION_MENSUAL_BONO_VAC', 0, NULL, '2011-03-24 16:30:04.0', 100, 1000402, 1001533, 1000012, 'Y', 'Y', 'N', 'N', 150, '2011-03-28 16:15:19.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DESCANSO', 0, NULL, '2011-01-28 09:04:01.0', 100, 1000131, 1001256, 1000009, 'Y', 'Y', 'N', 'N', 30, '2011-03-29 10:08:21.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_EMPRESA', 0, NULL, '2011-01-28 09:05:35.0', 100, 1000447, 1001260, 1000009, 'Y', 'Y', 'N', 'N', 70, '2011-03-29 10:08:27.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_IVSS', 0, NULL, '2011-01-28 09:06:06.0', 100, 1000446, 1001261, 1000009, 'Y', 'Y', 'N', 'N', 90, '2011-03-29 10:08:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_NOCTURNO', 0, NULL, '2011-01-28 09:10:03.0', 100, 1000046, 1001267, 1000009, 'Y', 'Y', 'N', 'N', 150, '2011-03-29 10:08:44.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_FER_DIURNO', 0, NULL, '2011-01-28 09:13:48.0', 100, 1000047, 1001268, 1000009, 'Y', 'Y', 'N', 'N', 160, '2011-03-29 10:08:46.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIA_ADIC_LABORADO_FER_NOCTUR', 0, NULL, '2011-01-28 09:14:17.0', 100, 1000048, 1001269, 1000009, 'Y', 'Y', 'N', 'N', 170, '2011-03-29 10:08:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_SUEL_PEND_PAG_VAC', 0, NULL, '2011-01-28 09:49:03.0', 100, 1000375, 1001289, 1000009, 'Y', 'Y', 'N', 'N', 370, '2011-03-29 10:09:18.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DED_CON_CARACTER_SALARIAL', 0, NULL, '2011-01-28 10:02:14.0', 100, 1000367, 1001295, 1000009, 'Y', 'Y', 'N', 'N', 430, '2011-03-29 10:09:29.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_BONO_VAC_CAUSADO', 0, NULL, '2011-01-28 11:12:13.0', 100, 1000278, 1001331, 1000009, 'Y', 'Y', 'N', 'N', 770, '2011-03-29 10:10:39.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_VACACIONES', 0, NULL, '2011-01-28 11:12:38.0', 100, 1000285, 1001332, 1000009, 'Y', 'Y', 'N', 'N', 780, '2011-03-29 10:10:41.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DISPONIBLES_BONO_VAC', 0, NULL, '2011-01-28 11:12:56.0', 100, 1000281, 1001333, 1000009, 'Y', 'Y', 'N', 'N', 790, '2011-03-29 10:10:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CIERRE_INTERES_PREST_PAG', 0, NULL, '2011-03-29 10:41:48.0', 100, 1000443, 1001579, 1000010, 'Y', 'Y', 'N', 'N', 930, '2011-03-29 10:41:48.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RECARGO_FERIADO_TRABAJADO', 0, NULL, '2011-01-28 09:09:36.0', 100, 1000120, 1001265, 1000009, 'Y', 'Y', 'N', 'N', 130, '2012-07-27 16:13:40.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_RECARGO_DESCANSO_TRABAJADO', 0, NULL, '2011-01-28 09:09:17.0', 100, 1000117, 1001264, 1000009, 'Y', 'Y', 'N', 'N', 120, '2012-07-27 16:13:54.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VACACIONES_PENDIENTES', 0, NULL, '2011-06-13 15:46:12.0', 100, 1000372, 1001856, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:10:34.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_CAMBIO_STATUS_CIERRE_LIQUIDA', 0, NULL, '2011-06-13 16:03:12.0', 100, 1000449, 1001874, 1000015, 'Y', 'Y', 'N', 'N', 10, '2012-08-06 11:11:50.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DESCANSOYFERIADO_VAC_VENC', 0, NULL, '2012-08-06 11:10:07.0', 100, 1000492, 1001934, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:27:53.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_ESTUDIO_LIQUIDACION', 0, NULL, '2011-06-13 15:59:01.0', 100, 1000454, 1001863, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:45:03.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_OTROS_LIQUIDAC', 0, NULL, '2011-06-13 15:59:10.0', 100, 1000457, 1001864, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:45:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_PERSONALES_LIQUIDAC', 0, NULL, '2011-06-13 15:59:27.0', 100, 1000456, 1001865, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:45:15.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTAMO_REMOD_VIVI_LIQUIDAC', 0, NULL, '2011-06-13 15:59:43.0', 100, 1000458, 1001866, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:45:19.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REPOSO_DEDUCC_LIQUIDACION', 0, NULL, '2011-06-13 16:00:23.0', 100, 1000383, 1001867, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:45:24.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INCE_TRABAJADOR', 0, NULL, '2011-06-13 16:02:05.0', 100, 1000459, 1001872, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:45:57.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_IMPUESTO_SOBRE_LA_RENTA', 0, NULL, '2011-06-13 16:02:22.0', 100, 1000397, 1001873, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:46:00.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SUELDO_EN_LIQUIDACION', 0, NULL, '2011-06-20 09:22:52.0', 100, 1000488, 1001875, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:46:05.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_FERIADO_LEGAL', 0, NULL, '2011-06-20 10:38:49.0', 100, 1000322, 1001876, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:46:14.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_DIAS_DESCANSO', 0, NULL, '2011-06-20 10:39:07.0', 100, 1000131, 1001877, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:46:17.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_TR', 0, NULL, '2011-06-20 11:33:28.0', 100, 1000140, 1001881, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:46:20.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_REGIMEN_PRESTACIONAL_TR', 0, NULL, '2011-06-20 11:33:56.0', 100, 1000141, 1001883, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:46:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_SEGURO_SOCIAL_OBLIGATORIO_PA', 0, NULL, '2011-06-20 11:33:34.0', 100, 1000272, 1001882, 1000015, 'Y', 'Y', 'N', 'N', 10, '2012-08-06 11:46:32.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_LEY_REG_PREST_VIV_HAB', 0, NULL, '2011-06-20 11:35:11.0', 100, 1000145, 1001885, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:46:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRESTACIONES_SOCIALES', 0, NULL, '2011-06-13 15:24:30.0', 100, 1000361, 1001846, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:56:42.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_PRES_SOC_DIAS_ADIC_FIN_RELAC', 0, NULL, '2011-06-13 15:24:47.0', 100, 1000362, 1001847, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:56:47.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_INTERESES_PRESTACION_SOCIAL', 0, NULL, '2011-06-13 15:25:02.0', 100, 1000366, 1001848, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:56:57.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_UTILIDADES_FRACCIONADAS', 0, NULL, '2011-06-13 15:25:53.0', 100, 1000370, 1001851, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:57:11.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_VACACIONES_FRACCIONADAS_LIQU', 0, NULL, '2011-06-13 15:44:04.0', 100, 1000420, 1001853, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:57:31.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_VACACIONAL_FRACCIONADO', 0, NULL, '2011-06-13 15:45:24.0', 100, 1000421, 1001855, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:57:35.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_BONO_VACACIONAL_PENDIENTE', 0, NULL, '2011-06-13 15:48:57.0', 100, 1000373, 1001857, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:57:38.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_MONTO_REPOSO_EMPRESA_DED', 0, NULL, '2011-06-20 10:39:44.0', 100, 1000475, 1001878, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:57:44.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_INASISTENCIA', 0, NULL, '2011-06-20 10:39:53.0', 100, 1000380, 1001879, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:57:48.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ASIGNACION_SUSPENSION', 0, NULL, '2011-06-20 10:40:36.0', 100, 1000382, 1001880, 1000015, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 11:57:52.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_ANTICIPOS_UTILIDADES', 0, NULL, '2011-06-13 08:19:21.0', 100, 1000376, 1001835, 1000014, 'Y', 'Y', 'N', 'Y', 10, '2012-08-06 12:00:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES(NULL, 1000000, NULL, '2012-08-06 12:01:59.0', 100, 1000145, 1001935, 1000014, 'Y', 'Y', 'N', 'Y', 20, '2012-08-06 12:01:59.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES(NULL, 1000000, NULL, '2012-08-06 12:02:10.0', 100, 1000274, 1001936, 1000014, 'Y', 'Y', 'N', 'N', 20, '2012-08-06 12:02:10.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_UTILIDADES_LOTTT_132', 1000000, NULL, '2012-08-07 10:26:22.0', 100, 1000495, 1001938, 1000010, 'Y', 'Y', 'N', 'Y', 940, '2012-08-07 10:26:26.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_UTILIDADES_LOTTT_132', 1000000, NULL, '2012-08-07 10:26:38.0', 100, 1000495, 1001939, 1000011, 'Y', 'Y', 'N', 'Y', 980, '2012-08-07 10:26:38.0', @ad_client_id, 100)
;
INSERT INTO adempiere.hr_payrollconcept(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
  VALUES('CC_UTILIDADES_LOTTT_132', 1000000, NULL, '2012-08-07 10:25:59.0', 100, 1000495, 1001937, 1000009, 'Y', 'Y', 'N', 'Y', 970, '2012-08-07 10:26:58.0', @ad_client_id, 100)
;

COMMIT;

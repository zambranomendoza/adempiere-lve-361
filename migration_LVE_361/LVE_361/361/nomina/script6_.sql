/*

Descripción: Consultas para crear los atributos asociados a conceptos
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
- Ejecutar los scripts

*/
BEGIN;


INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 1000003, NULL, 0, NULL, 'A', '2012-09-05 09:53:54.0', 100, NULL, NULL, 1013973, 1000059, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-09-05 09:53:54.0', 100, '2012-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000003, 0, NULL, 'Q', '2010-10-11 12:00:08.0', 100, NULL, NULL, 1000004, 1000003, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 12:00:08.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000004, 0, NULL, 'A', '2010-10-11 14:27:43.0', 100, NULL, NULL, 1000005, 1000004, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 14:27:43.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-11 16:11:22.0', 100, NULL, NULL, 1000008, 1000007, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 16:11:22.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-11 16:11:48.0', 100, NULL, NULL, 1000009, 1000008, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 16:11:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-11 16:12:22.0', 100, NULL, NULL, 1000010, 1000009, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 16:12:22.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000006, 0, NULL, 'Q', '2010-10-11 15:09:16.0', 100, NULL, NULL, 1000007, 1000006, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 16:30:14.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000007, 0, NULL, 'Q', '2010-10-11 16:35:28.0', 100, NULL, NULL, 1000012, 1000011, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 16:35:28.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000008, 0, NULL, 'Q', '2010-10-11 16:51:15.0', 100, NULL, NULL, 1000013, 1000012, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 16:51:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000009, 0, NULL, 'A', '2010-10-11 17:08:31.0', 100, NULL, NULL, 1000014, 1000013, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-11 17:08:31.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-11 17:27:29.0', 100, NULL, NULL, 1000015, 1000014, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 8.000000000000, NULL, NULL, '2010-10-11 17:27:29.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 09:14:56.0', 100, NULL, NULL, 1000018, 1000018, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 09:14:56.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 09:15:25.0', 100, NULL, NULL, 1000019, 1000019, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 09:15:25.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 09:50:11.0', 101, NULL, NULL, 1000020, 1000020, NULL, NULL, NULL, NULL, 'Y', 'N', 100, 1, 50.000000000000, NULL, NULL, '2010-10-12 09:50:11.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'D', '2010-10-12 10:07:32.0', 101, NULL, NULL, 1000024, 1000024, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, '2010-01-01 00:00:00.0', NULL, '2010-10-12 10:07:32.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000272, 0, NULL, 'A', '2010-10-11 14:36:39.0', 100, NULL, NULL, 1000006, 1000005, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-21 10:07:59.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000010, 0, NULL, 'A', '2010-10-12 10:25:35.0', 100, NULL, NULL, 1000027, 1000027, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 10:25:35.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'D', '2010-10-12 10:31:48.0', 101, NULL, NULL, 1000028, 1000026, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, '2010-01-01 00:00:00.0', NULL, '2010-10-12 10:31:48.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000011, 0, NULL, 'A', '2010-10-12 10:33:07.0', 100, NULL, NULL, 1000029, 1000028, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 10:33:07.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:38:52.0', 101, NULL, NULL, 1000032, 1000031, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 15.000000000000, NULL, NULL, '2010-10-12 10:38:52.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:41:05.0', 101, NULL, NULL, 1000033, 1000032, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0.250000000000, NULL, NULL, '2010-10-12 10:41:05.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:42:55.0', 101, NULL, NULL, 1000034, 1000033, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 60.000000000000, NULL, NULL, '2010-10-12 10:42:55.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:44:56.0', 101, NULL, NULL, 1000035, 1000034, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 2.000000000000, NULL, NULL, '2010-10-12 10:44:56.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:48:12.0', 101, NULL, NULL, 1000037, 1000036, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 30.000000000000, NULL, NULL, '2010-10-12 10:48:12.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:51:45.0', 101, NULL, NULL, 1000039, 1000038, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 360.000000000000, NULL, NULL, '2010-10-12 10:51:45.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:58:18.0', 101, NULL, NULL, 1000044, 1000043, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 15.000000000000, NULL, NULL, '2010-10-12 10:58:18.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 500.000000000000, NULL, 'A', '2010-10-12 11:08:04.0', 101, NULL, NULL, 1000048, 1000022, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 11:08:04.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 500.000000000000, NULL, 'A', '2010-10-12 11:08:42.0', 101, NULL, NULL, 1000052, 1000023, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 11:08:42.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 11:11:01.0', 101, NULL, NULL, 1000053, 1000049, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 50.000000000000, NULL, NULL, '2010-10-12 11:11:01.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 11:12:44.0', 101, NULL, NULL, 1000054, 1000050, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 30.000000000000, NULL, NULL, '2010-10-12 11:12:44.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 11:42:16.0', 101, NULL, NULL, 1000056, 1000052, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 7.000000000000, NULL, NULL, '2010-10-12 11:42:16.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 11:47:39.0', 101, NULL, NULL, 1000057, 1000053, NULL, NULL, NULL, NULL, 'Y', 'N', 100, 1, 2.000000000000, NULL, NULL, '2010-10-12 11:47:39.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 11:49:58.0', 101, NULL, NULL, 1000058, 1000054, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 3.000000000000, NULL, NULL, '2010-10-12 11:49:58.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 10.000000000000, NULL, 'A', '2010-10-12 12:03:36.0', 101, NULL, NULL, 1000060, 1000056, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 12:03:36.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 12:25:51.0', 101, NULL, NULL, 1000069, 1000063, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 33.330000000000, NULL, NULL, '2010-10-12 12:25:51.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 12:27:19.0', 101, NULL, NULL, 1000070, 1000064, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 66.670000000000, NULL, NULL, '2010-10-12 12:27:19.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 12:29:20.0', 101, NULL, NULL, 1000071, 1000065, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 30.000000000000, NULL, NULL, '2010-10-12 12:29:20.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 12:43:35.0', 101, NULL, NULL, 1000074, 1000069, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 5.000000000000, NULL, NULL, '2010-10-12 12:43:35.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 12:52:16.0', 101, NULL, NULL, 1000075, 1000070, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 6.000000000000, NULL, NULL, '2010-10-12 12:52:16.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:02:50.0', 101, NULL, NULL, 1000077, 1000072, NULL, NULL, NULL, NULL, 'Y', 'N', 100, 1, 4.000000000000, NULL, NULL, '2010-10-12 13:02:50.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:05:12.0', 101, NULL, NULL, 1000078, 1000073, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0.500000000000, NULL, NULL, '2010-10-12 13:05:12.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:07:09.0', 101, NULL, NULL, 1000079, 1000074, NULL, NULL, NULL, NULL, 'Y', 'N', 100, 1, 1.000000000000, NULL, NULL, '2010-10-12 13:07:09.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:08:31.0', 101, NULL, NULL, 1000080, 1000075, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0.500000000000, NULL, NULL, '2010-10-12 13:08:31.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:20:13.0', 100, NULL, NULL, 1000085, 1000079, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 2010.000000000000, NULL, NULL, '2011-01-24 15:19:42.0', 100, '2005-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 12:23:30.0', 101, NULL, NULL, 1000068, 1000062, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 3.000000000000, NULL, NULL, '2010-12-27 15:20:08.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:26:27.0', 100, NULL, NULL, 1000092, 1000086, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 9.000000000000, NULL, NULL, '2010-10-12 13:26:27.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:27:12.0', 100, NULL, NULL, 1000093, 1000087, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 60.000000000000, NULL, NULL, '2010-10-12 13:27:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:29:39.0', 100, NULL, NULL, 1000095, 1000089, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 30.000000000000, NULL, NULL, '2010-10-12 13:29:39.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:33:14.0', 100, NULL, NULL, 1000099, 1000094, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 3.000000000000, NULL, NULL, '2010-10-12 13:33:14.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:33:56.0', 101, NULL, NULL, 1000030, 1000029, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 30.000000000000, NULL, NULL, '2012-04-18 09:18:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:22:26.0', 100, NULL, NULL, 1000087, 1000081, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:18:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'A', '2010-10-12 11:05:10.0', 101, NULL, NULL, 1000046, 1000044, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:32:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'A', '2010-10-12 12:06:48.0', 101, NULL, NULL, 1000061, 1000057, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:32:29.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'A', '2010-10-12 12:13:14.0', 101, NULL, NULL, 1000063, 1000058, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:32:39.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'A', '2010-10-12 12:17:42.0', 101, NULL, NULL, 1000066, 1000060, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:33:13.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'A', '2010-10-12 12:20:32.0', 101, NULL, NULL, 1000067, 1000061, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:33:22.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'A', '2010-10-12 12:40:14.0', 101, NULL, NULL, 1000073, 1000068, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:33:30.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:12:55.0', 100, NULL, NULL, 1000201, 1000108, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'N', '2012-04-18 09:34:24.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 10:36:25.0', 101, NULL, NULL, 1000031, 1000030, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 15.000000000000, NULL, NULL, '2012-07-25 14:41:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:25:18.0', 100, NULL, NULL, 1000091, 1000085, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 2.000000000000, NULL, NULL, '2012-07-25 15:34:24.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:33:23.0', 100, NULL, NULL, 1000100, 1000093, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 3.000000000000, NULL, NULL, '2010-10-12 13:33:23.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:36:46.0', 100, NULL, NULL, 1000104, 1000098, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 30.000000000000, NULL, NULL, '2010-10-12 13:36:46.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:57:55.0', 100, NULL, NULL, 1000106, 1000100, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 5.000000000000, NULL, NULL, '2010-10-12 13:57:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:58:32.0', 100, NULL, NULL, 1000107, 1000101, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 60.000000000000, NULL, NULL, '2010-10-12 13:59:40.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 14:00:01.0', 100, NULL, NULL, 1000108, 1000102, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 55.000000000000, NULL, NULL, '2010-10-12 14:00:01.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:24:44.0', 100, NULL, NULL, 1000090, 1000084, NULL, NULL, NULL, NULL, 'Y', 'N', 100, 1, 2.000000000000, NULL, NULL, '2010-11-11 07:19:50.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 14:09:27.0', 100, NULL, NULL, 1000119, 1000113, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 2.000000000000, NULL, NULL, '2010-10-12 14:09:27.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000016, 0, NULL, 'A', '2010-10-12 15:19:39.0', 100, NULL, NULL, 1000122, 1000117, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 15:19:39.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000017, 0, NULL, 'A', '2010-10-12 15:40:48.0', 100, NULL, NULL, 1000123, 1000120, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 15:40:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000020, 0, NULL, 'Q', '2010-10-12 18:01:00.0', 100, NULL, NULL, 1000127, 1000125, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-12 18:01:00.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'D', '2010-10-12 13:16:18.0', 100, NULL, NULL, 1000083, 1000077, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, '2010-01-01 00:00:00.0', NULL, '2011-01-24 15:19:24.0', 100, '2005-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000265, 0, NULL, 'A', '2011-03-30 14:12:36.0', 100, NULL, NULL, 1006156, 1000475, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-30 14:12:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-02-14 11:04:17.0', 100, NULL, NULL, 1003163, 1000010, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-14 11:04:17.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:15:29.0', 100, NULL, NULL, 1000206, 1000112, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2010-11-04 09:17:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000052, 0, NULL, 'Q', '2010-10-28 16:55:04.0', 100, NULL, NULL, 1000224, 1000170, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-01 16:14:03.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000022, 0, NULL, 'Q', '2010-10-13 14:52:13.0', 100, NULL, NULL, 1000132, 1000129, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-13 14:52:13.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-13 11:23:23.0', 101, 'Valores: 1=Lunes, 2=Martes, 3=Miercoles, 4=Jueves, 5=Viernes, 6=Sabado', NULL, 1000129, 1000127, NULL, NULL, NULL, NULL, 'Y', 'N', 6, 1, 6.000000000000, NULL, NULL, '2010-12-17 10:26:26.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000024, 0, NULL, 'Q', '2010-10-14 08:48:50.0', 100, NULL, NULL, 1000134, 1000132, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-14 08:48:50.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000025, 0, NULL, 'Q', '2010-10-14 10:26:47.0', 100, NULL, NULL, 1000135, 1000133, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-14 10:26:47.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000029, 0, NULL, 'A', '2010-10-15 09:59:30.0', 100, NULL, NULL, 1000142, 1000141, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-15 09:59:30.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000032, 0, NULL, 'Q', '2010-10-15 10:47:08.0', 100, NULL, NULL, 1000145, 1000144, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-15 10:47:08.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000039, 0, NULL, 'Q', '2010-10-26 13:40:45.0', 101, NULL, NULL, 1000161, 1000156, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-26 13:40:45.0', 101, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000048, 0, NULL, 'Q', '2010-10-28 14:03:13.0', 100, NULL, NULL, 1000220, 1000166, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-04 09:19:35.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:10:25.0', 100, NULL, NULL, 1000195, 1000071, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2010-10-26 16:10:25.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-02-14 11:12:39.0', 100, NULL, NULL, 1003166, 1000066, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-25 16:20:00.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'D', '2010-10-12 10:10:26.0', 101, NULL, NULL, 1000025, 1000025, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, '2021-12-01 00:00:00.0', NULL, '2010-10-26 11:26:49.0', 100, '2000-12-31 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:08:42.0', 100, NULL, NULL, 1000190, 1000055, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'N', '2010-10-26 16:08:42.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:11:30.0', 100, NULL, NULL, 1000199, 1000080, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'N', '2010-10-26 16:11:30.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:12:03.0', 100, NULL, NULL, 1000200, 1000082, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2010-10-26 16:12:03.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:13:30.0', 100, NULL, NULL, 1000202, 1000109, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2010-10-26 16:13:30.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:14:36.0', 100, NULL, NULL, 1000203, 1000111, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2010-10-26 16:14:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:15:21.0', 100, NULL, NULL, 1000205, 1000092, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'N', '2010-10-26 16:15:21.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000044, 0, NULL, 'Q', '2010-10-28 16:11:08.0', 100, NULL, NULL, 1000223, 1000169, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-28 16:11:08.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000046, 0, NULL, 'Q', '2010-10-27 10:54:11.0', 100, NULL, NULL, 1000214, 1000163, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-27 10:54:11.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000030, 0, NULL, 'T', '2010-10-28 13:55:38.0', 100, NULL, NULL, 1000218, 1000153, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-28 13:55:38.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000049, 0, NULL, 'Q', '2010-10-28 15:32:36.0', 100, NULL, NULL, 1000221, 1000167, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-28 15:32:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000002, 0, NULL, 'A', '2010-10-29 09:41:04.0', 100, NULL, NULL, 1000226, 1000002, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-29 09:41:04.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000021, 0, NULL, 'Q', '2010-10-29 09:52:06.0', 100, NULL, NULL, 1000228, 1000128, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-10-29 09:52:06.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 2.000000000000, NULL, 'A', '2011-02-10 11:46:13.0', 100, NULL, NULL, 1003022, 1000083, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 2.000000000000, NULL, NULL, '2011-02-10 12:00:13.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'D', '2010-10-12 13:19:12.0', 100, NULL, NULL, 1000084, 1000078, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, '1997-06-19 00:00:00.0', NULL, '2010-11-01 15:30:42.0', 100, '1997-06-19 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000042, 0, NULL, 'Q', '2010-11-01 14:40:29.0', 100, NULL, NULL, 1000323, 1000160, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-01 14:40:33.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000037, 0, NULL, 'Q', '2010-11-01 15:12:16.0', 100, NULL, NULL, 1000324, 1000161, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-01 15:12:16.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000026, 0, NULL, 'A', '2010-11-02 16:29:43.0', 100, NULL, NULL, 1000331, 1000136, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-02 16:29:43.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000045, 0, NULL, 'Q', '2010-11-02 07:45:48.0', 100, NULL, NULL, 1000326, 1000162, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-02 07:46:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-11-02 12:00:38.0', 100, NULL, NULL, 1000327, 1000250, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-02 12:00:38.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000028, 0, NULL, 'A', '2010-11-02 16:01:39.0', 100, NULL, NULL, 1000329, 1000140, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-02 16:01:39.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000027, 0, NULL, 'Q', '2010-11-02 16:10:49.0', 100, NULL, NULL, 1000330, 1000139, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-02 16:10:49.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000019, 0, NULL, 'Q', '2010-11-03 07:57:30.0', 100, NULL, NULL, 1000333, 1000124, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-03 07:57:30.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:15:51.0', 100, NULL, NULL, 1000207, 1000095, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'N', '2012-04-18 09:34:08.0', 100, '2010-01-01 00:00:00.0', '2010-01-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 14:46:49.0', 100, NULL, NULL, 1000121, 1000115, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 7.500000000000, NULL, NULL, '2012-07-25 15:38:31.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:36:04.0', 100, NULL, NULL, 1000103, 1000097, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 30.000000000000, NULL, NULL, '2012-07-25 16:18:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000055, 0, NULL, 'Q', '2010-11-03 09:59:20.0', 100, NULL, NULL, 1000337, 1000252, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-03 09:59:20.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000257, 0, NULL, 'A', '2011-02-11 10:05:11.0', 100, 'D100', NULL, 1003113, 1000464, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-11 10:05:11.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000256, 0, NULL, 'A', '2011-02-11 10:07:28.0', 100, NULL, NULL, 1003114, 1000465, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-11 10:07:28.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-01-31 11:25:02.0', 100, NULL, NULL, 1001466, 1000378, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-31 11:25:02.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-04-29 16:13:32.0', 100, NULL, NULL, 1006831, 1000016, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-04-29 16:13:32.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-04-29 16:14:06.0', 100, NULL, NULL, 1006832, 1000017, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-04-29 16:14:06.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000267, 0, NULL, 'Q', '2011-05-02 08:50:54.0', 100, NULL, NULL, 1006833, 1000482, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-02 08:50:54.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000269, 0, NULL, 'Q', '2011-05-03 08:15:16.0', 100, NULL, NULL, 1006834, 1000483, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-03 08:15:16.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000268, 0, NULL, 'Q', '2011-05-03 08:15:53.0', 100, NULL, NULL, 1006835, 1000484, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-03 08:15:53.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.740000000000, NULL, 'A', '2010-11-04 08:56:05.0', 100, NULL, NULL, 1000353, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-16 15:15:12.0', 100, '2010-01-01 00:00:00.0', '2010-01-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000054, 0, NULL, 'Q', '2010-11-03 13:48:08.0', 100, NULL, NULL, 1000348, 1000253, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-03 13:48:08.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000018, 0, NULL, 'Q', '2010-11-03 13:55:11.0', 100, NULL, NULL, 1000349, 1000123, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-03 13:55:11.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000053, 0, NULL, 'Q', '2010-11-03 14:20:00.0', 100, NULL, NULL, 1000350, 1000254, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-03 14:20:00.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-12 13:27:39.0', 101, NULL, NULL, 1000094, 1000088, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'D', '2011-04-15 13:31:14.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000057, 0, NULL, 'Q', '2010-11-04 08:06:14.0', 100, NULL, NULL, 1000352, 1000255, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-04 08:06:14.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.650000000000, NULL, 'A', '2010-11-09 14:29:24.0', 100, NULL, NULL, 1000388, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:29:24.0', 100, '2010-02-01 00:00:00.0', '2010-02-28 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000058, 0, NULL, 'Q', '2010-11-05 10:15:51.0', 100, NULL, NULL, 1000356, 1000261, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-05 10:15:51.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-11-11 08:19:50.0', 100, NULL, NULL, 1000413, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 959.080000000000, NULL, NULL, '2011-06-20 16:07:45.0', 100, '2009-09-01 00:00:00.0', '2010-02-28 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000023, 0, NULL, 'A', '2010-11-05 14:25:43.0', 100, NULL, NULL, 1000364, 1000131, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-05 14:25:43.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000012, 0, NULL, 'A', '2010-11-05 14:43:22.0', 100, NULL, NULL, 1000365, 1000045, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-05 14:43:22.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000015, 0, NULL, 'A', '2010-11-05 14:45:17.0', 100, NULL, NULL, 1000366, 1000047, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-05 14:45:17.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000014, 0, NULL, 'A', '2010-11-05 14:45:55.0', 100, NULL, NULL, 1000367, 1000048, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-05 14:45:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000013, 0, NULL, 'A', '2010-11-05 14:46:29.0', 100, NULL, NULL, 1000368, 1000046, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-05 14:46:29.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.440000000000, NULL, 'A', '2010-11-09 14:29:41.0', 100, NULL, NULL, 1000389, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:29:41.0', 100, '2010-03-01 00:00:00.0', '2010-03-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000062, 0, NULL, 'Q', '2010-11-08 09:09:49.0', 100, NULL, NULL, 1000373, 1000264, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 09:09:49.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.230000000000, NULL, 'A', '2010-11-09 14:29:58.0', 100, NULL, NULL, 1000390, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:29:58.0', 100, '2010-04-01 00:00:00.0', '2010-04-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000063, 0, NULL, 'Q', '2010-11-08 11:40:57.0', 100, NULL, NULL, 1000382, 1000265, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 11:41:34.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000064, 0, NULL, 'Q', '2010-11-08 11:38:59.0', 100, NULL, NULL, 1000381, 1000266, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 11:42:50.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000065, 0, NULL, 'Q', '2010-11-08 13:55:08.0', 100, NULL, NULL, 1000383, 1000267, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 13:55:08.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000066, 0, NULL, 'Q', '2010-11-08 14:19:55.0', 100, NULL, NULL, 1000384, 1000268, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 14:19:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000067, 0, NULL, 'Q', '2010-11-08 14:39:20.0', 100, NULL, NULL, 1000385, 1000269, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 14:39:20.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000068, 0, NULL, 'Q', '2010-11-08 14:55:57.0', 100, NULL, NULL, 1000386, 1000270, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 14:59:02.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000069, 0, NULL, 'Q', '2010-11-08 15:35:49.0', 100, NULL, NULL, 1000387, 1000271, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-08 15:35:49.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.400000000000, NULL, 'A', '2010-11-09 14:30:15.0', 100, NULL, NULL, 1000391, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:30:15.0', 100, '2010-05-01 00:00:00.0', '2010-05-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.100000000000, NULL, 'A', '2010-11-09 14:30:30.0', 100, NULL, NULL, 1000392, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:30:30.0', 100, '2010-06-01 00:00:00.0', '2010-06-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.340000000000, NULL, 'A', '2010-11-09 14:30:49.0', 100, NULL, NULL, 1000393, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:30:49.0', 100, '2010-07-01 00:00:00.0', '2010-07-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.280000000000, NULL, 'A', '2010-11-09 14:31:08.0', 100, NULL, NULL, 1000394, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:31:08.0', 100, '2010-08-01 00:00:00.0', '2010-08-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.100000000000, NULL, 'A', '2010-11-09 14:31:25.0', 100, NULL, NULL, 1000395, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:31:25.0', 100, '2010-09-01 00:00:00.0', '2010-09-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 19.760000000000, NULL, 'A', '2010-11-09 14:31:55.0', 100, NULL, NULL, 1000396, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:33:58.0', 100, '2009-01-01 00:00:00.0', '2009-01-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 19.980000000000, NULL, 'A', '2010-11-09 14:32:12.0', 100, NULL, NULL, 1000397, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:34:11.0', 100, '2009-02-01 00:00:00.0', '2009-02-28 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 19.740000000000, NULL, 'A', '2010-11-09 14:32:35.0', 100, NULL, NULL, 1000398, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:34:26.0', 100, '2009-03-01 00:00:00.0', '2009-03-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 18.770000000000, NULL, 'A', '2010-11-09 14:33:37.0', 100, NULL, NULL, 1000399, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:34:38.0', 100, '2009-04-01 00:00:00.0', '2009-04-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 18.770000000000, NULL, 'A', '2010-11-09 14:34:55.0', 100, NULL, NULL, 1000400, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:34:55.0', 100, '2009-05-01 00:00:00.0', '2009-05-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 17.560000000000, NULL, 'A', '2010-11-09 14:35:13.0', 100, NULL, NULL, 1000401, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:35:13.0', 100, '2009-06-01 00:00:00.0', '2009-06-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 17.620000000000, NULL, 'A', '2010-11-09 14:36:00.0', 100, NULL, NULL, 1000403, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:36:45.0', 100, '2009-10-01 00:00:00.0', '2009-10-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000119, 0, NULL, 'Q', '2010-11-08 08:38:05.0', 100, NULL, NULL, 1000370, 1000263, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-02 08:37:31.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 17.050000000000, NULL, 'A', '2010-11-09 14:37:03.0', 100, NULL, NULL, 1000404, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:37:03.0', 100, '2009-11-01 00:00:00.0', '2009-11-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 09:52:13.0', 101, NULL, NULL, 1000021, 1000021, NULL, NULL, NULL, NULL, 'Y', 'N', 100, 1, 30.000000000000, NULL, NULL, '2011-05-13 11:24:43.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000216, 0, NULL, 'Q', '2010-12-23 10:15:50.0', 100, NULL, NULL, 1000638, 1000423, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-23 14:38:13.0', 100, '2009-12-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000240, 0, NULL, 'A', '2010-12-27 13:26:30.0', 100, NULL, NULL, 1000651, 1000424, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-28 14:12:03.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000239, 0, NULL, 'A', '2010-12-27 13:27:07.0', 100, NULL, NULL, 1000652, 1000425, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-28 14:34:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000219, 0, NULL, 'Q', '2010-12-28 13:45:23.0', 100, NULL, NULL, 1000653, 1000426, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-28 13:45:23.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000221, 0, NULL, 'Q', '2010-12-29 10:41:08.0', 100, NULL, NULL, 1000655, 1000427, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-29 10:41:08.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000124, 0, NULL, 'Q', '2010-12-29 11:08:35.0', 100, NULL, NULL, 1000656, 1000428, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-29 11:08:35.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000224, 0, NULL, 'Q', '2010-12-29 13:20:54.0', 100, NULL, NULL, 1000658, 1000430, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-29 13:20:54.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000226, 0, NULL, 'Q', '2011-01-10 08:17:06.0', 100, NULL, NULL, 1000660, 1000432, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-10 08:17:06.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000228, 0, NULL, 'Q', '2011-01-10 10:34:00.0', 100, NULL, NULL, 1000662, 1000434, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-10 10:34:00.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000229, 0, NULL, 'Q', '2011-01-10 11:07:12.0', 100, NULL, NULL, 1000663, 1000435, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-10 11:07:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000230, 0, NULL, 'Q', '2011-01-10 11:29:19.0', 100, NULL, NULL, 1000664, 1000436, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-10 11:29:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-02-04 16:19:09.0', 100, NULL, NULL, 1002729, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 1064.250000000000, NULL, NULL, '2011-06-20 16:08:13.0', 100, '2010-03-01 00:00:00.0', '2010-04-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.970000000000, NULL, 'A', '2010-11-09 14:37:22.0', 100, NULL, NULL, 1000405, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:37:22.0', 100, '2009-12-01 00:00:00.0', '2009-12-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 17.040000000000, NULL, 'A', '2010-11-09 14:35:31.0', 100, NULL, NULL, 1000402, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:38:42.0', 100, '2009-08-01 00:00:00.0', '2009-08-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.580000000000, NULL, 'A', '2010-11-09 14:39:13.0', 100, NULL, NULL, 1000406, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-09 14:39:13.0', 100, '2009-09-01 00:00:00.0', '2009-09-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000072, 0, NULL, 'A', '2010-11-10 08:09:44.0', 100, NULL, NULL, 1000409, 1000272, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-10 08:09:44.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000073, 0, NULL, 'A', '2010-11-10 08:18:35.0', 100, NULL, NULL, 1000410, 1000273, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-10 08:18:35.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000074, 0, NULL, 'A', '2010-11-10 08:24:43.0', 100, NULL, NULL, 1000411, 1000274, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-10 08:24:43.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000075, 0, NULL, 'Q', '2010-11-10 10:53:34.0', 100, NULL, NULL, 1000412, 1000275, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-10 10:53:34.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000109, 0, NULL, 'Q', '2010-11-25 15:51:12.0', 100, NULL, NULL, 1000452, 1000309, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-25 15:51:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000076, 0, NULL, 'Q', '2010-11-17 09:12:44.0', 100, NULL, NULL, 1000414, 1000276, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-17 09:12:44.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000077, 0, NULL, 'Q', '2010-11-17 10:06:47.0', 100, NULL, NULL, 1000415, 1000277, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-17 10:06:47.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000078, 0, NULL, 'Q', '2010-11-17 11:33:53.0', 100, NULL, NULL, 1000416, 1000278, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-17 11:33:53.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000079, 0, NULL, 'Q', '2010-11-17 11:56:26.0', 100, NULL, NULL, 1000417, 1000279, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-17 11:56:26.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000080, 0, NULL, 'Q', '2010-11-17 13:36:15.0', 100, NULL, NULL, 1000418, 1000280, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-17 13:36:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000081, 0, NULL, 'Q', '2010-11-17 13:55:51.0', 100, NULL, NULL, 1000419, 1000281, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-17 13:55:51.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000082, 0, NULL, 'Q', '2010-11-18 09:51:57.0', 100, NULL, NULL, 1000420, 1000282, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-18 09:51:57.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000083, 0, NULL, 'Q', '2010-11-18 10:13:39.0', 100, NULL, NULL, 1000421, 1000283, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-18 10:13:39.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000084, 0, NULL, 'Q', '2010-11-18 14:28:15.0', 100, NULL, NULL, 1000422, 1000284, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-18 14:28:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000087, 0, NULL, 'Q', '2010-11-18 15:23:02.0', 100, NULL, NULL, 1000423, 1000285, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-18 15:23:02.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000088, 0, NULL, 'Q', '2010-11-18 17:01:38.0', 100, NULL, NULL, 1000424, 1000286, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-18 17:01:38.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000086, 0, NULL, 'Q', '2010-11-19 08:01:58.0', 100, NULL, NULL, 1000425, 1000287, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-19 08:01:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000090, 0, NULL, 'Q', '2010-11-19 14:39:31.0', 100, NULL, NULL, 1000426, 1000288, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-19 14:39:31.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000091, 0, NULL, 'Q', '2010-11-19 14:45:55.0', 100, NULL, NULL, 1000427, 1000289, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-19 14:45:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000093, 0, NULL, 'Q', '2010-11-19 16:12:35.0', 100, NULL, NULL, 1000429, 1000292, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-19 16:12:35.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000222, 0, NULL, 'Q', '2010-12-29 11:22:44.0', 100, NULL, NULL, 1000657, 1000429, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-29 11:22:44.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000089, 0, NULL, 'Q', '2010-11-19 16:24:15.0', 100, NULL, NULL, 1000431, 1000290, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-19 16:24:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000096, 0, NULL, 'A', '2010-11-22 11:29:40.0', 100, NULL, NULL, 1000435, 1000296, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-22 11:29:40.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000225, 0, NULL, 'Q', '2010-12-29 14:31:50.0', 100, NULL, NULL, 1000659, 1000431, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-29 14:31:50.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000099, 0, NULL, 'A', '2010-11-23 08:15:05.0', 100, NULL, NULL, 1000438, 1000298, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-23 08:15:05.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000110, 0, NULL, 'A', '2010-11-25 16:10:34.0', 100, NULL, NULL, 1000453, 1000310, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-25 16:10:34.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000098, 0, NULL, 'A', '2010-11-23 08:15:56.0', 100, NULL, NULL, 1000439, 1000299, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-23 09:35:29.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000100, 0, NULL, 'Q', '2010-11-23 16:33:04.0', 100, NULL, NULL, 1000441, 1000301, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-23 16:33:04.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000101, 0, NULL, 'Q', '2010-11-24 09:46:15.0', 100, NULL, NULL, 1000442, 1000302, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-24 09:46:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-03-30 15:30:58.0', 100, NULL, NULL, 1006188, 1000476, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 7.000000000000, NULL, NULL, '2011-03-30 15:30:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000106, 0, NULL, 'Q', '2010-11-24 15:29:19.0', 100, NULL, NULL, 1000447, 1000306, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-24 15:29:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000107, 0, NULL, 'A', '2010-11-25 16:30:37.0', 100, NULL, NULL, 1000454, 1000311, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-25 16:30:37.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000112, 0, NULL, 'Q', '2010-11-26 08:36:38.0', 100, NULL, NULL, 1000455, 1000312, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-26 08:36:38.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000113, 0, NULL, 'Q', '2010-11-26 08:42:58.0', 100, NULL, NULL, 1000456, 1000313, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-26 08:42:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000114, 0, NULL, 'Q', '2010-11-29 15:10:57.0', 100, NULL, NULL, 1000458, 1000315, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-29 15:10:57.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000115, 0, NULL, 'Q', '2010-11-29 15:21:37.0', 100, NULL, NULL, 1000459, 1000316, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-29 15:21:37.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000117, 0, NULL, 'Q', '2010-11-30 09:06:19.0', 100, NULL, NULL, 1000460, 1000317, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-30 09:06:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000120, 0, NULL, 'Q', '2010-12-02 11:30:36.0', 100, NULL, NULL, 1000463, 1000319, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-02 11:30:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-12-02 11:36:43.0', 100, NULL, NULL, 1000464, 1000320, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 19.000000000000, NULL, NULL, '2010-12-02 11:36:43.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000123, 0, NULL, 'Q', '2010-12-02 15:25:25.0', 100, NULL, NULL, 1000465, 1000321, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-02 15:25:25.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000122, 0, NULL, 'A', '2010-12-02 15:40:48.0', 100, NULL, NULL, 1000466, 1000322, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-02 15:40:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000121, 0, NULL, 'A', '2010-12-02 15:41:48.0', 100, NULL, NULL, 1000467, 1000323, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-02 15:41:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-05-11 09:41:52.0', 100, NULL, NULL, 1006839, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 879.400000000000, NULL, NULL, '2011-06-20 16:07:02.0', 100, '2009-05-01 00:00:00.0', '2009-08-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000231, 0, NULL, 'Q', '2011-01-10 15:37:06.0', 100, NULL, NULL, 1000665, 1000437, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-10 15:37:06.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000233, 0, NULL, 'Q', '2011-01-10 15:48:09.0', 100, NULL, NULL, 1000667, 1000439, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-10 15:48:09.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000234, 0, NULL, 'Q', '2011-01-11 08:09:31.0', 100, NULL, NULL, 1000668, 1000440, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-11 08:09:31.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000235, 0, NULL, 'A', '2011-01-12 08:41:17.0', 100, NULL, NULL, 1000669, 1000441, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-12 08:41:17.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000237, 0, NULL, 'Q', '2011-01-12 09:49:16.0', 100, NULL, NULL, 1000671, 1000443, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-12 09:49:16.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000061, 0, NULL, 'Q', '2011-01-12 14:18:33.0', 100, NULL, NULL, 1000672, 1000444, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-12 14:18:33.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000218, 0, NULL, 'A', '2011-01-13 08:14:28.0', 100, NULL, NULL, 1000674, 1000446, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-13 08:14:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000241, 0, NULL, 'Q', '2011-01-13 08:21:29.0', 100, NULL, NULL, 1000676, 1000448, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-13 08:21:29.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000242, 0, NULL, 'Q', '2011-01-13 08:44:11.0', 100, NULL, NULL, 1000677, 1000449, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-13 08:44:11.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000245, 0, NULL, 'Q', '2011-01-13 10:26:07.0', 100, NULL, NULL, 1000680, 1000452, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-13 10:26:07.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000246, 0, NULL, 'A', '2011-01-13 15:21:24.0', 100, NULL, NULL, 1000681, 1000453, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-13 15:21:24.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000247, 0, NULL, 'A', '2011-01-17 09:09:17.0', 100, NULL, NULL, 1000682, 1000454, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 09:09:17.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000248, 0, NULL, 'A', '2011-01-17 09:11:16.0', 100, NULL, NULL, 1000683, 1000455, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 09:11:16.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000249, 0, NULL, 'A', '2011-01-17 09:12:37.0', 100, NULL, NULL, 1000684, 1000456, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 09:12:37.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000250, 0, NULL, 'A', '2011-01-17 09:14:55.0', 100, NULL, NULL, 1000685, 1000457, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 09:14:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000251, 0, NULL, 'A', '2011-01-17 09:16:33.0', 100, NULL, NULL, 1000686, 1000458, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 09:16:33.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000253, 0, NULL, 'Q', '2011-01-17 10:08:24.0', 100, NULL, NULL, 1000688, 1000460, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 10:08:24.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-01-19 10:39:04.0', 100, 'Superior a 6 meses', NULL, 1000692, 1000257, NULL, NULL, NULL, NULL, 'Y', 'N', 359, 180, 15.000000000000, NULL, NULL, '2011-01-19 10:41:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-01-19 10:40:26.0', 100, 'Superior a 1 año', NULL, 1000693, 1000257, NULL, NULL, NULL, NULL, 'Y', 'N', 1410065407, 360, 30.000000000000, NULL, NULL, '2011-01-19 10:41:24.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000270, 0, NULL, 'A', '2011-05-26 15:45:03.0', 100, NULL, NULL, 1008542, 1000486, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-26 15:45:03.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000271, 0, NULL, 'A', '2011-05-26 15:57:45.0', 100, NULL, NULL, 1008543, 1000487, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-26 15:57:45.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000215, 0, NULL, 'A', '2011-05-03 09:16:27.0', 100, NULL, NULL, 1006838, 1000422, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-03 09:16:27.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000252, 0, NULL, 'A', '2011-01-17 09:59:21.0', 100, NULL, NULL, 1000687, 1000459, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 09:59:21.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-12-07 15:01:23.0', 100, NULL, NULL, 1000523, 1000090, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2011-04-16 09:58:49.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000126, 0, NULL, 'A', '2010-12-03 16:58:21.0', 100, NULL, NULL, 1000473, 1000327, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-03 16:58:21.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000127, 0, NULL, 'Q', '2010-12-06 08:45:15.0', 100, NULL, NULL, 1000474, 1000328, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 08:45:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000128, 0, NULL, 'A', '2010-12-06 08:52:03.0', 100, NULL, NULL, 1000475, 1000329, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 08:52:03.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000129, 0, NULL, 'A', '2010-12-06 09:13:18.0', 100, NULL, NULL, 1000476, 1000330, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 09:13:18.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000130, 0, NULL, 'A', '2010-12-06 10:09:51.0', 100, NULL, NULL, 1000477, 1000331, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 10:09:51.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000131, 0, NULL, 'A', '2010-12-06 10:13:58.0', 100, NULL, NULL, 1000478, 1000332, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 10:13:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000132, 0, NULL, 'A', '2010-12-06 10:26:53.0', 100, NULL, NULL, 1000479, 1000334, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 10:26:53.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000133, 0, NULL, 'Q', '2010-12-06 10:31:56.0', 100, NULL, NULL, 1000480, 1000335, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 10:31:56.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000134, 0, NULL, 'Q', '2010-12-06 10:51:31.0', 100, NULL, NULL, 1000481, 1000336, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 10:51:31.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000135, 0, NULL, 'A', '2010-12-06 11:11:13.0', 100, NULL, NULL, 1000482, 1000337, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 11:11:13.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000136, 0, NULL, 'Q', '2010-12-06 11:21:04.0', 100, NULL, NULL, 1000483, 1000338, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 11:21:04.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000137, 0, NULL, 'Q', '2010-12-06 13:44:42.0', 100, NULL, NULL, 1000484, 1000339, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 13:44:42.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000138, 0, NULL, 'A', '2010-12-06 13:51:25.0', 100, NULL, NULL, 1000485, 1000340, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 13:51:25.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000139, 0, NULL, 'Q', '2010-12-06 14:20:20.0', 100, NULL, NULL, 1000486, 1000341, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 14:20:20.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000140, 0, NULL, 'A', '2010-12-06 14:25:03.0', 100, NULL, NULL, 1000487, 1000342, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 14:25:03.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000141, 0, NULL, 'Q', '2010-12-06 14:38:02.0', 100, NULL, NULL, 1000488, 1000343, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 14:38:02.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000142, 0, NULL, 'A', '2010-12-06 14:52:19.0', 100, NULL, NULL, 1000489, 1000344, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 14:52:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000143, 0, NULL, 'A', '2010-12-06 14:58:04.0', 100, NULL, NULL, 1000490, 1000345, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 14:58:04.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000144, 0, NULL, 'Q', '2010-12-06 14:59:50.0', 100, NULL, NULL, 1000491, 1000346, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 14:59:50.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000146, 0, NULL, 'A', '2010-12-06 15:23:58.0', 100, NULL, NULL, 1000493, 1000348, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 15:23:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000147, 0, NULL, 'A', '2010-12-06 15:49:10.0', 100, NULL, NULL, 1000494, 1000349, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 15:49:10.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000148, 0, NULL, 'Q', '2010-12-06 16:07:36.0', 100, NULL, NULL, 1000495, 1000350, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 16:07:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000150, 0, NULL, 'Q', '2010-12-06 16:29:46.0', 100, NULL, NULL, 1000500, 1000353, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 16:29:46.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000151, 0, NULL, 'A', '2010-12-06 16:32:47.0', 100, NULL, NULL, 1000501, 1000354, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 16:32:47.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000152, 0, NULL, 'A', '2010-12-06 16:42:28.0', 100, NULL, NULL, 1000502, 1000356, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 16:42:28.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000006, 0, NULL, 'A', '2010-12-06 16:20:17.0', 100, NULL, NULL, 1000498, 1000351, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-06 16:20:17.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000153, 0, NULL, 'A', '2010-12-07 08:45:28.0', 100, NULL, NULL, 1000504, 1000358, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 08:45:28.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000155, 0, NULL, 'Q', '2010-12-07 09:07:00.0', 100, NULL, NULL, 1000506, 1000360, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 09:07:00.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000157, 0, NULL, 'A', '2010-12-07 10:03:03.0', 100, NULL, NULL, 1000508, 1000362, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 10:03:03.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000158, 0, NULL, 'Q', '2010-12-07 10:20:44.0', 100, NULL, NULL, 1000511, 1000367, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 10:20:44.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000161, 0, NULL, 'Q', '2010-12-07 10:33:12.0', 100, NULL, NULL, 1000513, 1000368, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 10:33:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000170, 0, NULL, 'Q', '2010-12-07 14:54:05.0', 100, NULL, NULL, 1000522, 1000377, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 14:54:05.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000172, 0, NULL, 'A', '2010-12-07 15:31:45.0', 100, NULL, NULL, 1000528, 1000382, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 15:31:45.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000177, 0, NULL, 'A', '2010-12-07 16:19:04.0', 100, NULL, NULL, 1000532, 1000386, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 16:19:04.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000232, 0, NULL, 'Q', '2011-01-10 15:42:07.0', 100, NULL, NULL, 1000666, 1000438, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-10 15:42:07.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000236, 0, NULL, 'A', '2011-01-12 09:33:04.0', 100, NULL, NULL, 1000670, 1000442, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-12 09:33:04.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000238, 0, NULL, 'Q', '2011-01-12 14:35:33.0', 100, NULL, NULL, 1000673, 1000445, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-12 14:35:33.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000243, 0, NULL, 'Q', '2011-01-13 09:37:07.0', 100, NULL, NULL, 1000678, 1000450, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-13 09:37:07.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000244, 0, NULL, 'Q', '2011-01-13 09:45:04.0', 100, NULL, NULL, 1000679, 1000451, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-13 09:45:04.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000254, 0, NULL, 'Q', '2011-01-17 10:19:58.0', 100, NULL, NULL, 1000689, 1000461, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-01-17 10:19:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000178, 0, NULL, 'A', '2010-12-07 16:23:34.0', 100, NULL, NULL, 1000533, 1000387, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 16:23:34.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000181, 0, NULL, 'A', '2010-12-07 16:54:54.0', 100, NULL, NULL, 1000536, 1000390, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 16:54:54.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000108, 0, NULL, 'Q', '2010-12-08 08:43:41.0', 100, NULL, NULL, 1000543, 1000308, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 08:43:41.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000266, 0, NULL, 'Q', '2011-04-14 09:35:48.0', 100, NULL, NULL, 1006427, 1000477, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-04-14 09:35:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000192, 0, NULL, 'Q', '2010-12-08 09:46:14.0', 100, NULL, NULL, 1000548, 1000401, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 09:46:14.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000193, 0, NULL, 'Q', '2010-12-08 10:42:02.0', 100, NULL, NULL, 1000549, 1000402, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 10:42:02.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000194, 0, NULL, 'Q', '2010-12-08 10:57:43.0', 100, NULL, NULL, 1000550, 1000403, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 10:57:43.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000197, 0, NULL, 'Q', '2010-12-13 07:49:48.0', 100, NULL, NULL, 1000553, 1000406, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 07:49:48.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000198, 0, NULL, 'Q', '2010-12-13 07:50:46.0', 100, NULL, NULL, 1000554, 1000407, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 07:50:46.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000199, 0, NULL, 'Q', '2010-12-13 07:51:25.0', 100, NULL, NULL, 1000555, 1000408, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 07:51:25.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000201, 0, NULL, 'Q', '2010-12-13 07:52:12.0', 100, NULL, NULL, 1000556, 1000409, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 07:52:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000200, 0, NULL, 'Q', '2010-12-13 07:53:26.0', 100, NULL, NULL, 1000557, 1000410, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 07:53:26.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000202, 0, NULL, 'Q', '2010-12-13 09:38:16.0', 100, NULL, NULL, 1000558, 1000411, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 09:38:16.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000206, 0, NULL, 'A', '2010-12-13 12:00:55.0', 100, NULL, NULL, 1000563, 1000416, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 12:00:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000207, 0, NULL, 'A', '2010-12-13 14:20:22.0', 100, NULL, NULL, 1000564, 1000417, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 14:20:22.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000210, 0, NULL, 'A', '2010-12-07 15:22:19.0', 100, NULL, NULL, 1000526, 1000380, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-14 14:40:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000179, 0, NULL, 'A', '2010-12-07 16:27:28.0', 100, NULL, NULL, 1000534, 1000388, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 16:27:28.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000180, 0, NULL, 'A', '2010-12-07 16:52:12.0', 100, NULL, NULL, 1000535, 1000389, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 16:52:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000183, 0, NULL, 'A', '2010-12-08 07:53:23.0', 100, NULL, NULL, 1000538, 1000392, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 07:53:23.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000258, 0, NULL, 'Q', '2011-02-17 14:31:13.0', 100, NULL, NULL, 1003740, 1000466, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-17 14:31:13.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000259, 0, NULL, 'Q', '2011-02-17 14:31:44.0', 100, NULL, NULL, 1003741, 1000467, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-17 14:31:44.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000261, 0, NULL, 'Q', '2011-02-17 14:33:58.0', 100, NULL, NULL, 1003742, 1000468, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-17 15:06:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000262, 0, NULL, 'Q', '2011-02-17 14:35:13.0', 100, NULL, NULL, 1003743, 1000469, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-17 15:08:05.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000260, 0, NULL, 'Q', '2011-02-17 15:09:05.0', 100, NULL, NULL, 1003744, 1000470, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-02-17 15:09:05.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000217, 0, NULL, 'A', '2011-03-16 09:44:40.0', 100, NULL, NULL, 1003965, 1000447, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-16 09:44:40.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000208, 0, NULL, 'A', '2011-03-18 10:20:12.0', 100, 'Deducción por Inasistencia Injustificada', NULL, 1004044, 1000471, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-18 10:20:12.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-03-21 15:44:10.0', 100, 'Día de descanso trabajado', NULL, 1004100, 1000118, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-21 15:44:10.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000263, 0, NULL, 'A', '2011-03-21 16:18:02.0', 100, NULL, NULL, 1004101, 1000473, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-21 16:18:02.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-03-21 16:44:11.0', 100, NULL, NULL, 1004102, 1000119, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-21 16:44:11.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000264, 0, NULL, 'A', '2011-03-21 16:51:40.0', 100, NULL, NULL, 1004103, 1000474, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-21 16:51:40.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000227, 0, NULL, 'Q', '2011-05-16 15:30:18.0', 100, NULL, NULL, 1007128, 1000433, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-16 15:30:18.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000033, 0, NULL, 'A', '2011-05-13 10:05:15.0', 100, NULL, NULL, 1006912, 1000145, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-05-13 10:05:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.380000000000, NULL, 'A', '2011-06-10 14:45:11.0', 100, NULL, NULL, 1010326, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:45:11.0', 100, '2010-10-01 00:00:00.0', '2010-10-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.250000000000, NULL, 'A', '2011-06-10 14:45:35.0', 100, NULL, NULL, 1010327, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:45:35.0', 100, '2010-11-01 00:00:00.0', '2010-11-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.290000000000, NULL, 'A', '2011-06-10 14:45:51.0', 100, NULL, NULL, 1010328, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:46:35.0', 100, '2011-01-01 00:00:00.0', '2011-01-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.370000000000, NULL, 'A', '2011-06-10 14:46:52.0', 100, NULL, NULL, 1010329, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:46:52.0', 100, '2011-02-01 00:00:00.0', '2011-02-28 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.000000000000, NULL, 'A', '2011-06-10 14:47:09.0', 100, NULL, NULL, 1010330, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:47:09.0', 100, '2011-03-01 00:00:00.0', '2011-03-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.370000000000, NULL, 'A', '2011-06-10 14:47:30.0', 100, NULL, NULL, 1010331, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:47:30.0', 100, '2011-04-01 00:00:00.0', '2011-04-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.640000000000, NULL, 'A', '2011-06-10 14:47:49.0', 100, NULL, NULL, 1010332, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:47:49.0', 100, '2011-05-01 00:00:00.0', '2011-05-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.450000000000, NULL, 'A', '2011-06-10 14:48:33.0', 100, NULL, NULL, 1010333, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-10 14:48:33.0', 100, '2010-12-01 00:00:00.0', '2010-12-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000190, 0, NULL, 'A', '2011-03-25 16:19:16.0', 100, NULL, NULL, 1005373, 1000399, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-25 16:19:16.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000189, 0, NULL, 'A', '2011-03-25 16:19:36.0', 100, NULL, NULL, 1005374, 1000398, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-03-25 16:19:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2011-06-13 11:45:29.0', 100, NULL, NULL, 1010516, 1000095, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'N', '2011-06-13 11:45:29.0', 100, '2011-01-01 00:00:00.0', '2010-01-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000156, 0, NULL, 'A', '2011-06-17 15:31:20.0', 100, NULL, NULL, 1010554, 1000361, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-17 15:31:20.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000094, 0, NULL, 'A', '2010-11-19 16:42:50.0', 100, NULL, NULL, 1000432, 1000293, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-19 16:42:50.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000095, 0, NULL, 'A', '2010-11-22 08:13:36.0', 100, NULL, NULL, 1000433, 1000294, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-22 08:13:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000085, 0, NULL, 'A', '2010-11-22 09:03:58.0', 100, NULL, NULL, 1000434, 1000295, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-11-22 09:03:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000159, 0, NULL, 'A', '2010-12-07 10:19:58.0', 100, NULL, NULL, 1000509, 1000365, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 10:19:58.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000160, 0, NULL, 'A', '2010-12-07 10:21:47.0', 100, NULL, NULL, 1000512, 1000366, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 10:21:47.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000163, 0, NULL, 'A', '2010-12-07 11:44:15.0', 100, NULL, NULL, 1000515, 1000370, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 11:44:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000165, 0, NULL, 'A', '2010-12-07 13:57:33.0', 100, NULL, NULL, 1000517, 1000372, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 13:57:33.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000166, 0, NULL, 'A', '2010-12-07 14:23:37.0', 100, NULL, NULL, 1000518, 1000373, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 14:23:37.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000167, 0, NULL, 'A', '2010-12-07 14:37:15.0', 100, NULL, NULL, 1000519, 1000374, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 14:37:15.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000168, 0, NULL, 'A', '2010-12-07 14:44:36.0', 100, NULL, NULL, 1000520, 1000375, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 14:44:36.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000169, 0, NULL, 'A', '2010-12-07 14:49:40.0', 100, NULL, NULL, 1000521, 1000376, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 14:49:40.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000171, 0, NULL, 'A', '2010-12-07 15:11:25.0', 100, NULL, NULL, 1000525, 1000379, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 15:11:25.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000173, 0, NULL, 'A', '2010-12-07 15:23:35.0', 100, NULL, NULL, 1000527, 1000381, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 15:23:35.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000174, 0, NULL, 'A', '2010-12-07 15:55:16.0', 100, NULL, NULL, 1000529, 1000383, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 15:55:16.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000175, 0, NULL, 'A', '2010-12-07 16:09:23.0', 100, NULL, NULL, 1000530, 1000384, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 16:09:23.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000176, 0, NULL, 'A', '2010-12-07 16:13:17.0', 100, NULL, NULL, 1000531, 1000385, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-07 16:13:17.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000185, 0, NULL, 'A', '2010-12-08 08:01:26.0', 100, NULL, NULL, 1000540, 1000394, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 08:01:26.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000186, 0, NULL, 'A', '2010-12-08 08:08:46.0', 100, NULL, NULL, 1000541, 1000395, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 08:08:46.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000187, 0, NULL, 'A', '2010-12-08 08:14:06.0', 100, NULL, NULL, 1000542, 1000396, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 08:14:06.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000188, 0, NULL, 'A', '2010-12-08 08:46:10.0', 100, NULL, NULL, 1000544, 1000397, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 08:46:10.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000191, 0, NULL, 'A', '2010-12-08 09:37:32.0', 100, NULL, NULL, 1000547, 1000400, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 09:37:32.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000195, 0, NULL, 'A', '2010-12-08 11:26:49.0', 100, NULL, NULL, 1000551, 1000404, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 11:26:49.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000196, 0, NULL, 'A', '2010-12-08 11:35:30.0', 100, NULL, NULL, 1000552, 1000405, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-08 11:35:30.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000205, 0, NULL, 'A', '2010-12-13 11:41:07.0', 100, NULL, NULL, 1000562, 1000415, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-13 11:41:07.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000212, 0, NULL, 'A', '2010-12-15 11:18:06.0', 100, NULL, NULL, 1000567, 1000419, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-15 11:18:06.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000213, 0, NULL, 'A', '2010-12-15 12:54:33.0', 100, NULL, NULL, 1000569, 1000420, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2010-12-15 12:54:33.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000214, 0, NULL, 'A', '2011-06-17 10:04:53.0', 100, NULL, NULL, 1010553, 1000421, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-17 10:04:53.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2000005, 0, NULL, 'A', '2011-06-20 09:18:07.0', 100, NULL, NULL, 1010555, 1000488, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-20 09:18:07.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-06-20 16:08:40.0', 100, NULL, NULL, 1010556, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 1223.890000000000, NULL, NULL, '2011-06-20 16:08:40.0', 100, '2010-05-01 00:00:00.0', '2011-04-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-06-20 16:09:05.0', 100, NULL, NULL, 1010557, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 1407.470000000000, NULL, NULL, '2011-06-20 16:09:05.0', 100, '2011-05-01 00:00:00.0', '2011-08-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000273, 0, NULL, 'Q', '2011-06-21 11:10:31.0', 100, NULL, NULL, 1010577, 1000489, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-21 11:10:31.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 1000184, 0, NULL, 'A', '2011-06-21 15:44:59.0', 100, NULL, NULL, 1010578, 1000393, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2011-06-21 15:44:59.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:10:39.0', 100, NULL, NULL, 1000196, 1000105, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2012-04-18 15:55:19.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-11-04 14:58:50.0', 100, NULL, NULL, 1000354, 1000015, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 7.000000000000, NULL, NULL, '2012-04-18 09:19:53.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.090000000000, NULL, 'A', '2012-04-18 09:28:36.0', 100, NULL, NULL, 1012369, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:28:36.0', 100, '2011-06-01 00:00:00.0', '2011-06-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.520000000000, NULL, 'A', '2012-04-18 09:29:09.0', 100, NULL, NULL, 1012370, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:29:09.0', 100, '2011-07-01 00:00:00.0', '2011-07-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.940000000000, NULL, 'A', '2012-04-18 09:29:40.0', 100, NULL, NULL, 1012371, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:29:40.0', 100, '2011-08-01 00:00:00.0', '2011-08-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.000000000000, NULL, 'A', '2012-04-18 09:29:57.0', 100, NULL, NULL, 1012372, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:29:57.0', 100, '2011-09-01 00:00:00.0', '2011-09-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 16.390000000000, NULL, 'A', '2012-04-18 09:30:17.0', 100, NULL, NULL, 1012373, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:30:17.0', 100, '2011-10-01 00:00:00.0', '2011-10-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 15.430000000000, NULL, 'A', '2012-04-18 09:30:36.0', 100, NULL, NULL, 1012374, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:30:36.0', 100, '2011-11-01 00:00:00.0', '2011-11-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 15.030000000000, NULL, 'A', '2012-04-18 09:30:54.0', 100, NULL, NULL, 1012375, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:30:54.0', 100, '2011-12-01 00:00:00.0', '2011-12-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 15.700000000000, NULL, 'A', '2012-04-18 09:31:13.0', 100, NULL, NULL, 1012376, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:31:13.0', 100, '2012-01-01 00:00:00.0', '2012-01-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 15.180000000000, NULL, 'A', '2012-04-18 09:31:33.0', 100, NULL, NULL, 1012377, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:31:33.0', 100, '2012-02-01 00:00:00.0', '2012-02-29 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 14.970000000000, NULL, 'A', '2012-04-18 09:31:53.0', 100, NULL, NULL, 1012378, 1000256, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-18 09:31:53.0', 100, '2012-03-01 00:00:00.0', '2012-03-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'T', '2010-10-26 16:11:16.0', 100, NULL, NULL, 1000198, 1000107, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'N', '2012-04-18 09:33:55.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-06-20 16:09:31.0', 100, NULL, NULL, 1010558, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 1548.210000000000, NULL, NULL, '2012-04-18 09:35:20.0', 100, '2011-09-01 00:00:00.0', '2012-04-30 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2012-04-18 09:40:17.0', 100, NULL, NULL, 1012379, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 1780.450000000000, NULL, NULL, '2012-04-18 09:40:17.0', 100, '2012-05-01 00:00:00.0', '2012-08-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2012-04-18 09:40:48.0', 100, NULL, NULL, 1012380, 1000135, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 2047.520000000000, NULL, NULL, '2012-04-18 09:40:48.0', 100, '2012-09-01 00:00:00.0', '2012-08-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 1000000, 2000036, 0, NULL, 'Q', '2012-04-24 08:54:38.0', 100, NULL, NULL, 1013332, 1000147, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-04-24 08:54:38.0', 100, '2012-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 1000000, NULL, 0, NULL, 'D', '2012-07-25 11:16:54.0', 100, NULL, NULL, 1013827, 1000491, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, '2012-05-07 00:00:00.0', NULL, '2012-07-25 11:16:54.0', 100, '2012-05-07 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2011-01-19 10:38:04.0', 100, 'Superior a 1 mes ', NULL, 1000691, 1000257, NULL, NULL, NULL, NULL, 'Y', 'N', 179, 30, 7.000000000000, NULL, NULL, '2012-07-25 15:21:18.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, NULL, 0, NULL, 'Q', '2010-10-12 13:56:50.0', 100, NULL, NULL, 1000105, 1000099, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 10.000000000000, NULL, NULL, '2012-07-25 16:19:41.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 1000000, 2000101, 0, NULL, 'A', '2012-08-06 11:09:18.0', 100, NULL, NULL, 1013828, 1000492, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-08-06 11:09:18.0', 100, '2012-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 1000000, 1000170, 0, NULL, 'A', '2012-08-06 11:41:22.0', 100, NULL, NULL, 1013829, 1000493, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-08-06 11:41:22.0', 100, '2012-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 1000000, NULL, 0, NULL, 'A', '2012-08-06 15:47:39.0', 100, NULL, NULL, 1013830, 1000494, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-08-06 15:47:39.0', 100, '2011-01-01 00:00:00.0', '2011-12-31 00:00:00.0')
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 1000000, 2000102, 0, NULL, 'A', '2012-08-07 10:04:19.0', 100, NULL, NULL, 1013831, 1000495, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-08-07 10:04:19.0', 100, '2012-01-01 00:00:00.0', NULL)
;

COMMIT;

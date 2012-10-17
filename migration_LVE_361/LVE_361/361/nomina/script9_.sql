/*

Descripción: Consultas para crear las Unidades Tributarias
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
- Ejecutar los scripts

*/
BEGIN;


INSERT INTO adempiere.lve_tributary_unit(ad_client_id, ad_org_id, calendaryear, created, createdby, isactive, lve_tributary_unit_id, officialgazette, tributaryvalue, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2011, '2011-02-24 00:00:00.0', 100, 'Y', 1000001, '39623', 76.000000000000, '2011-02-24 00:00:00.0', 100, '2011-02-24 00:00:00.0', '2012-02-15 23:59:59.0')
;
INSERT INTO adempiere.lve_tributary_unit(ad_client_id, ad_org_id, calendaryear, created, createdby, isactive, lve_tributary_unit_id, officialgazette, tributaryvalue, updated, updatedby, validfrom, validto)
  VALUES(@ad_client_id, 0, 2012, '2012-02-16 00:00:00.0', 100, 'Y', 1000002, '39866', 90.000000000000, '2012-02-16 00:00:00.0', 100, '2012-02-16 00:00:00.0', NULL)
;

COMMIT;

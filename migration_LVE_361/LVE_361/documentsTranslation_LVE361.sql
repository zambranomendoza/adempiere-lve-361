-- Original contribution by 	Edickson Martínez – Pablo Ramirez
--Contributor(s): Jenny Cecilia Rodriguez - jrodriguez@dcsla.com for Double Click Sistemas C.A.
-- Date:      03/05/2012
-- Note: if you want to run script , you must  replaced all occurrences @ID_CLIENT@  the company that is creating
-- Example for GardenAdmin el @ID_CLIENT@ you should change  to 11


-- Function: update_traduct(integer)

-- DROP FUNCTION update_traduct(integer);
BEGIN;


CREATE OR REPLACE FUNCTION update_traduct(client_id integer)
  RETURNS integer AS
$BODY$
/*************************************************************************
* Equipo SIGFAS – Venezuela
*************************************************************************
* Title:          Traducir los documentos al Español
* Description:    Actualiza la tabla c_doctype_trl pasandole el client_id del cliente.
* Autor(s):    	Edickson Martínez – Pablo Ramirez
* Contributor(s): Jenny Cecilia Rodriguez - jrodriguez@dcsla.com 
                  Double Click Sistemas http://www.dcsla.com
************************************************************************/
DECLARE
c_id integer := $1;
BEGIN
UPDATE c_doctype_trl SET name = tt.name, printname = tt.printname FROM
(SELECT gardens_trl.name, gardens_trl.printname, newclient.c_doctype_id  FROM c_doctype newclient inner join c_doctype gardens
on newclient.name = gardens.name
and newclient.ad_client_id = c_id
and gardens.ad_client_id = 11
inner join c_doctype_trl gardens_trl on gardens.c_doctype_id = gardens_trl.c_doctype_id
where gardens_trl.ad_language = 'es_VE') tt
where c_doctype_trl.c_doctype_id = tt.c_doctype_id;

UPDATE c_doctype_trl SET name='Asignación',printname='Asignación' WHERE name='Allocation' AND ad_client_id=c_id;
UPDATE c_doctype_trl SET name='Autorización Devolución Proveedor', printname='Autorización de Devolución de productos proveedor' WHERE name='MM Customer Return' AND ad_client_id=c_id;
UPDATE c_doctype_trl SET name='Ajuste de Inventario', printname='Inventario Físico de Material' WHERE name='Physical Inventory' AND ad_client_id=c_id;
UPDATE c_doctype_trl SET name='Cotización', printname='Oferta' WHERE name='Binding offer' AND ad_client_id=c_id;
UPDATE c_doctype_trl SET name='Oferta', printname='Cotización' WHERE name='Non binding offer' AND ad_client_id=c_id;
UPDATE c_doctype_trl SET name='Orden a Crédito', printname='Confirmación de orden' WHERE name='Credit Order' AND ad_client_id=c_id;
RETURN 1;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION update_traduct(integer) OWNER TO postgres;

Select update_traduct(@ID_CLIENT@);

COMMIT;


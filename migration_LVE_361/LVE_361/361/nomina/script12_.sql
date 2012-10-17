/*

Descripción: Consultas para crear las funciones usadas en nómina
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Ejecutar los scripts

*/

BEGIN;

CREATE OR REPLACE FUNCTION adempiere.lve_birthday (in parameter_end_date timestamp, in birthday timestamp) RETURNS timestamp AS
$BODY$
DECLARE valor_mes varchar;
DECLARE valor_dia varchar;
DECLARE valor_anno varchar;
DECLARE cadena varchar;
DECLARE cadena2 varchar;
DECLARE fecha_hasta varchar;
DECLARE fecha_hasta_menor varchar;
DECLARE temporal integer;
DECLARE retorno timestamp;
DECLARE retorno2 timestamp;
DECLARE retorno_final timestamp;
BEGIN
	
SELECT INTO valor_mes extract(month  from birthday);     

SELECT INTO valor_dia extract(day  from birthday);

SELECT INTO valor_anno extract(year  from birthday); 

SELECT INTO fecha_hasta extract(year from parameter_end_date);

SELECT INTO temporal LENGTH(valor_mes);

IF temporal = 1
    THEN valor_mes:= '0' || valor_mes;
END IF;

SELECT INTO temporal LENGTH(valor_dia);

IF temporal = 1
    THEN valor_dia:= '0' || valor_dia;
END IF;

SELECT INTO cadena (valor_dia || '/' || valor_mes || '/' || fecha_hasta);

SELECT INTO retorno to_timestamp(cadena,'DD/MM/YYYY');

fecha_hasta_menor:= fecha_hasta;
SELECT INTO temporal CAST(fecha_hasta_menor AS numeric);
fecha_hasta_menor:= temporal + 1;
SELECT INTO cadena2 CAST(fecha_hasta_menor AS varchar);
SELECT INTO cadena2 (valor_dia || '/' || valor_mes || '/' || fecha_hasta_menor);
SELECT INTO retorno2 to_timestamp(cadena2,'DD/MM/YYYY');

IF valor_anno < fecha_hasta
    THEN retorno_final:= retorno;
ELSE
    retorno_final:= retorno2;
END IF;

RETURN retorno_final;

END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_convertdate (in p_date float8) RETURNS varchar AS
$BODY$
DECLARE valor varchar;
BEGIN  

        SELECT INTO valor CASE WHEN p_date = 1  THEN 'ENERO'
                               WHEN p_date = 2  THEN 'FEBRERO'
                               WHEN p_date = 3  THEN 'MARZO'
                               WHEN p_date = 4  THEN 'ABRIL'
                               WHEN p_date = 5  THEN 'MAYO'
                               WHEN p_date = 6  THEN 'JUNIO'
                               WHEN p_date = 7  THEN 'JULIO'
                               WHEN p_date = 8  THEN 'AGOSTO'
                               WHEN p_date = 9  THEN 'SEPTIEMBRE'
                               WHEN p_date = 10 THEN 'OCTUBRE'
                               WHEN p_date = 11 THEN 'NOVIEMBRE'
                               WHEN p_date = 12 THEN 'DICIEMBRE'END;


IF valor IS NULL THEN valor:='';
END IF ;

RETURN valor;

END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_daysnotice (in c_invoice_id numeric) RETURNS timestamp AS
$BODY$
DECLARE valor TimeStamp;
BEGIN
	
    SELECT INTO valor MAX(duedate) 
           FROM c_invoicepayschedule cs
           WHERE cs.c_invoice_id='1000013';
    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_daysnotice (in p_ad_client_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_notice bpchar) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN
	
    SELECT INTO valor sum(Daysbetween(Least(( mo.validfrom + mo.qty - 1 ),p_To), Greatest(mo.validfrom,p_From)) + 1) AS days
    from hr_movement mo inner join hr_concept co on mo.hr_concept_id = co.hr_concept_id and co.isregistered = 'Y'
    WHERE  
    ( ( mo.validfrom BETWEEN p_From AND p_To ) 
    OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN p_From AND p_To ) 
    OR ( p_From BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) 
    OR ( p_To BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id)
    AND (co.value = p_notice);
    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_daysnoticecategory (in p_ad_client_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_category bpchar) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN
	
    SELECT INTO valor SUM(Daysbetween(Least(( mo.validfrom + mo.qty - 1 ),p_To), Greatest(mo.validfrom,p_From)) + 1) AS days
    FROM hr_movement mo INNER JOIN hr_concept co ON mo.hr_concept_id = co.hr_concept_id AND co.isregistered = 'Y'
    INNER JOIN hr_concept_category cc ON co.hr_concept_category_id = cc.hr_concept_category_id
    WHERE  
    ( ( mo.validfrom BETWEEN p_From AND p_To ) 
    OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN p_From AND p_To ) 
    OR ( p_From BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) 
    OR ( p_To BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id)
    AND (cc.value = p_category);
    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_daysnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_notice bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days SUM(Daysbetween(Least(( mo.validfrom + mo.qty - 1 ),p_to), Greatest(mo.validfrom, p_from)) + 1) -    
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest)) -
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_movement mo 
    INNER JOIN hr_concept co 
    ON mo.hr_concept_id = co.hr_concept_id AND co.isregistered = 'Y'
    WHERE  
    ( ( mo.validfrom BETWEEN p_from AND p_to) 
    OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN p_from AND p_to) 
    OR ( p_from BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) 
    OR ( p_to BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id)
    AND (co.value = p_notice);
    SELECT INTO days CASE WHEN days IS NULL THEN 0 ELSE days END;
    RETURN days;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_daysrest (in p_from timestamptz, in p_to timestamptz, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE valor numeric;
DECLARE fecha timestamptz;
BEGIN
	valor := 0;
    fecha := p_from;
    LOOP
        IF (date_part('dow',fecha) IN (0,p_dayrest)) THEN
           valor := valor + 1;
        END IF;
        fecha:= fecha + 1;
        EXIT WHEN (fecha > p_to);
    END LOOP;    
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_daysrestnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_concept_category bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_movement mo 
    INNER JOIN hr_concept co 
    ON mo.hr_concept_id = co.hr_concept_id AND co.isregistered = 'Y'
    INNER JOIN hr_concept_category ca
    ON co.hr_concept_category_id = ca.hr_concept_category_id
    WHERE  
    ( ( mo.validfrom BETWEEN p_from AND p_to) 
    OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN p_from AND p_to) 
    OR ( p_from BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) 
    OR ( p_to BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id)
    AND (ca.value = p_concept_category);
    IF (days is null) THEN
        days := 0;
    END IF;
    RETURN days;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_daysvaconperiod (in p_ad_client_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN
	SELECT INTO valor SUM(tt.days) FROM (
    SELECT Daysbetween(Least(mo.validto,p_to), Greatest(mo.validfrom,p_from)) + 1 AS days
    FROM hr_movement mo 
    INNER JOIN hr_process pr ON mo.hr_process_id = pr.hr_process_id
    INNER JOIN hr_employee em ON pr.hr_payroll_id = em.hr_payroll_id AND mo.c_bpartner_id = em.c_bpartner_id
    INNER JOIN hr_payroll pa ON em.hr_payroll_id = pa.hr_payroll_id 
    INNER JOIN hr_contract co ON pa.hr_contract_id = co.hr_contract_id
    WHERE ((mo.validfrom BETWEEN p_from AND p_to AND mo.validto BETWEEN p_from AND p_to) 
    OR  (mo.validfrom BETWEEN p_from AND p_to AND mo.validto >= p_to)
    OR  (mo.validto BETWEEN p_from AND p_to AND mo.validfrom <= p_from)
    OR  (p_from BETWEEN mo.validfrom AND mo.validto AND p_to BETWEEN mo.validfrom AND mo.validto))
    AND (mo.isactive = 'Y') AND (mo.processed = 'Y') 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id) 
    AND (co.value = 'Vacaciones')
    GROUP BY mo.validfrom, mo.validto) tt;
    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_holidaysinperiod (in p_hr_payroll_id numeric, in p_from timestamptz, in p_to timestamptz, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE dValue decimal;
BEGIN	
    SELECT INTO dValue count(T.*)
    FROM (  SELECT nb.date1
            FROM hr_payroll pa 
            INNER JOIN hr_year ye ON pa.hr_payroll_id = ye.hr_payroll_id 
            INNER JOIN c_calendar ca ON ye.c_calendar_id = ca.c_calendar_id
            INNER JOIN c_nonbusinessday nb ON ca.c_calendar_id = nb.c_calendar_id 
            WHERE date1 BETWEEN p_from AND p_to
            AND nb.isactive = 'Y' 
            AND pa.hr_payroll_id = p_hr_payroll_id
            AND date_part('dow',nb.date1) NOT IN (0,p_dayrest)
            GROUP BY nb.date1  ) T;
    SELECT INTO dValue CASE WHEN dValue IS NULL THEN 0 ELSE dValue END;
    RETURN dValue;
END;
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_holidaysnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_concept_category bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_movement mo 
    INNER JOIN hr_concept co 
    ON mo.hr_concept_id = co.hr_concept_id AND co.isregistered = 'Y'
    INNER JOIN hr_concept_category ca
    ON co.hr_concept_category_id = ca.hr_concept_category_id
    WHERE  
    ( ( mo.validfrom BETWEEN p_from AND p_to) 
    OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN p_from AND p_to) 
    OR ( p_from BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) 
    OR ( p_to BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id)
    AND (ca.value = p_concept_category);
    SELECT INTO days CASE WHEN days IS NULL THEN 0 ELSE days END;
    RETURN days;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_holidaysrestnoticecategory (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_category bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest)) +
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_movement mo 
    INNER JOIN hr_concept co 
    ON mo.hr_concept_id = co.hr_concept_id AND co.isregistered = 'Y'
    INNER JOIN hr_concept_category cc 
    ON co.hr_concept_category_id = cc.hr_concept_category_id
    WHERE  
    ( ( mo.validfrom BETWEEN p_from AND p_to) 
    OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN p_from AND p_to) 
    OR ( p_from BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) 
    OR ( p_to BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id)
    AND (cc.value = p_category);
    SELECT INTO days CASE WHEN days IS NULL THEN 0 ELSE days END;
    RETURN days;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_holidaysrestnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_notice bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest)) +
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_movement mo 
    INNER JOIN hr_concept co 
    ON mo.hr_concept_id = co.hr_concept_id AND co.isregistered = 'Y'
    WHERE  
    ( ( mo.validfrom BETWEEN p_from AND p_to) 
    OR ( ( mo.validfrom + mo.qty - 1 ) BETWEEN p_from AND p_to) 
    OR ( p_from BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 ) ) 
    OR ( p_to BETWEEN mo.validfrom AND ( mo.validfrom + mo.qty - 1 )) ) 
    AND (mo.ad_client_id = p_ad_client_id) 
    AND (mo.c_bpartner_id = p_c_bpartner_id)
    AND (co.value = p_notice);
    SELECT INTO days CASE WHEN days IS NULL THEN 0 ELSE days END;
    RETURN days;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_isnull (in p1 numeric, in p2 numeric) RETURNS numeric AS
$BODY$
DECLARE resultado numeric;
BEGIN	
    SELECT INTO resultado CASE p1 is null WHEN true THEN p2 ELSE p1 END;
    RETURN resultado;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_paid_loan (in parameter_lve_loan_employee_payment varchar) RETURNS varchar AS
$BODY$
DECLARE valor varchar;
BEGIN

IF 	parameter_lve_loan_employee_payment = 's' OR parameter_lve_loan_employee_payment = 'S'
    THEN valor:= 'Y';
ELSE IF parameter_lve_loan_employee_payment = 'n' OR parameter_lve_loan_employee_payment = 'N'
        THEN valor:= 'N';
     END IF;
END IF;

RETURN valor;

END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_quota (in p_c_bpart numeric, in p_loan_emplo numeric, in p_start_date timestamp, in p_court_date timestamp) RETURNS numeric AS
$BODY$
DECLARE valor numeric;
BEGIN
	
    SELECT INTO valor count(lle.lve_loan_employee_id)
from lve_loan_quotas llq inner join lve_loan_employee lle 
on llq.lve_loan_employee_id=lle.lve_loan_employee_id

where lle.c_bpartner_id=p_c_bpart 
and lle.lve_loan_employee_id=p_loan_emplo
and llq.date1 between p_start_date and p_court_date;
      IF valor is null then 
        valor:=0;
      
      END IF ;
     RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_records_islr (in p_anho numeric, in p_hr_department_id numeric, in p_c_bpartner_id numeric, in p_hr_contract_id numeric) RETURNS SETOF record AS
$BODY$
	DECLARE
	    r RECORD;
	BEGIN
	    FOR r IN
	         SELECT
                lve_convertdate(date_part('month',hr_movement."validfrom")) AS Meses,
                ad_user."name" AS ad_user_name,
                hr_movement."c_bpartner_id" AS hr_movement_c_bpartner_id,
                CAST(c_bpartner."taxid" AS numeric) AS c_bpartner_taxid,
                to_char(CURRENT_TIMESTAMP, 'dd/mm/yyyy    HH12:MI:SS')||' a.m.' AS fecha_actual,
                ad_orginfo."taxid" AS ad_orginfo_taxid,
                ad_orginfo."phone" AS ad_orginfo_phone,
                hr_movement."amount" AS hr_movement_amount,
                lve_addres(ad_orginfo."c_location_id") AS direccion,
                ad_org."name" AS ad_org_name,
                lve_valueattribute('','','','CC_IMPUESTO_SOBRE_LA_RENTA',hr_movement."c_bpartner_id",hr_movement."validfrom",2) AS Impuesto_Retenido,
                lve_valueattribute('','','','A_FACTOR_ISLR',hr_movement."c_bpartner_id",hr_movement."validfrom",2) AS Porcentaje_Retencion,
                CAST(date_part('year',hr_movement."validfrom") AS INT4) AS Anno,
                CAST(date_part('month',hr_movement."validfrom") AS INT4) AS Mes
          FROM
                hr_movement
                INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
                INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
                INNER JOIN hr_employee ON hr_employee."c_bpartner_id" = c_bpartner."c_bpartner_id"
                INNER JOIN ad_user ON ad_user."c_bpartner_id" = c_bpartner."c_bpartner_id"
                INNER JOIN hr_payroll ON hr_payroll."hr_payroll_id" = hr_employee."hr_payroll_id"
                INNER JOIN hr_contract ON hr_contract."hr_contract_id" = hr_payroll."hr_contract_id"
                INNER JOIN hr_department ON hr_department."hr_department_id" = hr_employee."hr_department_id"
                INNER JOIN ad_org ON c_bpartner."ad_org_id" = ad_org."ad_org_id"
                INNER JOIN ad_orginfo ON  ad_orginfo."ad_org_id" = ad_org."ad_org_id"
          WHERE
                hr_contract."name" IN ('Quincenal','Semanal','Mensual')
                AND hr_concept."isoption1" = 'Y'
                AND date_part('year',hr_movement."validfrom") = p_anho
                AND (p_hr_department_id IS NULL  OR p_hr_department_id = hr_department."hr_department_id")
                AND (p_c_bpartner_id IS NULL  OR p_c_bpartner_id = hr_movement."c_bpartner_id")
                AND (p_hr_contract_id IS NULL  OR p_hr_contract_id = hr_contract."hr_contract_id")
          GROUP BY
                ad_user."name",
                c_bpartner."taxid",
                ad_orginfo."taxid",
                ad_orginfo."phone",
                hr_movement.amount,
                ad_orginfo."c_location_id",
                ad_org."name",
                hr_movement."c_bpartner_id",
                hr_movement."validfrom"
	    LOOP
	        RETURN NEXT r;
	    END LOOP;
	RETURN;
	END;
	$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_records_islr (in p_anho int4, in p_hr_department_id numeric, in p_c_bpartner_id numeric, in p_hr_contract_id numeric) RETURNS SETOF record AS
$BODY$
	DECLARE
	    r RECORD;
	BEGIN
	    FOR r IN
	         SELECT
                lve_convertdate(date_part('month',hr_movement."validfrom")) AS Meses,
                ad_user."name" AS ad_user_name,
                hr_movement."c_bpartner_id" AS hr_movement_c_bpartner_id,
                CAST(c_bpartner."taxid" AS numeric) AS c_bpartner_taxid,
                to_char(CURRENT_TIMESTAMP, 'dd/mm/yyyy    HH12:MI:SS')||' a.m.' AS fecha_actual,
                ad_orginfo."taxid" AS ad_orginfo_taxid,
                ad_orginfo."phone" AS ad_orginfo_phone,
                hr_movement."amount" AS hr_movement_amount,
                lve_addres(ad_orginfo."c_location_id") AS direccion,
                ad_org."name" AS ad_org_name,
                lve_valueattribute('','','','CC_IMPUESTO_SOBRE_LA_RENTA',hr_movement."c_bpartner_id",hr_movement."validfrom",2) AS Impuesto_Retenido,
                lve_valueattribute('','','','A_FACTOR_ISLR',hr_movement."c_bpartner_id",hr_movement."validfrom",2) AS Porcentaje_Retencion,
                CAST(date_part('year',hr_movement."validfrom") AS INT4) AS Anno,
                CAST(date_part('month',hr_movement."validfrom") AS INT4) AS Mes
          FROM
                hr_movement
                INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
                INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
                INNER JOIN hr_employee ON hr_employee."c_bpartner_id" = c_bpartner."c_bpartner_id"
                INNER JOIN ad_user ON ad_user."c_bpartner_id" = c_bpartner."c_bpartner_id"
                INNER JOIN hr_payroll ON hr_payroll."hr_payroll_id" = hr_employee."hr_payroll_id"
                INNER JOIN hr_contract ON hr_contract."hr_contract_id" = hr_payroll."hr_contract_id"
                INNER JOIN hr_department ON hr_department."hr_department_id" = hr_employee."hr_department_id"
                INNER JOIN ad_org ON c_bpartner."ad_org_id" = ad_org."ad_org_id"
                INNER JOIN ad_orginfo ON  ad_orginfo."ad_org_id" = ad_org."ad_org_id"
          WHERE
                hr_contract."name" IN ('Quincenal','Semanal','Mensual')
                AND hr_concept."isoption1" = 'Y'
                AND date_part('year',hr_movement."validfrom") = p_anho
                AND (p_hr_department_id IS NULL  OR p_hr_department_id = hr_department."hr_department_id")
                AND (p_c_bpartner_id IS NULL  OR p_c_bpartner_id = hr_movement."c_bpartner_id")
                AND (p_hr_contract_id IS NULL  OR p_hr_contract_id = hr_contract."hr_contract_id")
          GROUP BY
                ad_user."name",
                c_bpartner."taxid",
                ad_orginfo."taxid",
                ad_orginfo."phone",
                hr_movement.amount,
                ad_orginfo."c_location_id",
                ad_org."name",
                hr_movement."c_bpartner_id",
                hr_movement."validfrom"
	    LOOP
	        RETURN NEXT r;
	    END LOOP;
	RETURN;
	END;
	$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_retentiondatefunction (in p_date timestamp, in p_c_bpartner numeric) RETURNS numeric AS
$BODY$
DECLARE valor_mes_ciclo varchar;
DECLARE valor_control varchar;
DECLARE suma numeric;
DECLARE acumulador numeric;
DECLARE valor_dia_ciclo numeric;
DECLARE temporal timestamp;
DECLARE temporal2 timestamp;
registro hr_movement%ROWTYPE;
BEGIN

select into registro hr_movement."amount"
    FROM hr_movement 
    INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
    INNER JOIN c_bpartner ON c_bpartner.c_bpartner_id = hr_movement.c_bpartner_id
    where hr_concept."isoption1" = 'Y'
    and c_bpartner.c_bpartner_id = p_c_bpartner
    and hr_movement.validfrom = p_date;
	
acumulador := registro[2].amount;
  

RETURN acumulador;

END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_retroactivevalue (in p_hr_process_id numeric, in p_hr_department_id numeric, in p_c_bpartner_id numeric, in p_amount numeric, in p_to timestamptz, in p_ad_org_id numeric) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN	
    SELECT INTO valor hr_attribute.amount - p_amount -lve_valueconcept(p_hr_process_id,p_hr_department_id,'CC_SUELDO_RETROACTIVO',p_c_bpartner_id)
    FROM hr_concept INNER JOIN hr_attribute 
    ON hr_concept.hr_concept_id = hr_attribute.hr_concept_id
    WHERE hr_concept.value = 'A_SUELDO_MENSUAL_VEB' 
    AND hr_attribute.c_bpartner_id=p_c_bpartner_id
    AND 
    (
    (hr_attribute.validfrom<=p_to AND p_to<=hr_attribute.validto) 
    OR
    (hr_attribute.validfrom<=p_to AND hr_attribute.validto IS NULL)
    ) 
    AND hr_attribute.ad_org_id = p_ad_org_id;
    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_subscription_fee (in lve_loan_employee_id numeric, in start_date timestamp, in end_date timestamp, in lve_loan_employee_dateloan timestamp, in p_opcion numeric) RETURNS numeric AS
$BODY$
DECLARE valor numeric;
BEGIN



IF p_opcion = 1   
    THEN
        SELECT INTO valor sum(lve_loan_quotas.amount)
        FROM
            lve_loan_quotas
        WHERE      
            lve_loan_quotas.lve_loan_employee_id = lve_loan_employee_id
            AND lve_loan_quotas.date1 between start_date AND end_date
        GROUP BY lve_loan_quotas.lve_loan_employee_id
        ORDER BY lve_loan_quotas.lve_loan_employee_id DESC;

     ELSE
         SELECT INTO valor sum(lve_loan_quotas.amount)
         FROM
             lve_loan_quotas 
             INNER JOIN lve_loan_employee ON lve_loan_employee.lve_loan_employee_id = lve_loan_quotas.lve_loan_employee_id
         WHERE      
             lve_loan_quotas.lve_loan_employee_id = lve_loan_employee_id
             AND lve_loan_employee.dateloan = lve_loan_employee_dateloan;      
END IF; 

IF valor IS NULL THEN valor:=0;
END IF;

     RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_sumvaluepayroll (in p_c_bpartner_id numeric, in p_hr_process_id numeric, in p_type bpchar) RETURNS numeric AS
$BODY$
DECLARE valor numeric;
BEGIN
	
    SELECT INTO valor SUM(CASE WHEN m.columntype = 'A' THEN m.amount ELSE m.qty END)  
    FROM hr_movement m 
    WHERE m.isprinted = 'Y' AND m.accountsign = p_type AND m.c_bpartner_id = p_c_bpartner_id 
    AND m.hr_process_id = p_hr_process_id;

    RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_valueattribute_date_operation (in p_cbpartner_taxid varchar, in p_contract varchar, in p_department varchar, in p_concept varchar, in p_c_bpartner_id numeric, in p_date timestamp) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN
	SELECT INTO valor CASE WHEN hr_concept.columntype = 'Q' THEN qty ELSE amount END 
    FROM hr_attribute inner join hr_concept on hr_attribute.hr_concept_id = hr_concept.hr_concept_id
    INNER JOIN c_bpartner ON hr_attribute.c_bpartner_id = c_bpartner.c_bpartner_id
    INNER JOIN ad_user ON ad_user.c_bpartner_id = c_bpartner.c_bpartner_id
    INNER JOIN hr_employee ON hr_employee.c_bpartner_id = c_bpartner.c_bpartner_id
    INNER JOIN hr_department ON hr_department.hr_department_id = hr_employee.hr_department_id
    INNER JOIN hr_payroll ON hr_payroll.hr_payroll_id = hr_employee.hr_payroll_id
    INNER JOIN hr_contract ON hr_contract.hr_contract_id = hr_payroll.hr_contract_id
where
    hr_attribute.c_bpartner_id=p_c_bpartner_id
AND hr_concept."value" = p_concept
AND hr_attribute."validfrom" = p_date - interval '1 month'; 
    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_valueattribute (in p_cbpartner_taxid varchar, in p_contract varchar, in p_department varchar, in p_concept varchar, in p_c_bpartner_id numeric, in p_date timestamp, in p_opcion numeric) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN

    IF p_opcion = 1
        THEN
            SELECT INTO valor CASE WHEN hr_concept.columntype = 'Q' THEN qty ELSE amount END 
            FROM hr_attribute inner join hr_concept on hr_attribute.hr_concept_id = hr_concept.hr_concept_id
            INNER JOIN c_bpartner ON hr_attribute.c_bpartner_id = c_bpartner.c_bpartner_id
            INNER JOIN ad_user ON ad_user.c_bpartner_id = c_bpartner.c_bpartner_id
            INNER JOIN hr_employee ON hr_employee.c_bpartner_id = c_bpartner.c_bpartner_id
            INNER JOIN hr_department ON hr_department.hr_department_id = hr_employee.hr_department_id
            INNER JOIN hr_payroll ON hr_payroll.hr_payroll_id = hr_employee.hr_payroll_id
            INNER JOIN hr_contract ON hr_contract.hr_contract_id = hr_payroll.hr_contract_id
            WHERE
                hr_concept.VALUE = p_concept
                AND (hr_attribute.c_bpartner_id=p_c_bpartner_id OR hr_attribute.c_bpartner_id = NULL)
                AND ((p_date BETWEEN hr_attribute.validfrom AND hr_attribute.validto) 
                OR (hr_attribute.validfrom <= p_date AND hr_attribute.validto IS NULL));
         
     ELSEIF p_opcion = 2
          THEN
            SELECT INTO valor CASE WHEN hr_concept.columntype = 'Q' THEN qty ELSE amount END 
            FROM hr_movement inner join hr_concept on hr_movement.hr_concept_id = hr_concept.hr_concept_id
            INNER JOIN c_bpartner ON hr_movement.c_bpartner_id = c_bpartner.c_bpartner_id
            INNER JOIN ad_user ON ad_user.c_bpartner_id = c_bpartner.c_bpartner_id
            INNER JOIN hr_employee ON hr_employee.c_bpartner_id = c_bpartner.c_bpartner_id
            INNER JOIN hr_department ON hr_department.hr_department_id = hr_employee.hr_department_id
            INNER JOIN hr_payroll ON hr_payroll.hr_payroll_id = hr_employee.hr_payroll_id
            INNER JOIN hr_contract ON hr_contract.hr_contract_id = hr_payroll.hr_contract_id
            WHERE
                hr_concept.VALUE = p_concept
                AND (hr_movement.c_bpartner_id=p_c_bpartner_id OR hr_movement.c_bpartner_id = NULL)
                AND ((p_date BETWEEN hr_movement.validfrom AND hr_movement.validto) 
                OR (hr_movement.validfrom <= p_date AND hr_movement.validto IS NULL));

       ELSIF p_opcion = 3
           THEN
             SELECT INTO valor CASE WHEN hr_concept.columntype = 'Q' THEN qty ELSE amount END 
             FROM hr_attribute inner join hr_concept on hr_attribute.hr_concept_id = hr_concept.hr_concept_id
             WHERE
                hr_concept.VALUE = p_concept
                AND ((p_date BETWEEN hr_attribute.validfrom AND hr_attribute.validto) 
                OR (hr_attribute.validfrom <= p_date AND hr_attribute.validto IS NULL));
    END IF;

    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;

	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_valueconcept_socialsecurity (in p_hr_concept_value varchar, in p_c_bpartner_id numeric, in p_hr_movement_validto timestamp) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN

    IF p_hr_concept_value = 'CC_SEGURO_SOCIAL_OBLIGATORIO_TR'

	THEN SELECT INTO valor hr_movement."amount"
	     FROM
		    hr_movement 
    		    INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
    		    INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
	     WHERE
		    c_bpartner."c_bpartner_id" = p_c_bpartner_id 		    
            AND hr_movement."validto" = p_hr_movement_validto
		    AND hr_concept."value" = 'CC_SEGURO_SOCIAL_OBLIGATORIO_TR';

	 ELSIF p_hr_concept_value = 'CC_SEGURO_SOCIAL_OBLIGATORIO_PA'
     THEN SELECT INTO valor hr_movement."amount"
	     FROM
		    hr_movement 
    		    INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
    		    INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
	     WHERE
		    c_bpartner."c_bpartner_id" = p_c_bpartner_id 		    
            AND hr_movement."validto" = p_hr_movement_validto
		    AND hr_concept."value" = 'CC_SEGURO_SOCIAL_OBLIGATORIO_PA';

      ELSIF p_hr_concept_value = 'CC_REGIMEN_PRESTACIONAL_TR'
      THEN SELECT INTO valor hr_movement."amount"
	     FROM
		    hr_movement 
    		    INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
    		    INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
	     WHERE
		    c_bpartner."c_bpartner_id" = p_c_bpartner_id 		    
            AND hr_movement."validto" = p_hr_movement_validto
		    AND hr_concept."value" = 'CC_REGIMEN_PRESTACIONAL_TR';

        ELSIF  p_hr_concept_value = 'CC_REGIMEN_PRESTACIONAL_PA'
        THEN SELECT INTO valor hr_movement."amount"
	     FROM
		    hr_movement 
    		    INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
    		    INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
	     WHERE
		    c_bpartner."c_bpartner_id" = p_c_bpartner_id 		    
            AND hr_movement."validto" = p_hr_movement_validto
		    AND hr_concept."value" = 'CC_REGIMEN_PRESTACIONAL_PA';

        ELSIF p_hr_concept_value = 'CC_LEY_REG_PREST_VIV_HAB'
        THEN SELECT INTO valor hr_movement."amount"
	        FROM
                hr_movement 
                    INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
                    INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
            WHERE
                c_bpartner."c_bpartner_id" = p_c_bpartner_id 		    
                AND hr_movement."validto" = p_hr_movement_validto
                AND hr_concept."value" = 'CC_LEY_REG_PREST_VIV_HAB';

        ELSE
            SELECT INTO valor hr_movement."amount"
             FROM
                hr_movement 
                    INNER JOIN hr_concept ON hr_movement."hr_concept_id" = hr_concept."hr_concept_id"
                    INNER JOIN c_bpartner ON c_bpartner."c_bpartner_id" = hr_movement."c_bpartner_id"
             WHERE
                c_bpartner."c_bpartner_id" = p_c_bpartner_id 		    
                AND hr_movement."validto" = p_hr_movement_validto
                AND hr_concept."value" = 'CC_LEY_REG_PREST_VIV_HAB_PA';
        END IF;

    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_valueconcept (in p_hr_process_id numeric, in p_hr_department_id numeric, in p_concept varchar, in p_c_bpartner_id numeric) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN
	SELECT INTO valor CASE WHEN m.columntype = 'Q' THEN qty ELSE amount END AS value 
    FROM hr_movement m INNER JOIN hr_concept c 
    ON m.hr_concept_id = c.hr_concept_id
    WHERE m.hr_process_id = p_hr_process_id
        AND c.value = p_concept
    AND m.c_bpartner_id = p_c_bpartner_id;
    SELECT INTO valor CASE WHEN valor IS NULL THEN 0 ELSE valor END;
	RETURN valor;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE FUNCTION adempiere.lve_variablesalarytopexceeded (in p_ad_client_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_months int4) RETURNS numeric AS
$BODY$
DECLARE vcount DECIMAL;
DECLARE vresult DECIMAL;
DECLARE sinterval interval;
BEGIN	
    SELECT INTO sinterval (p_months-1)::bpchar || ' months';
    SELECT INTO vcount COUNT(*)
    FROM hr_concept c INNER JOIN hr_attribute a ON c.hr_concept_id = a.hr_concept_id
    WHERE c.value = 'A_SALARIO_VARIABLE_SUPERO_TOPE_BONO_ALIM'
    AND a.c_bpartner_id = p_c_bpartner_id
    AND a.textmsg = 'N'
    AND a.validfrom >=date(p_from - sinterval)
    AND a.ad_client_id = p_ad_client_id;
    SELECT INTO vresult CASE WHEN vcount > 0 THEN 0 ELSE 1 END;
    RETURN vresult;
END;	
$BODY$
LANGUAGE 'plpgsql'
;

CREATE OR REPLACE VIEW adempiere.hr_movement_employee_v
AS
SELECT hr_process.ad_client_id, hr_process.ad_org_id, hr_process.created, hr_process.createdby, hr_process.updated, hr_process.updatedby, hr_process.isactive, c_bpartner.name, lve_sumvaluepayroll(hr_movement.c_bpartner_id, hr_process.hr_process_id, 'D'::bpchar) AS assignments, lve_isnull(lve_sumvaluepayroll(hr_movement.c_bpartner_id, hr_process.hr_process_id, 'C'::bpchar), (0)::numeric) AS deductions, (lve_sumvaluepayroll(hr_movement.c_bpartner_id, hr_process.hr_process_id, 'D'::bpchar) - lve_isnull(lve_sumvaluepayroll(hr_movement.c_bpartner_id, hr_process.hr_process_id, 'C'::bpchar), (0)::numeric)) AS total, hr_movement.c_bpartner_id, hr_process.hr_process_id FROM ((hr_process JOIN hr_movement ON ((hr_process.hr_process_id = hr_movement.hr_process_id))) JOIN c_bpartner ON ((hr_movement.c_bpartner_id = c_bpartner.c_bpartner_id))) GROUP BY hr_process.ad_client_id, hr_process.ad_org_id, hr_process.created, hr_process.createdby, hr_process.updated, hr_process.updatedby, hr_process.isactive, hr_movement.c_bpartner_id, hr_process.hr_process_id, c_bpartner.name;
;

CREATE OR REPLACE VIEW adempiere.hrv_nomina
AS
SELECT m.c_bpartner_id, m.textmsg, m.description, m.hr_department_id, m.hr_concept_id, m.amount, m.validfrom, m.validto, m.isprinted, c.value AS des_concep0, c.name AS des_concep1, c.isregistered, c.description AS co_concep, c.columntype AS tipo, c.type, c.accountsign, e.name2, e.name, cb.value AS cedula, cb.name AS nombre, dp.name AS despartamento, e.startdate AS fecha_inicio, orgi.taxid, orgi.logo_id, m.ad_client_id, m.ad_org_id, (0)::numeric AS total_recibo, org.description AS empresa, m.hr_process_id, py.name AS contrato, p.name AS descrip_nomina, cb.taxid AS cedula1 FROM ((((((((hr_process p JOIN hr_movement m ON ((p.hr_process_id = m.hr_process_id))) JOIN hr_employee e ON (((m.c_bpartner_id = e.c_bpartner_id) AND (p.hr_payroll_id = e.hr_payroll_id)))) JOIN hr_concept c ON ((m.hr_concept_id = c.hr_concept_id))) JOIN c_bpartner cb ON ((e.c_bpartner_id = cb.c_bpartner_id))) JOIN hr_department dp ON ((dp.hr_department_id = e.hr_department_id))) JOIN ad_orginfo orgi ON ((orgi.ad_org_id = m.ad_client_id))) JOIN ad_org org ON ((org.ad_org_id = m.ad_org_id))) JOIN hr_payroll py ON ((py.hr_payroll_id = p.hr_payroll_id)));

COMMIT;


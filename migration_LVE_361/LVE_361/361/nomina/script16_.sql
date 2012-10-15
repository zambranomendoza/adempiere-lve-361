-- Original contribution by Ing. Jenny Cecilia Rodriguez for Double Click Sistemas, C.A.

BEGIN;

-- Función lve_daysnotice
CREATE OR REPLACE FUNCTION adempiere.lve_daysnotice (in p_ad_client_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_notice bpchar) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN
	
    SELECT into valor mo.amount + mo.qty AS days
    from hr_attribute mo inner join hr_concept co on mo.hr_concept_id = co.hr_concept_id and co.isregistered = 'Y'
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
-- Función lve_daysnoticecategory
CREATE OR REPLACE FUNCTION adempiere.lve_daysnoticecategory (in p_ad_client_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_category bpchar) RETURNS numeric AS
$BODY$
DECLARE valor decimal;
BEGIN
	
    SELECT into valor mo.amount + mo.qty AS days
    from hr_attribute mo inner join hr_concept co on mo.hr_concept_id = co.hr_concept_id and co.isregistered = 'Y'
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
-- Función lve_daysnoticeinperiod
CREATE OR REPLACE FUNCTION adempiere.lve_daysnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_notice bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days SUM(mo.amount + mo.qty) -    
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest)) -
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_attribute mo inner join hr_concept co on mo.hr_concept_id = co.hr_concept_id and co.isregistered = 'Y'
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
-- Función lve_daysrest
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
-- Función lve_daysrest2
CREATE OR REPLACE FUNCTION adempiere.lve_daysrest2 (in p_from timestamptz, in p_to timestamptz, in p_dayrest1 int4, in p_dayrest2 int4) RETURNS numeric AS
$BODY$
DECLARE valor numeric;
DECLARE fecha timestamptz;
BEGIN
	valor := 0;
    fecha := p_from;
    LOOP
        IF (date_part('dow',fecha) IN (p_dayrest1,p_dayrest2)) THEN
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
-- Función lve_daysrestnoticeinperiod
CREATE OR REPLACE FUNCTION adempiere.lve_daysrestnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_concept_category bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_attribute mo 
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
-- Función lve_holidaysinperiod
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
-- Función lve_holidaysinperiod2
CREATE OR REPLACE FUNCTION adempiere.lve_holidaysinperiod2 (in p_hr_payroll_id numeric, in p_from timestamptz, in p_to timestamptz, in p_dayrest1 int4, in p_dayrest2 int4) RETURNS numeric AS
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
            AND date_part('dow',nb.date1) NOT IN (p_dayrest1,p_dayrest2)
            GROUP BY nb.date1  ) T;
    SELECT INTO dValue CASE WHEN dValue IS NULL THEN 0 ELSE dValue END;
    RETURN dValue;
END;
$BODY$
LANGUAGE 'plpgsql'
;
-- Función lve_holidaysnoticeinperiod
CREATE OR REPLACE FUNCTION adempiere.lve_holidaysnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_concept_category bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_attribute mo 
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
-- Función lve_holidaysnoticeinperiod2
CREATE OR REPLACE FUNCTION adempiere.lve_holidaysnoticeinperiod2 (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_concept_category bpchar, in p_dayrest1 int4, in p_dayrest2 int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_holidaysinperiod2(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest1, p_dayrest2))
    FROM hr_attribute mo 
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
-- Función lve_holidaysrestnoticecategory
CREATE OR REPLACE FUNCTION adempiere.lve_holidaysrestnoticecategory (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_category bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest)) +
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_attribute mo 
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
-- Función lve_holidaysrestnoticeinperiod
CREATE OR REPLACE FUNCTION adempiere.lve_holidaysrestnoticeinperiod (in p_ad_client_id numeric, in p_hr_payroll_id numeric, in p_c_bpartner_id numeric, in p_from timestamptz, in p_to timestamptz, in p_notice bpchar, in p_dayrest int4) RETURNS numeric AS
$BODY$
DECLARE days DECIMAL;
BEGIN	
    SELECT INTO days
    SUM(lve_holidaysinperiod(p_hr_payroll_id,Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest)) +
    SUM(lve_daysrest(Greatest(mo.validfrom, p_from),Least(( mo.validfrom + mo.qty - 1 ),p_to), p_dayrest))
    FROM hr_attribute mo 
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
-- Actualización de reglas-----------------------------------------------------------------------------------
UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_BONO_PRODUCCION") != null)
{
   result = getAttribute("A_BONO_PRODUCCION");
}

'
WHERE value = 'beanshell:R_BONO_PRODUCCION'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

Timestamp DateIniEmp = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");


   Timestamp DateIniEmpFrom=DateIniEmp.clone() ;
   Timestamp DateIniEmpTo= DateIniEmp.clone() ;

   DateIniEmpFrom.setYear(_From.getYear());
   DateIniEmpTo.setYear(_To.getYear());

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 &&
   (  org.compiere.util.TimeUtil.isValid(_From, _To, DateIniEmpFrom) || 
   org.compiere.util.TimeUtil.isValid(_From, _To, DateIniEmpTo)
   ) &&
   getAttribute("C_MONTO_PAGAR_BONO_AÑOS_EMPRESA") > 0 && (DateIniEmp.getYear()< _From.getYear() || DateIniEmp.getYear()< _To.getYear() ) )
{
   result = getAttribute("C_MONTO_PAGAR_BONO_AÑOS_EMPRESA");
}'
WHERE value = 'beanshell:R_BONO_AÑOS_EMPRESA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

if (getConcept("CC_DIAS_ADIC_VAC_PAG_SIN_DISFRU") > 0)
{
     result = getConcept("CC_DIAS_ADIC_VAC_PAG_SIN_DISFRU") * getConcept("CC_SUELDO_DIARIO_VAC");
}

}'
WHERE value = 'beanshell:R_VACACIONES_PAGADAS_SIN_DISF'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_ANTICIPO_SUELDO") > 0)
   result = getAttribute("A_ANTICIPO_SUELDO");
'
WHERE value = 'beanshell:R_ANTICIPO_SUELDO'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if ("S".equals(getAttributeString("A_EMPLEADO_SINDICALIZADO"))  && getAttribute("C_MONTO_DESCONTAR_MONTEPIO")>0 && "S".equals(getAttributeString("C_DESCONTAR_MONTEPIO")) && getConcept("CC_APLICAR_CONCEPTO")==1.0)
     result=getAttribute("C_MONTO_DESCONTAR_MONTEPIO");
'
WHERE value = 'beanshell:R_MONTEPIO'
;

UPDATE adempiere.ad_rule 
SET script ='A_Tab.getField("isOption7").setDisplayed(A_Tab.getValue("isRegistered").equals(true));
		A_Tab.getField("isOption8").setDisplayed(A_Tab.getValue("isRegistered").equals(true));

result="";'
WHERE value = 'beanshell:Callout_IsRegistered'
;

UPDATE adempiere.ad_rule 
SET script ='int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sQuery = "select lve_daysnoticeinperiod(?,?,?,?,?,?,?)";

int days = DB.getSQLValue(get_TrxName(), sQuery, 
                 new Object[] { getAD_Client_ID(), _Payroll, _C_BPartner_ID, _From, _To, ''D_DIAS_DEDUCCION_SUSPENSION'', dayrest } );

return = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
	'
WHERE value = 'beanshell:R_DEDUCCION_SUSPENSION'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_DEDUCCION_SIN_CARACTER_SALARIAL") > 0)
   result = getAttribute("A_DEDUCCION_SIN_CARACTER_SALARIAL");'
WHERE value = 'beanshell:R_DED_SIN_CARACTER_SALARIAL'
;

UPDATE adempiere.ad_rule 
SET script ='

String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0;

if (( "Utilidades".equals(sContract) && getAttribute("C_DESC_CUOTA_SINDICAL_UTILIDADES")>0 ) ||  (getAttribute("C_DESC_CUOTA_SINDICAL_SUELDO")>0 && "S".equals(getAttributeString("A_EMPLEADO_SINDICALIZADO")) && getConcept("CC_APLICAR_CONCEPTO") ) ) {

     if ("Utilidades".equals(sContract))
          result= (getAttribute("C_DESC_CUOTA_SINDICAL_UTILIDADES")/100) * getConcept("CC_UTILIDADES");
     else
          if (!"Semanal".equals(sContract)) 
               result= getCOncept("CC_SUELDO_APLICAR_PERIODO") * (getAttribute("C_DESC_CUOTA_SINDICAL_SUELDO")/100);
          else 
               result= LVE_Payroll.dayOnPeriod(_From, _To)* (getAttribute("C_DESC_CUOTA_SINDICAL_SUELDO")/100);
     
}
'
WHERE value = 'beanshell:R_CUOTA_SINDICAL'
;

UPDATE adempiere.ad_rule 
SET script ='result=1.0; 
String msg=null;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

Double value1 = "S".equals(getAttributeString("C_PAGAR_INTERESES_PRESTACIONES_MENSUAL")) ? 
                           getConcept("CC_INTERESES_PREST_SOC_MENSUAL"):     
                           getConcept("CC_INTERESES_PREST_SOC_ANUALES");

if (value1>0) {
   msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_INTERESES_CANCELADOS",process, 
                                                                        new BigDecimal(getAttribute("A_MONTO_ACUM_INTERESES_CANCELADOS",date)+ value1), _C_BPartner_ID);
   if (msg != null)	
      result=0;
}
 '
WHERE value = 'beanshell:R_CIERRE_INTERES_PREST_PAG'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "S1" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}'
WHERE value = 'beanshell:R_PRESTAMO_ESTUDIO_LIQUIDACION'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "P1" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}'
WHERE value = 'beanshell:R_PRESTAMO_PERSONALES_LIQUIDAC'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp dateIni = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateEnd = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateResult = dateIni;

dateResult.setYear(dateEnd.getYear() - (dateEnd.getMonth() < dateIni.getMonth() ? 1 : 0));

result = dateResult.getTime();


'
WHERE value = 'beanshell:R_FEC_ING_CAL_VAC_FRAC'
;

UPDATE adempiere.ad_rule 
SET script ='boolean  value = "S".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES").toUpperCase()); 
     
result= value ? getConcept("CC_APLICAR_RETENCION_FINAL_MES"):getConcept("CC_NO_APLICAR_RETENCI_FINAL_MES");
'
WHERE value = 'beanshell:R_FECHA_INICIO_RETENCIONES'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();
long oneDay = 86400000;
String estatus =getAttributeString("A_ESTATUS_EMPLEADO");
result=0.0;

if (getConcept("CC_MESES_PARA_UTILIDADES")>0){
    if ("Prestaciones".equals(sContract))

         result=LVE_Payroll.sumConcept (get_TrxName(), "isOption5", _From, _To , _C_BPartner_ID, "Utilidades").doubleValue(); 

   Timestamp lastPayroll90=LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Utilidades''", true); 
   Timestamp lastPayrollWorked= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), _Payroll, true); 

   if (lastPayroll90!=null && lastPayrollWorked!=null ){

        Timestamp dateAxu=  estatus.trim().equals("PLIQ") ? LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"):lastPayrollWorked; 

         Double conceptUti= LVE_Payroll.sumConcept (get_TrxName(), "isOption5", new Timestamp (lastPayroll90.getTime()+oneDay), dateAxu , _C_BPartner_ID, "Utilidades").doubleValue();
    
    result=  conceptUti;
   
    }
}'
WHERE value = 'beanshell:R_MONTO_DEVENGADO_PERIODO_UTIL'
;

UPDATE adempiere.ad_rule 
SET script ='Double Hours = getConcept("CC_HORAS_JORNADA_TRABAJADOR");

if (getConcept("CC_CANCELAR_BONO_ALIMENTACION")==1.0 && getConcept("CC_APLICAR_CONCEPTO")==1.0 ){
 result= getConcept("CC_HORAS_BONO_ALIMENTACION") / Hours;
}
else{
  result= 0.0;
}
'
WHERE value = 'beanshell:R_DIAS_BONO_ALIMENTACION'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;

String sql = "SELECT lve_daysnotice(?,?,?,?,?)";
double days = DB.getSQLValue(get_TrxName(), sql , new Object[] { getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_INASISTENCIA_JUSTIFICADA"});

if (days != null && days > 0 && getConcept("CC_APLICA")==1.0)
   result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
description = "Días: "  + days;'
WHERE value = 'beanshell:R_ASIGNACION_INASISTENCIA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

String sql = "SELECT lve_daysnotice(?,?,?,?,?)";
double days = DB.getSQLValue(get_TrxName(), sql , new Object[] { getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_TURNO_NOCTURNO"});

if (days != null && days > 0 && getConcept("CC_APLICA")==1.0) {
	result = days * getConcept("CC_SUELDO_DIARIO") * getAttribute("C_RECARGO_POR_BONO_NOCTURNO") / 100;
	description = "Días: " + days;
}'
WHERE value = 'beanshell:R_BONO_NOCTURNO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;

String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Vacaciones".equals(sContract)) 
   result =(double) LVE_Payroll.workingDaysMonth(get_TrxName(), _From, _To,
                                                                                               _Payroll, ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(), _C_BPartner_ID);
else {
        String sql = "SELECT lve_daysvaconperiod(?,?,?,?)";
        result = DB.getSQLValue(get_TrxName(), sql, new Object[] {getAD_Client_ID(), _C_BPartner_ID, _From, _To});
}'
WHERE value = 'beanshell:R_DIAS_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0;

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     
   result=  !"Mensual".equals(getHR_Payroll().getHR_Contract().getName()) ? 1.0 : 0.0;

}

'
WHERE value = 'beanshell:R_TRABAJADOR_CON_ESTABI_LABOR'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HB" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}'
WHERE value = 'beanshell:R_PRESTAMO_COMPRA_VIVIENDA_LIQ'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if ((getConcept("CC_CANCELAR_BONO_ALIMENTACION")== 1.0 && getConcept("CC_APLICAR_CONCEPTO")== 1.0 ) &&  
     "S".equals(getAttributeString("C_CANCELAR_BONO_ALIMENTACION"))){
     result= getConcept("CC_MONTO_BONO_ALIMENTACION");
}'
WHERE value = 'beanshell:R_BONO_ALIMENTACION'
;

UPDATE adempiere.ad_rule 
SET script ='result=1.0;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);
Double value1= getConcept("CC_APORTE_FONDO_AHORRO_TRABAJAD");

if (value1 > 0){
    msg = LVE_Payroll.addValueConcept("A_TOT_MONTO_DISPONIBLE_FONDO_AHORRO ",process,
               new BigDecimal(getAttribute("A_MONTO_ACUM_FONDO_AHORRO", date)+getAttribute("A_MONT_ACUM_INI_FONDO_AHORRO", date)), _C_BPartner_ID);
    if (msg != null)	
       result=0.0;
}'
WHERE value = 'beanshell:R_ACT_TOT_DISP_FOND_AHO_CIERRE'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "OT" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}'
WHERE value = 'beanshell:R_PRESTAMO_OTROS_LIQUIDAC'
;

UPDATE adempiere.ad_rule 
SET script ='A_Tab.setValue("C_BPartneremp_ID",(@C_BPartnerEmp_ID));'
WHERE value = 'beanshell:BP_FijarInicial'
;

UPDATE adempiere.ad_rule 
SET script ='Float u=  ((new Float ( A_Tab.getValue("TimeEnd").getTime()-A_Tab.getValue("TimeStart").getTime()))/1000/3600)+A_Tab.getValue("dshoras");
A_Tab.setValue("ValueNumberHour",u);'
WHERE value = 'beanshell:BP_calculosHoras'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();
double valueReturn = 0;      
if (!"Vacaciones".equals(sContract) && !"Liquidacion".equals(sContract)) 
{

    double workDays =  (double) LVE_Payroll.workDays(get_TrxName(), _From, _To, _Payroll, ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(), sContract);
    description = "Días: " + workDays;
    valueReturn = workDays * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}

result = valueReturn;'
WHERE value = 'beanshell:R_SUELDO_APLICAR_PERIODO'
;

UPDATE adempiere.ad_rule 
SET script ='String sQuery = "SELECT COUNT(*) FROM LVE_ISICBYCATEGORY WHERE LVE_ISIC_ID = ? AND LVE_MUNICIPALITY_ID = ?";
Integer count = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {A_Tab.getValue("LVE_ISIC_ID"), A_Tab.getValue("LVE_MUNICIPALITY_ID")});'
WHERE value = 'beanshell:BP_Validar_Al_Eliminar_Tasa_Im'
;

UPDATE adempiere.ad_rule 
SET script ='double sueldo = getConcept("CC_SUELDO_MENSUAL");
result = sueldo / getAttribute("C_DIAS_DEL_MES");'
WHERE value = 'beanshell:R_SUELDO_DIARIO'
;

UPDATE adempiere.ad_rule 
SET script ='result = getConceptGroup("ASG_NOV");'
WHERE value = 'beanshell:R_DIAS_ASG_NOVEDADES_DIARIAS'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_ASIGNACION_CARACTER_SALARIAL") != null)
{
    result = getAttribute("A_ASIGNACION_CARACTER_SALARIAL");
}'
WHERE value = 'beanshell:R_ASIGNACION_CARACTER_SALARIAL'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double recargo = 1 + (getAttribute("C_RECARGO_POR_FERIADO_DIAS_DESCANSO") / 100);
double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
//double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_FERIADO_DIURNO");
double dias_adic = getAttribute("A_DIAS_ADIC_LABORADOS_FERIADO_DIURNO",_From, _To);
if (dias_adic != 0.0)
  description = "Dias Adicionales Feriados Diurnos: " + dias_adic;
result = sueldo_diario * dias_adic * recargo;
}'
WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_FER_DIURNO'
;

UPDATE adempiere.ad_rule 
SET script ='int dias = 0;
if (_DateEnd.after(_From) && _DateEnd.before(_To)) {
    dias = org.compiere.util.TimeUtil.getDaysBetween(_DateEnd, _To);
    if (_To.getDate() == 31)
        dias--; 
}       
result = dias;'
WHERE value = 'beanshell:R_DEDUCIR_DIAS_EGRESO'
;

UPDATE adempiere.ad_rule 
SET script ='int dias = 0;
if (_DateStart.after(_From) && _DateStart.before(_To)) {
    dias = org.compiere.util.TimeUtil.getDaysBetween(_From, _DateStart);
}       
result = dias;'
WHERE value = 'beanshell:R_DEDUCIR_DIAS_INGRESO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
    result = 1.0; 
    int dias_vacaciones = getConcept("CC_DIAS_VACACIONES");
    double sueldo = getConcept("CC_SUELDO_MENSUAL");
    if (_Days == dias_Vacaciones || sueldo == 0.0)
       result = 0.0; 
}'
WHERE value = 'beanshell:R_APLICAR_CONCEPTO'
;

UPDATE adempiere.ad_rule 
SET script ='String sConsulta = ""
+ "SELECT u.birthday "
+ "FROM   c_bpartner b "
+ "       inner join ad_user u "
+ "         ON b.c_bpartner_id = u.c_bpartner_id "
+ "WHERE  b.c_bpartner_id = ? "
+ "       AND u.isinpayroll = ''Y'' ";

Timestamp fecha_nacimiento = DB.getSQLValueTS(get_TrxName(),sConsulta,new Object[] {_C_BPartner_ID});

int meses = getMonths(fecha_nacimiento, _To);
int edad = meses / 12;
result = edad;'
WHERE value = 'beanshell:R_EDAD'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
String sContract = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContract);
double dDaysVac = getConcept("CC_DIAS_VACACIONES");

if  (!bCont_Vac || (bCont_Vac && dDaysVac>0))
{
   double Days = getAttribute("A_DIAS_DISFRUTE_VACACIONES_ESPECIALES");
   if (Days == null || Days == 0)
       Days = getAttribute("C_DIAS_BASE_DISFRUTE_VACACIONES");
   result = Days;
}'
WHERE value = 'beanshell:R_DIAS_BASE_DISFRUTE_VACAC'
;

UPDATE adempiere.ad_rule 
SET script ='result = 1.0;
String msg=null; 

if (getConcept("CC_MONTO_PRES_SOC_DIAS_ADIC") >0) {
     result=1.0;
     msg = LVE_Payroll.addValueConcept("A_VAL_INIC_DEV_ANUAL_SUELDO_ADIC_PRESTA",process,new BigDecimal(0),_C_BPartner_ID);
     if (msg != null)	
        result=0.0;
}					   
'
WHERE value = 'beanshell:R_CIERRE_VAL_INIC_ANU_SUEL_PRE'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;  /* falso, no aplicar */

// Se toman 4 dias, ya que representa la mayor parte de una semana
long lCuatroDias = 86400000 * 4;
int iMes_Actual = _From.getMonth();

Timestamp From = (Timestamp)_From.clone();
Timestamp To = (Timestamp)_To.clone();

From.setTime(From.getTime() + lCuatroDias);
To.setTime(To.getTime() + lCuatroDias);

if (From.getMonth() == iMes_Actual && To.getMonth()!=iMes_Actual)
   result = 1.0; /* verdadero aplicar */

  '
WHERE value = 'beanshell:R_ULTIMA_SEMANA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_ASIGNACION_SIN_CARACTER_SALARIAL") != null)
{
    result = getAttribute("A_ASIGNACION_SIN_CARACTER_SALARIAL");
}
'
WHERE value = 'beanshell:R_ASIGNACION_SIN_C_SALARIAL'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp From = _From;
Timestamp To = _To;

Timestamp dateEndMonth = LVE_Payroll.lastDayOfMonth(To);
result= org.compiere.util.TimeUtil.isValid(From ,To, dateEndMonth) ? 1.0: 0.0;  
'
WHERE value = 'beanshell:R_APLICAR_ULTIMA_NOMINA_MES'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;  /* falso, no aplicar */

String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContrato);
double dEdad = getConcept("CC_EDAD");
String sRetenerLRPVH = getAttributeString("A_RETENER_LRPVH");
String sAplicarRetLRPVH = getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES");
double dTopeEdadLRPVH = getAttribute("C_TOPE_EDAD_LRPVH");

if (("S".equals(sRetenerLRPVH) && dEdad<=dTopeEdadLRPVH) ||
   ("S".equals(sAplicarRetLRPVH) && getConcept("CC_ULTIMA_SEMANA") == 0 && bCont_Vac))
    result = 1.0; /* verdadero aplicar */



    '
WHERE value = 'beanshell:R_APLICAR_RETENCIONES_LRPVH'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     result= getAttribute("A_DIAS_ADICIONALES_LABORADOS") * getConcept("CC_SUELDO_DIARIO");   
}'
WHERE value = 'beanshell:R_DIAS_LABORADOS_FINIQ_RELACI'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_AUTOMOVILES");
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_AUTOMOVILES'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_HCM");
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_HCM'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
String sueldo_variable = getConceptString("A_SUELDO_VARIABLE");

if (sueldo_variable == null)
  sueldo_variable = "N";

double sueldo_diario;
if (sueldo_variable.equals("S")) {
  sueldo_diario = getConcept("CC_SUELDO_DIARIO_VARIABLE");
} else {
  sueldo_diario =(getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}

double recargo = getAttribute("C_RECARGO_POR_FERIADO_DIAS_DESCANSO") / 100;
double dias_desc_trab = getConcept("CC_DIAS_DESCANSO_TRABAJADO");

result = sueldo_diario * recargo * dias_desc_trab;
description = "Días: "  + dias_desc_trab;
}'
WHERE value = 'beanshell:R_RECARGO_DESCANSO_TRABAJADO'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_GASTOS_FUNERARIOS");
     if (result == null) result = 0.0;
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_GASTOS_FUNER'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp dateIni = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(),null);
Timestamp dateAtt = getAttributeDate("C_AÑO_CORTE_ANTIGUEDAD_L_O_T");
result = dateIni.getTime() < dateAtt.getTime() ? dateAtt.getTime() : dateIni.getTime();



'
WHERE value = 'beanshell:R_FECHA_INGRESO_ANTIGUEDAD'
;

UPDATE adempiere.ad_rule 
SET script ='import org.compiere.util.* ;

Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp from=_From; 
Timestamp to=_To;



result=((dateEndEmployee!=null)&&(TimeUtil.isValid(from,to, dateEndEmployee)))? (double) LVE_Payroll.workDays(get_TrxName(), from,dateEndEmployee , _Payroll, "0,"+  ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString()) - getConcept("CC_DIAS_DESCANSO_PERIODO") : 0;
'
WHERE value = 'beanshell:R_DIAS_NO_LABORABLES_POR_EGRE'
;

UPDATE adempiere.ad_rule 
SET script ='String contract=  getHR_Payroll().getHR_Contract().getValue();
Timestamp dateEndEmployee = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 

result = "Liquidacion".equals(contract) &&  getConcept("CC_POR_LIQUIDAR") ==1.0 
             ? LVE_Payroll.yearsElapsed(_DateStart, dateEndEmployee)
             :LVE_Payroll.yearsElapsed(_DateStart, _To) ; '
WHERE value = 'beanshell:R_AÑOS_ANTIGUEDAD'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_GASTOS_ODONTOLOGICOS");
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_GASTOS_ODON'
;

UPDATE AD_Rule SET Name='R_POR_LIQUIDAR', Value='beanshell:R_POR_LIQUIDAR',Updated=now(), UpdatedBy=100,
script='String estatus =getAttributeString("A_ESTATUS_EMPLEADO");

if (estatus == null)
    estatus="";
    
result= estatus.trim().equals("PLIQ") ?1.0:0.0;'
WHERE AD_Rule_ID=2000042 and value = 'beanshell:R_POR_LIQUIDAR'
;

UPDATE AD_Rule 
SET Value='beanshell:R_APLICA',name='R_APLICA',Updated=now(),UpdatedBy=100,description=null,
script='result=1.0; 

String Status =getAttributeString("A_ESTATUS_EMPLEADO");

if (Status.trim().equals("LIQU"))	
          result=0.0;'
WHERE AD_Rule_ID=1000273
;

UPDATE adempiere.ad_rule 
SET script ='
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "OT" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()),_Process );
	
'
WHERE value = 'beanshell:R_CUOTA_PRESTAMO_OTROS'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_ESCOLAR");
}



'
WHERE value = 'beanshell:R_CUOTA_POLIZA_ESCOLAR'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_EXCESO_CELULAR");
}



'
WHERE value = 'beanshell:R_EXCESO_CELULAR'
;

UPDATE adempiere.ad_rule 
SET script ='
long oneDay = 86400000;

if (getConcept("CC_APLICA_DIAS_ADIC_PREST")==1.0){

     result=(LVE_Payroll.yearsElapsed(new Timestamp( (Long) getConcept("CC_FECHA_INGRESO_ANTIGUEDAD") ),new Timestamp (_To.clone().getTime()-oneDay )) -(getAttribute("C_AÑOS_ANTIG_APLICAR_DIAS_ADIC_PRESTAC")  -1) )* getAttribute("C_DIAS_ADICIONALES_PRESTACIONES")  ;


}else
  result =0.0;

'
WHERE value = 'beanshell:R_DIAS_ADIC_PRESTACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='    
result =getAttribute("A_DIAS_UTILIDADES_CASOS_ESPECIALES")>0 
            ? getAttribute("A_DIAS_UTILIDADES_CASOS_ESPECIALES")
            : getAttribute("C_DIAS_UTILIDADES");

'
WHERE value = 'beanshell:R_DIAS_UTILIDADES_TRABAJADOR'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){

     result= getConcept("CC_SUELDO_DIARIO_VAC") * getAttribute("A_TOT_DIAS_DISPONIBLES_VACACIONES");

}'
WHERE value = 'beanshell:R_VACACIONES_PENDIENTES'
;

UPDATE adempiere.ad_rule 
SET script ='
if (getConcept("CC_DISFRUTAR_DIAS_ADIC_VAC")==1.0) {
 
         result=getConcept("A_DIAS_ADIC_VAC_PAGAR_SIN_DISFRUTE") <=getConcept("CC_DIAS_ADIC_VAC_DISPONIBLE" ) ? getConcept("A_DIAS_ADIC_VAC_PAGAR_SIN_DISFRUTE") :getConcept("CC_DIAS_ADIC_VAC_DISPONIBLE" ); 

}else{
        result =0;
}'
WHERE value = 'beanshell:R_DIAS_ADIC_VAC_PAG_SIN_DISFRU'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.1 && "S".equals(getAttributeString("C_CALCULAR_INTERES_PRESTACIONES")) ){
     result= getAttribute("A_MONTO_ACUM_INICIAL_PREST_SOCIALES") + getAttribute("A_MONTO_ACUM_PRESTACIONES_SOCIALES");  
}'
WHERE value = 'beanshell:R_PRESTACIONES_SOCI_FIDECOMISO'
;

UPDATE adempiere.ad_rule 
SET script ='
Integer quantityFamily= LVE_Payroll.numberDependent (get_TrxName(), _C_BPartner_ID, "Hija(o)", 19);
Integer topMax= getAttribute("C_TOPE_MAXIMO_HIJOS_PARA_PAGO_DE_PRIMA") ; 

result= quantityFamily > topMax ?  topMax: quantityFamily ; 
'
WHERE value = 'beanshell:R_NUMERO_HIJOS_PRIMA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
String sContract = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContract);
double dDaysVac = getConcept("CC_DIAS_VACACIONES");

if  (!bCont_Vac || (bCont_Vac && dDaysVac>0))
{
    double Days = getAttribute("A_DIAS_VACACIONES_PAGAR_CASO_ESP");
    if (Days == null || Days == 0)
        Days = getAttribute("C_DIAS_BASE_PAGAR_POR_VACACIONES");
    result = Days;
}'
WHERE value = 'beanshell:R_DIAS_BASE_PAGAR_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='
result =getConcept("A_ACUM_DIAS_ADIC_VACACIONES_CAUSADAS")-getConcept("A_ACUM_DIAS_ADIC_VACA_PAG_SIN_DISFRUT");

'
WHERE value = 'beanshell:R_DIAS_ADIC_VAC_DISPONIBLE'
;

UPDATE adempiere.ad_rule 
SET script ='
result= (getConcept("CC_APLICAR_CAL_AÑO_INIC_OPERACI") ==1.0 ? getAttribute("A_MONTO_ACUM_INI_ANTICIPOS_UTILIDADES"):0)+ getAttribute("A_MONTO_ACUM_ANTICIPO_UTILIDADES");'
WHERE value = 'beanshell:R_ANTICIPOS_UTILIDADES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;

if (getConcept("CC_POR_LIQUIDAR")==1.0){
       result= getConcept("CC_SUELDO_DIARIO_VAC") * getAttribute("A_TOT_DIAS_SIN_CANCELAR_BONO_VACACIONAL");

}'
WHERE value = 'beanshell:R_BONO_VACACIONAL_PENDIENTE'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     result= getAttribute("A_MONTO_ACUM_INTERESES_CANCELADOS")+ getAttribute("A_MONT_ACUM_INI_INTERESES_PREST_PAG");
}'
WHERE value = 'beanshell:R_INTERESES_PREST_SOC_PAG'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_HC");
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_H.C'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_VIDA");
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_VIDA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && 
    "S".equals(getAttributeString("A_EFECTIVIDAD_MATRIMONIO")))
{
    result = getAttribute("C_BONO_MATRIMONIO");
}
'
WHERE value = 'beanshell:R_BONO_MATRIMONIO'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
String sContract = getHR_Payroll().getHR_Contract().getValue();

if( (!"Liquidacion".equals(sContract) || ("Liquidacion".equals(sContract) && getConcept("CC_POR_LIQUIDAR")==1.0) ) && getConcept("CC_APLICAR_CONCEPTO")==1.0){

     result= getConcept("CC_MONTO_BASE_ISLR") * getAttribute("A_FACTOR_ISLR") / 100;

}'
WHERE value = 'beanshell:R_IMPUESTO_SOBRE_LA_RENTA'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
Integer dayVacation= getConcept("CC_DIAS_VACACIONES");
if (getConcept("CC_APLICAR_CONCEPTO")==1.0 && dayVacation >0 ){

     result=dayVacation * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")); 

}'
WHERE value = 'beanshell:R_VACACIONES_PAGADAS'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_CONTRA_ACCIDENTES");
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_CONTRA_ACCIDENT'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     result= getAttribute("A_MONTO_ACUM_INI_ANTICIPOS_PREST_SOC")+getAttribute("A_MONTO_ACUM_ANTICIPO_PREST_SOCIALES");
}'
WHERE value = 'beanshell:R_ANTICIPO_PRESTACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if(getConcept("CC_POR_LIQUIDAR")==1.0 && getAttribute("A_MONTO_ACUM_CANCELADO_REPOSO_IVSS")>0){
     result= getAttribute("A_MONTO_ACUM_CANCELADO_REPOSO_IVSS"); 
}'
WHERE value = 'beanshell:R_REPOSO_DEDUCC_LIQUIDACION'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0) {
     result= getAttribute("A_ANTICIPO_PRESTACIONES_SOCIALES");
}'
WHERE value = 'beanshell:R_ANTICIPO_PRESTACIONES_SOCIAL'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0) {
     result= getAttribute("A_ANTICIPO_UTILIDADES");
}'
WHERE value = 'beanshell:R_ANTICIPO_UTILIDADES'
;

UPDATE adempiere.ad_rule 
SET script ='

result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_UNIFORMES");
}'
WHERE value = 'beanshell:R_CUOTA_UNIFORMES'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;

result=  ((LVE_Payroll.monthsOnPeriod(new Timestamp( (Long) getConcept("CC_FECHA_INGRESO_ANTIGUEDAD") ), new Timestamp (_To.clone().getTime()-oneDay )) % 12.0 ==0.0 
&&  getConcept("CC_AÑOS_ANTIGUEDAD")>1.0)) || ((getConcept("CC_POR_LIQUIDAR") ==1.0 
&&  getConcept("CC_AÑOS_ANTIGUEDAD") !=0.0 
&&  getConcept("CC_MESES_TRABAJADOS") % 12 >=6) )? 1.0 : 0.0;  


'
WHERE value = 'beanshell:R_APLICA_DIAS_ADIC_PREST'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_HCM_FAMILIARES");
}'
WHERE value = 'beanshell:R_CUOTA_POLIZA_HCM_FAMILIARES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (! "S".equals(getAttributeString("C_PRESTACIONES_DEPOSITADAS_FIDEICOMISO")) && 
      "S".equals(getAttributeString("C_CALCULAR_INTERES_PRESTACIONES")) && 
    getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0  &&
    getConcept("CC_APLICA")==1.0) {

    result= getConcept("CC_BASE_%_CALCULO_INTERES_PREST") / 100 * getConcept("CC_BASE_INTERES_PRESTA_SOCIALES"); 

    if ("S".equals(getAttributeString("C_CALCULAR_INT_SOBRE_BASE_MENSUAL")))
          result=result / 12;
    else
          result=result / getAttribute("C_DIAS_DEL_AÑO") * getConcept("CC_DIAS_MES");
}

'
WHERE value = 'beanshell:R_MONTO_INTERESES_PRESTACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='

String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "P1" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()), _Process );'
WHERE value = 'beanshell:R_CUOTA_PRESTAMO_PERSONALES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
if("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES")) && getConcept("CC_APLICAR_CONCEPTO")==1.0 && getConcept("CC_DIAS_VACACIONES") > 0){
     result= getConcept("CC_DIAS_DE_SUELDO_PENDIENTE")* (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}
'
WHERE value = 'beanshell:R_DIAS_SUEL_PEND_PAG_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HI" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()), _Process );'
WHERE value = 'beanshell:R_CUOTA_PRESTAMO_REMOD_VIVIEND'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

double monthDays = getAttribute("C_DIAS_DEL_MES");

if (monthDays >0)
    result = getConcept("CC_SUELDO_MENSUAL_VARIABLE") / monthDays;

'
WHERE value = 'beanshell:R_SUELDO_DIARIO_VARIABLE'
;

UPDATE AD_Rule SET Name='R_CAMBIO_STATUS_CIERRE_LIQUIDA', Value='beanshell:R_CAMBIO_STATUS_CIERRE_LIQUIDA',
Updated=now(), UpdatedBy=100,
script='result=0.0; 
String msg=null; 

String estatus =getAttributeString("A_ESTATUS_EMPLEADO");
Double value1= getConcept("CC_PRESTACIONES_SOCIALES");

if (value1!=0 || estatus.trim().equals("PLIQ")  ){
      msg = LVE_Payroll.addValueStringConcept("A_ESTATUS_EMPLEADO",process,"LIQU", _C_BPartner_ID);
     if (msg != null)	
          result=0;
}'
WHERE AD_Rule_ID=1000242 and value = 'beanshell:R_CAMBIO_STATUS_CIERRE_LIQUIDA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
    result= getConcept("CC_DIAS_UTILIDADES_POR_MES")*getConcept("CC_MESES_PARA_UTILIDADES")*getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");
}
'
WHERE value = 'beanshell:R_ANTIC_UTILIDADES_LOTTT_132'
;

UPDATE adempiere.ad_rule 
SET script ='String msg=null; 
Double value1= getConcept("CC_ANTICIPO_PRESTACIONES_SOCIAL");
Double value2= getConcept("CC_ANTICIPO_UTILIDADES");
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

result=1.0;

if (value1>0) {
      msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_ANTICIPO_PREST_SOCIALES",process,
                 new BigDecimal(getAttribute("A_MONTO_ACUM_ANTICIPO_PREST_SOCIALES" , date)+value1),_C_BPartner_ID);
      if (msg != null)	
          result=0;
}

if (value2>0) {
      msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_ANTICIPO_UTILIDADES",process,
                 new BigDecimal(getAttribute("A_MONTO_ACUM_ANTICIPO_UTILIDADES", date)+value2),_C_BPartner_ID);
      if (msg != null)	
            result=0;
}
 

'
WHERE value = 'beanshell:R_CIERRE_ANTICIPO_PREST_UTIL'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
if ("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES"))){
     result=1.0;
     msg = LVE_Payroll.addValueStringConcept("A_SUELDO_PAGADO_VACACIONES",process,"S", _C_BPartner_ID);
     if (msg != null)	
          result=0;
}'
WHERE value = 'beanshell:R_ACT_CAMPO_SUELDO_PAG_VAC_CIE'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if (!"S".equals(getAttributeString("C_PRESTACIONES_DEPOSITADAS_FIDEICOMISO")) && 
     "S".equals(getAttributeString("C_CALCULAR_INTERES_PRESTACIONES")) && 
    !"S".equals(getAttributeString("C_PAGAR_INTERESES_PRESTACIONES_MENSUAL")) &&
     getConcept("CC_APLICA")==1.0){
     result= LVE_Payroll.generatedValue(get_TrxName(), _Process , _Department , _C_BPartner_ID, "CC_MONTO_INTERESES_PRESTACIONES");
}

'
WHERE value = 'beanshell:R_INTERESES_PREST_SOC_ANUALES'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp To= _To.clone();
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )

     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "S1" , new Date  (To.getYear(), To.getMonth(), To.getDate()), _Process );

	'
WHERE value = 'beanshell:R_CUOTA_PRESTAMO_ESTUDIO'
;

UPDATE adempiere.ad_rule 
SET script ='
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HB" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()), _Process );
'
WHERE value = 'beanshell:R_CUOTA_PRESTAMO_COMPRA_VIVIEN'
;

UPDATE adempiere.ad_rule 
SET script ='
Double value1= getConcept("CC_MONTO_INTERESES_PRESTACIONES");
result=0.0;

if (value1>0){
     result=1.0;

     msg = LVE_Payroll.addValueDateConcept("A_FECHA_MES_ANTERIOR_PRESTACIONES",process,_From, _C_BPartner_ID);
     if (msg != null)	
        result=0.0;

     msg = LVE_Payroll.addValueDateConcept("A_FECHA_ULTIMO_CALC_INTERESES_PRESTACION",process,_To, _C_BPartner_ID);
     if (msg != null)	
        result=0.0;
}

'
WHERE value = 'beanshell:R_CIERRE_FEC_INTER_PREST_MENSU'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_NUMERO_HIJOS_NACIDOS") != null)
{
    result = getAttribute("A_NUMERO_HIJOS_NACIDOS") * getAttribute("C_BONO_NACIMIENTO_HIJOS");
}
'
WHERE value = 'beanshell:R_BONO_NACIMIENTO_HIJOS'
;

UPDATE adempiere.ad_rule 
SET script ='

result=getConcept("A_DIAS_VACACIONES_INASISTENCIA_INJUST")>=getAttribute("C_DIAS_MIN_DESC_VAC_POR_INASIST_INJUS")?getConcept("A_DIAS_VACACIONES_INASISTENCIA_INJUST"):0;
'
WHERE value = 'beanshell:R_DIAS_DESC_VAC_INAS_INJUS'
;

UPDATE adempiere.ad_rule 
SET script ='result= getAttribute("C_TOPE_SALARIOS_BONO_ALIMENTACION")* getAttribute("C_SUELDO_MINIMO"); '
WHERE value = 'beanshell:R_TOPE_SALARIO_BONO_ALIMENT'
;

UPDATE adempiere.ad_rule 
SET script ='result=getConcept("CC_APLICAR_CONCEPTO");'
WHERE value = 'beanshell:R_SUELDO_LIQUIDADO_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='
result= getConcept("A_TOT_MONTO_DISPONIBLE_INTERESES_PREST"); '
WHERE value = 'beanshell:R_VAL_INI_DEV_ANU_SUEL_ADI_PRE'
;

UPDATE adempiere.ad_rule 
SET script ='
result= getConcept("A_TOT_MONTO_DISPONIBLE_PRESTACIONES"); '
WHERE value = 'beanshell:R_MONTO_DISPONIBLE_PREST'
;

UPDATE adempiere.ad_rule 
SET script ='result=getConcept("A_TOT_MONTO_DISPONIBLE_FONDO_AHORRO");'
WHERE value = 'beanshell:R_TOTAL_DISP_FONDO_AHORRO'
;

UPDATE adempiere.ad_rule 
SET script ='
result= getConcept("A_TOT_MONTO_DISPONIBLE_INTERESES_PREST"); '
WHERE value = 'beanshell:R_MONTO_DISP_INTERESES_PREST'
;

UPDATE adempiere.ad_rule 
SET script ='
result= getConcept("A_DIAS_UTILIDADES_CASOS_ESPECIALES")>0 ? getConcept("A_DIAS_UTILIDADES_CASOS_ESPECIALES")/12: getAttribute("C_DIAS_UTILIDADES")/12; 

'
WHERE value = 'beanshell:R_DIAS_UTILIDADES_POR_MES'
;

UPDATE adempiere.ad_rule 
SET script ='
import java.lang.Math;

long oneDay = 86400000;
Timestamp  dateStart= _DateStart.clone();
Timestamp  dateStartEmployee= LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp  startPayroll= new Timestamp( Math.max( dateStart.getTime() , dateStartEmployee.getTime() ) );
 
      if (getAttributeDate("A_FECHA_ULTIMO_MES_PROC") != null ){

                long dateLastMonth=getAttributeDate("A_FECHA_ULTIMO_MES_PROC").getTime() + oneDay; 
                result= Math.max(dateLastMonth,dateStartEmployee.getTime());

      }
      if(startPayroll !=null){

                result=startPayroll.getTime();     
      }'
WHERE value = 'beanshell:R_APLICAR_RETENCION_FINAL_MES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICA")==1.0 && "S".equals(getAttributeString("C_PAGAR_BONO_FIN_ANO"))) {
     result= getConcept("CC_VALOR_DIAS_BONO_FIN_AÑO_TRAB")* getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");
}'
WHERE value = 'beanshell:R_BONO_FIN_AÑO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;
if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_MONTO_PAGAR_COMISIONES", _From)!=null)
   result = getAttribute("A_MONTO_PAGAR_COMISIONES", _From);'
WHERE value = 'beanshell:R_COMISIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getConcept("CC_APLICAR_ULTIMA_NOMINA_MES") == 1.0)
{
    result = getAttribute("A_BECA_ESTUDIO");
}'
WHERE value = 'beanshell:R_BECA_ESTUDIO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

String sContrato = getHR_Payroll().getHR_Contract().getValue();
double iDiasVacPeriodo = getConcept("CC_DIAS_VACACIONES");
boolean bCont_Vac = "N_VAC".equals(sContrato);

if  (!bCont_Vac || (bCont_Vac && iDiasVacPeriodo>0))
    result = getAttribute("A_DIAS_BONO_VACACIONAL_CASO_ESP") > 0 ? getAttribute("A_DIAS_BONO_VACACIONAL_CASO_ESP") : 
             					getAttribute("C_DIAS_BASE_BONO_VACACIONAL");

'
WHERE value = 'beanshell:R_DIAS_BASE_BONO_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

   String sContract = getHR_Payroll().getHR_Contract().getValue().trim();
    if ("Vacaciones".equals(sContract)) 
      result=getConcept("CC_DIAS_BONO_VAC_POR_AÑO") * getConcept("CC_SUELDO_DIARIO_VAC");

}'
WHERE value = 'beanshell:R_BONO_VACACIONAL'
;

UPDATE adempiere.ad_rule 
SET script ='Double iAnhosAntiguedad= getConcept("CC_AÑOS_ANTIGUEDAD");
Double iAnhosMaxVac = getAttribute("C_DIAS_TOPE_DISFRUTE_VACACIONES")-getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")+1;

result= iAnhosAntiguedad > iAnhosMaxVac && iAnhosMaxVac > 0 ? iAnhosMaxVac : iAnhosAntiguedad;
		
	'
WHERE value = 'beanshell:R_AÑOS_ANTIGUEDAD_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContrato);
double cant_lunes = getConcept("CC_LUNES_PARA_RETENCIONES");
double factor = getAttribute("C_FACTOR_REG_PREST_EMPLEO_PATRONAL") / 100;
double base_sueldo_minimo = getAttribute("C_TOPE_SAL_MIN_SEGURO_SOCIAL_OBL") * getAttribute("C_SUELDO_MINIMO");
double sueldo_para_ret = getConcept("CC_SUELDO_PARA_RETENCIONES");
double sueldobase = (base_sueldo_minimo > sueldo_para_ret ? sueldo_para_ret : base_sueldo_minimo);

if ((getConcept("CC_APLICAR_RETENCIONES") == 1) 
&& (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1))


   if ( "S".equals(getAttributeString("A_SUELDO_VARIABLE"))  )
        
        result= LVE_Payroll.amountRetention ( _C_BPartner_ID,process ,"CC_REGIMEN_PRESTACIONAL_PA",base_sueldo_minimo,factor, cant_lunes,"CC_LUNES_PARA_RETENCIONES");

  else

       result = ( (sueldobase * 12.0 / 52.0) * factor * cant_lunes );


'
WHERE value = 'beanshell:R_REGIMEN_PRESTACIONAL_PA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_AÑOS_ANTIGUEDAD")>0)
{
	//Timestamp incomeDateVac = new Timestamp(getConcept("CC_FECHA_INGRESO_CAL_VACACIONES"));
	double yearsOfAntiquity = getConcept("CC_AÑOS_ANTIGUEDAD");
	double MaxQYearsBonusVac = getAttribute("C_TOPE_PAGAR_DIAS_BONO_VACACIONAL") - getConcept("CC_DIAS_BASE_BONO_VAC") + 1;
				
	if (yearsOfAntiquity > MaxQYearsBonusVac && MaxQYearsBonusVac > 0)
		result = MaxQYearsBonusVac;
	else
		result = yearsOfAntiquity;	
}



'
WHERE value = 'beanshell:R_AÑOS_ANTIGUEDAD_BONO_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='
Timestamp nextPayroll= LVE_Payroll.nextPayroll(get_TrxName(), _Payroll, "Utilidades", _To, _C_BPartner_ID);
Timestamp lastPayroll= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID, getAD_Org_ID(),"''Utilidades''",  true);
result=0.0;

if ((nextPayroll!=null && nextPayroll.getYear()== getAttribute("C_AÑO_INICIO_OPERACIONES")) && ( lastPayroll!=null & lastPayroll.getYear()!= nextPayroll.getYear()) ){
result= getAttribute("A_MONTO_ACUM_INI_UTILIDADES"); 
}

'
WHERE value = 'beanshell:R_INCLUIR_ACUM_INIC_UTILIDADES'
;

UPDATE adempiere.ad_rule 
SET script ='Double value1= getAttribute("A_SUELDO_MENSUAL_USD"); 
result=0.0;

if (value1>0){
     result=1.0;
     msg = LVE_Payroll.addValueConcept("A_SUELDO_MENSUAL_VEB",process,
                new BigDecimal(getConcept("CC_SUELDO_MENSUAL")), _C_BPartner_ID);
     if (msg != null)	
          result=0;
}
'
WHERE value = 'beanshell:R_ACTUALIZAR_SUELDO_MENSUAL'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 &&
    getAttribute("C_MONTO_PAGAR_BONO_POR_GRADUACION") > 0 &&
    "S".equals(getAttributeString("A_PAGAR_BONO_GRADUACION")))
{
     result = getAttribute("C_MONTO_PAGAR_BONO_POR_GRADUACION");
}
'
WHERE value = 'beanshell:R_BONO_POR_GRADUACION'
;

UPDATE adempiere.ad_rule 
SET script ='int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sQuery = "select lve_daysrest(?,?,?) - lve_daysrestnoticeinperiod(?,?,?,?,?,?,?)";


Timestamp From = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp To = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");


From = From.getTime() > _From.getTime() ? From : _From.clone();

To = (To != null  && To.getTime() < _To.getTime() )? To : _To.clone();

int days = DB.getSQLValue(get_TrxName(), sQuery, 
                 new Object[] {From, To, dayrest, getAD_Client_ID(),_Payroll,_C_BPartner_ID,_From,_To,"ASG_NOV_DIAS",dayrest});


result = (double)days;
'
WHERE value = 'beanshell:R_DIAS_DESCANSO_PERIODO'
;

UPDATE adempiere.ad_rule 
SET script ='String estatus =getAttributeString("A_ESTATUS_EMPLEADO");

Double Aux = estatus.trim().equals("PLIQ") ? 0.0 : getConcept("CC_SALARIO_ESTIMADO_UTILIDADES"); 
Aux = Aux + getConcept("CC_INCLUIR_ACUM_INIC_UTILIDADES")+getConcept("CC_MONTO_DEVENGADO_PERIODO_UTIL");
Double Aux2= (getConcept("CC_MESES_PARA_UTILIDADES") * getAttribute("C_DIAS_DEL_MES"))>0 ? (getConcept("CC_MESES_PARA_UTILIDADES")*getAttribute("C_DIAS_DEL_MES")) : 1.0;

result= Aux2>0 ? Aux/Aux2 : 0.0; '
WHERE value = 'beanshell:R_MONTO_DIARIO_DEVENGADO_AÑO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_DEDUCCION_CON_CARACTER_SALARIAL") > 0)
   result = getAttribute("A_DEDUCCION_CON_CARACTER_SALARIAL");'
WHERE value = 'beanshell:R_DED_CON_CARACTER_SALARIAL'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnotice =  DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_DESCANSO_TRABAJADO"});
result = daysnotice == null ? 0 : daysnotice;
}'
WHERE value = 'beanshell:R_DIAS_DESCANSO_TRABAJADO'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;
String contract=  getHR_Payroll().getHR_Contract().getValue();
double monthsWorked = getConcept("CC_MESES_TRABAJADOS");

Timestamp resultDate=null;

if ("Semanal".equals(contract)){
   double days = monthsWorked >= 3 ? 90 : monthsWorked * getAttribute("C_DIAS_DEL_MES");
   Timestamp lastDate = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Semanal''", true);
   resultDate = lastDate.getTime() - (oneDay * days);
}
else {
  double months = monthsWorked >= 3 ? 3 : monthsWorked;
  Timestamp startDate = LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true);
  startDate.setMonth(startDate.getMonth() - months + 1);
  resultDate = startDate.getTime();
}

result= resultDate.getTime();
	  '
WHERE value = 'beanshell:R_FEC_INIC_CORT_TRIM_PAG_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;
String sContract = getHR_Payroll().getHR_Contract().getValue();
Timestamp From= _From.clone();
Timestamp To = _To.clone(); 
Timestamp dateStart ;
Timestamp dateEnd ;
Integer months; 

if ("Prestaciones".equals(sContract)){
     months=  LVE_Payroll.monthsOnPeriod(From, To);
}else{
     Timestamp dateStartEmployee =LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 
     Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
     dateStart=  dateStartEmployee.getTime() > From.getTime() ? dateStartEmployee: From ;
     dateEnd = ((dateEndEmployee!=null) && (To.getTime()> dateEndEmployee.getTime())) ?  dateEndEmployee : To ;
     months=  LVE_Payroll.monthsOnPeriod(dateStart, new Timestamp(dateEnd.getTime() + oneDay));
}

Integer periodContract= LVE_Payroll.periodExecutionContract(get_TrxName(), _C_BPartner_ID, "Utilidades", "M", process);
result= months < periodContract? months: periodContract;
'
WHERE value = 'beanshell:R_MESES_PARA_UTILIDADES'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

import org.eevolution.model.*;
LVE_Payroll NV = new LVE_Payroll();

String msg=null;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

double acumDays = getAttribute("A_ACUM_INI_DIAS_BONO_VACACIONA_NO_PAG") + 
                                getAttribute("A_ACUM_DIAS_BONOS_VACACIONAL_CAUSADO", date) - 
                                getAttribute("A_ACUM_DIAS_BONO_VACACIONAL_PAGADOS", date);


result = acumDays + getConcept("CC_DIAS_BONO_VAC_CAUSADO");
'
WHERE value = 'beanshell:R_DIAS_DISPONIBLES_BONO_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

result = getAttribute("A_TOT_DIAS_SIN_CANCELAR_BONO_VACACIONAL", date) + 
              getConcept("CC_DIAS_BONO_VAC_CAUSADO");

'
WHERE value = 'beanshell:R_DIAS_ACUM_BONO_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 

if ((!"Vacaciones".equals(sContract)) || getConcept("CC_DIAS_VACACIONES") > 0){

     result= LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption8","Y",_Payroll);

}
'
WHERE value = 'beanshell:R_MONTO_BASE_ISLR'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0; 

long OneDay = 86400000;
int CurrentMonth = _From.getMonth();
Timestamp From = (Timestamp)_From.clone();
Timestamp To = (Timestamp)_To.clone();

From.setTime(From.getTime() + (OneDay * 4));
To.setTime(To.getTime() + (OneDay * 5));

if ((From.getMonth() == CurrentMonth && To.getMonth()!=CurrentMonth) &&
   "P".equals(getAttributeString("C_PAGAR_VACACIONES_P_D_A")))
{
   result = getConcept("CC_SUELDO_MENSUAL");
}'
WHERE value = 'beanshell:R_SUELDO_MES_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Vacaciones".equals(sContract))
   result = getConcept("CC_DIAS_VACACIONES") * getConcept("CC_SUELDO_DIARIO_VAC");

}'
WHERE value = 'beanshell:R_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;

if ("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES"))){
    result=1.0;
    if ("S".equals(getAttributeString("A_SUELDO_PAGADO_VACACIONES"))) {
        msg = LVE_Payroll.addValueStringConcept("A_SUELDO_PAGADO_VACACIONES",process,"", _C_BPartner_ID);
        if (msg != null)
            result=0;
    }
}
'
WHERE value = 'beanshell:R_ACT_CAMPO_SUELDO_PAG_VACACIO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sContract = getHR_Payroll().getHR_Contract().getValue();
if ("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES")) && "Vacaciones".equals(sContract))
{
    result = getConcept("CC_DIAS_DE_SUELDO_PENDIENTE") * getConcept("CC_SUELDO_DIARIO_VAC");
}

}'
WHERE value = 'beanshell:R_SUELDO_PENDIENTE'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnotice =  DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_FERIADO_TRABAJADO"});
result = daysnotice == null ? 0 : daysnotice;
}
'
WHERE value = 'beanshell:R_DIAS_FERIADO_TRABAJADO'
;

UPDATE adempiere.ad_rule 
SET script ='import org.compiere.util.*;
Timestamp dateStartEmployee = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee (get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");


if (TimeUtil.isValid(new Timestamp (dateStartRetention   ), _To , dateStartEmployee)){

     result= LVE_Payroll.dayOnPeriod(dateStartEmployee, _To, 1); 

}else{
     
     result= ( (datEndEmployee==null) && (TimeUtil.isValid(_DateStart, _To , dateEndEmployee)) )? LVE_Payroll.dayOnPeriod(new Timestamp (dateStartRetention), dateEndEmployee, 1):LVE_Payroll.dayOnPeriod( new Timestamp (dateStartRetention),_To, 1) ; 

}

'
WHERE value = 'beanshell:R_LUNES_RETENC_NORMAL_ING_EG'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

   String sContract = getHR_Payroll().getHR_Contract().getValue();
   double holidayAndRest = 0;


   if ("Vacaciones".equals(sContract))
   {
      holidayAndRest = LVE_Payroll.daysElapsed(_From, _To) - getConcept("CC_DIAS_VACACIONES");
      result = holidayAndRest * getConcept("CC_SUELDO_DIARIO_VAC");
   }

}'
WHERE value = 'beanshell:R_VAC_EN_FESTIVOS_DESCANSO'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
String msg=null; 

String estatus =getAttributeString("A_ESTATUS_EMPLEADO");
Double value1= getConcept("CC_PRESTACIONES_SOCIALES");

if (value1!=0 || estatus.trim().equals("PLIQ")  ){
      msg = LVE_Payroll.addValueStringConcept("A_ESTATUS_EMPLEADO",process,"LIQU", _C_BPartner_ID);
     if (msg != null)	
          result=0;
}'
WHERE value = 'beanshell:R_CAMBIO_STATUS_CIERRE_LIQUIDA'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
String msg=null;
String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Vacaciones".equals(sContract)){
   result=1.0;
   long time= getConcept("CC_FEC_FIN_ULT_VAC_DISF"); 
   Timestamp To= _To.clone();
   Timestamp date= time != 0  ? new Timestamp(time) : To; 

   msg = LVE_Payroll.addValueDateConcept("A_FECHA_FIN_ULTIMA_VACACIONES_DISF",process,To, _C_BPartner_ID);
   if (msg != null)	
       result=0;
}'
WHERE value = 'beanshell:R_ACT_FECH_FIN_ULTIMA_VAC_DISF'
;

UPDATE adempiere.ad_rule 
SET script ='result=1.0; 
String msg=null; 
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

Double value1= getConcept("CC_APORTE_FONDO_AHORRO_TRABAJAD");
Double value2= getConcept( "CC_APORTE_FONDO_AHORRO_EMPRESA");

if (value1 + value2 > 0){
    msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_FONDO_AHORRO",process,
    new BigDecimal(getAttribute("A_MONTO_ACUM_FONDO_AHORRO",date)+value1+value2), _C_BPartner_ID);
    if (msg != null)	
         result=0;
}'
WHERE value = 'beanshell:R_CIERRE_ACUM_FONDO_AHORRO'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
if ("S".equals(getAttributeString("C_PAGAR_BONO_FIN_ANO")) && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0){
     result= (getConcept("CC_VALOR_DIAS_BONO_FIN_AÑO_TRAB")/12)* getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");

}'
WHERE value = 'beanshell:R_PROVISI_MENSUAL_BONO_FIN_ANO'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){
      result= getAttribute("A_MONTO_ACUM_INI_INTERESES_PREST_SOC")+getAttribute("A_MONTO_ACUM_INTERESES_PRESTACIONES");
}
'
WHERE value = 'beanshell:R_INTERESES_PREST_SOCIALES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
String msg=null; 
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

if("S".equals(getAttributeString("C_PAGAR_ 100_%_DEL_REPOSO_IVSS"))){
     result=1.0;
     Double value1=getConcept("CC_MONTO_REPOSO_IVSS");
     Double value1=getConcept("CC_DIAS_REPOSO_IVSS");

     if (value1 > 0){
         msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_CANCELADO_REPOSO_IVSS",process,
                    new BigDecimal(getAttribute("A_MONTO_ACUM_CANCELADO_REPOSO_IVSS",date)+value1), _C_BPartner_ID);
         if (msg != null)	
              result=0;
     }
     if (value2 > 0){
         msg = LVE_Payroll.addValueConcept("A_ACUM_DIAS_PAGAR_REPOSO_IVSS",process,
                    new BigDecimal(getAttribute("A_ACUM_DIAS_PAGAR_REPOSO_IVSS",date)+value2), _C_BPartner_ID);
         if (msg != null)	
              result=0;
      }  
}'
WHERE value = 'beanshell:R_ACT_ACUM_MONTO_PAG_REPO_IVSS'
;

UPDATE adempiere.ad_rule 
SET script ='resul=0.0; 
Double mount = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption8","Y",_Payroll);
String sContract = getHR_Payroll().getHR_Contract().getValue();

if (getConcept("CC_APLICAR_CONCEPTO")==1.0 &&  !"Utilidades".equals(sContract) ){
 result= (getAttribute("C_FACTOR_INCE_PATRONAL")/100)* mount;  
     
}'
WHERE value = 'beanshell:R_INCE_PATRONAL'
;

UPDATE adempiere.ad_rule 
SET script ='

result=0.0; 
String sContract = getHR_Payroll().getHR_Contract().getValue();

if (!"Liquidacion".equals(sContract)|| ("Liquidacion".equals(sContract) && getConcept("CC_POR_LIQUIDAR")==1.0) ){
     if ("Liquidacion".equals(sContract)) 
         result=getConcept("CC_UTILIDADES_FRACCIONADAS") * (getAttribute("C_FACTOR_INCE_TRABAJADOR")/100);
     else
         result= (getConcept("CC_ANTIC_UTILIDADES_LOTTT_132") + getConcept("CC_UTILIDADES_LOTTT_132")) * (getAttribute("C_FACTOR_INCE_TRABAJADOR")/100); 
         

}
'
WHERE value = 'beanshell:R_INCE_TRABAJADOR'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HI" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}'
WHERE value = 'beanshell:R_PRESTAMO_REMOD_VIVI_LIQUIDAC'
;

UPDATE adempiere.ad_rule 
SET script ='String msg=null; 
result =1.0;

if (getAttribute("A_MONTO_ACUM_ANTICIPO_UTILIDADES")>0) {
   msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_ANTICIPO_UTILIDADES",process,new BigDecimal(0),_C_BPartner_ID);
   if (msg != null)
       result=0;
}


'
WHERE value = 'beanshell:R_CIERRE_ANTICIP_UTIL_CONT_UTI'
;

UPDATE adempiere.ad_rule 
SET script ='String workDay = getAttributeString("A_JORNADA_LABORAL");

result = ("D".equals(workDay)?getAttribute("C_HORAS_JORNADA_DIURNA"):
             ("N".equals(workDay)?getAttribute("C_HORAS_JORNADA_NOCTURNA"):
             getAttribute("C_HORAS_JORNADA_MIXTA")));

'
WHERE value = 'beanshell:R_HORAS_JORNADA_TRABAJADOR'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_CANCELAR_BONO_ALIMENTACION")==1.0 && getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("C_VALOR_BONO_ALIMENTARIO")* LVE_Payroll.tributaryUnit(get_TrxName(),getAD_Org_ID(), _From ,  _To)*    
                  getConcept("CC_DIAS_BONO_ALIMENTACION");
}'
WHERE value = 'beanshell:R_MONTO_BONO_ALIMENTACION'
;

UPDATE adempiere.ad_rule 
SET script ='String jornada = getConceptString("A_JORNADA_LABORAL");

if (jornada == null)
  jornada = "D";  /* Default Diurna */

double sueldo = getConcept("CC_SUELDO_MENSUAL");

double horas = getAttribute("C_HORAS_JORNADA_DIURNA");

if ("N".equals(jornada)) /* Nocturna */
  horas = getAttribute("C_HORAS_JORNADA_NOCTURNA");

if ("M".equals(jornada))  /* Mixta */
  horas = getAttribute("C_HORAS_JORNADA_MIXTA");

description = "Horas jornada " + jornada + "=" + horas;

result =  horas>0 ?  (sueldo / getAttribute("C_DIAS_DEL_MES")) / horas : 0.0;'
WHERE value = 'beanshell:R_SUELDO_HORA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;
if (getConcept("CC_APLICAR_CONCEPTO")==1.0) {
String sQuery = ""
+ "SELECT u.birthday "
+ "FROM   c_bpartner b inner join ad_user u ON b.c_bpartner_id = u.c_bpartner_id "
+ "WHERE  b.c_bpartner_id = ? AND u.isinpayroll = ''Y'' ";

Timestamp birthday = DB.getSQLValueTS(get_TrxName(),sQuery,new Object[] {_C_BPartner_ID});

Timestamp birthdayFrom =birthday;
Timestamp birthdayTo =birthday;
birthdayFrom.setYear(_From.getYear());
birthdayTo.setYear(_To.getYear());

if (birthday != null && 
   (
   org.compiere.util.TimeUtil.isValid(_From, _To,birthdayFrom) || 
   org.compiere.util.TimeUtil.isValid(_From, _To,birthdayTo )
   ) &&
   getAttribute("C_MONTO_PAGAR_BONO_CUMPLEAÑOS") > 0 &&
   getConcept("CC_APLICAR_CONCEPTO") == 1.0)
{
   result = getAttribute("C_MONTO_PAGAR_BONO_CUMPLEAÑOS");
}
}'
WHERE value = 'beanshell:R_BONO_CUMPLEAÑOS'
;

UPDATE adempiere.ad_rule 
SET script ='Double value1= getConcept( "CC_BONO_POST_VACACIONAL");
result=0.0; 

if (value1>0){
     result=1.0;
     msg = LVE_Payroll.addValueDateConcept("A_FECHA_ULTIMO_BONO_POST_VACACIONAL_PAG",process,_To, _C_BPartner_ID);
     if (msg != null)	
        result=0.0;
}'
WHERE value = 'beanshell:R_ACT_FEC_ULTI_BONO_POST_VAC_P'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;
String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContrato);
Integer iDaysVacPer = getConcept("CC_DIAS_VACACIONES");
Timestamp dateIniLastMonthProc = getAttributeDate("A_FECHA_INICIO_ULTIMO_MES_PROCESADO",_From);
Timestamp previousdate = LVE_Payroll.PreviousDateOfPayroll(get_TrxName(), _From, _C_BPartner_ID, _Payroll);

result = 0;

if  ((!bCont_Vac && getConcept("CC_APLICAR_CONCEPTO") == 1.0) || (bCont_Vac && iDaysVacPer>0))
{
     if (dateIni_LastMonthProc == null && previousdate != null)
          result = previousdate.setTime(previousdate.getTime()+oneDay).getMonth();
     else
          result = dateIniLastMonthProc==null?0.0:dateIniLastMonthProc.getMonth();
}

'
WHERE value = 'beanshell:R_FEC_ULT_MES_PROC'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();
double days = 0;
                    
switch (sContract)
{
  case "Quincenal":
      days = (getAttribute("C_DIAS_DEL_MES") / 2);
      break;
  case "Mensual":
      days = getAttribute("C_DIAS_DEL_MES");
      break;
  default:
      days =  LVE_Payroll.daysElapsed(_From, _To);
      break;
}

result = days - getConcept("CC_DIAS_VACACIONES");

'
WHERE value = 'beanshell:R_DIAS_DE_SUELDO_PENDIENTE'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;
String sContract = getHR_Payroll().getHR_Contract().getValue();
double salary_ret=0;
boolean bCont_Vac = "Vacaciones".equals(sContract);
double factor = getAttribute("C_FACTOR_REG_PREST_VIV_PATRONAL");
Timestamp From = _From.clone();
Timestamp To= _To.clone();

if (getConcept("CC_APLICAR_RETENCIONES_LRPVH") == 1.0 && 
   (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1.0)){
     if ( "N".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES")) )
        salary_ret = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption1","Y",_Payroll);
     if (("S".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES")) || "Mensual".equals( sContract)) && LVE_Payroll.isLastHalfMonth( To ) ){
        From = LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true) ;
        To= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true) ;
        From = From ==null ? _From.clone() : From;
        To = To==null ? _To.clone() : To;
        salary_ret =  LVE_Payroll.GeneratedConcepts(get_TrxName(),process,"isoption1","Y", From, To,_C_BPartner_ID, "''Mensual'',''Quincenal'',''Semanal''", "Y").doubleValue() + LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption1","Y",_Payroll);
   }
   result = salary_ret * factor / 100;
}'
WHERE value = 'beanshell:R_LEY_REG_PREST_VIV_HAB_PA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
result = 0.0;
String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
Double daysnotice = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_REPOSO"});
boolean bPay100restingAttri = getAttribute("A_PAGAR_100%_REPOSO") == 1.0;
boolean bPay100restingConst = getAttribute("C_PAGAR_100%_REPOSO") == 1.0;
Double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
Double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");
Double dDedRest =  DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "D_DIAS_DEDUCCION_REPOSO"});

if (daysPaid < daysrestclient && dDedRest>0) 
   daysnotice += dDedRest>daysrestclient ? daysrestclient : dDedRest;

if ((bPay100restingAttri || (!bPay100restingAttri && !bPay100restingConst)) && daysnotice > 0)
   result = daysnotice;
else
{
  daysnotice += dDedRest;
  if ((daysPaid == null || daysPaid < daysrestclient) && (daysnotice > 0))
  {
     description = "Días de Reposo por Cuenta de la Empresa: " + (daysrestclient - daysPaid);
     result = (daysrestclient - daysPaid)  ;
  }
}'
WHERE value = 'beanshell:R_DIAS_REPOSO_EMPRESA'
;

UPDATE adempiere.ad_rule 
SET script ='
String sContract = getHR_Payroll().getHR_Contract().getValue();
Timestamp nextPayroll= LVE_Payroll.nextPayroll(get_TrxName(), _Payroll, "Utilidades", _To, _C_BPartner_ID);
Timestamp lastPayroll= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID, getAD_Org_ID(), _Payroll,  true);
result= 0.0;

if( "S".equals(getAttributeString("C_APLICAR_UTILIDADES_SOBRE_DEVENG_ANUAL")) && (nextPayroll!=null && lastPayroll!=null) && (nextPayroll.getTime() > lastPayroll.getTime()) && !"Prestaciones".equals(sContract) ){
 
       GregorianCalendar t1 = new GregorianCalendar(nextPayroll.getYear(),nextPayroll.getMonth(),nextPayroll.getDay());
       GregorianCalendar t2 = new GregorianCalendar(lastPayroll.getYear(),lastPayroll.getMonth(),lastPayroll.getDay());

      result= (t2.get(Calendar.DAY_OF_YEAR) - t1.get(Calendar.DAY_OF_YEAR))* (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")); 
     
}
'
WHERE value = 'beanshell:R_SALARIO_ESTIMADO_UTILIDADES'
;

UPDATE adempiere.ad_rule 
SET script ='
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "HB", _From, _To ).doubleValue();

'
WHERE value = 'beanshell:R_PRESTAMO_COMPRA_VIVIENDA'
;

UPDATE adempiere.ad_rule 
SET script ='
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "P1", _From, _To ).doubleValue();

'
WHERE value = 'beanshell:R_PRESTAMO_PERSONALES'
;

UPDATE adempiere.ad_rule 
SET script ='
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "HI", _From, _To ).doubleValue();

'
WHERE value = 'beanshell:R_PRESTAMO_REMODELACION_VIVIEN'
;

UPDATE adempiere.ad_rule 
SET script ='
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "S1", _From, _To ).doubleValue();

'
WHERE value = 'beanshell:R_PRESTAMO_ESTUDIO'
;

UPDATE adempiere.ad_rule 
SET script ='String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContrato);
double cant_lunes = getConcept("CC_LUNES_PARA_RETENCIONES");
double factor = getAttribute("C_FACTOR_SEG_SOC_OBL_PATRONAL") / 100;
double base_sueldo_minimo = getAttribute("C_TOPE_SAL_MIN_SEGURO_SOCIAL_OBL") * getAttribute("C_SUELDO_MINIMO");
double sueldo_para_ret = getConcept("CC_SUELDO_PARA_RETENCIONES");
double sueldobase = (base_sueldo_minimo > sueldo_para_ret ? sueldo_para_ret : base_sueldo_minimo);

if ((getConcept("CC_APLICAR_RETENCIONES") == 1) 
&& (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1))


   if ( "S".equals(getAttributeString("A_SUELDO_VARIABLE"))  ) 

        result= LVE_Payroll.amountRetention ( _C_BPartner_ID,process ,"CC_SEGURO_SOCIAL_OBLIGATORIO_PA",base_sueldo_minimo,factor, cant_lunes,"CC_LUNES_PARA_RETENCIONES");
     
  else

          result = (sueldobase * 12.0 / 52.0) * factor * cant_lunes;
     

 

'
WHERE value = 'beanshell:R_SEGURO_SOCIAL_OBLIGATORIO_PA'
;

UPDATE adempiere.ad_rule 
SET script ='
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "OT", _From, _To ).doubleValue();

'
WHERE value = 'beanshell:R_PRESTAMO_OTROS'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

result =1.0;
Double concept= getConcept("CC_DIAS_BASE_DISFRUTE_VACAC");
Double value1= getConcept("CC_DIAS_VACACIONES_CAUSADAS");
Double value2= getConcept("CC_DIAS_BONO_VAC_CAUSADO");
String msg=null; 

if (value1>0) {
     msg = LVE_Payroll.addValueConcept("A_ACUM_DIAS_ADIC_VACACIONES_CAUSADAS",process,new BigDecimal(value1- concept),_C_BPartner_ID);
     if (msg != null)	
          result=0;

     msg = LVE_Payroll.addValueConcept("A_ACUM_DIAS_VACACIONES_CAUSADAS",process,new BigDecimal(concept +
                                                                          getAttribute("A_ACUM_DIAS_VACACIONES_CAUSADAS",date)),_C_BPartner_ID);
     if (msg != null)	
          result=0;
}

if (value2>0) {
      msg = LVE_Payroll.addValueConcept("A_ACUM_DIAS_BONOS_VACACIONAL_CAUSADO",process,
                 new BigDecimal(value2+ getAttribute("A_ACUM_DIAS_BONOS_VACACIONAL_CAUSADO",date)),_C_BPartner_ID);
     if (msg != null)	
          result=0;
}'
WHERE value = 'beanshell:R_CIERRE_DIAS_VAC_BONO_VAC_CAU'
;

UPDATE adempiere.ad_rule 
SET script ='result=1.0;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

Double value=getConcept("CC_MONTO_INTERESES_PRESTACIONES");

Double value1 = getAttribute("A_MONTO_ACUM_INTERESES_PRESTACIONES" , date )+value;

Double value2 = "S".equals(getAttributeString("C_PAGAR_INTERESES_PRESTACIONES_MENSUAL"))
                           ? getConcept("CC_INTERESES_PREST_SOC_MENSUAL")
                           : getConcept("CC_INTERESES_PREST_SOC_ANUALES");

Double value3 = getAttribute("A_MONTO_ACUM_INTERESES_CANCELADOS", date)+ value2;

BigDecimal value4 = new BigDecimal(
	        getAttribute("A_MONTO_ACUM_INI_INTERESES_PREST_SOC", date)+value1-
	        getAttribute("A_MONT_ACUM_INI_INTERESES_PREST_PAG", date)- value3);

if (value > 0) {
   msg = LVE_Payroll.addValueConcept("A_TOT_MONTO_DISPONIBLE_INTERESES_PREST",process,value4, _C_BPartner_ID);
   if (msg != null)	
        result=0;
}'
WHERE value = 'beanshell:R_ACT_MONT_DISPONI_INTERES_PRE'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;

long oneDay = 86400000;
Timestamp From = _From.clone();
From.setMonth(From.getMonth()-1);

Double dAcumPrestSoc = 	getAttribute("A_MONTO_ACUM_INICIAL_PREST_SOCIALES")+
		getAttribute("A_MONTO_ACUM_PRESTACIONES_SOCIALES", From);

Double dAcumIntPrest = 	getAttribute("A_MONTO_ACUM_INI_INTERESES_PREST_SOC")+
		getAttribute("A_MONTO_ACUM_INTERESES_PRESTACIONES", From);

Double dAcumAnticPrest = 	getAttribute("A_MONTO_ACUM_INI_ANTICIPOS_PREST_SOC")+
		getAttribute("A_MONTO_ACUM_ANTICIPO_PREST_SOCIALES", From)+
		getConcept("CC_ANTICIPO_PRESTACIONES_SOCIAL");

Double dAcumIntPag =	getAttribute("A_MONT_ACUM_INI_INTERESES_PREST_PAG")+
		getAttribute("A_MONTO_ACUM_INTERESES_CANCELADOS", _To.clone())+
		getConcept("CC_INTERESES_PREST_SOC_PAG");


if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0){
           result="S".equals(getAttributeString("C_CAPITALIZAR_INTERESES_PRESTACIONES"))
	? dAcumPrestSoc+dAcumIntPrest - dAcumAnticPrest - dAcumIntPag 
                      : dAcumPrestSoc-dAcumAnticPrest;
}
'
WHERE value = 'beanshell:R_BASE_INTERES_PRESTA_SOCIALES'
;

UPDATE adempiere.ad_rule 
SET script ='
result= getAttribute("C_VALOR_ANUAL_PRESTACIONES_SOCIALES") / 12 * 3; 
'
WHERE value = 'beanshell:R_DIAS_GARANTIA_PRESTACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result=1.0;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);
		
Double value1=getConcept("CC_GARANTIA_PREST_SOCIALES");
Double value2=getConcept("CC_MONTO_PRES_SOC_DIAS_ADIC");

Double value3 = getAttribute("A_MONTO_ACUM_PRESTACIONES_SOCIALES", date) +value1+value2;

Double value4= getConcept("CC_ANTICIPO_PRESTACIONES_SOCIAL");
Double value5= getAttribute("A_MONTO_ACUM_ANTICIPO_PREST_SOCIALES" , date )+value4;
			

BigDecimal value6= new BigDecimal( value3  +
		              getAttribute("A_MONTO_ACUM_INICIAL_PREST_SOCIALES", date)-
		              getAttribute("A_MONTO_ACUM_INI_ANTICIPOS_PREST_SOC", date)-
		              value5);
if (value1 > 0) {
    msg = LVE_Payroll.addValueConcept("A_TOT_MONTO_DISPONIBLE_PRESTACIONES",process, value6, _C_BPartner_ID);
    if (msg != null)	
         result=0;
}'
WHERE value = 'beanshell:R_ACT_MONT_DISP_PREST_CIERRE_P'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0) {

     Double value = (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES")>=2) 
                  ? ( ( getConcept("CC_DIAS_BASE_DISFRUTE_VACAC") + (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES")-1)) / 12 ) 
                  : ( getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")/12 ) ; 
     result= value * getConcept("CC_SUELDO_DIARIO_VAC");

}

'
WHERE value = 'beanshell:R_PROVISION_MENSUAL_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
double utilCompany = getAttribute("C_UTILIDADES_EMPRESA");
long oneDay = 86400000;


Timestamp dateIniEmployee   = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(),null);
Timestamp startDate   = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Utilidades''", true);

if (startDate != null) {
Timestamp endDate    = startDate.clone();
double monthsWorked =LVE_Payroll.monthsOnPeriod(dateIniEmployee, endDate);
double monthsDefault = 12;
double months = monthsWorked > monthsDefault ? monthsDefault : monthsWorked;
startDate.setMonth(startDate.getMonth(-months));
startDate = new Timestamp(startDate.getTime()+oneDay);

Double employeeSalaries = LVE_Payroll.sumConcept(get_TrxName(), "IsOption8", startDate,  endDate, "''Mensual'',''Quincenal'',''Semanal''", _C_BPartner_ID).doubleValue();
Double allSalaries = LVE_Payroll.sumConcept(get_TrxName(), "IsOption8", startDate,  endDate, "''Mensual'',''Quincenal'',''Semanal''", _C_BPartner_ID).doubleValue();

if (utilCompany>0) {
     double salariesLimit = getConcept("CC_SALARIO_DIARIO_INTEGRAL") * getAttribute("C_DIAS_DEL_MES") * 4;
     double factor = utilCompany * 15/100 / allSalaries;
     double amountPaid = LVE_Payroll.generatedValue (get_TrxName() ,_C_BPartner_ID,"CC_ANTIC_UTILIDADES_LOTTT_132", getAD_Org_ID(), startDate, endDate);
     double amountPayable = factor * salarysEmployee;
     amountPayable = salariesLimit < amountPayable ? salariesLimit : amountPayable;
     result= amountPaid < amountPayable ? amountPayable - amountPaid : 0;
}

}'
WHERE value = 'beanshell:R_UTILIDADES_LOTTT_132'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

int YearsAntiq = getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC");
int DaysAccumulated = getConcept("CC_DIAS_ACUM_BONO_VAC");
int DaysCanceled = getAttribute("A_ACUM_DIAS_BONO_VACACIONAL_PAGADOS", date);
int DaysCaused = getAttribute("A_ACUM_DIAS_BONOS_VACACIONAL_CAUSADO", date);

result = 0.0;

if (DaysCanceled >= 0)
{
    if (DaysAccumulated > DaysCanceled)
        result = DaysAccumulated - DaysCanceled;
    else
        // Advancement vacation bonus
        result = (DaysCaused == DaysCanceled) ?  (getConcept("CC_DIAS_BASE_BONO_VAC") + YearsAntiq - (YearsAntiq > 0 ? 1 : 0)) : 0;
}'
WHERE value = 'beanshell:R_DIAS_BONO_VAC_POR_AÑO'
;

UPDATE adempiere.ad_rule 
SET script ='String jornada = getAttributeString("A_JORNADA_LABORAL");
if (jornada == null)
  jornada = "D";  /* Default Diurna */
double sueldo = getConcept("CC_SUELDO_MENSUAL");
double horas = getAttribute("C_HORAS_JORNADA_DIURNA");
if ("N".equals(jornada)) /* Nocturna */
  horas = getAttribute("C_HORAS_JORNADA_NOCTURNA");
if ("M".equals(jornada))  /* Mixta */
  horas = getAttribute("C_HORAS_JORNADA_MIXTA");
double sueldo_hora =  horas>0 ?  (sueldo / getAttribute("C_DIAS_DEL_MES")) / horas : 0.0;

double recargo = 1 + (getAttribute("C_RECARGO_HORAS_EXTRAS_DIURNAS") / 100);
recargo *= 1 + (getAttribute("C_RECARGO_HORAS_EXTRAS_NOCTURNAS") / 100);
String sql = "SELECT lve_daysnotice(?,?,?,?,?)";
double horas_nov = DB.getSQLValue(get_TrxName(), sql , new Object[] { getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_NOV_HORAS_EXTRAS_NOCTURNAS"});

if (horas_nov > 0.0)
  description = "Horas Extras Nocturnas: " + horas_nov;
result = horas_nov* sueldo_hora * recargo;'
WHERE value = 'beanshell:R_HORAS_EXTRAS_NOCTURNAS'
;

UPDATE adempiere.ad_rule 
SET script ='String sQuery = ""
	+ "SELECT MAX(d.enddate) " 
	+ "FROM hr_process p "
	+ "INNER JOIN hr_employee e ON p.hr_payroll_id = e.hr_payroll_id "
	+ "INNER JOIN hr_payroll r ON r.hr_payroll_id = e.hr_payroll_id "
	+ "INNER JOIN hr_contract c ON r.hr_contract_id = c.hr_contract_id "
	+ "INNER JOIN hr_period d ON d.hr_period_id = p.hr_period_id "
	+ "WHERE c.value = ''Vacaciones'' "
	+ "AND d.startdate >= ? "
	+ "AND d.enddate <= ? "
	+ "AND e.c_bpartner_id = ? "
                      + "AND p.docstatus = ''CL'' ";

Timestamp date = DB.getSQLValueTS(get_TrxName(),sQuery,new Object[] {_From.clone(), _To.clone(), _C_BPartner_ID});
	
if (date == null)
   result = 0;
else
   result = date.getTime();


'
WHERE value = 'beanshell:R_FEC_FIN_ULT_VAC_DISF'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

long oneDay = 86400000;
String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)) 
{
    Timestamp From = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
    From = new Timestamp(From.getTime() + oneDay);
    double days = LVE_Payroll.daysElapsed(From, _To);
    double sueldoDiario =  ("S".equals(getAttributeString("A_SUELDO_VARIABLE") )? 
                                          getConcept("CC_SUELDO_DIARIO_VARIABLE")  : 
                                         (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")));
     result = (days * sueldoDiario) - LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption6","Y",_Payroll);
}

'
WHERE value = 'beanshell:R_SUELDO_EN_LIQUIDACION'
;

UPDATE adempiere.ad_rule 
SET script ='LVE_Payroll NV = new LVE_Payroll();
if (getConcept("CC_CANCELAR_BONO_ALIMENTACION")==1.0 && getConcept("CC_APLICAR_CONCEPTO")==1.0){
 Timestamp dtStartEmployee = new Timestamp((long)getConcept("CC_FECHA_INICIO")), dtEndEmployee = new Timestamp((long)getConcept("CC_FECHA_FIN")); 
 Double Hours = getConcept("CC_HORAS_JORNADA_TRABAJADOR");
 Double bonDays = NV.workingDaysMonth(get_TrxName(),dtStartEmployee,dtEndEmployee,_Payroll,((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(),_C_BPartner_ID)+
                               NV.sumNotice(get_TrxName(), _Payroll, null, false,"''ASG_NOV_ADIC''", _C_BPartner_ID)-
                               NV.sumNotice(get_TrxName(), _Payroll, "isoption7",false, "''ASG_NOV_DIAS'', ''DED_NOV_DIAS''", _C_BPartner_ID);
 Boolean Cond1 = "S".equals(getAttributeString("A_PAGAR_BONO_ALIMENTACION_POR_DIA"));
 Boolean Cond2 = "S".equals(getAttributeString("C_PAGAR_BONO_ALIMENTACION_POR_DIA")) && getAttributeString("A_PAGAR_BONO_ALIMENTACION_POR_DIA")!="N"; 
 Boolean Cond3 = "S".equals(getAttributeString("A_APLICA_BONO_ALIMENTACION_MEDIO_TURNO"));
 Boolean Cond4 = "S".equals(getAttributeString("C_APLICA_BONO_ALIMENTACION_MEDIO_TURNO")) &&getAttributeString("A_APLICA_BONO_ALIMENTACION_MEDIO_TURNO")!="N";
 if (Cond1 || Cond2) {
         if (Cond3 || Cond4)
            bonDays -= NV.countNotice(get_TrxName(), _Payroll, null, "''DED_NOV_HORAS''", _C_BPartner_ID, (Hours/2), ">");
         else
            bonDays -= NV.countNotice(get_TrxName(), _Payroll, null, "''DED_NOV_HORAS''", _C_BPartner_ID, 0, ">");
         bonDays += NV.countNotice(get_TrxName(), _Payroll, null, "''ASG_HORA_EXTRA''", _C_BPartner_ID, (Hours/2), ">=");
         result = bonDays * Hours;
 }
 else {
         Double bonHours = (bonDays * Hours) + NV.sumNotice(get_TrxName(), _Payroll, null, false,"''ASG_HORA_EXTRA''", _C_BPartner_ID);
         bonHours -= NV.sumNotice(get_TrxName(), _Payroll, null, false,"''DED_HORA_EXTRA''", _C_BPartner_ID);
         result = bonHours;
 }
}'
WHERE value = 'beanshell:R_HORAS_BONO_ALIMENTACION'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
if (getConcept("CC_APLICAR_RETENCIONES") == 1) {
     long oneDay = 86400000;
     String sContract = getHR_Payroll().getHR_Contract().getValue();
     Timestamp From =LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),null);
     Timestamp From2 =LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Vacaciones''", true);
     Timestamp To =LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),null);
     Timestamp To2 =LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Vacaciones''", true);
     boolean isVariableSalary= "S".equals(getConceptString("A_SUELDO_VARIABLE"));
     boolean isLastHalfMonth= LVE_Payroll.isLastHalfMonth( _To.clone() );

     if (!"Liquidacion".equals(sContract)) {
        if (("N".equals(getConceptString("C_APLICAR_RETENCIONES_FINAL_MES")) &&  !isVariableSalary ) || ( isVariableSalary && !isLastHalfMonth))
            From = From.getTime() > _From.getTime() ? From : _From.clone();
        else if (isLastHalfMonth){ 
                Timestamp dateStartPayEmp = LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Semanal'', ''Quincenal'', ''Mensual''", true);
                dateStartPayEmp= dateStartPayEmp != null ? dateStartPayEmp : _From.clone();
                From = From.getTime() > dateStartPayEmp.getTime() ? From : dateStartPayEmp;
            }
     } else {
         From = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
         From = new Timestamp(From.getTime() + oneDay); }

     To = (To != null  && To.getTime() < _To.getTime() )? To : _To.clone();
     To2 = (To2 != null && To2.getTime() < To.getTime() )? To2 : To.clone();
     result=LVE_Payroll.dayOnPeriod(From, To, 1);  
     if (From2 != null) {
        From2 =From2.getTime() > From.getTime() ? From2 : From.clone();
        result -= LVE_Payroll.dayOnPeriod(From2, To2, 1); 
     }
}'
WHERE value = 'beanshell:R_LUNES_PARA_RETENCIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
if (getConcept("CC_MESES_TRABAJADOS")>=1 &&  getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")== 1.0){
 
Double days = getAttribute("C_DIAS_DEL_MES");

result= days>0 ?  (getConcept("CC_DIAS_UTILIDADES_POR_MES") / days) * getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD") :0.0 ;

}

'
WHERE value = 'beanshell:R_PORCION_DIARIA_UTIL'
;

UPDATE adempiere.ad_rule 
SET script ='import java.lang.Math;

long oneDay = 86400000;
Timestamp  dateStart= _DateStart.clone();
Timestamp  dateStartEmployee= LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp  startPayroll= new Timestamp( Math.max( dateStart.getTime() , dateStartEmployee.getTime() ) );
Timestamp  endVacation= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Vacaciones''", true);
endVacation= endVacation==null ? new Timestamp(0) : endVacation;
Timestamp  startVacation= LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Vacaciones''", true);
startVacation= startVacation==null ? new Timestamp(0) : startVacation;
Timestamp  From = _From.clone();
Timestamp To = _To.clone();
Timestamp lastPayroll= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),_Payroll, true); 
String sContract = getHR_Payroll().getHR_Contract().getValue();

         if ("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES").toUpperCase())){
                      	
		if(!"Vacaciones".equals(sContract)){	       
			   if(endVacation==null){
		
			        result= Math.max(From.getTime(), dateStartEmployee.getTime());
			   }
		                         if(endVacation.getTime() <To.getTime()){

			        result= endVacation.getTime() +oneDay ;
			   }
		}else{ // Es Contrato de Vacaciones

			    result=lastPayroll.getTime()+oneDay; 
		}
         }else{
		if(!"Vacaciones".equals(sContract)){

		       long value =  Math.max(From.getTime(), endVacation.getTime()+oneDay);
                                                   result= Math.max( value, dateStartEmployee.getTime());

		}else{ 

		                      result= startVacation.getTime();
		} 
          }
'
WHERE value = 'beanshell:R_NO_APLICAR_RETENCI_FINAL_MES'
;

UPDATE adempiere.ad_rule 
SET script ='int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");

String sQuery = "select lve_daysnoticecategory(?,?,?,?,?)";
double daysnotice = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "ASG_NOV_DIAS"});

//double dedDays = daysnotice + getConcept("CC_DEDUCIR_DIAS_EGRESO")  + getConcept("CC_DEDUCIR_DIAS_INGRESO");

String sContract = getHR_Payroll().getHR_Contract().getValue();

//double workDays =  (double) LVE_Payroll.workDays(get_TrxName(), _From, _To, _Payroll, ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(), sContract);
// Updated by Jenny Rodriguez
Timestamp dtStartEmployee = new Timestamp((long)getConcept("CC_FECHA_INICIO")), dtEndEmployee = new Timestamp((long)getConcept("CC_FECHA_FIN")); 
double workDays =  (double) LVE_Payroll.workDays(get_TrxName(), dtStartEmployee, dtEndEmployee, _Payroll,
                                                                                          ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(), sContract);

//result = workDays - dedDays;
result = workDays + daysnotice;

'
WHERE value = 'beanshell:R_DIAS_EFECTIVOS_TRABAJADOS'
;

UPDATE adempiere.ad_rule 
SET script ='
String msg=null;
Timestamp To = _To.clone();
Timestamp From = _From.clone();
String sContract =process.getHR_Payroll().getHR_Contract().getValue();
Timestamp startProc= LVE_Payroll.firstDayOfMonth(From);
Timestamp endMoth=LVE_Payroll.lastDayOfMonth(From);
boolean lastWeekPayroll= org.compiere.util.TimeUtil.isValid(From,To, endMoth);
//***********************Timestamp To = LVE_Payroll.lastDayOfMonth(From);
//***********************if (To.getTime() > _To.getTime())
//***********************    To = _To;
//***********************Boolean lastWeekPayroll= LVE_Payroll.isLastWeek(To); 

result=0;
if (( !"Vacaciones".equals(sContract) && "S".equals( getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES")) ) || ( !"Vacaciones".equals(sContract) &&  
      process.getConcept("CC_DIAS_VACACIONES")!= 0 )  || (startProc != null)) {
	if (lastWeekPayroll){
	     result=1;
	     msg = LVE_Payroll.addValueDateConcept( "A_FECHA_INICIO_ULTIMO_MES_PROCESADO", process,
                                      LVE_Payroll.firstDayOfMonth(From),_C_BPartner_ID);
	     if (msg != null)	
	        result=0;
                          msg = LVE_Payroll.addValueDateConcept( "A_FECHA_FIN_ULTIMO_MES_PROC", process, LVE_Payroll.lastDayOfMonth(From), _C_BPartner_ID);
	     if (msg != null)	
	        result=0;
                      }
}			   
				'
WHERE value = 'beanshell:R_CIERRE_FECHA_ULTIMO_MES_PROC'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp To = LVE_Payroll.lastDayOfMonth(_From);
if (To.getTime() > _To.getTime())
  To = _To;

long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

Boolean lastWeek= LVE_Payroll.isLastWeek(To); 
result=0.0; 

if (lastWeek && 
   !"S".equals(getAttributeString("C_PRESTACIONES_DEPOSITADAS_FIDEICOMISO")) && 
    "S".equals(getAttributeString("C_CALCULAR_INTERES_PRESTACIONES")) && 
    "S".equals(getAttributeString("C_PAGAR_INTERESES_PRESTACIONES_MENSUAL")) && 
    getConcept("CC_APLICAR_CONCEPTO")==1.0 ){

             result= LVE_Payroll.generatedValue(get_TrxName() , _C_BPartner_ID, "CC_MONTO_INTERESES_PRESTACIONES", getAD_Org_ID() , 
                                                                                (Timestamp) getAttributeDate("A_FECHA_MES_ANTERIOR_PRESTACIONES", date) ); 
}'
WHERE value = 'beanshell:R_INTERESES_PREST_SOC_MENSUAL'
;

UPDATE adempiere.ad_rule 
SET script ='import org.eevolution.model.*;
LVE_Payroll NV = new LVE_Payroll();

String msg=null;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

if (getConcept("CC_VACACIONES")>0){
     result=1.0;
     msg = NV.addValueConcept("A_ACUM_DIAS_VACACIONES_DISFRUTADOS",process,
                new BigDecimal(getAttribute("A_ACUM_DIAS_VACACIONES_DISFRUTADOS",date)+
                getConcept("CC_DIAS_VACACIONES")), _C_BPartner_ID);
     if (msg != null)  result=0;

    msg = NV.addValueConcept("A_ACUM_DIAS_VACACIONES_INASIST_INJUST",process,
               new BigDecimal(getAttribute("A_ACUM_DIAS_VACACIONES_INASIST_INJUST",date)+ getConcept("CC_DIAS_DESC_VAC_INAS_INJUS")), _C_BPartner_ID);
     if (msg != null) result=0;

    msg = NV.addValueConcept("A_ACUM_DIAS_ADIC_VACA_PAG_SIN_DISFRUT",process,
               new BigDecimal(getAttribute("A_ACUM_DIAS_ADIC_VACA_PAG_SIN_DISFRUT",date)+ getConcept("CC_VACACIONES_PAGADAS_SIN_DISF")), _C_BPartner_ID);
     if (msg != null)  result=0;

    msg = NV.addValueConcept("A_ACUM_DIAS_BONO_VACACIONAL_PAGADOS",process,
                new BigDecimal(getAttribute("A_ACUM_DIAS_BONO_VACACIONAL_PAGADOS",date)+ 
                getConcept("CC_DIAS_BONO_VAC_POR_AÑO")), _C_BPartner_ID);
    if (msg != null)  result=0;     
}'
WHERE value = 'beanshell:R_CIERRE_DIA_VAC_BONO_VAC_USAD'
;

UPDATE adempiere.ad_rule 
SET script ='Double value1=getConcept("CC_MONTO_INTERESES_PRESTACIONES");
Double value2=getConcept("CC_GARANTIA_PREST_SOCIALES");
Double value3=getConcept("CC_MONTO_PRES_SOC_DIAS_ADIC");
long oneDay = 86400000;

Timestamp From = (Timestamp) _From.clone();
From.setMonth(From.getMonth()-1);

String msg=null; 
result=0.0;

if ((value2+value3)>0){
     result=1.0;
     msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_PRESTACIONES_SOCIALES",process,
                new BigDecimal(getAttribute("A_MONTO_ACUM_PRESTACIONES_SOCIALES", From)+value2+value3),_C_BPartner_ID);
     if (msg != null)	
          result=0.0;

     if (value1>0){
           msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_INTERESES_PRESTACIONES",process,
                      new BigDecimal(getAttribute("A_MONTO_ACUM_INTERESES_PRESTACIONES" , From)+value1),_C_BPartner_ID);
           if (msg != null)	
              result=0.0;
      }
}

'
WHERE value = 'beanshell:R_CIERRE_ACUM_PREST_SOC_INTERE'
;

UPDATE adempiere.ad_rule 
SET script ='result =1.0;
Double value1=  0;
Integer month= LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INGRESO_ANTIGUEDAD")) , _To);
if (month>3 && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0)
   value1= getConcept("CC_DIAS_GARANTIA_PRESTACIONES"); 

Double value2= (getConcept("CC_DIAS_ADIC_PRESTACIONES")> getAttribute ("C_TOPE_DIAS_ADIC_PRESTACIONES") ) 
                          ? getAttribute("C_TOPE_DIAS_ADIC_PRESTACIONES") 
                          : getConcept("CC_DIAS_ADD_PRESTACIONES" ) ; 
String msg=null; 
long oneDay = 86400000;

Timestamp From = (Timestamp) _From.clone();
From.setMonth(From.getMonth()-1);

if (value1>0) {

      msg = LVE_Payroll.addValueConcept("A_ACUM_DIAS_PRESTACIONES_SOCIALES",process,
                 new BigDecimal(getAttribute("A_ACUM_DIAS_PRESTACIONES_SOCIALES", From)+ value1), _C_BPartner_ID );
     if (msg != null)	
          result=0;
}

if (value2>0) {
     msg = LVE_Payroll.addValueConcept("A_ACUM_DIAS_ADICIONALES_PRESTACIONES",process,
                new BigDecimal(getAttribute("A_ACUM_DIAS_ADICIONALES_PRESTACIONES", From)+ value2), _C_BPartner_ID );
     if (msg != null)	
          result=0;
}'
WHERE value = 'beanshell:R_CIERRE_DIAS_PRESTACIONES_CAU'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 
Timestamp dateEndEmployee = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 
if (!LVE_Payroll.typeEndEmployee (get_TrxName(),getAD_Org_ID(),  _C_BPartner_ID,  "''Mensual'',''Quincenal'',''Semanal''", "JD") && getConcept("CC_POR_LIQUIDAR")==1.0){
     
     Double value1= (getConcept("CC_DIAS_BASE_DISFRUTE_VACAC") + (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES")-1))/12 *(LVE_Payroll.monthsOnPeriod(new Timestamp ((long) getConcept("CC_FEC_ING_CAL_VAC_FRAC")),dateEndEmployee));
     Double value2= (getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")/12)*(LVE_Payroll.monthsOnPeriod(new Timestamp ((long) getConcept("CC_FEC_ING_CAL_VAC_FRAC")),dateEndEmployee));
     Double value3= (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES") >= 2 ) ? value1 : value2 ;
     result= getConcept("CC_SUELDO_DIARIO_VAC")* value3; 
}
'
WHERE value = 'beanshell:R_VACACIONES_FRACCIONADAS_LIQU'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

import org.eevolution.model.*;
LVE_Payroll NV = new LVE_Payroll();

String msg=null;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

double acumAddDays = getAttribute("A_ACUM_INI_DIAS_ADICIONALES_VACACIONES") + 
                                      getAttribute("A_ACUM_DIAS_ADIC_VACACIONES_CAUSADAS", date) - 
                                      getAttribute("A_ACUM_DIAS_ADIC_VACA_PAG_SIN_DISFRUT", date) ;

double acumDays = getAttribute("A_ACUM_INI_DIAS_VACACIONES_VENCIDAS") + 
                                getAttribute("A_ACUM_DIAS_VACACIONES_CAUSADAS", date) - 
                                getAttribute("A_ACUM_DIAS_VACACIONES_DISFRUTADOS", date) - 
                                getAttribute("A_ACUM_DIAS_VACACIONES_INASIST_INJUST", date) ;


result = acumAddDays + acumDays + getConcept("CC_DIAS_VACACIONES_CAUSADAS");'
WHERE value = 'beanshell:R_DIAS_DISPONIBLES_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
String msg=null;
LVE_Payroll NV = new LVE_Payroll();
Boolean bVac =  "Vacaciones".equals(getHR_Payroll().getHR_Contract().getValue()) ;
Double value1 = getConcept( "CC_DIAS_VACACIONES_CAUSADAS"); 
Double value2 = getConcept( "CC_DIAS_BONO_VAC_CAUSADO"); 
Double value3 = 0;
if (getConcept("CC_DIAS_VACACIONES") > 0) {
     Timestamp From_V = bVac ? _From.clone() : NV.StartDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Vacaciones''", true);
     Timestamp To_V     = bVac ? _To.clone()     : NV.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Vacaciones''", true);
     value3  = NV.workingDaysMonth(get_TrxName(), From_V, To_V, _Payroll, ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(), _C_BPartner_ID);
}
Double value4 =  value3 > 0 ? getConcept("CC_DIAS_BONO_VAC_POR_AÑO") : 0;
long oneDay = 86400000;
Timestamp date = (Timestamp) _From.clone();
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);
To = _To.clone();
Double concept= getConcept("CC_DIAS_BASE_DISFRUTE_VACAC");
Timestamp dateIncome = new Timestamp( (long) getConcept("CC_FECHA_INGRESO_CAL_VACACIONES"));

if (  (!bVac && value1>0 && org.compiere.util.TimeUtil.isValid(date,To, dateIncome)) || (bVac &&  value3> 0)  ) {
     Double availableDaysVacations = getAttribute("A_TOT_DIAS_DISPONIBLES_VACACIONES", date)-getAttribute("A_ACUM_DIAS_VACACIONES_DISFRUTADOS",date)+value1-value3;
     Double availableDaysBon=getAttribute("A_TOT_DIAS_SIN_CANCELAR_BONO_VACACIONAL", date)-getAttribute("A_ACUM_DIAS_BONO_VACACIONAL_PAGADOS",date)+value2-value4;  
     result=1.0;
     msg = LVE_Payroll.addValueConcept("A_TOT_DIAS_DISPONIBLES_VACACIONES",process,new BigDecimal(availableDaysVacations), _C_BPartner_ID);
     if (msg != null)  result=0;
     msg = LVE_Payroll.addValueConcept("A_TOT_DIAS_SIN_CANCELAR_BONO_VACACIONAL",process,new BigDecimal(availableDaysBon), _C_BPartner_ID);
     if (msg != null)  result=0;
}
'
WHERE value = 'beanshell:R_ACT_DIAS_DISP_VAC_BON_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= (getAttribute("C_DIAS_BONO_FIN_AÑO")==1) 
             ? ( getAttribute("C_FACTOR_FONDO_AHORRO_EMPRESARIAL")/100* getConcept("CC_APORTE_FONDO_AHORRO_TRABAJAD")) 
             : (getAttribute("C_FACTOR_FONDO_AHORRO_EMPRESARIAL")/ 100* LVE_Payroll.sumConcept(get_TrxName(), "IsOption_9", _From, _To , _C_BPartner_ID,getHR_Payroll().getHR_Contract().getValue())).doubleValue(); 
}'
WHERE value = 'beanshell:R_APORTE_FONDO_AHORRO_EMPRESA'
;

UPDATE adempiere.ad_rule 
SET script ='import org.compiere.model.*;

double sueldo = getAttribute("A_SUELDO_MENSUAL_USD");

if (sueldo > 0) {

        /* convert */
        BigDecimal tasa = MConversionRate.convertBase(Env.TrxName(), new BigDecimal(sueldo), 100, getDateAcct(), 0, getAD_Client_ID(), getAD_Org_ID());
        sueldo = sueldo * tasa.doubleValue();
        description = "Sueldo en dolares " + sueldo + " conversion=" + tasa;
} else {
       
        sueldo =  getAttribute("A_SUELDO_MENSUAL_VEB", _To.clone());

}

result = sueldo;

'
WHERE value = 'beanshell:R_SUELDO_MENSUAL'
;

UPDATE adempiere.ad_rule 
SET script ='if (A_Tab.getValue("C_BPartner_ID") != null && (A_Tab.getValue("HR_Department_ID") != null || A_Tab.getValue("HR_Job_ID") != null ))
	A_Tab.setValue("C_BPartner_ID",null);

if (A_Tab.getValue("C_BPartner_ID_F1") != null && A_Tab.getValue("HR_Job_ID")==null)
	A_Tab.setValue("C_BPartner_ID_F1_ID",null);

if (A_Tab.getValue("C_BPartner_ID_F2") != null && A_Tab.getValue("HR_Department_ID")==null)
	A_Tab.setValue("C_BPartner_ID_F2_ID",null);

result="";'
WHERE value = 'beanshell:LVE_restart_filters'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
    result= getAttribute("A_FACTOR_FONDO_AHORRO_TRABAJADOR")/100 * 
                 LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption_9","Y",_Payroll);
}

'
WHERE value = 'beanshell:R_APORTE_FONDO_AHORRO_TRABAJAD'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

String sContract = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContract);
int monthsOnPeriod = getConcept("CC_MESES_TRABAJADOS");
Timestamp dateIncome = new Timestamp((long)getConcept("CC_FECHA_INGRESO_CAL_VACACIONES"));
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp To = (Timestamp) _To.clone();
From.setDate(1);
From = new Timestamp(From.getTime()-oneDay);
String sQuery = "SELECT MAX(d.enddate) FROM hr_process p  INNER JOIN hr_employee e ON p.hr_payroll_id = e.hr_payroll_id "
	+ "INNER JOIN hr_payroll r ON r.hr_payroll_id = e.hr_payroll_id INNER JOIN hr_contract c ON r.hr_contract_id = c.hr_contract_id "
	+ "INNER JOIN hr_period d ON d.hr_period_id = p.hr_period_id WHERE c.value in (?) AND d.startdate >= ? AND d.enddate <= ? AND e.c_bpartner_id = ? ";
Timestamp lastdateVac= DB.getSQLValueTS(get_TrxName() ,sQuery,new Object[] {"''Vacaciones''", From, To,_C_BPartner_ID});
Timestamp lastdateLasEmp= DB.getSQLValueTS(get_TrxName(),sQuery, new Object[] {"''Mensual'', ''Quincenal'', ''Semanal''", From, To,_C_BPartner_ID});

boolean bApplying = (monthsOnPeriod % 12 == 0) && (getConcept("CC_ANTIGUEDAD_SUPERIOR_UN_AÑO")== 1.0) && 
                                 (From.getTime() <= dateIncome.getTime() && dateIncome.getTime() <= To.getTime());
boolean bNomNormal = !bCont_Vac && (lastdateVac == null ||   To.getTime() > lastdateVac.getTime());
boolean bNomVac =  bCont_Vac && (lastdateLasEmp == null ||  To.getTime() > lastdateLasEmp.getTime());
					
if (bApplying && (bNomNormal || bNomVac))
{
	if (getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")>getAttribute("C_DIAS_TOPE_DISFRUTE_VACACIONES"))
		result = getConcept("CC_DIAS_BASE_DISFRUTE_VACAC");
	else
		result = getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES") >= 2 ? 
		             getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")+(getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES")-1) : 
		             getConcept("CC_DIAS_BASE_DISFRUTE_VACAC");
}	     '
WHERE value = 'beanshell:R_DIAS_VACACIONES_CAUSADAS'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;  /* falso, no aplicar */

String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bAplicaPeriodo = "S".equals(getAttributeString("A_RETENER_SSO_RP")) && 
                                         (
		(getConcept("CC_ULTIMA_SEMANA") == 0 && "N".equals(getConceptString("C_APLICAR_RETENCIONES_FINAL_MES")))
	                     ||
		(getConcept("CC_ULTIMA_SEMANA") == 1 && "S".equals(getConceptString("C_APLICAR_RETENCIONES_FINAL_MES")))
	                    );
double iDiasVacPeriodo = getConcept("CC_DIAS_VACACIONES");
boolean bCont_Vac = "Vacaciones".equals(sContrato);
double iEdad = getConcept("CC_EDAD");
String sSexo;

String sConsulta = "SELECT e.gender "
	   + "FROM   c_bpartner b inner join hr_employee e ON b.c_bpartner_id = e.c_bpartner_id "
	   + "WHERE  b.c_bpartner_id = ? ";
sSexo = DB.getSQLValueString(get_TrxName(), sConsulta, _C_BPartner_ID);

if  ( (!bCont_Vac || (bCont_Vac && iDiasVacPeriodo>0)) && bAplicaPeriodo && 	
      (("F".equals(sSexo) && iEdad<=getAttribute("C_TOPE_EDAD_MUJERES")) || ("M".equals(sSexo) && iEdad<=getAttribute("C_TOPE_EDAD_HOMBRES")))
    )
    result = 1.0; /* verdadero aplicar */

    '
WHERE value = 'beanshell:R_APLICAR_RETENCIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;
String sContract = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContract);
int monthsOnPeriod = getConcept("CC_MESES_TRABAJADOS");
Timestamp dateIncome = new Timestamp((long)getConcept("CC_FECHA_INGRESO_CAL_VACACIONES"));

long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp To = (Timestamp) _To.clone();
From.setDate(1);
From = new Timestamp(From.getTime()-oneDay);
String sQuery = "SELECT MAX(d.enddate) FROM hr_process p INNER JOIN hr_employee e ON p.hr_payroll_id = e.hr_payroll_id "
	+ "INNER JOIN hr_payroll r ON r.hr_payroll_id = e.hr_payroll_id INNER JOIN hr_contract c ON r.hr_contract_id = c.hr_contract_id "
	+ "INNER JOIN hr_period d ON d.hr_period_id = p.hr_period_id WHERE c.value in (?) AND d.startdate >= ? AND d.enddate <= ? AND e.c_bpartner_id = ? ";

Timestamp lastdateVac= DB.getSQLValueTS(get_TrxName() ,sQuery,new Object[] {"''Vacaciones''", From, To,_C_BPartner_ID});
Timestamp lastdateLasEmp= DB.getSQLValueTS(get_TrxName(),sQuery, new Object[] {"''Mensual'', ''Quincenal'', ''Semanal''", From, To,_C_BPartner_ID});

boolean bApplying = (monthsOnPeriod % 12 == 0) && (getConcept("CC_ANTIGUEDAD_SUPERIOR_UN_AÑO")== 1.0) && 
                                 (From.getTime() <= dateIncome.getTime() && dateIncome.getTime() <= To.getTime());
boolean bNomNormal = !bCont_Vac && (lastdateVac == null ||   To.getTime() > lastdateVac.getTime());
boolean bNomVac =  bCont_Vac && (lastdateLasEmp == null ||  To.getTime() > lastdateLasEmp.getTime());
					
if (bApplying && (bNomNormal || bNomVac))
{
	if (getConcept("CC_DIAS_BASE_BONO_VAC")>getAttribute("C_TOPE_PAGAR_DIAS_BONO_VACACIONAL"))
		result = getConcept("CC_DIAS_BASE_BONO_VAC");
	else
		result = getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC") >= 2 ? 
		             getConcept("CC_DIAS_BASE_BONO_VAC")+(getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC")-1) : 
		             getConcept("CC_DIAS_BASE_BONO_VAC");
}'
WHERE value = 'beanshell:R_DIAS_BONO_VAC_CAUSADO'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();

result=0.0;

Double variableSalary = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption9","Y",_Payroll) / getAttribute("C_DIAS_DEL_MES");

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && 
   ( !"Liquidacion".equals(sContract) || ( "Liquidacion".equals(sContract) && getConcept("CC_POR_LIQUIDAR")==1.0 ) ) ) {

    Double value=  getConcept("CC_SUELDO_DIARIO") + variableSalary +
                             getConcept("CC_PORCION_DIARIA_BONO_VAC") +
                             getConcept("CC_PORCION_DIARIA_UTIL") ;

    result= value;
}
'
WHERE value = 'beanshell:R_SALARIO_DIARIO_INTEGRAL'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0) {

     result = (getConcept("CC_DIAS_BASE_BONO_VAC")+getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC"))/12 * getConcept("CC_SUELDO_DIARIO_VAC") ; 
}

'
WHERE value = 'beanshell:R_PROVISION_MENSUAL_BONO_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='result = LVE_Payroll.monthsOnPeriod(_DateStart , _To)

'
WHERE value = 'beanshell:R_MESES_TRABAJADOS'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
Double days = getAttribute("C_DIAS_DEL_MES");

if(getConcept("CC_MESES_TRABAJADOS")>=1 && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0){

     Double value = (getConcept("CC_DIAS_BASE_BONO_VAC")+getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC")) / 12;

     Double salary =  getConcept("CC_SUELDO_MENSUAL") / days;

     result= salary > 0 ?  value / days * salary : 0.0;  

}

'
WHERE value = 'beanshell:R_PORCION_DIARIA_BONO_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
String sVariableSalary = getAttributeString("A_SUELDO_VARIABLE");

if ("S".equals(sVariableSalary)) {
      Timestamp DateIni = new Timestamp(getConcept("CC_FEC_INIC_CORT_TRIM_PAG_VAC"));
      Timestamp DateFin = new Timestamp(getConcept("CC_FEC_FINAL_CORT_TRIM_PAG_VAC"));

      if (DateIni != null && DateFin != null) {
            double accum = getAttribute("A_MONT_ACUM_INI_SUELDO_VAC_PROM_TRIM") >0 ? getAttribute("A_MONT_ACUM_INI_SUELDO_VAC_PROM_TRIM") : 0;
            double salary = LVE_Payroll.sumConcept(
                                     get_TrxName(), "IsOption1", startDate,  endDate, "''Mensual'',''Quincenal'',''Semanal''", _C_BPartner_ID).doubleValue();

            double months = monthsWorked >= 3 || accum > 0 ? 3 : monthsWorked;            
            result = (accum + salary) / months;
      }
}

'
WHERE value = 'beanshell:R_PROMEDIO_TRIM_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='if (getAttributeString("C_DISFRUTAR_DIAS_ADICIONALES_VACACIONES").trim().toUpperCase().equals("S") && 
   (getAttributeString("A_DISFRUTAR_DIAS_ADICIONALES_VACACIONES")==null || 
    getAttributeString("A_DISFRUTAR_DIAS_ADICIONALES_VACACIONES").trim().toUpperCase().equals("S"))){
     result=1.0;
}else
     result=0.0;
'
WHERE value = 'beanshell:R_DISFRUTAR_DIAS_ADIC_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0) {
     result= getConcept("CC_DIAS_UTILIDADES_POR_MES") * getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD"); 
}'
WHERE value = 'beanshell:R_PROVISION_MENSUAL_UTILIDADES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;

Timestamp dateBreak = getAttributeDate("C_AÑO_CORTE_ANTIGUEDAD_L_O_T_T_T");
Integer monthDateBreak = LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INGRESO_ANTIGUEDAD")) , dateBreak);
Integer month = 0;

if (monthDateBreak > 3)
    month = LVE_Payroll.monthsOnPeriod(dateBreak , _To);
else
    month = LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INGRESO_ANTIGUEDAD")) , _To);

if (month>=3 && month%3==0 && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0)
   result= getConcept("CC_SALARIO_PARA_PRESTACIONES") / getAttribute("C_DIAS_DEL_MES") * getConcept("CC_DIAS_GARANTIA_PRESTACIONES"); '
WHERE value = 'beanshell:R_GARANTIA_PREST_SOCIALES'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp dateIniEmployee = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Semanal'', ''Quincenal''");
Timestamp dateEndPayroll = _To.clone();

dateIniEmployee.setYear(dateEndPayroll.getYear());	      
result = dateIniEmployee.getTime();

'
WHERE value = 'beanshell:R_FECHA_INGRESO_CAL_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='String sContract = getHR_Payroll().getHR_Contract().getValue();
String sVariableSalary = getAttributeString("A_SUELDO_VARIABLE");

double dDaysBaseVac = getConcept("CC_DIAS_BASE_DISFRUTE_VACAC");
double dDaysPayVac = getConcept("CC_DIAS_BASE_PAGAR_VACACIONES");

double dDays = getAttribute("C_DIAS_DEL_MES");
boolean bQuarterlyAverage = "S".equals(sVariableSalary); // SI EL SALARIO ES VARIABLE, SACAR PROMEDIO DEL TRIMESTRE

double value = 0;
if ((getConcept("CC_DIAS_VACACIONES") > 0) ||  ("Prestaciones".equals(sContract)) || (getConcept("CC_POR_LIQUIDAR") == 1.0))
{
   value = (bQuarterlyAverage ? getConcept("CC_PROMEDIO_TRIM_VAC") : getConcept("CC_SUELDO_MES_ANTERIOR_VAC")) / dDays;	
					   
   value = value * (dDaysBaseVac > 0 ? dDaysPayVac / dDaysBaseVac : 1);
}  
result = value;'
WHERE value = 'beanshell:R_SUELDO_DIARIO_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

Timestamp lastPayroll= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Prestaciones''", true);
Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");

if (getConcept("CC_POR_LIQUIDAR")==1.0 && lastPayroll != null && dateEndEmployee!=null && lastPayroll.getTime()<dateEndEmployee.getTime() &&
    getConcept("CC_AÑOS_ANTIGUEDAD")>1 && (getConcept("CC_MESES_TRABAJADOS")%12) == 0) {

      Double additionalDays = getConcept("CC_DIAS_ADIC_PRESTACIONES") + 
                                              getAttribute("C_DIAS_ADICIONALES_PRESTACIONES");

      Double topAdditionalDays = getAttribute("C_TOPE_DIAS_ADIC_PRESTACIONES");
                  
      result= (additionalDays > topAdditionalDays ? topAdditionalDays : additionalDays) * getConcept("CC_SALARIO_PARA_PRESTACIONES") / getAttribute("C_DIAS_DEL_MES");
}



'
WHERE value = 'beanshell:R_PRES_SOC_DIAS_ADIC_FIN_RELAC'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 

if (getConcept("CC_APLICA")==1.0)
{
    long oneDay = 86400000;
    Integer month= LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INGRESO_ANTIGUEDAD")),new Timestamp (_To.clone().getTime()-oneDay ));

    Double additionalDays = getConcept("CC_DIAS_ADIC_PRESTACIONES");
    Double topAdditionalDays = getAttribute("C_TOPE_DIAS_ADIC_PRESTACIONES");

    if ( (month%12)==0 && getConcept("CC_AÑOS_ANTIGUEDAD")>1  && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI") == 1.0 ) 
         result= (additionalDays > topAdditionalDays ? topAdditionalDays : additionalDays) * getConcept("CC_SALARIO_PARA_PRESTACIONES") / getAttribute("C_DIAS_DEL_MES");
}'
WHERE value = 'beanshell:R_MONTO_PRES_SOC_DIAS_ADIC'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp From = _From.clone();

Timestamp dtStartEmployee= LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''");

if (From.getTime() > dtStartEmployee.getTime())    
   dtStartEmployee = From;  

result = dtStartEmployee.getTime();'
WHERE value = 'beanshell:R_FECHA_INICIO'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
long oneDay = 86400000; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){     
     String sQuery = ""
     + "SELECT Max(m.validto) "
     + "FROM   hr_movement m "
     + "INNER JOIN hr_concept c ON m.hr_concept_id = c.hr_concept_id  AND c.value = ''CC_GARANTIA_PREST_SOCIALES''  AND c_bpartner_id = ? ";

     Timestamp startDate = DB.getSQLValueTS(get_TrxName(), sQuery, new Object[] {_C_BPartner_ID});
     Timestamp dateIniEmployee   = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(),null);
     Timestamp endDateEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");

     if (!LVE_Payroll.lastDayOfMonth(dateIni))
        startDate.setDate(dateIniEmployee.getDate());
     startDate = startDate + oneDay;

     double daysAccum = LVE_Payroll.daysElapsed(startDate, endDateEmployee) * 
                                      getAttribute("C_VALOR_ANUAL_PRESTACIONES_SOCIALES")  / getAttribute("C_DIAS_DEL_MES");

     double accum = daysAccum * getConcept("CC_SALARIO_PARA_PRESTACIONES") / getAttribute("C_DIAS_DEL_MES");
     
     description = "Dias : " + (getAttribute("A_ACUM_INI_DIAS_PRESTACIONES") + getAttribute("A_ACUM_DIAS_PRESTACIONES_SOCIALES") + daysAccum);

     result=getAttribute("A_MONTO_ACUM_INICIAL_PREST_SOCIALES") + getAttribute("A_MONTO_ACUM_PRESTACIONES_SOCIALES") + accum;
}


'
WHERE value = 'beanshell:R_PRESTACIONES_SOCIALES'
;

UPDATE adempiere.ad_rule 
SET script ='result= 0.0;

Timestamp dateEndEmployee = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 

if (!LVE_Payroll.typeEndEmployee (get_TrxName(),getAD_Org_ID(),  _C_BPartner_ID,  "''Mensual'',''Quincenal'',''Semanal''", "JD") && getConcept("CC_POR_LIQUIDAR")==1.0){

      Integer month= LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FEC_ING_CAL_VAC_FRAC")), dateEndEmployee);
      Double value1= (getConcept("CC_DIAS_BASE_BONO_VAC")+ getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC"))/12*month;
      Double value2= (getConcept("CC_DIAS_BASE_BONO_VAC")/12)* month;
      result= (getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC") >= 1 ? value1:value2 )* getConcept("CC_SUELDO_DIARIO_VAC");
} 

'
WHERE value = 'beanshell:R_BONO_VACACIONAL_FRACCIONADO'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp To = _To;

Timestamp dtEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''"); 

if (dtEndEmployee == null || (dtEndEmployee!=null && To.getTime() < dtEndEmployee.getTime()))    
   dtEndEmployee = To;

result = dtEndEmployee.getTime();
'
WHERE value = 'beanshell:R_FECHA_FIN'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

long oneDay = 86400000; 
Timestamp dateLastPayEmp = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true);
long  values= _From.getTime()-oneDay;
if (dateLastPayEmp == null)
     dateStartPayEmp= new  Timestamp(values);

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 &&
    getAttributeDate("A_FECHA_FIN_ULTIMA_VACACIONES_DIF")!=null && 
    getAttributeDate("A_FECHA_ULTIMO_BONO_POST_VACACIONAL_PAG")!=null && 
    getAttribute("C_MONTO_PAGAR_BONO_POST_VACACIONAL") > 0 &&
    org.compiere.util.TimeUtil.isValid(dateLastPayEmp, _To, getAttributeDate("A_FECHA_FIN_ULTIMA_VACACIONES_DISF")) &&
    _To.getYear() > getAttributeDate("A_FECHA_ULTIMO_BONO_POST_VACACIONAL_PAG").getYear())
{
    result = getAttribute("C_MONTO_PAGAR_BONO_POST_VACACIONAL");
}
'
WHERE value = 'beanshell:R_BONO_POST_VACACIONAL'
;

UPDATE adempiere.ad_rule 
SET script ='result= 0.0;
long oneDay = 86400000;
double daysVac = getAttribute("A_TOT_DIAS_DISPONIBLES_VACACIONES");

if (daysVac > 0) {
    // Encontrar la fecha de inicio en que se causaron las ultimas vacaciones
    Timestamp dateInitialEmployee = LVE_Payroll.DateEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 
    Timestamp dateEndEmployee = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 
    Timestamp dateIni = dateInitialEmployee.clone();
    dateini.setYear(_To.getYear());
    if (dateIni > dateEndEmployee)   dateini.setYear(dateini.getYear()-1);
    double estimatedDays = (daysVac / 5 * 2) * oneDay;
    Timestamp dateEnd = dateIni.clone().getTime() + estimatedDays;
    
    int restday = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
    String sQueryRest = sQuery = "select lve_daysrest(?,?,?)";
    String sQueryHoliday = "select lve_holidaysinperiod(?,?,?,?)";

    double restdays = DB.getSQLValue(get_TrxName(), sQueryRest, new Object[] {dateIni, dateEnd,restday});
    double holidays = DB.getSQLValue(get_TrxName(), sQueryHoliday, new Object[] {_Payroll, dateIni, dateEnd, restdays});

    int totalDays = LVE_Payroll.daysElapsed(dateIni,dateEnd);
   
    while (totalDays - restdays - holidays < daysVac + 1){
         dateEnd.setTime(dateEnd.getTime()+oneDay);
         restdays = DB.getSQLValue(get_TrxName(), sQueryRest, new Object[] {dateIni, dateEnd,restday});
         holidays = DB.getSQLValue(get_TrxName(), sQueryHoliday, new Object[] {_Payroll, dateIni, dateEnd, restdays});
         totalDays = LVE_Payroll.daysElapsed(dateIni,dateEnd);		
     }
     result = (restdays * holidays) + getConcept("CC_SUELDO_DIARIO_VAC");
}'
WHERE value = 'beanshell:R_DESCANSOYFERIADO_VAC_VENC'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp lastDate = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true);

result= lastDate.getTime();'
WHERE value = 'beanshell:R_FEC_FINAL_CORT_TRIM_PAG_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp dateIni = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''");

if (dateIni == null)    dateIni = new Timestamp(0);

if (LVE_Payroll.yearsElapsed(dateIni, _To.clone())>0)
   result =1.0;
else
   result = 0.0; '
WHERE value = 'beanshell:R_ANTIGUEDAD_SUPERIOR_UN_AÑO'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;
long continuousdays = getAttribute("C_DIAS_CONTINUOS_PARA_PAGAR_NUEVO_REPOSO") ; 
Timestamp From = _From.clone();
Timestamp To = _From.clone();
From.setTime(From.getTime() - (continuousdays * oneDay));
To.setTime(To.getTime() - oneDay);

BigDecimal sumConcept = LVE_Payroll.sumConcept(get_TrxName(), From, To , "CC_DIAS_REPOSO_EMPRESA", _C_BPartner_ID, "''Mensual'',''Quincenal'',''Semanal''");

result = sumConcept == null ? 0 : sumConcept.doubleValue();
'
WHERE value = 'beanshell:R_DIAS_REPOSO_PAGADO_EMPRESA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 &&
    getAttribute("C_MONTO_BONO_ASISTENCIA_PUNTUAL") > 0 &&
    "S".equals(getAttributeString("A_PAGAR_BONO_ASISTENCIA_PUNTUAL")))
{
    double months = LVE_Payroll.periodExecutionContract(get_TrxName(), _C_BPartner_ID, getHR_Payroll().getHR_Contract().getValue(), "D", process) / getAttribute("C_DIAS_DEL_MES");
    result = getAttribute("C_MONTO_BONO_ASISTENCIA_PUNTUAL") * months;
}
'
WHERE value = 'beanshell:R_BONO_ASISTENCIA_PUNTUAL'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && 
    getConcept("CC_APLICAR_ULTIMA_NOMINA_MES") == 1.0 &&
    getConcept("CC_NUMERO_HIJOS_PRIMA") > 0 &&
    getAttribute("C_MONTO_PAGAR_DE_PRIMA_POR_HIJOS") > 0 &&
    "S".equals(getAttributeString("A_PAGAR_PRIMA_POR_HIJO")))
{
   double months = LVE_Payroll.periodExecutionContract(get_TrxName(), _C_BPartner_ID, getHR_Payroll().getHR_Contract().getValue(), "D", process) / getAttribute("C_DIAS_DEL_MES");
   result = getAttribute("C_MONTO_PAGAR_DE_PRIMA_POR_HIJOS") * getConcept("CC_NUMERO_HIJOS_PRIMA") * months;
}'
WHERE value = 'beanshell:R_PRIMA_POR_HIJOS'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0;

Timestamp dateNextPayroll= LVE_Payroll.nextPayroll(get_TrxName(), _Payroll, getHR_Payroll().getHR_Contract().getValue(), _To, _C_BPartner_ID);

if( (dateNextPayroll !=null) && ( getAttribute("C_AÑO_INICIO_OPERACIONES") == dateNextPayroll.getYear() ) ){
   result=1.0;
} 
'
WHERE value = 'beanshell:R_APLICAR_CAL_AÑO_INIC_OPERACI'
;

UPDATE adempiere.ad_rule 
SET script ='
result=0.0; 

if(getConcept("CC_POR_LIQUIDAR")==1.0){
    Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
    Double days = getConcept("CC_DIAS_UTILIDADES_POR_MES") * 
                            LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INICIO_UTIL_FRAC")), dateEndEmployee);
    result= days * getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");

}'
WHERE value = 'beanshell:R_UTILIDADES_FRACCIONADAS'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;  
Timestamp dateIniEmployee = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateAfterLastPayroll = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Utilidades''", true);

dateReturn = dateIniEmployee;

if (dateAfterLastPayroll != null)
{
  dateAfterLastPayroll.setTime(dateAfterLastPayroll.getTime()+oneDay);

  dateReturn = dateIniEmployee.getTime() > dateAfterLastPayroll.getTime() ? dateIniEmployee : dateAfterLastPayroll; 
}

result = dateReturn.getTime();'
WHERE value = 'beanshell:R_FECHA_INICIO_UTIL_FRAC'
;

UPDATE adempiere.ad_rule 
SET script ='

result=0.0;
Timestamp From= _From.clone();
Timestamp To= _To.clone();
String sContract = getHR_Payroll().getHR_Contract().getValue();

Boolean valor= org.compiere.util.TimeUtil.isValid(From,To,(Timestamp)  getAttributeDate("C_FECHA_PAGO_RETROACTIVO"));
 
if(valor && ("Quincenal".equals(sContract) || "Semanal".equals(sContract) ) &&  getConcept("CC_APLICAR_CONCEPTO")==1.0){
     Double valor= getAttribute("A_RETROACTIVO_INICIAL_SUELDO");

    result = valor >0 ? valor :  LVE_Payroll. retroactiveValue (get_TrxName(),  _C_BPartner_ID ,  _Department , From, To) ; 

//(LVE_Payroll.monthsOnPeriod(From, To) * getConcept("CC_SUELDO") - LVE_Payroll.generatedValue (get_TrxName() ,_C_BPartner_ID,"CC_SUELDO",  //getAD_Org_ID(), (Timestamp)  getAttributeDate("C_FECHA_INICIO_RETROACTIVO"), (Timestamp)  getAttributeDate("C_FECHA_FIN_RETROACTIVO") ) );

}'
WHERE value = 'beanshell:R_RETROACTIVO_SUELDO'
;

UPDATE adempiere.ad_rule 
SET script ='Timestamp dFecUltCalcPres;
Double dValorTabla=0.0;
long oneDay = 86400000; 

if (!"S".equals(getAttributeString("C_PRESTACIONES_DEPOSITADAS_FIDEICOMISO")) && "S".equals(getAttributeString("C_CALCULAR_INTERES_PRESTACIONES"))){

   dFecUltCalcPres =getAttributeDate("A_FECHA_ULTIMO_CALC_INTERESES_PRESTACION",  new Timestamp(_From.clone().getTime()-oneDay));
   if (dFecUltCalcPres==null)
   {
        dFecUltCalcPres = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'', ''Quincenal'', ''Semanal''",true);
        if (dFecUltCalcPres.getTime() > _To.getTime())
	dFecUltCalcPres = _To.clone();
        dFecUltCalcPres.setDate(1);
        dFecUltCalcPres = new Timestamp(dFecUltCalcPres.getTime()-oneDay);
   }        
   if (dFecUltCalcPres!=null)
      dValorTabla = getAttribute("C_INTERES_SOBRE_PRESTACION",dFecUltCalcPres);
   result=dValorTabla;
}
else
   result=0.0;'
WHERE value = 'beanshell:R_BASE_%_CALCULO_INTERES_PREST'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
Timestamp From = _From.clone();
Timestamp To= _To.clone();
String sContract = getHR_Payroll().getHR_Contract().getValue();

if ( "N".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES")) || "Mensual".equals( sContract))
        result = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption1","Y",_Payroll);

if (("S".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES"))) && LVE_Payroll.isLastHalfMonth( To ) && (!"Mensual".equals( sContract)))
{
        From = LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(),"''Quincenal'',''Semanal''", true) ;
        To= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Quincenal'',''Semanal''", true) ;
        From = From ==null ? _From.clone() : From;
        To = To==null ? _To.clone() : To;   
        result = LVE_Payroll.GeneratedConcepts(get_TrxName(),process,"isoption1","Y", From, To,_C_BPartner_ID,"''Quincenal'',''Semanal''", "Y").doubleValue()   +     
                     LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption1","Y",_Payroll)  ;
}
'
WHERE value = 'beanshell:R_MONTO_BASE_PARA_LRPVH'
;

UPDATE adempiere.ad_rule 
SET script ='import org.eevolution.model.*;
LVE_Payroll NV = new LVE_Payroll();

String sIsvariableSalary = getAttributeString("A_SUELDO_VARIABLE"); 
Double dSalaryTop = getConcept("CC_TOPE_SALARIO_BONO_ALIMENT");
boolean bSalaryLessThanTop = false;

if ((sIsvariableSalary==null) || ("N".equals(sIsvariableSalary)))
{
   bSalaryLessThanTop = getConcept("CC_SUELDO_MENSUAL") <= dSalaryTop; 
   String sValue = bSalaryLessThanTop==true ? "N" : "S";
   String msg = NV.addValueStringConcept("A_SALARIO_VARIABLE_SUPERO_TOPE_BONO_ALIM",process,sValue, _C_BPartner_ID);
}
else
if ((sIsvariableSalary!=null) && ("S".equals(sIsvariableSalary)))
{
   boolean bVarSalaryTopExceeded = NV.salaryTop(get_TrxName(), _AD_Client_ID, _C_BPartner_ID, _From, getAttribute("C_MESES_SALARIO_VAR_PARA_BONO_ALIMENT"));
   Double dVariableSalary = NV.GeneratedConcepts(get_TrxName(),process,"isoption1","Y",_From,_To,_C_BPartner_ID,"''Mensual'',''Semanal'',''Quincenal''", "Y").doubleValue();
   bSalaryLessThanTop = (dVariableSalary <= dSalaryTop && !bVarSalaryTopExceeded);
   String sValue = dVariableSalary <= dSalaryTop ? "N" : "S";
   String msg = NV.addValueStringConcept("A_SALARIO_VARIABLE_SUPERO_TOPE_BONO_ALIM",process,sValue, _C_BPartner_ID);
}
result=0.0;
if (bSalaryLessThanTop && getConcept("CC_DIAS_EFECTIVOS_TRABAJADOS") >0) 
  result=1.0;'
WHERE value = 'beanshell:R_CANCELAR_BONO_ALIMENTACION'
;

UPDATE adempiere.ad_rule 
SET script ='
result = getConcept("CC_PRESTACIONES_SOCIALES");
'
WHERE value = 'beanshell:R_INDEMNIZACION_DESPIDO_INJUST'
;

UPDATE adempiere.ad_rule 
SET script ='long oneDay = 86400000;

Double value1= getConcept("CC_GARANTIA_PREST_SOCIALES");

Boolean value2= LVE_Payroll.isLastWeek(new Timestamp (_To.getTime()+oneDay) );

Double monthOnPeriod = LVE_Payroll.monthsOnPeriod(LVE_Payroll.DateInitialEmployee
(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"), _To);

result=0.0; 

if ( ( value1>0 || value2 ) && (monthOnPeriod%12)==0){
     result=1.0;

     msg = LVE_Payroll.addValueDateConcept("A_FECHA_CORTE_ANUAL_VACACIONES ",process,_To, _C_BPartner_ID);
     if (msg != null)	
        result=0.0;
}'
WHERE value = 'beanshell:R_CIERRE_FEC_ANUAL_VACACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
long oneDay = 86400000;

double monthsWorked = getConcept("CC_MESES_TRABAJADOS");

if (monthsWorked >= 1 && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0){
  
   Timestamp startDate   = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true);
   if (startDate == null)
       startDate = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
   
   Timestamp endDate    = startDate.clone();
   Timestamp startDate2 = startDate.clone();

   Integer monthsDefault = "S".equals(getConceptString("A_SUELDO_VARIABLE")) ? 6 : 1;
   Integer divisor = monthsWorked > monthsDefault ? monthsDefault : monthsWorked;

   startDate.setMonth(startDate.getMonth()-divisor);

   startDate = new Timestamp(startDate.getTime()+oneDay);

   startDate2.setMonth(startDate2.getMonth()-1);
   startDate2 = new Timestamp(startDate2.getTime()+oneDay);

   Double salaryAccum = LVE_Payroll.sumConcept(get_TrxName(), "IsOption4", startDate2,  endDate, "''Mensual'',''Quincenal'',''Semanal''", _C_BPartner_ID).doubleValue();
   Double salaryVariable = LVE_Payroll.sumConcept(get_TrxName(), "IsOption9", startDate,  endDate, "''Mensual'',''Quincenal'',''Semanal''", _C_BPartner_ID).doubleValue();

   Double aliquots = (getConcept("CC_PORCION_DIARIA_BONO_VAC") +getConcept("CC_PORCION_DIARIA_UTIL")) * getAttribute("C_DIAS_DEL_MES");

   result= salaryAccum + (salaryVariable / divisor) + aliquots;
}'
WHERE value = 'beanshell:R_SALARIO_PARA_PRESTACIONES'
;

UPDATE adempiere.ad_rule 
SET script ='String contract=  getHR_Payroll().getHR_Contract().getValue();

if (    ("Prestaciones".equals(contract) &&  _To.getTime() <=  getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_To).getTime()) || ! "Prestaciones".equals(contract)){
     result=1.0;
}else{
    result=0.0;
}'
WHERE value = 'beanshell:R_APLI_PRES_FEC_ULT_PROCESAMI'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getAttribute("A_BONO_VEHICULO_MOTO", _From) != null &&
    getAttribute("A_BONO_VEHICULO_MOTO", _From) > 0)
{
  /* double days_asg = getConcept("CC_DIAS_ASG_NOVEDADES_DIARIAS");
   double days_ded = getConcept("CC_DIAS_DED_NOVEDADES_DIARIAS") + getConcept("CC_DEDUCIR_DIAS_EGRESO") + getConcept("CC_DEDUCIR_DIAS_INGRESO");
   double workDays = (double) LVE_Payroll.workDays(get_TrxName(), _From, _To, _Payroll, "0,"+ ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString()) -
                                  getConcept("CC_DIAS_DESCANSO_PERIODO");
   double workedDays = workDays + days_asg - days_ded;
   result = getConcept("A_BONO_VEHICULO_MOTO") / getAttribute("DIAS_DEL_MES") * workedDays;   */
   boolean isLastHalfMonth= LVE_Payroll.isLastHalfMonth( _To.clone() );
  

   if (!isLastHalfMonth)
       result = getAttribute("A_BONO_VEHICULO_MOTO", _From); 
}

'
WHERE value = 'beanshell:R_BONO_VEHICULO_MOTO'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0; 
long oneDay = 86400000;

Timestamp startDate   = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true);
if (startDate == null)
       startDate = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
Timestamp endDate    = startDate.clone();
Timestamp startDate2 = startDate.clone();

Integer monthsWorked = getConcept("CC_MESES_TRABAJADOS");
Integer monthsDefault = "S".equals(getAttributeString("C_APLICAR_UTILIDADES_SOBRE_DEVENG_ANUAL")) ? 12 : 6;
Integer divisor = monthsWorked > monthsDefault ? monthsDefault : monthsWorked;

startDate.setMonth(startDate.getMonth()-divisor);
startDate = new Timestamp(startDate.getTime()+oneDay);

startDate2.setMonth(startDate2.getMonth()-1);
startDate2 = new Timestamp(startDate2.getTime()+oneDay);

Double salaryAccum = LVE_Payroll.sumConcept(get_TrxName(), "IsOption4", startDate2,  endDate, "''Mensual'',''Quincenal'',''Semanal''", _C_BPartner_ID).doubleValue();
Double salaryVariable = LVE_Payroll.sumConcept(get_TrxName(), "IsOption9", startDate,  endDate, "''Mensual'',''Quincenal'',''Semanal''", _C_BPartner_ID).doubleValue();

result= ((salaryAccum + (salaryVariable / divisor)) / getAttribute("C_DIAS_DEL_MES")) + getConcept("CC_PORCION_DIARIA_BONO_VAC");'
WHERE value = 'beanshell:R_SUELDO_DIARIO_PARA_UTILIDAD'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;
long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();

String contract=  getHR_Payroll().getHR_Contract().getValue();
Double dFactor = "Semanal".equals(contract) ? 35 * 30 : 1;

String sVariableSalary = getAttributeString("A_SUELDO_VARIABLE");

if (!"S".equals(sVariableSalary)) {
    Timestamp DateFin = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true);
    Timestamp DateIni = null ;

   if (DateFin.getTime() > From.getTime() || From.getMonth() == DateFin.getMonth()) {
       From.setDate(1);
       DateFin.setTime(From.getTime() - oneDay);
    }
    DateIni = DateFin;

    if ("Semanal".equals(contract))
        DateIni.setTime(DateFin.getTime() - ((35 + 1) * oneDay));
    else
        DateIni.setMonth(DateFin.getMonth() - 1);    

    if (DateIni != null && DateFin != null)
        result = LVE_Payroll.sumConcept(get_TrxName(), "IsOption1", DateIni, DateFin, _C_BPartner_ID, "") / dFactor * 30;
}'
WHERE value = 'beanshell:R_SUELDO_MES_ANTERIOR_VAC'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

	String sueldo_variable = getConceptString("A_SUELDO_VARIABLE");

	if (sueldo_variable == null)
  		sueldo_variable = "N";

	double sueldo_diario;
	if (sueldo_variable.equals("S"))
  		sueldo_diario = getConcept("CC_SUELDO_DIARIO_VARIABLE");
  	else 
    		sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
  
	double dias_feriado_trab = getConcept("CC_DIAS_FERIADO_TRABAJADO");
	result = sueldo_diario * dias_feriado_trab;
	description = "Días: "  + dias_feriado_trab;
}'
WHERE value = 'beanshell:R_FERIADO_TRABAJADO'
;

UPDATE adempiere.ad_rule 
SET script ='import org.eevolution.model.*;
double salary = 0;
LVE_Payroll NV = new LVE_Payroll();
long oneDay = 86400000;
Timestamp To = _From.clone();
To.setDate(1);
To.setTime(To.getTime()-oneDay);

Timestamp From = To.clone();
From.setMonth(From.getMonth() - 12);

Timestamp DateIniEmp = NV.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");

if (DateIniEmp.getTime() > From.getTime())
   From = DateIniEmp;

if (From.getTime() >= To.getTime())
    salary = getConcept("CC_SUELDO_MENSUAL");

if (From.getTime() < To.getTime())
{
    double months = NV.daysElapsed(From, To);
    salary =NV.GeneratedConcepts(get_TrxName(),process,"isoption1","Y", From, To,_C_BPartner_ID, "''Mensual'',''Quincenal'',''Semanal''", "Y").doubleValue()  / months;
}

if (salary == 0)
   salary = getConcept("CC_SUELDO_MENSUAL");

result = salary;'
WHERE value = 'beanshell:R_SUELDO_MENSUAL_VARIABLE'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;
if (getConcept("CC_APLICA")==1.0) {
String sContract = getHR_Payroll().getHR_Contract().getValue();
int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
double monthdays = (int)getAttribute("C_DIAS_DEL_MES");
double valueReturn = 0;
double dedDays = getConcept("CC_DEDUCIR_DIAS_EGRESO")  + getConcept("CC_DEDUCIR_DIAS_INGRESO");

if (!"Vacaciones".equals(sContract) && !"Liquidacion".equals(sContract)){
    switch (sContract){
        case "Quincenal":
            valueReturn = (monthdays / 2) - dedDays;
            break;
        case "Mensual":
            valueReturn = monthdays - dedDays;
            break;
        default:
            valueReturn =  (double) getAttribute("C_DIAS_NOMINA_SEMANAL") - dedDays;
            break;
    }
}

double sueldoDiario =  ("S".equals(getAttributeString("A_SUELDO_VARIABLE") )? 
                                      getConcept("CC_SUELDO_DIARIO_VARIABLE")  : 
                                     (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")));

result = (valueReturn * sueldoDiario)-LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption6","Y",_Payroll);
description = "Sueldo base diario: " + sueldoDiario;
}'
WHERE value = 'beanshell:R_SUELDO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sueldo_variable = getConceptString("A_SUELDO_VARIABLE");

if (sueldo_variable == null)
  sueldo_variable = "N";

double sueldo_diario;
if (sueldo_variable.equals("S")) {
  sueldo_diario = getConcept("CC_SUELDO_DIARIO_VARIABLE");
} else {
  sueldo_diario =(getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}

double dias_desc_trab = getConcept("CC_DIAS_DESCANSO_TRABAJADO");


result = sueldo_diario * dias_desc_trab;
description = "Días: "  + dias_desc_trab;
}'
WHERE value = 'beanshell:R_DESCANSO_TRABAJADO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
//double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_DIURNO");
double dias_adic = getAttribute("A_DIAS_ADIC_LABORADOS_DIURNO",_From, _To);
if (dias_adic != 0.0)
  description = "Días: " + dias_adic;
result = sueldo_diario * dias_adic;
}'
WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_DIURNO'
;

UPDATE adempiere.ad_rule 
SET script ='String sContrato = getHR_Payroll().getHR_Contract().getValue();

boolean bCont_Vac = "Vacaciones".equals(sContrato);
double factor = getAttribute("C_FACTOR_REG_PREST_VIVIENDA_H_TRABAJADOR");
double sueldobase = getConcept("CC_MONTO_BASE_PARA_LRPVH");


if (getConcept("CC_APLICAR_RETENCIONES_LRPVH") == 1.0 && (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1.0)){
   result = sueldobase * factor / 100;
   description = "Sueldo base: " + sueldobase;
}'
WHERE value = 'beanshell:R_LEY_REG_PREST_VIV_HAB'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnoticeA = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "A_DIAS_REPOSO"});
double daysnoticeD = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_REPOSO"});
double daysToPay = 0;

if (daysnoticeA > 0) {
double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");
Double percentclient = (getAttribute("C_PAGAR_100%_REPOSO") == 1.0 || getAttribute("A_PAGAR_100%_REPOSO") == 1.0) ? 100 : 
			getAttribute("C_PORCENTAJE_PAGAR_POR_REPOSO_EMPRESA");

if (daysPaid + daysnoticeD >= daysrestclient) 
	daysToPay = daysnoticeA;
else 
	daysToPay = daysnoticeA - daysrestclient + daysnoticeD;

daysToPay = daysToPay > 0 ? daysToPay : 0;
result = (daysToPay * percentclient / 100) * getConcept("CC_SUELDO_DIARIO") ;
description = "Días de Reposo al " + percentclient + "%: " + daysToPay;
}'
WHERE value = 'beanshell:R_MONTO_REPOSO_EMPRESA'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnoticeA = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "A_DIAS_REPOSO"});
double daysnoticeD = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_REPOSO"});
double daysToPay = 0;
double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");
double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");

if (daysnoticeA + daysnoticeD > 0 && daysrestclient > daysPaid) {
	daysToPay = daysnoticeA + daysnoticeD > daysrestclient - daysPaid ? 
		    daysrestclient - daysPaid : daysnoticeA + daysnoticeD;

daysToPay = daysToPay > 0 ? daysToPay : 0;
result = daysToPay * getConcept("CC_SUELDO_DIARIO") ;
description = "Días de Reposo por la Empresa: " + daysToPay;
}'
WHERE value = 'beanshell:R_MONTO_REPOSO_EMPRESA_DED'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");

//Timestamp From = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp To = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
//From = From.getTime() > _From.getTime() ? From : _From.clone();
To = (To != null  && To.getTime() < _To.getTime() )? To : _To.clone();

Timestamp From;
long oneDay = 86400000;
String sContract = getHR_Payroll().getHR_Contract().getValue();
if (!"Liquidacion".equals(sContract)) {
    From = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
    From = From.getTime() > _From.getTime() ? From : _From.clone();
}else{
    From = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
    From = new Timestamp(From.getTime() + oneDay);
}

sQuery = "select lve_holidaysinperiod(?,?,?,?)";
double holidaysinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {_Payroll, From, To, dayrest});

sQuery = "select lve_holidaysnoticeinperiod(?,?,?,?,?,?,?)";
double holidaysnoticeinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {getAD_Client_ID(),_Payroll,_C_BPartner_ID, From, To,"ASG_NOV_DIAS",dayrest});

result = (holidaysinperiod - holidaysnoticeinperiod) *
             (getAttributeString("A_SUELDO_VARIABLE")=="S" ? 
              getConcept("CC_SUELDO_DIARIO_VARIABLE") : 
             (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")) );
description = "Días Feriados: " + (holidaysinperiod - holidaysnoticeinperiod);
}'
WHERE value = 'beanshell:R_FERIADO_LEGAL'
;

UPDATE adempiere.ad_rule 
SET script ='String sContrato = getHR_Payroll().getHR_Contract().getValue();

boolean bCont_Vac = "Vacaciones".equals(sContrato);
double factor = getAttribute("C_FACTOR_IVSS_TRABAJADOR") / 100;
double base_sueldo_minimo = getAttribute("C_TOPE_SAL_MIN_SEGURO_SOCIAL_OBL") * getAttribute("C_SUELDO_MINIMO");
double sueldo_para_ret = getConcept("CC_SUELDO_PARA_RETENCIONES");
double sueldobase = (base_sueldo_minimo > sueldo_para_ret ? sueldo_para_ret : base_sueldo_minimo);

if ((getConcept("CC_APLICAR_RETENCIONES") == 1) && (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1)) {  
   double cant_lunes  = getConcept("CC_LUNES_PARA_RETENCIONES");
   if ("S".equals(getConceptString("A_SUELDO_VARIABLE"))){
      result= LVE_Payroll.amountRetention(_C_BPartner_ID,process ,"CC_SEGURO_SOCIAL_OBLIGATORIO_TR",base_sueldo_minimo,factor, cant_lunes,"CC_LUNES_PARA_RETENCIONES");
      description = "N° Lunes: " + cant_lunes + ". Sueldo base: " + base_sueldo_minimo;
  }else{
      result = (sueldobase * 12.0 / 52.0) * factor * cant_lunes; 
      description = "N° Lunes: " + cant_lunes + ". Sueldo base: " + sueldobase;
  }	
}'
WHERE value = 'beanshell:R_SEGURO_SOCIAL_OBLIGATORIO_TR'
;

UPDATE adempiere.ad_rule 
SET script ='String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContrato);
double cant_lunes = getConcept("CC_LUNES_PARA_RETENCIONES");
double factor = getAttribute("C_FACTOR_REG_PREST_EMPLEO_TRABAJADOR") / 100;
double base_sueldo_minimo = getAttribute("C_TOPE_SAL_MIN_SEGURO_SOCIAL_OBL") * getAttribute("C_SUELDO_MINIMO");
double sueldo_para_ret = getConcept("CC_SUELDO_PARA_RETENCIONES");
double sueldobase = (base_sueldo_minimo > sueldo_para_ret ? sueldo_para_ret : base_sueldo_minimo);

if ((getConcept("CC_APLICAR_RETENCIONES") == 1) && (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1))
   if ("S".equals(getConceptString("A_SUELDO_VARIABLE"))) {
        result= LVE_Payroll.amountRetention ( _C_BPartner_ID,process ,"CC_REGIMEN_PRESTACIONAL_TR",base_sueldo_minimo,factor, cant_lunes,"CC_LUNES_PARA_RETENCIONES");
	description = "N° Lunes: " + cant_lunes + ". Sueldo base: " + base_sueldo_minimo;
   } else {
	result = ( (sueldobase * 12.0 / 52.0) * factor * cant_lunes );
 	description = "N° Lunes: " + cant_lunes + ". Sueldo base: " + sueldobase;
   }'
WHERE value = 'beanshell:R_REGIMEN_PRESTACIONAL_TR'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;

String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnotice = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_REPOSO"});

if (daysnotice > 0) {
        double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
        double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");

        if (daysPaid < daysrestclient)
            daysnotice = daysnotice - daysrestclient - daysPaid > 0 ? daysnotice - daysrestclient - daysPaid : 0;
        description = "Días de Reposo IVSS: " + daysnotice;
        result = daysnotice * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}'
WHERE value = 'beanshell:R_DEDUCCION_REPOSO'
;

UPDATE adempiere.ad_rule 
SET script ='String jornada = getAttributeString("A_JORNADA_LABORAL");
if (jornada == null)
  jornada = "D";  /* Default Diurna */
double sueldo = getConcept("CC_SUELDO_MENSUAL");
double horas = getAttribute("C_HORAS_JORNADA_DIURNA");
if ("N".equals(jornada)) /* Nocturna */
  horas = getAttribute("C_HORAS_JORNADA_NOCTURNA");
if ("M".equals(jornada))  /* Mixta */
  horas = getAttribute("C_HORAS_JORNADA_MIXTA");
double sueldo_hora =  horas>0 ?  (sueldo / getAttribute("C_DIAS_DEL_MES")) / horas : 0.0;

double recargo = 1 + (getAttribute("C_RECARGO_HORAS_EXTRAS_DIURNAS") / 100);
String sql = "SELECT lve_daysnotice(?,?,?,?,?)";
double horas_nov = DB.getSQLValue(get_TrxName(), sql , new Object[] { getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_NOV_HORAS_EXTRAS_DIURNAS"});

if (horas_nov != 0.0)
  description = "Horas Extras Diurnas: " + horas_nov;
result = horas_nov* sueldo_hora * recargo;'
WHERE value = 'beanshell:R_HORAS_EXTRAS_DIURNAS'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnoticeA = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "A_DIAS_REPOSO"});
double daysnoticeD = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_REPOSO"});
double daysToPay = 0;

if (daysnoticeA > 0) {
double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");
Double percentclient = (getAttribute("C_PAGAR_100%_REPOSO") == 1.0 || getAttribute("A_PAGAR_100%_REPOSO") == 1.0) ? 0 : 
			100-getAttribute("C_PORCENTAJE_PAGAR_POR_REPOSO_EMPRESA");

if (daysPaid + daysnoticeD >= daysrestclient) 
	daysToPay = daysnoticeA;
else 
	daysToPay = daysnoticeA - daysrestclient + daysnoticeD;

daysToPay = daysToPay > 0 ? daysToPay : 0;
result = (daysToPay * percentclient / 100) * getConcept("CC_SUELDO_DIARIO") ;
description = "Días de reposo por el I.V.S.S. (" + percentclient + "%): " + daysToPay;
}'
WHERE value = 'beanshell:R_DIAS_REPOSO_IVSS'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;
String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnoticeA = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "A_DIAS_REPOSO"});
double daysnoticeD = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_REPOSO"});
double daysToPay = 0;

if (daysnoticeA > 0) {
double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");
Double percentclient = (getAttribute("C_PAGAR_100%_REPOSO") == 1.0 || getAttribute("A_PAGAR_100%_REPOSO") == 1.0) ? 0 : 
			100-getAttribute("C_PORCENTAJE_PAGAR_POR_REPOSO_EMPRESA");

if (daysPaid + daysnoticeD >= daysrestclient) 
	daysToPay = daysnoticeA;
else 
	daysToPay = daysnoticeA - daysrestclient + daysnoticeD;

daysToPay = daysToPay > 0 ? daysToPay : 0;
result = (daysToPay * percentclient / 100) * getConcept("CC_SUELDO_DIARIO") ;
description = "Días de reposo por el I.V.S.S. (" + percentclient + "%): " + daysToPay;
}'
WHERE value = 'beanshell:R_MONTO_REPOSO_IVSS'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;

int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sQuery = "select lve_daysnoticeinperiod(?,?,?,?,?,?,?)";

double days = DB.getSQLValue(get_TrxName(), sQuery, 
                        new Object[] { getAD_Client_ID(), _Payroll, _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_INASISTENCIA", dayrest } );

if (days > 0)
    result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
	
description = "Días de Inasistencia: " + days;'
WHERE value = 'beanshell:R_DEDUCCION_INASISTENCIA'
;

UPDATE adempiere.ad_rule 
SET script ='result=0.0;
Timestamp From = _From.clone();
Timestamp To= _To.clone();
String sContract = getHR_Payroll().getHR_Contract().getValue();

if ( "N".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES")) || "Mensual".equals( sContract)) {
    if (getConcept("CC_ULTIMA_SEMANA")!=1.0)
	result = getConcept("CC_SUELDO_MENSUAL")  + LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption9","Y",_Payroll);
    else {
	From = LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(),"''Quincenal'',''Semanal''", true) ;
        To= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Quincenal'',''Semanal''", true) ;
        From = From ==null ? _From.clone() : From;
        To = To==null ? _To.clone() : To; 
      	result = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption1","Y",_Payroll) +
        LVE_Payroll.GeneratedConcepts(get_TrxName(),process,"isoption1","Y", From, To,_C_BPartner_ID,"''Quincenal'',''Semanal''", "Y").doubleValue();
    }
}
if (("S".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES"))) && LVE_Payroll.isLastHalfMonth( To ) && (!"Mensual".equals( sContract))) {
        From = LVE_Payroll.StartDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(),"''Quincenal'',''Semanal''", true) ;
        To= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Quincenal'',''Semanal''", true) ;
        From = From ==null ? _From.clone() : From;
        To = To==null ? _To.clone() : To;   
        result = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption1","Y",_Payroll) +
        LVE_Payroll.GeneratedConcepts(get_TrxName(),process,"isoption1","Y", From, To,_C_BPartner_ID,"''Quincenal'',''Semanal''", "Y").doubleValue();
}'
WHERE value = 'beanshell:R_SUELDO_PARA_RETENCIONES'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
String sueldo_variable = getConceptString("A_SUELDO_VARIABLE");

if (sueldo_variable == null)
  sueldo_variable = "N";

double sueldo_diario;
if (sueldo_variable.equals("S")) {
  sueldo_diario = getConcept("CC_SUELDO_DIARIO_VARIABLE");
} else {
  sueldo_diario =(getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}

double recargo = getAttribute("C_RECARGO_POR_FERIADO_DIAS_DESCANSO") / 100;
double dias_feriado_trab = getConcept("CC_DIAS_FERIADO_TRABAJADO");

result = sueldo_diario * recargo * dias_feriado_trab;
description = "Días: "  + dias_feriado_trab;
}'
WHERE value = 'beanshell:R_RECARGO_FERIADO_TRABAJADO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double recargo_feriado = 1 + (getAttribute("C_RECARGO_POR_FERIADO_DIAS_DESCANSO") / 100);
double recargo_nocturno = 1 + (getAttribute("C_RECARGO_POR_BONO_NOCTURNO") / 100);
double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
//double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_FERIADO_DIURNO");
double dias_adic = getAttribute("A_DIAS_ADIC_LABORADOS_FERIADO_NOCTURNO",_From, _To);
if (dias_adic != 0.0)
  description = "Dias Adicionales Feriados Nocturnos: " + dias_adic;
result = ( sueldo_diario * dias_adic * recargo_feriado ) * recargo_nocturno;
}'
WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_FER_NOCTUR'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double recargo = 1 + (getAttribute("C_RECARGO_POR_BONO_NOCTURNO") / 100);
double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
//double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_NOCTURNO");
double dias_adic = getAttribute("A_DIAS_ADIC_LABORADOS_NOCTURNO",_From, _To);
if (dias_adic != 0.0)
  description = "Dias Adicionales Nocturnos: " + dias_adic;
result = sueldo_diario * dias_adic * recargo;
}'
WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_NOCTURNO'
;

UPDATE adempiere.ad_rule 
SET script ='result = 0;

String sql = "SELECT lve_daysnotice(?,?,?,?,?)";
double days = DB.getSQLValue(get_TrxName(), sql, new Object[] {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_SUSPENSION_REM"});

if (days != null && days > 0 && getConcept("CC_APLICA")==1.0)
   result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));

description = "Días: "  + days;'
WHERE value = 'beanshell:R_ASIGNACION_SUSPENSION'
;

INSERT INTO "adempiere"."ad_rule"("ad_client_id", "ad_org_id", "ad_rule_id", "accesslevel", 
"created", "createdby", "description", "entitytype", "eventtype", "help", "isactive", "name", 
"ruletype", "script", "updated", "updatedby", "value")
VALUES(1000000, 0, (SELECT MAX(ad_rule_id)+1 FROM ad_rule), NULL, 
now(), 100, 'A002', 'U', 'H', NULL, 'Y', 'R_DIAS_DESCANSO_DOMINGOS', 
'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0 && getAttributeString("C_DESGLOSAR_DIAS_DESCANSO").equals("S")) {
long oneDay = 86400000;
int dayrest = getAttributeString("C_DESGLOSAR_DIAS_DESCANSO").equals("S")?0:(int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sContract = getHR_Payroll().getHR_Contract().getValue();
Timestamp From;
Timestamp To = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
To = (To != null  && To.getTime() < _To.getTime() )? To : _To.clone();

if (!"Liquidacion".equals(sContract)) {
    From = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
    From = From.getTime() > _From.getTime() ? From : _From.clone();
}
else {
    From = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
    From = new Timestamp(From.getTime() + oneDay);
}

String sQuery = "select lve_daysrest(?,?,?)";
double restdays = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {From, To,dayrest});

sQuery = "select lve_holidaysinperiod(?,?,?,?)";
double holidaysinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {_Payroll, From, To, dayrest});

sQuery = "select lve_holidaysnoticeinperiod(?,?,?,?,?,?,?)";
double holidaysnoticeinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {getAD_Client_ID(),_Payroll,_C_BPartner_ID, From, To,"ASG_NOV_DIAS",dayrest});

double sueldoDiario =  (getAttributeString("A_SUELDO_VARIABLE")=="S" ? 
                                      getConcept("CC_SUELDO_DIARIO_VARIABLE")  : 
                                     (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")));

result = (restdays) * sueldoDiario;
description = "Días de descanso: " + (restdays);
} ', now(), 100, 'beanshell:R_DIAS_DESCANSO_DOMINGOS')
;

UPDATE adempiere.ad_rule 
SET script ='result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
long oneDay = 86400000;
String sSplitDayRest = getAttributeString("C_DESGLOSAR_DIAS_DESCANSO");
int dayrest1 = sSplitDayRest.equals("S")?(int)getAttribute("C_DIA_SEMANA_DESCANSO"):0;
int dayrest2 = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sContract = getHR_Payroll().getHR_Contract().getValue();
Timestamp From;
Timestamp To = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
To = (To != null  && To.getTime() < _To.getTime() )? To : _To.clone();

if (!"Liquidacion".equals(sContract)) {
    From = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
    From = From.getTime() > _From.getTime() ? From : _From.clone();
}
else {
    From = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
    From = new Timestamp(From.getTime() + oneDay);
}

String sQuery = "select lve_daysrest2(?,?,?,?)";
double restdays = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {From, To, dayrest1, dayrest2});

sQuery = "select lve_holidaysinperiod2(?,?,?,?,?)";
double holidaysinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {_Payroll, From, To, dayrest1, dayrest2});

sQuery = "select lve_holidaysnoticeinperiod2(?,?,?,?,?,?,?,?)";
double holidaysnoticeinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {getAD_Client_ID(),_Payroll,_C_BPartner_ID, From, To,"ASG_NOV_DIAS", dayrest1, dayrest2});

double sueldoDiario =  (getAttributeString("A_SUELDO_VARIABLE")=="S" ? 
                                      getConcept("CC_SUELDO_DIARIO_VARIABLE")  : 
                                     (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")));

result = (restdays) * sueldoDiario;
description = "Días de descanso: " + (restdays);
}'
WHERE value = 'beanshell:R_DIAS_DESCANSO'
;
UPDATE adempiere.ad_rule SET description = 'B110' WHERE value = 'beanshell:R_BONO_PRODUCCION'
;
UPDATE adempiere.ad_rule SET description = 'B105' WHERE value = 'beanshell:R_BONO_AÑOS_EMPRESA'
;
UPDATE adempiere.ad_rule SET description = 'A304' WHERE value = 'beanshell:R_VACACIONES_PAGADAS_SIN_DISF'
;
UPDATE adempiere.ad_rule SET description = 'E020' WHERE value = 'beanshell:R_ANTICIPO_SUELDO'
;
UPDATE adempiere.ad_rule SET description = 'E100' WHERE value = 'beanshell:R_MONTEPIO'
;
UPDATE adempiere.ad_rule SET description = 'Callout_IsRegistere' WHERE value = 'beanshell:Callout_IsRegistered'
;
UPDATE adempiere.ad_rule SET description = 'D103' WHERE value = 'beanshell:R_DEDUCCION_SUSPENSION'
;
UPDATE adempiere.ad_rule SET description = 'E011' WHERE value = 'beanshell:R_DED_SIN_CARACTER_SALARIAL'
;
UPDATE adempiere.ad_rule SET description = 'E060' WHERE value = 'beanshell:R_CUOTA_SINDICAL'
;
UPDATE adempiere.ad_rule SET description = 'W011' WHERE value = 'beanshell:R_CIERRE_INTERES_PREST_PAG'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:R_PRESTAMO_ESTUDIO_LIQUIDACION'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:R_PRESTAMO_PERSONALES_LIQUIDAC'
;
UPDATE adempiere.ad_rule SET description = 'Y043' WHERE value = 'beanshell:R_FEC_ING_CAL_VAC_FRAC'
;
UPDATE adempiere.ad_rule SET description = 'Y040' WHERE value = 'beanshell:R_FECHA_INICIO_RETENCIONES'
;
UPDATE adempiere.ad_rule SET description = 'Q015' WHERE value = 'beanshell:R_MONTO_DEVENGADO_PERIODO_UTIL'
;
UPDATE adempiere.ad_rule SET description = 'Y021' WHERE value = 'beanshell:R_DIAS_BONO_ALIMENTACION'
;
UPDATE adempiere.ad_rule SET description = 'A101' WHERE value = 'beanshell:R_ASIGNACION_INASISTENCIA'
;
UPDATE adempiere.ad_rule SET description = 'A005' WHERE value = 'beanshell:R_BONO_NOCTURNO'
;
UPDATE adempiere.ad_rule SET description = 'Días de vacaciones dentro del periodo actual' WHERE value = 'beanshell:R_DIAS_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'Q032' WHERE value = 'beanshell:R_TRABAJADOR_CON_ESTABI_LABOR'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:R_PRESTAMO_COMPRA_VIVIENDA_LIQ'
;
UPDATE adempiere.ad_rule SET description = 'A004' WHERE value = 'beanshell:R_BONO_ALIMENTACION'
;
UPDATE adempiere.ad_rule SET description = 'W018' WHERE value = 'beanshell:R_ACT_TOT_DISP_FOND_AHO_CIERRE'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:R_PRESTAMO_OTROS_LIQUIDAC'
;
UPDATE adempiere.ad_rule SET description = 'Fijar Datos Iniciales' WHERE value = 'beanshell:BP_FijarInicial'
;
UPDATE adempiere.ad_rule SET description = 'Calculo de Horas de la Visita' WHERE value = 'beanshell:BP_calculosHoras'
;
UPDATE adempiere.ad_rule SET description = 'Q003' WHERE value = 'beanshell:R_SUELDO_APLICAR_PERIODO'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:BP_Validar_Al_Eliminar_Tasa_Im'
;
UPDATE adempiere.ad_rule SET description = 'Q001' WHERE value = 'beanshell:R_SUELDO_DIARIO'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:R_DIAS_ASG_NOVEDADES_DIARIAS'
;
UPDATE adempiere.ad_rule SET description = 'B100' WHERE value = 'beanshell:R_ASIGNACION_CARACTER_SALARIAL'
;
UPDATE adempiere.ad_rule SET description = 'A110' WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_FER_DIURNO'
;
UPDATE adempiere.ad_rule SET description = 'Y001' WHERE value = 'beanshell:R_DEDUCIR_DIAS_EGRESO'
;
UPDATE adempiere.ad_rule SET description = 'Y002' WHERE value = 'beanshell:R_DEDUCIR_DIAS_INGRESO'
;
UPDATE adempiere.ad_rule SET description = 'Y011' WHERE value = 'beanshell:R_APLICAR_CONCEPTO'
;
UPDATE adempiere.ad_rule SET description = 'Y005' WHERE value = 'beanshell:R_EDAD'
;
UPDATE adempiere.ad_rule SET description = 'Y047' WHERE value = 'beanshell:R_DIAS_BASE_DISFRUTE_VACAC'
;
UPDATE adempiere.ad_rule SET description = 'W002' WHERE value = 'beanshell:R_CIERRE_VAL_INIC_ANU_SUEL_PRE'
;
UPDATE adempiere.ad_rule SET 
description = 'Funcion determina si la nomina se encuentra en la ultima semana del mes' WHERE value = 'beanshell:R_ULTIMA_SEMANA'
;
UPDATE adempiere.ad_rule SET description = 'B101' WHERE value = 'beanshell:R_ASIGNACION_SIN_C_SALARIAL'
;
UPDATE adempiere.ad_rule SET description = 'Y081' WHERE value = 'beanshell:R_APLICAR_ULTIMA_NOMINA_MES'
;
UPDATE adempiere.ad_rule SET description = 'Y041' WHERE value = 'beanshell:R_APLICAR_RETENCIONES_LRPVH'
;
UPDATE adempiere.ad_rule SET description = 'A403' WHERE value = 'beanshell:R_DIAS_LABORADOS_FINIQ_RELACI'
;
UPDATE adempiere.ad_rule SET description = 'E075' WHERE value = 'beanshell:R_CUOTA_POLIZA_AUTOMOVILES'
;
UPDATE adempiere.ad_rule SET description = 'E070' WHERE value = 'beanshell:R_CUOTA_POLIZA_HCM'
;
UPDATE adempiere.ad_rule SET description = 'A104' WHERE value = 'beanshell:R_RECARGO_DESCANSO_TRABAJADO'
;
UPDATE adempiere.ad_rule SET description = 'E076' WHERE value = 'beanshell:R_CUOTA_POLIZA_GASTOS_FUNER'
;
UPDATE adempiere.ad_rule SET description = 'Y030' WHERE value = 'beanshell:R_FECHA_INGRESO_ANTIGUEDAD'
;
UPDATE adempiere.ad_rule SET description = 'Y019' WHERE value = 'beanshell:R_DIAS_NO_LABORABLES_POR_EGRE'
;
UPDATE adempiere.ad_rule SET description = 'Y009' WHERE value = 'beanshell:R_AÑOS_ANTIGUEDAD'
;
UPDATE adempiere.ad_rule SET description = 'E077' WHERE value = 'beanshell:R_CUOTA_POLIZA_GASTOS_ODON'
;
UPDATE adempiere.ad_rule SET description = 'Y029' WHERE value = 'beanshell:R_POR_LIQUIDAR'
;
UPDATE adempiere.ad_rule SET description = 'E034' WHERE value = 'beanshell:R_CUOTA_PRESTAMO_OTROS'
;
UPDATE adempiere.ad_rule SET description = 'E078' WHERE value = 'beanshell:R_CUOTA_POLIZA_ESCOLAR'
;
UPDATE adempiere.ad_rule SET description = 'E090' WHERE value = 'beanshell:R_EXCESO_CELULAR'
;
UPDATE adempiere.ad_rule SET description = 'Y007' WHERE value = 'beanshell:R_DIAS_ADIC_PRESTACIONES'
;
UPDATE adempiere.ad_rule SET description = 'Y025' WHERE value = 'beanshell:R_DIAS_UTILIDADES_TRABAJADOR'
;
UPDATE adempiere.ad_rule SET description = 'A411' WHERE value = 'beanshell:R_VACACIONES_PENDIENTES'
;
UPDATE adempiere.ad_rule SET description = 'Y050' WHERE value = 'beanshell:R_DIAS_ADIC_VAC_PAG_SIN_DISFRU'
;
UPDATE adempiere.ad_rule SET description = 'D402' WHERE value = 'beanshell:R_PRESTACIONES_SOCI_FIDECOMISO'
;
UPDATE adempiere.ad_rule SET description = 'Y069' WHERE value = 'beanshell:R_NUMERO_HIJOS_PRIMA'
;
UPDATE adempiere.ad_rule SET description = 'Y048' WHERE value = 'beanshell:R_DIAS_BASE_PAGAR_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'Y051' WHERE value = 'beanshell:R_DIAS_ADIC_VAC_DISPONIBLE'
;
UPDATE adempiere.ad_rule SET description = 'D200' WHERE value = 'beanshell:R_ANTICIPOS_UTILIDADES'
;
UPDATE adempiere.ad_rule SET description = 'A412' WHERE value = 'beanshell:R_BONO_VACACIONAL_PENDIENTE'
;
UPDATE adempiere.ad_rule SET description = 'D403' WHERE value = 'beanshell:R_INTERESES_PREST_SOC_PAG'
;
UPDATE adempiere.ad_rule SET description = 'E072' WHERE value = 'beanshell:R_CUOTA_POLIZA_H.C'
;
UPDATE adempiere.ad_rule SET description = 'E073' WHERE value = 'beanshell:R_CUOTA_POLIZA_VIDA'
;
UPDATE adempiere.ad_rule SET description = 'B108' WHERE value = 'beanshell:R_BONO_MATRIMONIO'
;
UPDATE adempiere.ad_rule SET description = 'R005' WHERE value = 'beanshell:R_IMPUESTO_SOBRE_LA_RENTA'
;
UPDATE adempiere.ad_rule SET description = 'D001' WHERE value = 'beanshell:R_VACACIONES_PAGADAS'
;
UPDATE adempiere.ad_rule SET description = 'E074' WHERE value = 'beanshell:R_CUOTA_POLIZA_CONTRA_ACCIDENT'
;
UPDATE adempiere.ad_rule SET description = 'D400' WHERE value = 'beanshell:R_ANTICIPO_PRESTACIONES'
;
UPDATE adempiere.ad_rule SET description = 'D406' WHERE value = 'beanshell:R_REPOSO_DEDUCC_LIQUIDACION'
;
UPDATE adempiere.ad_rule SET description = 'B020' WHERE value = 'beanshell:R_ANTICIPO_PRESTACIONES_SOCIAL'
;
UPDATE adempiere.ad_rule SET description = 'B021' WHERE value = 'beanshell:R_ANTICIPO_UTILIDADES'
;
UPDATE adempiere.ad_rule SET description = 'E050' WHERE value = 'beanshell:R_CUOTA_UNIFORMES'
;
UPDATE adempiere.ad_rule SET description = 'Q030' WHERE value = 'beanshell:R_APLICA_DIAS_ADIC_PREST'
;
UPDATE adempiere.ad_rule SET description = 'E071' WHERE value = 'beanshell:R_CUOTA_POLIZA_HCM_FAMILIARES'
;
UPDATE adempiere.ad_rule SET description = 'V003' WHERE value = 'beanshell:R_MONTO_INTERESES_PRESTACIONES'
;
UPDATE adempiere.ad_rule SET description = 'E032' WHERE value = 'beanshell:R_CUOTA_PRESTAMO_PERSONALES'
;
UPDATE adempiere.ad_rule SET description = 'D002' WHERE value = 'beanshell:R_DIAS_SUEL_PEND_PAG_VAC'
;
UPDATE adempiere.ad_rule SET description = 'E033' WHERE value = 'beanshell:R_CUOTA_PRESTAMO_REMOD_VIVIEND'
;
UPDATE adempiere.ad_rule SET description = 'Q033' WHERE value = 'beanshell:R_SUELDO_DIARIO_VARIABLE'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:R_CAMBIO_STATUS_CIERRE_LIQUIDA'
;
UPDATE adempiere.ad_rule SET description = 'A200' WHERE value = 'beanshell:R_ANTIC_UTILIDADES_LOTTT_132'
;
UPDATE adempiere.ad_rule SET description = 'W004' WHERE value = 'beanshell:R_CIERRE_ANTICIPO_PREST_UTIL'
;
UPDATE adempiere.ad_rule SET description = 'W012' WHERE value = 'beanshell:R_ACT_CAMPO_SUELDO_PAG_VAC_CIE'
;
UPDATE adempiere.ad_rule SET description = 'A007' WHERE value = 'beanshell:R_INTERESES_PREST_SOC_ANUALES'
;
UPDATE adempiere.ad_rule SET description = 'E030' WHERE value = 'beanshell:R_CUOTA_PRESTAMO_ESTUDIO'
;
UPDATE adempiere.ad_rule SET description = 'E031' WHERE value = 'beanshell:R_CUOTA_PRESTAMO_COMPRA_VIVIEN'
;
UPDATE adempiere.ad_rule SET description = 'W021' WHERE value = 'beanshell:R_CIERRE_FEC_INTER_PREST_MENSU'
;
UPDATE adempiere.ad_rule SET description = 'B102' WHERE value = 'beanshell:R_BONO_NACIMIENTO_HIJOS'
;
UPDATE adempiere.ad_rule SET description = 'Y055' WHERE value = 'beanshell:R_DIAS_DESC_VAC_INAS_INJUS'
;
UPDATE adempiere.ad_rule SET description = 'Y070' WHERE value = 'beanshell:R_TOPE_SALARIO_BONO_ALIMENT'
;
UPDATE adempiere.ad_rule SET description = 'Y063' WHERE value = 'beanshell:R_SUELDO_LIQUIDADO_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'Y058' WHERE value = 'beanshell:R_VAL_INI_DEV_ANU_SUEL_ADI_PRE'
;
UPDATE adempiere.ad_rule SET description = 'Y059' WHERE value = 'beanshell:R_MONTO_DISPONIBLE_PREST'
;
UPDATE adempiere.ad_rule SET description = 'Y064' WHERE value = 'beanshell:R_TOTAL_DISP_FONDO_AHORRO'
;
UPDATE adempiere.ad_rule SET description = 'Y060' WHERE value = 'beanshell:R_MONTO_DISP_INTERESES_PREST'
;
UPDATE adempiere.ad_rule SET description = 'Y012' WHERE value = 'beanshell:R_DIAS_UTILIDADES_POR_MES'
;
UPDATE adempiere.ad_rule SET description = 'Y040-1' WHERE value = 'beanshell:R_APLICAR_RETENCION_FINAL_MES'
;
UPDATE adempiere.ad_rule SET description = 'A201' WHERE value = 'beanshell:R_BONO_FIN_AÑO'
;
UPDATE adempiere.ad_rule SET description = 'B112' WHERE value = 'beanshell:R_COMISIONES'
;
UPDATE adempiere.ad_rule SET description = 'B113' WHERE value = 'beanshell:R_BECA_ESTUDIO'
;
UPDATE adempiere.ad_rule SET description = 'Y046' WHERE value = 'beanshell:R_DIAS_BASE_BONO_VAC'
;
UPDATE adempiere.ad_rule SET description = 'A302' WHERE value = 'beanshell:R_BONO_VACACIONAL'
;
UPDATE adempiere.ad_rule SET description = 'Y062' WHERE value = 'beanshell:R_AÑOS_ANTIGUEDAD_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'U002' WHERE value = 'beanshell:R_REGIMEN_PRESTACIONAL_PA'
;
UPDATE adempiere.ad_rule SET description = 'Y054' WHERE value = 'beanshell:R_AÑOS_ANTIGUEDAD_BONO_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Q012' WHERE value = 'beanshell:R_INCLUIR_ACUM_INIC_UTILIDADES'
;
UPDATE adempiere.ad_rule SET description = 'W020' WHERE value = 'beanshell:R_ACTUALIZAR_SUELDO_MENSUAL'
;
UPDATE adempiere.ad_rule SET description = 'B106' WHERE value = 'beanshell:R_BONO_POR_GRADUACION'
;
UPDATE adempiere.ad_rule SET description = 'Determina los días de descanso en un período dado' WHERE value = 'beanshell:R_DIAS_DESCANSO_PERIODO'
;
UPDATE adempiere.ad_rule SET description = 'Q009' WHERE value = 'beanshell:R_MONTO_DIARIO_DEVENGADO_AÑO'
;
UPDATE adempiere.ad_rule SET description = 'E010' WHERE value = 'beanshell:R_DED_CON_CARACTER_SALARIAL'
;
UPDATE adempiere.ad_rule SET description = 'A104' WHERE value = 'beanshell:R_DIAS_DESCANSO_TRABAJADO'
;
UPDATE adempiere.ad_rule SET description = 'Y036' WHERE value = 'beanshell:R_FEC_INIC_CORT_TRIM_PAG_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Y022' WHERE value = 'beanshell:R_MESES_PARA_UTILIDADES'
;
UPDATE adempiere.ad_rule SET description = 'Y057' WHERE value = 'beanshell:R_DIAS_DISPONIBLES_BONO_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Y052' WHERE value = 'beanshell:R_DIAS_ACUM_BONO_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Q010' WHERE value = 'beanshell:R_MONTO_BASE_ISLR'
;
UPDATE adempiere.ad_rule SET description = 'Q022' WHERE value = 'beanshell:R_SUELDO_MES_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'A300' WHERE value = 'beanshell:R_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'W013' WHERE value = 'beanshell:R_ACT_CAMPO_SUELDO_PAG_VACACIO'
;
UPDATE adempiere.ad_rule SET description = 'A303' WHERE value = 'beanshell:R_SUELDO_PENDIENTE'
;
UPDATE adempiere.ad_rule SET description = 'A105' WHERE value = 'beanshell:R_DIAS_FERIADO_TRABAJADO'
;
UPDATE adempiere.ad_rule SET description = 'Y018' WHERE value = 'beanshell:R_LUNES_RETENC_NORMAL_ING_EG'
;
UPDATE adempiere.ad_rule SET description = 'A301' WHERE value = 'beanshell:R_VAC_EN_FESTIVOS_DESCANSO'
;
UPDATE adempiere.ad_rule SET description = 'W009' WHERE value = 'beanshell:R_CAMBIO_STATUS_CIERRE_LIQUIDA'
;
UPDATE adempiere.ad_rule SET description = 'W025' WHERE value = 'beanshell:R_ACT_FECH_FIN_ULTIMA_VAC_DISF'
;
UPDATE adempiere.ad_rule SET description = 'W017' WHERE value = 'beanshell:R_CIERRE_ACUM_FONDO_AHORRO'
;
UPDATE adempiere.ad_rule SET description = 'U005' WHERE value = 'beanshell:R_PROVISI_MENSUAL_BONO_FIN_ANO'
;
UPDATE adempiere.ad_rule SET description = 'A402' WHERE value = 'beanshell:R_INTERESES_PREST_SOCIALES'
;
UPDATE adempiere.ad_rule SET description = 'W024' WHERE value = 'beanshell:R_ACT_ACUM_MONTO_PAG_REPO_IVSS'
;
UPDATE adempiere.ad_rule SET description = 'U004' WHERE value = 'beanshell:R_INCE_PATRONAL'
;
UPDATE adempiere.ad_rule SET description = 'R004' WHERE value = 'beanshell:R_INCE_TRABAJADOR'
;
UPDATE adempiere.ad_rule SET description = NULL WHERE value = 'beanshell:R_PRESTAMO_REMOD_VIVI_LIQUIDAC'
;
UPDATE adempiere.ad_rule SET description = 'W006' WHERE value = 'beanshell:R_CIERRE_ANTICIP_UTIL_CONT_UTI'
;
UPDATE adempiere.ad_rule SET description = 'Y071-HORAS' WHERE value = 'beanshell:R_HORAS_JORNADA_TRABAJADOR'
;
UPDATE adempiere.ad_rule SET description = 'V004' WHERE value = 'beanshell:R_MONTO_BONO_ALIMENTACION'
;
UPDATE adempiere.ad_rule SET description = 'Q002' WHERE value = 'beanshell:R_SUELDO_HORA'
;
UPDATE adempiere.ad_rule SET description = 'B104' WHERE value = 'beanshell:R_BONO_CUMPLEAÑOS'
;
UPDATE adempiere.ad_rule SET description = 'W026' WHERE value = 'beanshell:R_ACT_FEC_ULTI_BONO_POST_VAC_P'
;
UPDATE adempiere.ad_rule SET description = 'Y061' WHERE value = 'beanshell:R_FEC_ULT_MES_PROC'
;
UPDATE adempiere.ad_rule SET description = 'Y032' WHERE value = 'beanshell:R_DIAS_DE_SUELDO_PENDIENTE'
;
UPDATE adempiere.ad_rule SET description = 'U003' WHERE value = 'beanshell:R_LEY_REG_PREST_VIV_HAB_PA'
;
UPDATE adempiere.ad_rule SET description = 'A100-3' WHERE value = 'beanshell:R_DIAS_REPOSO_EMPRESA'
;
UPDATE adempiere.ad_rule SET description = 'Q013' WHERE value = 'beanshell:R_SALARIO_ESTIMADO_UTILIDADES'
;
UPDATE adempiere.ad_rule SET description = 'B031' WHERE value = 'beanshell:R_PRESTAMO_COMPRA_VIVIENDA'
;
UPDATE adempiere.ad_rule SET description = 'B032' WHERE value = 'beanshell:R_PRESTAMO_PERSONALES'
;
UPDATE adempiere.ad_rule SET description = 'B033' WHERE value = 'beanshell:R_PRESTAMO_REMODELACION_VIVIEN'
;
UPDATE adempiere.ad_rule SET description = 'B030' WHERE value = 'beanshell:R_PRESTAMO_ESTUDIO'
;
UPDATE adempiere.ad_rule SET description = 'U001' WHERE value = 'beanshell:R_SEGURO_SOCIAL_OBLIGATORIO_PA'
;
UPDATE adempiere.ad_rule SET description = 'B034' WHERE value = 'beanshell:R_PRESTAMO_OTROS'
;
UPDATE adempiere.ad_rule SET description = 'W007' WHERE value = 'beanshell:R_CIERRE_DIAS_VAC_BONO_VAC_CAU'
;
UPDATE adempiere.ad_rule SET description = 'W015' WHERE value = 'beanshell:R_ACT_MONT_DISPONI_INTERES_PRE'
;
UPDATE adempiere.ad_rule SET description = 'Q011' WHERE value = 'beanshell:R_BASE_INTERES_PRESTA_SOCIALES'
;
UPDATE adempiere.ad_rule SET description = 'V001-1' WHERE value = 'beanshell:R_DIAS_GARANTIA_PRESTACIONES'
;
UPDATE adempiere.ad_rule SET description = 'W014' WHERE value = 'beanshell:R_ACT_MONT_DISP_PREST_CIERRE_P'
;
UPDATE adempiere.ad_rule SET description = 'U008' WHERE value = 'beanshell:R_PROVISION_MENSUAL_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'B200' WHERE value = 'beanshell:R_UTILIDADES_LOTTT_132'
;
UPDATE adempiere.ad_rule SET description = 'Y013' WHERE value = 'beanshell:R_DIAS_BONO_VAC_POR_AÑO'
;
UPDATE adempiere.ad_rule SET description = 'B009' WHERE value = 'beanshell:R_HORAS_EXTRAS_NOCTURNAS'
;
UPDATE adempiere.ad_rule SET description = 'Y067' WHERE value = 'beanshell:R_FEC_FIN_ULT_VAC_DISF'
;
UPDATE adempiere.ad_rule SET description = 'A001-LIQUIDACION' WHERE value = 'beanshell:R_SUELDO_EN_LIQUIDACION'
;
UPDATE adempiere.ad_rule SET description = 'Y071' WHERE value = 'beanshell:R_HORAS_BONO_ALIMENTACION'
;
UPDATE adempiere.ad_rule SET 
description = 'Obtiene la cantidad de lunes dentro del período de nomina' WHERE value = 'beanshell:R_LUNES_PARA_RETENCIONES'
;
UPDATE adempiere.ad_rule SET description = 'Q006' WHERE value = 'beanshell:R_PORCION_DIARIA_UTIL'
;
UPDATE adempiere.ad_rule SET description = 'Y040-2' WHERE value = 'beanshell:R_NO_APLICAR_RETENCI_FINAL_MES'
;
UPDATE adempiere.ad_rule SET description = 'A001-1' WHERE value = 'beanshell:R_DIAS_EFECTIVOS_TRABAJADOS'
;
UPDATE adempiere.ad_rule SET description = 'W001' WHERE value = 'beanshell:R_CIERRE_FECHA_ULTIMO_MES_PROC'
;
UPDATE adempiere.ad_rule SET description = 'A006' WHERE value = 'beanshell:R_INTERESES_PREST_SOC_MENSUAL'
;
UPDATE adempiere.ad_rule SET description = 'W010' WHERE value = 'beanshell:R_CIERRE_DIA_VAC_BONO_VAC_USAD'
;
UPDATE adempiere.ad_rule SET description = 'W003' WHERE value = 'beanshell:R_CIERRE_ACUM_PREST_SOC_INTERE'
;
UPDATE adempiere.ad_rule SET description = 'W008' WHERE value = 'beanshell:R_CIERRE_DIAS_PRESTACIONES_CAU'
;
UPDATE adempiere.ad_rule SET description = 'A409' WHERE value = 'beanshell:R_VACACIONES_FRACCIONADAS_LIQU'
;
UPDATE adempiere.ad_rule SET description = 'Y056' WHERE value = 'beanshell:R_DIAS_DISPONIBLES_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'W016' WHERE value = 'beanshell:R_ACT_DIAS_DISP_VAC_BON_VAC'
;
UPDATE adempiere.ad_rule SET description = 'U010' WHERE value = 'beanshell:R_APORTE_FONDO_AHORRO_EMPRESA'
;
UPDATE adempiere.ad_rule SET description = 'Q024' WHERE value = 'beanshell:R_SUELDO_MENSUAL'
;
UPDATE adempiere.ad_rule SET description = 'LVE_restart_filters' WHERE value = 'beanshell:LVE_restart_filters'
;
UPDATE adempiere.ad_rule SET description = 'E080' WHERE value = 'beanshell:R_APORTE_FONDO_AHORRO_TRABAJAD'
;
UPDATE adempiere.ad_rule SET description = 'Y016' WHERE value = 'beanshell:R_DIAS_VACACIONES_CAUSADAS'
;
UPDATE adempiere.ad_rule SET description = 'Y004' WHERE value = 'beanshell:R_APLICAR_RETENCIONES'
;
UPDATE adempiere.ad_rule SET description = 'Y017' WHERE value = 'beanshell:R_DIAS_BONO_VAC_CAUSADO'
;
UPDATE adempiere.ad_rule SET description = 'Q031' WHERE value = 'beanshell:R_SALARIO_DIARIO_INTEGRAL'
;
UPDATE adempiere.ad_rule SET description = 'U007' WHERE value = 'beanshell:R_PROVISION_MENSUAL_BONO_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Y014' WHERE value = 'beanshell:R_MESES_TRABAJADOS'
;
UPDATE adempiere.ad_rule SET description = 'Q007' WHERE value = 'beanshell:R_PORCION_DIARIA_BONO_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Q021' WHERE value = 'beanshell:R_PROMEDIO_TRIM_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Y049' WHERE value = 'beanshell:R_DISFRUTAR_DIAS_ADIC_VAC'
;
UPDATE adempiere.ad_rule SET description = 'U006' WHERE value = 'beanshell:R_PROVISION_MENSUAL_UTILIDADES'
;
UPDATE adempiere.ad_rule SET description = 'V001' WHERE value = 'beanshell:R_GARANTIA_PREST_SOCIALES'
;
UPDATE adempiere.ad_rule SET description = 'Y053' WHERE value = 'beanshell:R_FECHA_INGRESO_CAL_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'Q019' WHERE value = 'beanshell:R_SUELDO_DIARIO_VAC'
;
UPDATE adempiere.ad_rule SET description = 'A401' WHERE value = 'beanshell:R_PRES_SOC_DIAS_ADIC_FIN_RELAC'
;
UPDATE adempiere.ad_rule SET description = 'V002' WHERE value = 'beanshell:R_MONTO_PRES_SOC_DIAS_ADIC'
;
UPDATE adempiere.ad_rule SET description = 'Y071-FROM' WHERE value = 'beanshell:R_FECHA_INICIO'
;
UPDATE adempiere.ad_rule SET description = 'A400' WHERE value = 'beanshell:R_PRESTACIONES_SOCIALES'
;
UPDATE adempiere.ad_rule SET description = 'A410' WHERE value = 'beanshell:R_BONO_VACACIONAL_FRACCIONADO'
;
UPDATE adempiere.ad_rule SET description = 'Y071-TO' WHERE value = 'beanshell:R_FECHA_FIN'
;
UPDATE adempiere.ad_rule SET description = 'B107' WHERE value = 'beanshell:R_BONO_POST_VACACIONAL'
;
UPDATE adempiere.ad_rule SET description = 'A413' WHERE value = 'beanshell:R_DESCANSOYFERIADO_VAC_VENC'
;
UPDATE adempiere.ad_rule SET description = 'Y037' WHERE value = 'beanshell:R_FEC_FINAL_CORT_TRIM_PAG_VAC'
;
UPDATE adempiere.ad_rule SET description = 'Y200' WHERE value = 'beanshell:R_ANTIGUEDAD_SUPERIOR_UN_AÑO'
;
UPDATE adempiere.ad_rule SET description = 'A100-G' WHERE value = 'beanshell:R_DIAS_REPOSO_PAGADO_EMPRESA'
;
UPDATE adempiere.ad_rule SET description = 'B103' WHERE value = 'beanshell:R_BONO_ASISTENCIA_PUNTUAL'
;
UPDATE adempiere.ad_rule SET description = 'B114' WHERE value = 'beanshell:R_PRIMA_POR_HIJOS'
;
UPDATE adempiere.ad_rule SET description = 'Y027' WHERE value = 'beanshell:R_APLICAR_CAL_AÑO_INIC_OPERACI'
;
UPDATE adempiere.ad_rule SET description = 'A407' WHERE value = 'beanshell:R_UTILIDADES_FRACCIONADAS'
;
UPDATE adempiere.ad_rule SET description = 'Y026' WHERE value = 'beanshell:R_FECHA_INICIO_UTIL_FRAC'
;
UPDATE adempiere.ad_rule SET description = 'B111' WHERE value = 'beanshell:R_RETROACTIVO_SUELDO'
;
UPDATE adempiere.ad_rule SET description = 'Y010' WHERE value = 'beanshell:R_BASE_%_CALCULO_INTERES_PREST'
;
UPDATE adempiere.ad_rule SET description = 'Q023' WHERE value = 'beanshell:R_MONTO_BASE_PARA_LRPVH'
;
UPDATE adempiere.ad_rule SET description = 'Y028' WHERE value = 'beanshell:R_CANCELAR_BONO_ALIMENTACION'
;
UPDATE adempiere.ad_rule SET description = 'A406' WHERE value = 'beanshell:R_INDEMNIZACION_DESPIDO_INJUST'
;
UPDATE adempiere.ad_rule SET description = 'W019' WHERE value = 'beanshell:R_CIERRE_FEC_ANUAL_VACACIONES'
;
UPDATE adempiere.ad_rule SET description = 'Q004' WHERE value = 'beanshell:R_SALARIO_PARA_PRESTACIONES'
;
UPDATE adempiere.ad_rule SET description = 'Y080' WHERE value = 'beanshell:R_APLI_PRES_FEC_ULT_PROCESAMI'
;
UPDATE adempiere.ad_rule SET description = 'B109' WHERE value = 'beanshell:R_BONO_VEHICULO_MOTO'
;
UPDATE adempiere.ad_rule SET description = 'Q008' WHERE value = 'beanshell:R_SUELDO_DIARIO_PARA_UTILIDAD'
;
UPDATE adempiere.ad_rule SET description = 'Q020' WHERE value = 'beanshell:R_SUELDO_MES_ANTERIOR_VAC'
;
UPDATE adempiere.ad_rule SET description = 'A105' WHERE value = 'beanshell:R_FERIADO_TRABAJADO'
;
UPDATE adempiere.ad_rule SET description = 'Q035' WHERE value = 'beanshell:R_SUELDO_MENSUAL_VARIABLE'
;
UPDATE adempiere.ad_rule SET description = 'A001' WHERE value = 'beanshell:R_SUELDO'
;
UPDATE adempiere.ad_rule SET description = 'A102' WHERE value = 'beanshell:R_DESCANSO_TRABAJADO'
;
UPDATE adempiere.ad_rule SET description = 'A106' WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_DIURNO'
;
UPDATE adempiere.ad_rule SET description = 'R003' WHERE value = 'beanshell:R_LEY_REG_PREST_VIV_HAB'
;
UPDATE adempiere.ad_rule SET description = 'A100-1' WHERE value = 'beanshell:R_MONTO_REPOSO_EMPRESA'
;
UPDATE adempiere.ad_rule SET description = 'A100-1.1' WHERE value = 'beanshell:R_MONTO_REPOSO_EMPRESA_DED'
;
UPDATE adempiere.ad_rule SET description = 'A003' WHERE value = 'beanshell:R_FERIADO_LEGAL'
;
UPDATE adempiere.ad_rule SET description = 'R001' WHERE value = 'beanshell:R_SEGURO_SOCIAL_OBLIGATORIO_TR'
;
UPDATE adempiere.ad_rule SET description = 'R002' WHERE value = 'beanshell:R_REGIMEN_PRESTACIONAL_TR'
;
UPDATE adempiere.ad_rule SET description = 'D100' WHERE value = 'beanshell:R_DEDUCCION_REPOSO'
;
UPDATE adempiere.ad_rule SET description = 'B008' WHERE value = 'beanshell:R_HORAS_EXTRAS_DIURNAS'
;
UPDATE adempiere.ad_rule SET description = 'D100' WHERE value = 'beanshell:R_DIAS_REPOSO_IVSS'
;
UPDATE adempiere.ad_rule SET description = 'D100' WHERE value = 'beanshell:R_MONTO_REPOSO_IVSS'
;
UPDATE adempiere.ad_rule SET description = 'D101' WHERE value = 'beanshell:R_DEDUCCION_INASISTENCIA'
;
UPDATE adempiere.ad_rule SET description = 'Q025' WHERE value = 'beanshell:R_SUELDO_PARA_RETENCIONES'
;
UPDATE adempiere.ad_rule SET description = 'A105' WHERE value = 'beanshell:R_RECARGO_FERIADO_TRABAJADO'
;
UPDATE adempiere.ad_rule SET description = 'A111' WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_FER_NOCTUR'
;
UPDATE adempiere.ad_rule SET description = 'A107' WHERE value = 'beanshell:R_DIA_ADIC_LABORADO_NOCTURNO'
;
UPDATE adempiere.ad_rule SET description = 'A103' WHERE value = 'beanshell:R_ASIGNACION_SUSPENSION'
;
UPDATE adempiere.ad_rule SET description = 'A002' WHERE value = 'beanshell:R_DIAS_DESCANSO_DOMINGOS'
;
UPDATE adempiere.ad_rule SET description = 'A002' WHERE value = 'beanshell:R_DIAS_DESCANSO'
;
--Fin Actualización de reglas--------------------------------------------------------------------------------

--Inicio Insertar conceptos
INSERT INTO adempiere.hr_concept(accountsign, isreadwrite, isreceipt, ispaid, value, name, hr_concept_category_id, hr_concept_id, hr_department_id, hr_job_id, hr_payroll_id, isactive, ad_client_id, isemployee, isprinted, isregistered, type, updated, updatedby, validfrom, validto, isdefault, ad_org_id, columntype, created, createdby, description, ad_reference_id, seqno, isoption1, isoption2, isoption3, isoption4, isoption5, isoption6, isoption7, isoption8, isoption9, isoption10, isrequiredforworker, c_charge_id)
  VALUES(NULL, 'N', 'N', 'N', 'A_DIAS_SUSPENSION_REM', 'Días de Suspención Remunerados', 1000005, 1000496, NULL, NULL, NULL, 'Y', 1000000, 'Y', 'N', 'Y', 'C', '2012-10-09 13:57:00.0', 100, NULL, NULL, 'N', 1000000, 'A', '2012-10-09 13:56:31.0', 100, 'A103', NULL, 1330, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', NULL)
;
INSERT INTO adempiere.hr_concept(accountsign, isreadwrite, isreceipt, ispaid, value, name, hr_concept_category_id, hr_concept_id, hr_department_id, hr_job_id, hr_payroll_id, isactive, ad_client_id, isemployee, isprinted, isregistered, type, updated, updatedby, validfrom, validto, isdefault, ad_org_id, columntype, created, createdby, description, ad_reference_id, seqno, isoption1, isoption2, isoption3, isoption4, isoption5, isoption6, isoption7, isoption8, isoption9, isoption10, isrequiredforworker, c_charge_id)
  VALUES(NULL, 'N', 'N', 'N', 'A_TURNO_NOCTURNO', 'Días con turno nocturno', 1000000, 1000497, NULL, NULL, NULL, 'Y', 1000000, 'Y', 'N', 'Y', 'C', '2012-10-09 14:21:30.0', 100, NULL, NULL, 'N', 1000000, 'A', '2012-10-09 14:21:30.0', 100, 'A005', NULL, 1330, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', NULL)
;
INSERT INTO adempiere.hr_concept(accountsign, isreadwrite, isreceipt, ispaid, value, name, hr_concept_category_id, hr_concept_id, hr_department_id, hr_job_id, hr_payroll_id, isactive, ad_client_id, isemployee, isprinted, isregistered, type, updated, updatedby, validfrom, validto, isdefault, ad_org_id, columntype, created, createdby, description, ad_reference_id, seqno, isoption1, isoption2, isoption3, isoption4, isoption5, isoption6, isoption7, isoption8, isoption9, isoption10, isrequiredforworker, c_charge_id)
  VALUES(NULL, 'N', 'N', 'N', 'C_DESGLOSAR_DIAS_DESCANSO', 'Desglosar días de descanso Si(S) No(N)', NULL, 1000498, NULL, NULL, NULL, 'Y', 1000000, 'N', 'N', 'N', 'I', '2012-10-09 14:55:50.0', 100, NULL, NULL, 'N', 1000000, 'T', '2012-10-09 14:55:50.0', 100, NULL, NULL, 170, 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', NULL)
;
INSERT INTO adempiere.hr_concept(accountsign, isreadwrite, isreceipt, ispaid, value, name, hr_concept_category_id, hr_concept_id, hr_department_id, hr_job_id, hr_payroll_id, isactive, ad_client_id, isemployee, isprinted, isregistered, type, updated, updatedby, validfrom, validto, isdefault, ad_org_id, columntype, created, createdby, description, ad_reference_id, seqno, isoption1, isoption2, isoption3, isoption4, isoption5, isoption6, isoption7, isoption8, isoption9, isoption10, isrequiredforworker, c_charge_id)
  VALUES('D', 'N', 'N', 'Y', 'CC_DIAS_DESCANSO_DOMINGOS', 'Días de descanso (Domingos)', 1000000, 1000499, NULL, NULL, NULL, 'Y', 1000000, 'N', 'Y', 'N', 'E', '2012-10-09 15:11:04.0', 100, NULL, NULL, 'N', 1000000, 'A', '2012-10-09 15:09:59.0', 100, 'A002', NULL, 4560, 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'N', 'Y', 'N', 'N', 'N', 1000000)
;
--Fin Insertar conceptos

-- Inicio de actualizar conceptos
UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A106', 
hr_concept_category_id = 1000004,  
isemployee = 'Y', name = 'Días Adicionales Laborados Diurno', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_ADIC_LABORADOS_DIURNO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A100', 
hr_concept_category_id = 1000005,  
isemployee = 'Y', name = 'Días Reposo Remunerados', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_REPOSO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A102', 
hr_concept_category_id = 1000005,  
isemployee = 'Y', name = 'Días Descanso Trabajados', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_DESCANSO_TRABAJADO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'E004', 
hr_concept_category_id = 1000001,  
isemployee = 'Y', name = 'Horas No Trabajadas Nocturnas', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'E_HORAS_NO_TRABAJADAS_NOCTURNAS'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A101', 
hr_concept_category_id = 1000005,  
isemployee = 'Y', name = 'Días Inasistencia Justificada', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_INASISTENCIA_JUSTIFICADA'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A103', 
hr_concept_category_id = 1000005,  
isemployee = 'Y', name = 'Días Feriado Trabajados', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_FERIADO_TRABAJADO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'Y', isoption2 = 'Y', isoption3 = 'Y',  
isoption4 = 'Y', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'Y', isoption9 = 'Y',
description = 'A102', 
hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Días de descanso trabajado', isactive = 'Y', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = NULL 
WHERE value = 'CC_DIAS_DESCANSO_TRABAJADO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'D100', 
hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Días de Reposo IVSS', isactive = 'N', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = NULL 
WHERE value = 'CC_DIAS_REPOSO_IVSS'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'Y', isoption2 = 'Y', isoption3 = 'Y',  
isoption4 = 'Y', isoption5 = 'N', isoption6 = 'Y',
isoption7 = 'N', isoption8 = 'Y', isoption9 = 'N',
description = 'A100', 
hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Monto de Reposo Empresa', isactive = 'Y', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = NULL 
WHERE value = 'CC_MONTO_REPOSO_EMPRESA_DED'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'D100',
hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Monto de Reposo IVSS', isactive = 'Y', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = 1000000 
WHERE value = 'CC_MONTO_REPOSO_IVSS'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'Y', isoption2 = 'N', isoption3 = 'Y',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'Y', isoption9 = 'Y',
description = 'A102',
hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Descanso Trabajado', isactive = 'Y', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = 1000000 
WHERE value = 'CC_DESCANSO_TRABAJADO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'Y', isoption2 = 'Y', isoption3 = 'Y',  
isoption4 = 'Y', isoption5 = 'N', isoption6 = 'Y',
isoption7 = 'N', isoption8 = 'Y', isoption9 = 'N',
description = 'A100', 
hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Monto de Reposo Empresa (%)', isactive = 'Y', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = 1000000 
WHERE value = 'CC_MONTO_REPOSO_EMPRESA'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'D101', 
hr_concept_category_id = 1000006,  
isemployee = 'Y', name = 'Días Deducción por Inasistencia Injustificada', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'D_DIAS_DEDUCCION_INASISTENCIA'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'E003', 
hr_concept_category_id = 1000001,  
isemployee = 'Y', name = 'Horas No Trabajadas Diurnas', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'E_HORAS_NO_TRABAJADAS_DIURNAS'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'B002', 
hr_concept_category_id = 1000003,  
isemployee = 'Y', name = 'Horas Extras Nocturnas', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_NOV_HORAS_EXTRAS_NOCTURNAS'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'B001', 
hr_concept_category_id = 1000007,  
isemployee = 'Y', name = 'Horas Extras Diurnas', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_NOV_HORAS_EXTRAS_DIURNAS'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A107', 
hr_concept_category_id = 1000004,  
isemployee = 'Y', name = 'Días Adicionales Laborados Nocturno', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_ADIC_LABORADOS_NOCTURNO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'D100', 
hr_concept_category_id = 1000006,  
isemployee = 'Y', name = 'Días Deducción Reposo', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'D_DIAS_DEDUCCION_REPOSO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'Y', isoption8 = 'N', isoption9 = 'N',
description = 'A104', 
hr_concept_category_id = 1000004,  
isemployee = 'Y', name = 'Días Adicionales Laborados Feriado Diurno', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_ADIC_LABORADOS_FERIADO_DIURNO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'Y', isoption8 = 'N', isoption9 = 'N',
description = 'A105', 
hr_concept_category_id = 1000004,  
isemployee = 'Y', name = 'Días Adicionales Laborados Feriado Nocturno', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_ADIC_LABORADOS_FERIADO_NOCTURNO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'Y', isoption2 = 'Y', isoption3 = 'Y',  
isoption4 = 'Y', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'Y', isoption9 = 'Y',
description = 'A102', 
hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Recargo Descanso Trabajado', isactive = 'Y', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = 1000000 
WHERE value = 'CC_RECARGO_DESCANSO_TRABAJADO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A103', 
hr_concept_category_id = 1000005,  
isemployee = 'Y', name = 'Días de Suspención Remunerados', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_DIAS_SUSPENSION_REM'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = 'A005', 
hr_concept_category_id = 1000000,  
isemployee = 'Y', name = 'Días con turno nocturno', isactive = 'Y', isregistered = 'Y',  
type = 'C', columntype = 'A', c_charge_id = NULL 
WHERE value = 'A_TURNO_NOCTURNO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'N', isoption2 = 'N', isoption3 = 'N',  
isoption4 = 'N', isoption5 = 'N', isoption6 = 'N',
isoption7 = 'N', isoption8 = 'N', isoption9 = 'N',
description = NULL, hr_concept_category_id = NULL,  
isemployee = 'N', name = 'Desglosar días de descanso Si(S) No(N)', isactive = 'Y', isregistered = 'N',  
type = 'I', columntype = 'T', c_charge_id = NULL 
WHERE value = 'C_DESGLOSAR_DIAS_DESCANSO'
;

UPDATE adempiere.hr_concept SET 
isoption1 = 'Y', isoption2 = 'Y', isoption3 = 'Y',  
isoption4 = 'Y', isoption5 = 'N', isoption6 = 'Y',
isoption7 = 'N', isoption8 = 'Y', isoption9 = 'N',
description = 'A002', hr_concept_category_id = 1000000,  
isemployee = 'N', name = 'Días de descanso (Domingos)', isactive = 'Y', isregistered = 'N',  
type = 'E', columntype = 'A', c_charge_id = 1000000 
WHERE value = 'CC_DIAS_DESCANSO_DOMINGOS'
;
-- Fin de actualizar conceptos

--Inicio crear atributos
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(1000000, 1000000, NULL, 0, NULL, 'T', '2012-10-09 14:56:07.0', 100, NULL, NULL, (SELECT MAX(hr_attribute_id) + 1 FROM hr_attribute), 1000498, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, 'S', '2012-10-09 16:54:44.0', 100, '2010-01-01 00:00:00.0', NULL)
;
INSERT INTO adempiere.hr_attribute(ad_client_id, ad_org_id, ad_rule_id, amount, c_bpartner_id, columntype, created, createdby, description, hr_attribute_acct, hr_attribute_id, hr_concept_id, hr_department_id, hr_employee_id, hr_job_id, hr_payroll_id, isactive, isprinted, maxvalue, minvalue, qty, servicedate, textmsg, updated, updatedby, validfrom, validto)
  VALUES(1000000, 1000000, 2000103, 0, NULL, 'A', '2012-10-09 16:48:32.0', 100, NULL, NULL, (SELECT MAX(hr_attribute_id) + 1 FROM hr_attribute), 1000499, NULL, NULL, NULL, NULL, 'Y', 'N', 0, 0, 0, NULL, NULL, '2012-10-09 16:48:32.0', 100, '2012-09-01 00:00:00.0', NULL)
;
--Fin crear atributos

-- Traducciones de los elementos asociados a las opciones de los conceptos
UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Caracter Salarial', 
printname = 'Concepto con Caracter Salarial', 
description = 'Indica que el concepto tiene caracter salarial'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption1')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Prestaciones', 
printname = 'Prestaciones', 
description = 'Indica que el concepto es parte del salario base para prestaciones sociales (sólo lo que es fijo)'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption2')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Vacaciones', 
printname = 'Vacaciones', 
description = 'Indica que el concepto es parte del salario base para Vacaciones'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption3')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Utilidades', 
printname = 'Utilidades', 
description = 'Indica que el concepto es parte del salario base para Utilidades (sólo lo que es fijo)'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption4')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Préstamos', 
printname = 'Préstamos', 
description = 'Indica que este concepto es de préstamos'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption5')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Acumulado de Asignaciones', 
printname = 'Acumulado de Asignaciones', 
description = 'Indica que el concepto acumula otras asignaciones que no son sueldo'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption6')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Bono de Alimentación', 
printname = 'Bono de Alimentación', 
description = 'Indica si se genera o no, bono de alimentación cuando el trabajador presente esta novedad'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption7')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'ISLR', 
printname = 'Impuesto Sobre La Renta', 
description = 'Indica que el concepto es acumulado para la base del cálculo de ISLR'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption8')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Elemento Salarial Variable', 
printname = 'Elemento Salarial Variable', 
description = 'Indica si que el concepto es considerado un elemento salarial variable'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption9')
;

UPDATE adempiere.ad_element_trl SET istranslated = 'Y', name = 'Actualización', 
printname = 'Actualización', 
description = 'Indica que la regla que ejecuta el concepto debe actualizar los atributos a los que hace referencia'
WHERE ad_element_id = (SELECT ad_element_id FROM ad_element WHERE columnname = 'IsOption10')
;
-- Fin de las traducciones de los elementos asociados a las opciones de los conceptos

-- Definición de nómina
-- Asociar concepto
INSERT INTO adempiere.hr_payrollconcept
(name, ad_org_id, ad_rule_id, created, createdby, hr_concept_id, hr_payrollconcept_id, hr_payroll_id, 
isactive, isdisplayed, isinclude, isprinted, seqno, updated, ad_client_id, updatedby)
VALUES('CC_DIAS_DESCANSO_DOMINGOS', 1000000, NULL, now(), 100, 
(select hr_concept_id from hr_concept where value = 'CC_DIAS_DESCANSO_DOMINGOS'), 
(select max(hr_payrollconcept_id)+1 from hr_payrollconcept), 
(select hr_payroll_id from hr_payroll where value = 'NOMINA_QUINCENAL'), 
'Y', 'Y', 'N', 'N', 980, now(), 1000000, 100)
;
-- Actualizar conceptos asociados
UPDATE adempiere.hr_payrollconcept SET isactive = 'Y', isdisplayed = 'Y', isprinted = 'N' WHERE name = 'CC_DIA_ADIC_LABORADO_DIURNO'
;
UPDATE adempiere.hr_payrollconcept SET isactive = 'Y', isdisplayed = 'Y', isprinted = 'N' WHERE name = 'CC_MONTO_REPOSO_EMPRESA'
;
UPDATE adempiere.hr_payrollconcept SET isactive = 'Y', isdisplayed = 'Y', isprinted = 'Y' WHERE name = 'CC_UTILIDADES_LOTTT_132'
;
-- Fechas desde y hasta sólo para los conceptos tipo novedades
UPDATE ad_column SET ad_reference_id = 16
WHERE ad_column_id IN (
SELECT ad_column_id
FROM ad_column WHERE ad_table_id = (SELECT ad_table_id FROM ad_table WHERE tablename = 'HR_Attribute') 
AND columnname IN ('ValidFrom', 'ValidTo')
)
;

-- Inactivar forma de novedades
UPDATE AD_Menu SET IsActive='N',Updated=now(),UpdatedBy=100 
WHERE AD_Menu_ID = (SELECT ad_menu_id FROM ad_menu WHERE name = 'Payroll Action Notice')
;

-- Actualizar el orden de los conceptos
UPDATE AD_Tab SET SeqNo=140,Updated=now(),UpdatedBy=100 
WHERE AD_Tab_ID=(select AD_Tab_ID from ad_tab WHERE name = 'Concept Ordering' and ad_window_id in 
(select ad_window_id from ad_window where name = 'Payroll Concept Catalog'))
;

-- Campos de la ventana de atributos de conceptos tipo novedad
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Payroll Department' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Service date' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Text Message' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Payroll' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Payroll Job' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Rule' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Column Type' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Max Value' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Min Value' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Business Partner ' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Amount' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Quantity' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Active' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))

;
-- Quitar la condición el campo empleado en la lógica de despliegue
UPDATE AD_Field SET DisplayLogic=NULL,Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Business Partner ' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

-- Tiempo de la novedad
UPDATE AD_Field_Trl SET Name='Tiempo de la Novedad',Description='Tiempo de la Novedad',Help=NULL,
Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND AD_Field_ID= 
(select AD_Field_ID from ad_field WHERE name = 'Amount' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field_Trl SET Name='Tiempo de la Novedad',Description='Tiempo de la Novedad',Help=NULL,
Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Quantity' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=now(), UpdatedBy=100 WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Quantity' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=now(),UpdatedBy=100 WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Amount' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Notices Attributes' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

--Campos de la pestaña movimientos en la ventana proceso de nómina
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Service date' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Movement' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Process')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Printed' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Movement' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Process')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Text Message' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Movement' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Process')))
;

UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Description' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Movement' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Process')))
;

UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Active' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Movement' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Process')))
;

UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Quantity' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Movement' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Process')))
;

UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=
(select AD_Field_ID from ad_field WHERE name = 'Employee' and ad_tab_id in
(select ad_tab_id from ad_tab where  name = 'Concept Notices' and ad_window_id in
(select ad_window_id from ad_window where  name = 'Payroll Concept Catalog')))
;

UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Requerido',PrintName='Requerido',Description='Indica que el atributo es requerido',
Help=NULL,Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND AD_Element_ID=
(select ad_element_id from ad_element where columnname = 'isRequiredForWorker' and entitytype = 'DCS')
;

COMMIT;

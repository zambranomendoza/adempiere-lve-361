/*

Descripción: Consultas para crear las reglas de nómina
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
- Ejecutar los scripts

*/

BEGIN;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000152, NULL, '2010-12-06 16:40:20.0', 100, 'B110', 'U', 'H', NULL, 'Y', 'R_BONO_PRODUCCION', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_BONO_PRODUCCION") != null)
{
   result = getAttribute("A_BONO_PRODUCCION");
}

', '2010-12-06 16:40:20.0', 100, 'beanshell:R_BONO_PRODUCCION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000142, NULL, '2010-12-06 14:42:53.0', 100, 'B105', 'U', 'H', NULL, 'Y', 'R_BONO_AÑOS_EMPRESA', 'S', 'result = 0.0;

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
}', '2011-02-21 16:10:58.0', 100, 'beanshell:R_BONO_AÑOS_EMPRESA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000095, NULL, '2010-11-22 08:10:33.0', 100, 'A304', 'U', 'H', 'Asignación por Días Adicionales de Vacaciones Sin Disfrute', 'Y', 'R_VACACIONES_PAGADAS_SIN_DISF', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

if (getConcept("CC_DIAS_ADIC_VAC_PAG_SIN_DISFRU") > 0)
{
     result = getConcept("CC_DIAS_ADIC_VAC_PAG_SIN_DISFRU") * getConcept("CC_SUELDO_DIARIO_VAC");
}

}', '2011-06-21 11:19:12.0', 100, 'beanshell:R_VACACIONES_PAGADAS_SIN_DISF')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000153, NULL, '2010-12-07 08:31:07.0', 100, 'E020', 'U', 'H', NULL, 'Y', 'R_ANTICIPO_SUELDO', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_ANTICIPO_SUELDO") > 0)
   result = getAttribute("A_ANTICIPO_SUELDO");
', '2010-12-07 08:46:32.0', 100, 'beanshell:R_ANTICIPO_SUELDO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000206, NULL, '2010-12-13 12:00:19.0', 100, 'E100', 'U', 'H', NULL, 'Y', 'R_MONTEPIO', 'S', '
result=0.0; 

if ("S".equals(getAttributeString("A_EMPLEADO_SINDICALIZADO"))  && getAttribute("C_MONTO_DESCONTAR_MONTEPIO")>0 && "S".equals(getAttributeString("C_DESCONTAR_MONTEPIO")) && getConcept("CC_APLICAR_CONCEPTO")==1.0)
     result=getAttribute("C_MONTO_DESCONTAR_MONTEPIO");
', '2011-05-16 10:55:17.0', 100, 'beanshell:R_MONTEPIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000116, NULL, '2010-11-30 08:53:00.0', 100, 'Callout_IsRegistere', 'U', 'C', NULL, 'Y', 'Callout_IsRegistere', 'S', 'A_Tab.getField("isOption7").setDisplayed(A_Tab.getValue("isRegistered").equals(true));
		A_Tab.getField("isOption8").setDisplayed(A_Tab.getValue("isRegistered").equals(true));

result="";', '2010-11-30 09:01:12.0', 100, 'beanshell:Callout_IsRegistered')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000208, NULL, '2010-12-14 14:22:02.0', 100, 'D101', 'U', 'H', NULL, 'Y', 'R_DEDUCCION_INASISTENCIA', 'S', 'result = 0;

int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sQuery = "select lve_daysnoticeinperiod(?,?,?,?,?,?,?)";

double days = DB.getSQLValue(get_TrxName(), sQuery, 
                        new Object[] { getAD_Client_ID(), _Payroll, _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_INASISTENCIA", dayrest } );

if (days > 0)
    result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
	', '2011-05-30 16:19:13.0', 100, 'beanshell:R_DEDUCCION_INASISTENCIA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000207, NULL, '2010-12-13 14:18:35.0', 100, 'A005', 'U', 'H', NULL, 'Y', 'R_BONO_NOCTURNO', 'S', 'result = 0.0;

double dHours = getConceptGroup("ASG_HORA_EXT_NOCTURNA");
double dValue = 0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && dHours > 0)
{
	dValue = dHours * getConcept("CC_SUELDO_HORA");
	dValue = (dValue * getAttribute("C_RECARGO_POR_BONO_NOCTURNO")) / 100;
	result = dValue;
}

', '2011-01-31 10:29:46.0', 100, 'beanshell:R_BONO_NOCTURNO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000210, NULL, '2010-12-14 14:40:42.0', 100, 'A101', 'U', 'H', NULL, 'Y', 'R_ASIGNACION_INASISTENCIA', 'S', 'result = 0;

String sql = "SELECT lve_daysnotice(?,?,?,?,?)";
double days = DB.getSQLValue(get_TrxName(), sql , new Object[] { getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_INASISTENCIA_JUSTIFICADA"});

if (days != null && days > 0 && getConcept("CC_APLICA")==1.0)
   result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));', '2011-06-21 11:46:07.0', 100, 'beanshell:R_ASIGNACION_INASISTENCIA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000209, NULL, '2010-12-14 14:27:47.0', 100, 'D103', 'U', 'H', NULL, 'Y', 'R_DEDUCCION_SUSPENSION', 'S', 'int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sQuery = "select lve_daysnoticeinperiod(?,?,?,?,?,?,?)";

int days = DB.getSQLValue(get_TrxName(), sQuery, 
                 new Object[] { getAD_Client_ID(), _Payroll, _C_BPartner_ID, _From, _To, ''D_DIAS_DEDUCCION_SUSPENSION'', dayrest } );

return = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
	', '2011-02-03 15:24:30.0', 100, 'beanshell:R_DEDUCCION_SUSPENSION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000159, NULL, '2010-12-07 10:17:51.0', 100, 'E011', 'U', 'H', NULL, 'Y', 'R_DED_SIN_CARACTER_SALARIAL', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_DEDUCCION_SIN_CARACTER_SALARIAL") > 0)
   result = getAttribute("A_DEDUCCION_SIN_CARACTER_SALARIAL");', '2010-12-07 10:17:51.0', 100, 'beanshell:R_DED_SIN_CARACTER_SALARIAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000205, NULL, '2010-12-13 11:40:24.0', 100, 'E060', 'U', 'H', NULL, 'Y', 'R_CUOTA_SINDICAL', 'S', '

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
', '2011-05-16 10:54:52.0', 100, 'beanshell:R_CUOTA_SINDICAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000218, NULL, '2010-12-27 13:24:08.0', 100, 'A100-2', 'U', 'H', NULL, 'Y', 'R_MONTO_REPOSO_IVSS', 'S', 'result = 0;

Double days = getConcept("CC_DIAS_REPOSO_IVSS");
if (days > 0 && getConcept("CC_APLICA")==1.0)
{
boolean bPay100restingAttri = getAttribute("A_PAGAR_100%_REPOSO") == 1.0;
boolean bPay100restingConst = getAttribute("C_PAGAR_100%_REPOSO") == 1.0;

if (!bPay100restingAttri && bPay100restingConst && days > 0)
{
  description = "Días de Reposo IVSS: " + days;
  result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}
}
', '2011-06-21 11:45:49.0', 100, 'beanshell:R_MONTO_REPOSO_IVSS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000237, NULL, '2011-01-12 09:48:31.0', 100, 'W011', 'U', 'H', NULL, 'Y', 'R_CIERRE_INTERES_PREST_PAG', 'S', 'result=1.0; 
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
 ', '2011-05-26 10:18:36.0', 100, 'beanshell:R_CIERRE_INTERES_PREST_PAG')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000247, NULL, '2011-01-17 08:40:56.0', 100, NULL, 'U', 'H', NULL, 'Y', 'R_PRESTAMO_ESTUDIO_LIQUIDACION', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "S1" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}', '2011-02-18 10:09:42.0', 100, 'beanshell:R_PRESTAMO_ESTUDIO_LIQUIDACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000249, NULL, '2011-01-17 09:12:06.0', 100, NULL, 'U', 'H', NULL, 'Y', 'R_PRESTAMO_PERSONALES_LIQUIDAC', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "P1" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}', '2011-02-18 10:09:53.0', 100, 'beanshell:R_PRESTAMO_PERSONALES_LIQUIDAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000052, NULL, '2010-10-28 16:37:50.0', 100, 'Y043', 'U', 'H', NULL, 'Y', 'R_FEC_ING_CAL_VAC_FRAC', 'S', 'Timestamp dateIni = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateEnd = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateResult = dateIni;

dateResult.setYear(dateEnd.getYear() - (dateEnd.getMonth() < dateIni.getMonth() ? 1 : 0));

result = dateResult.getTime();


', '2011-02-21 16:15:47.0', 100, 'beanshell:R_FEC_ING_CAL_VAC_FRAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000096, NULL, '2010-11-22 10:30:11.0', 100, 'Y040', 'U', 'H', NULL, 'Y', 'R_FECHA_INICIO_RETENCIONES', 'S', 'boolean  value = "S".equals(getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES").toUpperCase()); 
     
result= value ? getConcept("CC_APLICAR_RETENCION_FINAL_MES"):getConcept("CC_NO_APLICAR_RETENCI_FINAL_MES");
', '2010-11-25 07:56:41.0', 100, 'beanshell:R_FECHA_INICIO_RETENCIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000127, NULL, '2010-12-06 08:43:38.0', 100, 'Q015', 'U', 'H', NULL, 'Y', 'R_MONTO_DEVENGADO_PERIODO_UTIL', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();
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
}', '2011-05-12 16:10:49.0', 100, 'beanshell:R_MONTO_DEVENGADO_PERIODO_UTIL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000115, NULL, '2010-11-29 15:20:40.0', 100, 'Y021', 'U', 'H', NULL, 'Y', 'R_DIAS_BONO_ALIMENTACION', 'S', 'Double Hours = getConcept("CC_HORAS_JORNADA_TRABAJADOR");

if (getConcept("CC_CANCELAR_BONO_ALIMENTACION")==1.0 && getConcept("CC_APLICAR_CONCEPTO")==1.0 ){
 result= getConcept("CC_HORAS_BONO_ALIMENTACION") / Hours;
}
else{
  result= 0.0;
}
', '2011-06-07 14:13:24.0', 100, 'beanshell:R_DIAS_BONO_ALIMENTACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000019, NULL, '2010-10-12 17:53:38.0', 100, 'Días de vacaciones dentro del periodo actual', 'U', 'H', NULL, 'Y', 'R_DIAS_VACACIONES', 'S', 'result = 0;

String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Vacaciones".equals(sContract)) 
   result =(double) LVE_Payroll.workingDaysMonth(get_TrxName(), _From, _To,
                                                                                               _Payroll, ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(), _C_BPartner_ID);
else {
        String sql = "SELECT lve_daysvaconperiod(?,?,?,?)";
        result = DB.getSQLValue(get_TrxName(), sql, new Object[] {getAD_Client_ID(), _C_BPartner_ID, _From, _To});
}', '2012-07-26 13:54:39.0', 100, 'beanshell:R_DIAS_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000155, NULL, '2010-12-07 09:06:07.0', 100, 'Q032', 'U', 'H', NULL, 'Y', 'R_TRABAJADOR_CON_ESTABI_LABOR', 'S', '
result=0.0;

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     
   result=  !"Mensual".equals(getHR_Payroll().getHR_Contract().getName()) ? 1.0 : 0.0;

}

', '2010-12-07 09:06:11.0', 100, 'beanshell:R_TRABAJADOR_CON_ESTABI_LABOR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000248, NULL, '2011-01-17 09:10:49.0', 100, NULL, 'U', 'H', NULL, 'Y', 'R_PRESTAMO_COMPRA_VIVIENDA_LIQ', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HB" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}', '2011-02-18 10:09:35.0', 100, 'beanshell:R_PRESTAMO_COMPRA_VIVIENDA_LIQ')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000215, NULL, '2010-12-15 13:41:49.0', 100, 'A004', 'U', 'H', NULL, 'Y', 'R_BONO_ALIMENTACION', 'S', 'result=0.0; 

if ((getConcept("CC_CANCELAR_BONO_ALIMENTACION")== 1.0 && getConcept("CC_APLICAR_CONCEPTO")== 1.0 ) &&  
     "S".equals(getAttributeString("C_CANCELAR_BONO_ALIMENTACION"))){
     result= getConcept("CC_MONTO_BONO_ALIMENTACION");
}', '2011-07-07 10:45:53.0', 100, 'beanshell:R_BONO_ALIMENTACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000230, NULL, '2011-01-10 11:28:37.0', 100, 'W018', 'U', 'H', NULL, 'Y', 'R_ACT_TOT_DISP_FOND_AHO_CIERRE', 'S', 'result=1.0;
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
}', '2011-05-26 10:24:41.0', 100, 'beanshell:R_ACT_TOT_DISP_FOND_AHO_CIERRE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000250, NULL, '2011-01-17 09:14:14.0', 100, NULL, 'U', 'H', NULL, 'Y', 'R_PRESTAMO_OTROS_LIQUIDAC', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "OT" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}', '2011-02-18 10:09:47.0', 100, 'beanshell:R_PRESTAMO_OTROS_LIQUIDAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000003, NULL, '2011-05-12 14:01:02.0', 0, 'Fijar Datos Iniciales', 'U', 'C', ' ', 'Y', 'Fijar Datos Iniciales', 'S', 'A_Tab.setValue("C_BPartneremp_ID",(@C_BPartnerEmp_ID));', '2011-05-12 14:19:44.0', 0, 'beanshell:BP_FijarInicial')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000000, NULL, '2011-04-07 16:47:02.0', 100, 'Calculo de Horas de la Visita', 'DCS', 'C', ' ', 'Y', 'Calculo de Horas de Visita', 'S', 'Float u=  ((new Float ( A_Tab.getValue("TimeEnd").getTime()-A_Tab.getValue("TimeStart").getTime()))/1000/3600)+A_Tab.getValue("dshoras");
A_Tab.setValue("ValueNumberHour",u);', '2011-04-13 19:59:28.0', 100, 'beanshell:BP_calculosHoras')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000004, NULL, '2010-10-11 14:25:31.0', 100, 'Q003', 'U', 'H', NULL, 'Y', 'R_SUELDO_APLICAR_PERIODO', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();
double valueReturn = 0;      
if (!"Vacaciones".equals(sContract) && !"Liquidacion".equals(sContract)) 
{

    double workDays =  (double) LVE_Payroll.workDays(get_TrxName(), _From, _To, _Payroll, ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString(), sContract);
    description = "Días: " + workDays;
    valueReturn = workDays * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}

result = valueReturn;', '2011-02-03 15:31:53.0', 100, 'beanshell:R_SUELDO_APLICAR_PERIODO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000012, NULL, '2010-10-12 11:03:00.0', 100, 'A106', 'U', 'H', NULL, 'Y', 'R_DIA_ADIC_LABORADO_DIURNO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_DIURNO");
if (dias_adic != 0.0)
  description = "Dias adicionales diurnos=" + dias_adic;
result = sueldo_diario * dias_adic;
}', '2011-06-21 11:48:24.0', 100, 'beanshell:R_DIA_ADIC_LABORADO_DIURNO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000002, NULL, '2011-04-13 13:53:02.0', 100, NULL, 'U', 'C', ' ', 'Y', 'Validación al eliminar una tasa de impuesto', 'S', 'String sQuery = "SELECT COUNT(*) FROM LVE_ISICBYCATEGORY WHERE LVE_ISIC_ID = ? AND LVE_MUNICIPALITY_ID = ?";
Integer count = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {A_Tab.getValue("LVE_ISIC_ID"), A_Tab.getValue("LVE_MUNICIPALITY_ID")});', '2011-04-13 14:02:19.0', 100, 'beanshell:BP_Validar_Al_Eliminar_Tasa_Im')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000003, NULL, '2010-10-11 11:56:31.0', 100, 'Q001', 'U', 'H', NULL, 'Y', 'R_SUELDO_DIARIO', 'S', 'double sueldo = getConcept("CC_SUELDO_MENSUAL");
result = sueldo / getAttribute("C_DIAS_DEL_MES");', '2010-11-02 09:31:33.0', 100, 'beanshell:R_SUELDO_DIARIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000010, NULL, '2010-10-12 10:25:07.0', 100, 'B008', 'U', 'H', NULL, 'Y', 'R_HORAS_EXTRAS_DIURNAS', 'S', 'String jornada = getConceptString("A_JORNADA_LABORAL");
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
double horas_nov = getConcept("A_NOV_HORAS_EXTRAS_DIURNAS");
if (horas_nov != 0.0)
  description = "Horas Novedad =" + horas_nov;
result = horas_nov* sueldo_hora * recargo;', '2011-05-13 11:51:31.0', 100, 'beanshell:R_HORAS_EXTRAS_DIURNAS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000015, NULL, '2010-10-12 11:04:08.0', 100, 'A110', 'U', 'H', NULL, 'Y', 'R_DIA_ADIC_LABORADO_FER_DIURNO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double recargo = 1 + (getAttribute("C_RECARGO_POR_FERIADO_DIAS_DESCANSO") / 100);
double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_FERIADO_DIURNO");
if (dias_adic != 0.0)
  description = "Dias adicionales feriados diurnos=" + dias_adic;
result = sueldo_diario * dias_adic * recargo;
}', '2011-06-21 11:48:41.0', 100, 'beanshell:R_DIA_ADIC_LABORADO_FER_DIURNO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000013, NULL, '2010-10-12 11:03:16.0', 100, 'A107', 'U', 'H', NULL, 'Y', 'R_DIA_ADIC_LABORADO_NOCTURNO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double recargo = 1 + (getAttribute("C_RECARGO_POR_BONO_NOCTURNO") / 100);
double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_NOCTURNO");
if (dias_adic != 0.0)
  description = "Dias adicionales nocturnos=" + dias_adic;
result = sueldo_diario * dias_adic * recargo;
}', '2011-06-21 11:48:32.0', 100, 'beanshell:R_DIA_ADIC_LABORADO_NOCTURNO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000006, NULL, '2010-10-11 15:55:10.0', 100, NULL, 'U', 'H', NULL, 'Y', 'R_DIAS_ASG_NOVEDADES_DIARIAS', 'S', 'result = getConceptGroup("ASG_NOV");', '2010-12-06 16:19:28.0', 100, 'beanshell:R_DIAS_ASG_NOVEDADES_DIARIAS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000130, NULL, '2010-12-06 10:08:25.0', 100, 'B100', 'U', 'H', NULL, 'Y', 'R_ASIGNACION_CARACTER_SALARIAL', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_ASIGNACION_CARACTER_SALARIAL") != null)
{
    result = getAttribute("A_ASIGNACION_CARACTER_SALARIAL");
}', '2010-12-06 10:08:25.0', 100, 'beanshell:R_ASIGNACION_CARACTER_SALARIAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000014, NULL, '2010-10-12 11:03:50.0', 100, 'A111', 'U', 'H', NULL, 'Y', 'R_DIA_ADIC_LABORADO_FER_NOCTUR', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

double recargo_feriado = 1 + (getAttribute("C_RECARGO_POR_FERIADO_DIAS_DESCANSO") / 100);
double recargo_nocturno = 1 + (getAttribute("C_RECARGO_POR_BONO_NOCTURNO") / 100);
double sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
double dias_adic = getConcept("CC_DIAS_ADIC_LABORADOS_FERIADO_DIURNO");
if (dias_adic != 0.0)
  description = "Dias adicionales feriados nocturnos=" + dias_adic;
result = ( sueldo_diario * dias_adic * recargo_feriado ) * recargo_nocturno;
}', '2011-06-21 11:48:51.0', 100, 'beanshell:R_DIA_ADIC_LABORADO_FER_NOCTUR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000007, NULL, '2010-10-11 16:34:20.0', 100, 'Y001', 'U', 'H', NULL, 'Y', 'R_DEDUCIR_DIAS_EGRESO', 'S', 'int dias = 0;
if (_DateEnd.after(_From) && _DateEnd.before(_To)) {
    dias = org.compiere.util.TimeUtil.getDaysBetween(_DateEnd, _To);
    if (_To.getDate() == 31)
        dias--; 
}       
result = dias;', '2010-10-29 09:57:17.0', 100, 'beanshell:R_DEDUCIR_DIAS_EGRESO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000008, NULL, '2010-10-11 16:51:04.0', 100, 'Y002', 'U', 'H', NULL, 'Y', 'R_DEDUCIR_DIAS_INGRESO', 'S', 'int dias = 0;
if (_DateStart.after(_From) && _DateStart.before(_To)) {
    dias = org.compiere.util.TimeUtil.getDaysBetween(_From, _DateStart);
}       
result = dias;', '2010-10-29 09:57:35.0', 100, 'beanshell:R_DEDUCIR_DIAS_INGRESO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000016, NULL, '2010-10-12 15:19:30.0', 100, 'A104', 'U', 'H', NULL, 'Y', 'R_RECARGO_DESCANSO_TRABAJADO', 'S', 'result = 0.0;

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
}
', '2011-06-21 11:46:39.0', 100, 'beanshell:R_RECARGO_DESCANSO_TRABAJADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000020, NULL, '2010-10-12 18:00:40.0', 100, 'Y011', 'U', 'H', NULL, 'Y', 'R_APLICAR_CONCEPTO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
    result = 1.0; 
    int dias_vacaciones = getConcept("CC_DIAS_VACACIONES");
    double sueldo = getConcept("CC_SUELDO_MENSUAL");
    if (_Days == dias_Vacaciones || sueldo == 0.0)
       result = 0.0; 
}', '2012-09-17 15:53:37.0', 100, 'beanshell:R_APLICAR_CONCEPTO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000022, NULL, '2010-10-13 12:08:11.0', 100, 'Y005', 'U', 'H', NULL, 'Y', 'R_EDAD', 'S', 'String sConsulta = ""
+ "SELECT u.birthday "
+ "FROM   c_bpartner b "
+ "       inner join ad_user u "
+ "         ON b.c_bpartner_id = u.c_bpartner_id "
+ "WHERE  b.c_bpartner_id = ? "
+ "       AND u.isinpayroll = ''Y'' ";

Timestamp fecha_nacimiento = DB.getSQLValueTS(get_TrxName(),sConsulta,new Object[] {_C_BPartner_ID});

int meses = getMonths(fecha_nacimiento, _To);
int edad = meses / 12;
result = edad;', '2010-11-09 17:11:23.0', 100, 'beanshell:R_EDAD')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000017, NULL, '2010-10-12 15:39:09.0', 100, 'A105', 'U', 'H', NULL, 'Y', 'R_RECARGO_FERIADO_TRABAJADO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sueldo_variable = getConceptString("A_SUELDO_VARIABLE");

if (sueldo_variable == null)
  sueldo_variable = "N";

double sueldo_diario;
if (sueldo_variable.equals("S")) {
  sueldo_diario = getConcept("CC_SUELDO_DIARIO_VARIABLE");
} else {
  sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}

double recargo = getAttribute("C_RECARGO_POR_FERIADO_DIAS_DESCANSO") / 100;
double dias_desc_trab = getConcept("CC_DIAS_FERIADO_TRABAJADO");

result = sueldo_diario * recargo * dias_desc_trab;

}', '2011-06-21 11:47:39.0', 100, 'beanshell:R_RECARGO_FERIADO_TRABAJADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000018, NULL, '2010-10-12 17:18:18.0', 100, 'Y047', 'U', 'H', NULL, 'Y', 'R_DIAS_BASE_DISFRUTE_VACAC', 'S', 'result = 0;
String sContract = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContract);
double dDaysVac = getConcept("CC_DIAS_VACACIONES");

if  (!bCont_Vac || (bCont_Vac && dDaysVac>0))
{
   double Days = getAttribute("A_DIAS_DISFRUTE_VACACIONES_ESPECIALES");
   if (Days == null || Days == 0)
       Days = getAttribute("C_DIAS_BASE_DISFRUTE_VACACIONES");
   result = Days;
}', '2010-11-23 09:32:09.0', 100, 'beanshell:R_DIAS_BASE_DISFRUTE_VACAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000219, NULL, '2010-12-28 13:43:37.0', 100, 'W002', 'U', 'H', NULL, 'Y', 'R_CIERRE_VAL_INIC_ANU_SUEL_PRE', 'S', 'result = 1.0;
String msg=null; 

if (getConcept("CC_MONTO_PRES_SOC_DIAS_ADIC") >0) {
     result=1.0;
     msg = LVE_Payroll.addValueConcept("A_VAL_INIC_DEV_ANUAL_SUELDO_ADIC_PRESTA",process,new BigDecimal(0),_C_BPartner_ID);
     if (msg != null)	
        result=0.0;
}					   
', '2011-05-19 09:47:38.0', 100, 'beanshell:R_CIERRE_VAL_INIC_ANU_SUEL_PRE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000024, NULL, '2010-10-14 08:44:55.0', 100, 'Funcion determina si la nomina se encuentra en la ultima semana del mes', 'U', 'H', NULL, 'Y', 'R_ULTIMA_SEMANA', 'S', 'result = 0.0;  /* falso, no aplicar */

// Se toman 4 dias, ya que representa la mayor parte de una semana
long lCuatroDias = 86400000 * 4;
int iMes_Actual = _From.getMonth();

Timestamp From = (Timestamp)_From.clone();
Timestamp To = (Timestamp)_To.clone();

From.setTime(From.getTime() + lCuatroDias);
To.setTime(To.getTime() + lCuatroDias);

if (From.getMonth() == iMes_Actual && To.getMonth()!=iMes_Actual)
   result = 1.0; /* verdadero aplicar */

  ', '2010-10-29 14:26:52.0', 100, 'beanshell:R_ULTIMA_SEMANA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000131, NULL, '2010-12-06 10:12:05.0', 100, 'B101', 'U', 'H', NULL, 'Y', 'R_ASIGNACION_SIN_C_SALARIAL', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_ASIGNACION_SIN_CARACTER_SALARIAL") != null)
{
    result = getAttribute("A_ASIGNACION_SIN_CARACTER_SALARIAL");
}
', '2010-12-06 10:25:20.0', 100, 'beanshell:R_ASIGNACION_SIN_C_SALARIAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000119, NULL, '2010-12-02 08:18:29.0', 100, 'Y081', 'U', 'H', NULL, 'Y', 'R_APLICAR_ULTIMA_NOMINA_MES', 'S', 'Timestamp From = _From;
Timestamp To = _To;

Timestamp dateEndMonth = LVE_Payroll.lastDayOfMonth(To);
result= org.compiere.util.TimeUtil.isValid(From ,To, dateEndMonth) ? 1.0: 0.0;  
', '2010-12-02 08:18:29.0', 100, 'beanshell:R_APLICAR_ULTIMA_NOMINA_MES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000032, NULL, '2010-10-15 10:38:18.0', 100, 'Y041', 'U', 'H', NULL, 'Y', 'R_APLICAR_RETENCIONES_LRPVH', 'S', 'result = 0.0;  /* falso, no aplicar */

String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContrato);
double dEdad = getConcept("CC_EDAD");
String sRetenerLRPVH = getAttributeString("A_RETENER_LRPVH");
String sAplicarRetLRPVH = getAttributeString("C_APLICAR_RETENCIONES_FINAL_MES");
double dTopeEdadLRPVH = getAttribute("C_TOPE_EDAD_LRPVH");

if (("S".equals(sRetenerLRPVH) && dEdad<=dTopeEdadLRPVH) ||
   ("S".equals(sAplicarRetLRPVH) && getConcept("CC_ULTIMA_SEMANA") == 0 && bCont_Vac))
    result = 1.0; /* verdadero aplicar */



    ', '2011-05-17 11:01:06.0', 100, 'beanshell:R_APLICAR_RETENCIONES_LRPVH')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000161, NULL, '2010-12-07 10:32:31.0', 100, 'A403', 'U', 'H', NULL, 'Y', 'R_DIAS_LABORADOS_FINIQ_RELACI', 'S', 'result=0.0;

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     result= getAttribute("A_DIAS_ADICIONALES_LABORADOS") * getConcept("CC_SUELDO_DIARIO");   
}', '2012-07-30 14:08:41.0', 100, 'beanshell:R_DIAS_LABORADOS_FINIQ_RELACI')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000183, NULL, '2010-12-08 07:52:38.0', 100, 'E075', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_AUTOMOVILES', 'S', 'result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_AUTOMOVILES");
}', '2010-12-08 07:52:38.0', 100, 'beanshell:R_CUOTA_POLIZA_AUTOMOVILES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000178, NULL, '2010-12-07 16:23:00.0', 100, 'E070', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_HCM', 'S', '
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_HCM");
}', '2010-12-07 16:23:00.0', 100, 'beanshell:R_CUOTA_POLIZA_HCM')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000184, NULL, '2010-12-08 07:56:06.0', 100, 'E076', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_GASTOS_FUNER', 'S', 'result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_GASTOS_FUNERARIOS");
     if (result == null) result = 0.0;
}', '2011-06-30 08:54:04.0', 100, 'beanshell:R_CUOTA_POLIZA_GASTOS_FUNER')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000026, NULL, '2010-10-14 11:13:08.0', 100, 'Q025', 'U', 'H', 'Sueldo Para Retenciones', 'Y', 'R_SUELDO_PARA_RETENCIONES', 'S', '
result = getConcept("CC_SUELDO_MENSUAL")

    ', '2011-02-04 15:38:37.0', 100, 'beanshell:R_SUELDO_PARA_RETENCIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000039, NULL, '2010-10-26 09:55:34.0', 0, 'Y030', 'U', 'H', NULL, 'Y', 'R_FECHA_INGRESO_ANTIGUEDAD', 'S', 'Timestamp dateIni = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(),null);
Timestamp dateAtt = getAttributeDate("C_AÑO_CORTE_ANTIGUEDAD_L_O_T");
result = dateIni.getTime() < dateAtt.getTime() ? dateAtt.getTime() : dateIni.getTime();



', '2011-05-17 14:51:00.0', 100, 'beanshell:R_FECHA_INGRESO_ANTIGUEDAD')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000101, NULL, '2010-11-24 09:21:19.0', 100, 'Y019', 'U', 'H', 'Días no laborados en la nomina al momento de egreso del epleado', 'Y', 'R_DIAS_NO_LABORABLES_POR_EGRE', 'S', 'import org.compiere.util.* ;

Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp from=_From; 
Timestamp to=_To;



result=((dateEndEmployee!=null)&&(TimeUtil.isValid(from,to, dateEndEmployee)))? (double) LVE_Payroll.workDays(get_TrxName(), from,dateEndEmployee , _Payroll, "0,"+  ((Integer)getAttribute("C_DIA_SEMANA_DESCANSO")).toString()) - getConcept("CC_DIAS_DESCANSO_PERIODO") : 0;
', '2011-02-21 16:13:56.0', 100, 'beanshell:R_DIAS_NO_LABORABLES_POR_EGRE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000037, NULL, '2010-10-25 15:26:55.0', 0, 'Y009', 'U', 'H', NULL, 'Y', 'R_AÑOS_ANTIGUEDAD', 'S', 'String contract=  getHR_Payroll().getHR_Contract().getValue();
Timestamp dateEndEmployee = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 

result = "Liquidacion".equals(contract) &&  getConcept("CC_POR_LIQUIDAR") ==1.0 
             ? LVE_Payroll.yearsElapsed(_DateStart, dateEndEmployee)
             :LVE_Payroll.yearsElapsed(_DateStart, _To) ; ', '2011-06-17 11:38:12.0', 100, 'beanshell:R_AÑOS_ANTIGUEDAD')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000185, NULL, '2010-12-08 08:00:15.0', 100, 'E077', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_GASTOS_ODON', 'S', 'result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_GASTOS_ODONTOLOGICOS");
}', '2010-12-08 08:00:15.0', 100, 'beanshell:R_CUOTA_POLIZA_GASTOS_ODON')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000042, NULL, '2010-10-27 07:58:18.0', 100, 'Y029', 'U', 'H', NULL, 'Y', 'R_POR_LIQUIDAR', 'S', 'String estatus =getAttributeString("A_ESTATUS_EMPLEADO");

if (estatus == null)
    estatus="";
    
result= estatus.trim().equals("PLIQ") ?1.0:0.0;
', '2010-11-23 09:56:44.0', 100, 'beanshell:R_POR_LIQUIDAR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000200, NULL, '2010-12-13 07:45:36.0', 100, 'E034', 'U', 'H', NULL, 'Y', 'R_CUOTA_PRESTAMO_OTROS', 'S', '
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "OT" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()),_Process );
	
', '2011-02-18 10:08:42.0', 100, 'beanshell:R_CUOTA_PRESTAMO_OTROS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000186, NULL, '2010-12-08 08:08:12.0', 100, 'E078', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_ESCOLAR', 'S', 'result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_ESCOLAR");
}



', '2010-12-08 08:08:12.0', 100, 'beanshell:R_CUOTA_POLIZA_ESCOLAR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000187, NULL, '2010-12-08 08:13:34.0', 100, 'E090', 'U', 'H', NULL, 'Y', 'R_EXCESO_CELULAR', 'S', 'result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_EXCESO_CELULAR");
}



', '2010-12-08 08:13:34.0', 100, 'beanshell:R_EXCESO_CELULAR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000046, NULL, '2010-10-27 10:37:58.0', 100, 'Y007', 'U', 'H', NULL, 'Y', 'R_DIAS_ADIC_PRESTACIONES', 'S', '
long oneDay = 86400000;

if (getConcept("CC_APLICA_DIAS_ADIC_PREST")==1.0){

     result=(LVE_Payroll.yearsElapsed(new Timestamp( (Long) getConcept("CC_FECHA_INGRESO_ANTIGUEDAD") ),new Timestamp (_To.clone().getTime()-oneDay )) -(getAttribute("C_AÑOS_ANTIG_APLICAR_DIAS_ADIC_PRESTAC")  -1) )* getAttribute("C_DIAS_ADICIONALES_PRESTACIONES")  ;


}else
  result =0.0;

', '2012-07-30 15:31:48.0', 100, 'beanshell:R_DIAS_ADIC_PRESTACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000044, NULL, '2010-10-27 09:30:40.0', 100, 'Y025', 'U', 'H', NULL, 'Y', 'R_DIAS_UTILIDADES_TRABAJADOR', 'S', '    
result =getAttribute("A_DIAS_UTILIDADES_CASOS_ESPECIALES")>0 
            ? getAttribute("A_DIAS_UTILIDADES_CASOS_ESPECIALES")
            : getAttribute("C_DIAS_UTILIDADES");

', '2010-11-02 15:02:50.0', 100, 'beanshell:R_DIAS_UTILIDADES_TRABAJADOR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000165, NULL, '2010-12-07 13:57:02.0', 100, 'A411', 'U', 'H', NULL, 'Y', 'R_VACACIONES_PENDIENTES', 'S', 'result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){

     result= getConcept("CC_SUELDO_DIARIO_VAC") * getAttribute("A_TOT_DIAS_DISPONIBLES_VACACIONES");

}', '2012-08-01 11:11:19.0', 100, 'beanshell:R_VACACIONES_PENDIENTES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000053, NULL, '2010-10-29 08:07:52.0', 100, 'Y050 ', 'U', 'H', NULL, 'Y', 'R_DIAS_ADIC_VAC_PAG_SIN_DISFRU', 'S', '
if (getConcept("CC_DISFRUTAR_DIAS_ADIC_VAC")==1.0) {
 
         result=getConcept("A_DIAS_ADIC_VAC_PAGAR_SIN_DISFRUTE") <=getConcept("CC_DIAS_ADIC_VAC_DISPONIBLE" ) ? getConcept("A_DIAS_ADIC_VAC_PAGAR_SIN_DISFRUTE") :getConcept("CC_DIAS_ADIC_VAC_DISPONIBLE" ); 

}else{
        result =0;
}', '2010-11-08 10:54:49.0', 100, 'beanshell:R_DIAS_ADIC_VAC_PAG_SIN_DISFRU')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000171, NULL, '2010-12-07 15:03:33.0', 100, 'D402', 'U', 'H', NULL, 'Y', 'R_PRESTACIONES_SOCI_FIDECOMISO', 'S', 'result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.1 && "S".equals(getAttributeString("C_CALCULAR_INTERES_PRESTACIONES")) ){
     result= getAttribute("A_MONTO_ACUM_INICIAL_PREST_SOCIALES") + getAttribute("A_MONTO_ACUM_PRESTACIONES_SOCIALES");  
}', '2011-05-16 10:54:09.0', 100, 'beanshell:R_PRESTACIONES_SOCI_FIDECOMISO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000120, NULL, '2010-12-02 11:29:34.0', 100, 'Y069', 'U', 'H', NULL, 'Y', 'R_NUMERO_HIJOS_PRIMA', 'S', '
Integer quantityFamily= LVE_Payroll.numberDependent (get_TrxName(), _C_BPartner_ID, "Hija(o)", 19);
Integer topMax= getAttribute("C_TOPE_MAXIMO_HIJOS_PARA_PAGO_DE_PRIMA") ; 

result= quantityFamily > topMax ?  topMax: quantityFamily ; 
', '2010-12-02 11:30:50.0', 100, 'beanshell:R_NUMERO_HIJOS_PRIMA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000057, NULL, '2010-11-04 07:58:03.0', 100, 'Y048', 'U', 'H', NULL, 'Y', 'R_DIAS_BASE_PAGAR_VACACIONES', 'S', 'result = 0;
String sContract = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContract);
double dDaysVac = getConcept("CC_DIAS_VACACIONES");

if  (!bCont_Vac || (bCont_Vac && dDaysVac>0))
{
    double Days = getAttribute("A_DIAS_VACACIONES_PAGAR_CASO_ESP");
    if (Days == null || Days == 0)
        Days = getAttribute("C_DIAS_BASE_PAGAR_POR_VACACIONES");
    result = Days;
}', '2010-11-23 09:37:06.0', 100, 'beanshell:R_DIAS_BASE_PAGAR_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000055, NULL, '2010-11-03 09:45:21.0', 100, 'Y051', 'U', 'H', NULL, 'Y', 'R_DIAS_ADIC_VAC_DISPONIBLE', 'S', '
result =getConcept("A_ACUM_DIAS_ADIC_VACACIONES_CAUSADAS")-getConcept("A_ACUM_DIAS_ADIC_VACA_PAG_SIN_DISFRUT");

', '2010-11-03 11:30:21.0', 100, 'beanshell:R_DIAS_ADIC_VAC_DISPONIBLE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000169, NULL, '2010-12-07 14:48:55.0', 100, 'D200', 'U', 'H', NULL, 'Y', 'R_ANTICIPOS_UTILIDADES', 'S', '
result= (getConcept("CC_APLICAR_CAL_AÑO_INIC_OPERACI") ==1.0 ? getAttribute("A_MONTO_ACUM_INI_ANTICIPOS_UTILIDADES"):0)+ getAttribute("A_MONTO_ACUM_ANTICIPO_UTILIDADES");', '2010-12-07 14:48:55.0', 100, 'beanshell:R_ANTICIPOS_UTILIDADES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000166, NULL, '2010-12-07 14:22:54.0', 100, 'A412', 'U', 'H', NULL, 'Y', 'R_BONO_VACACIONAL_PENDIENTE', 'S', 'result=0.0;

if (getConcept("CC_POR_LIQUIDAR")==1.0){
       result= getConcept("CC_SUELDO_DIARIO_VAC") * getAttribute("A_TOT_DIAS_SIN_CANCELAR_BONO_VACACIONAL");

}', '2011-06-13 16:24:34.0', 100, 'beanshell:R_BONO_VACACIONAL_PENDIENTE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000173, NULL, '2010-12-07 15:22:41.0', 100, 'D403', 'U', 'H', NULL, 'Y', 'R_INTERESES_PREST_SOC_PAG', 'S', '
result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     result= getAttribute("A_MONTO_ACUM_INTERESES_CANCELADOS")+ getAttribute("A_MONT_ACUM_INI_INTERESES_PREST_PAG");
}', '2010-12-07 15:22:41.0', 100, 'beanshell:R_INTERESES_PREST_SOC_PAG')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000180, NULL, '2010-12-07 16:51:06.0', 100, 'E072', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_H.C', 'S', '
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_HC");
}', '2010-12-07 16:51:06.0', 100, 'beanshell:R_CUOTA_POLIZA_H.C')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000181, NULL, '2010-12-07 16:54:16.0', 100, 'E073', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_VIDA', 'S', '
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_VIDA");
}', '2010-12-07 16:54:16.0', 100, 'beanshell:R_CUOTA_POLIZA_VIDA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000147, NULL, '2010-12-06 15:48:29.0', 100, 'B108', 'U', 'H', NULL, 'Y', 'R_BONO_MATRIMONIO', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && 
    "S".equals(getAttributeString("A_EFECTIVIDAD_MATRIMONIO")))
{
    result = getAttribute("C_BONO_MATRIMONIO");
}
', '2011-05-16 10:53:06.0', 100, 'beanshell:R_BONO_MATRIMONIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000188, NULL, '2010-12-08 08:42:04.0', 100, 'R005', 'U', 'H', NULL, 'Y', 'R_IMPUESTO_SOBRE_LA_RENTA', 'S', 'result=0.0; 
String sContract = getHR_Payroll().getHR_Contract().getValue();

if( (!"Liquidacion".equals(sContract) || ("Liquidacion".equals(sContract) && getConcept("CC_POR_LIQUIDAR")==1.0) ) && getConcept("CC_APLICAR_CONCEPTO")==1.0){

     result= getConcept("CC_MONTO_BASE_ISLR") * getAttribute("A_FACTOR_ISLR") / 100;

}', '2010-12-08 08:42:04.0', 100, 'beanshell:R_IMPUESTO_SOBRE_LA_RENTA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000167, NULL, '2010-12-07 14:36:44.0', 100, 'D001', 'U', 'H', NULL, 'Y', 'R_VACACIONES_PAGADAS', 'S', 'result=0.0; 
Integer dayVacation= getConcept("CC_DIAS_VACACIONES");
if (getConcept("CC_APLICAR_CONCEPTO")==1.0 && dayVacation >0 ){

     result=dayVacation * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")); 

}', '2011-02-03 15:33:58.0', 100, 'beanshell:R_VACACIONES_PAGADAS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000182, NULL, '2010-12-07 16:57:16.0', 100, 'E074', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_CONTRA_ACCIDENT', 'S', 'result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_CONTRA_ACCIDENTES");
}', '2012-07-30 15:29:25.0', 100, 'beanshell:R_CUOTA_POLIZA_CONTRA_ACCIDENT')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000170, NULL, '2010-12-07 14:53:16.0', 100, 'D400', 'U', 'H', NULL, 'Y', 'R_ANTICIPO_PRESTACIONES', 'S', '
result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){
     result= getAttribute("A_MONTO_ACUM_INI_ANTICIPOS_PREST_SOC")+getAttribute("A_MONTO_ACUM_ANTICIPO_PREST_SOCIALES");
}', '2010-12-07 14:53:43.0', 100, 'beanshell:R_ANTICIPO_PRESTACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000174, NULL, '2010-12-07 15:54:14.0', 100, 'D406', 'U', 'H', NULL, 'Y', 'R_REPOSO_DEDUCC_LIQUIDACION', 'S', 'result=0.0; 

if(getConcept("CC_POR_LIQUIDAR")==1.0 && getAttribute("A_MONTO_ACUM_CANCELADO_REPOSO_IVSS")>0){
     result= getAttribute("A_MONTO_ACUM_CANCELADO_REPOSO_IVSS"); 
}', '2010-12-07 15:54:14.0', 100, 'beanshell:R_REPOSO_DEDUCC_LIQUIDACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000175, NULL, '2010-12-07 16:08:46.0', 100, 'B020', 'U', 'H', NULL, 'Y', 'R_ANTICIPO_PRESTACIONES_SOCIAL', 'S', '
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0) {
     result= getAttribute("A_ANTICIPO_PRESTACIONES_SOCIALES");
}', '2010-12-07 16:08:46.0', 100, 'beanshell:R_ANTICIPO_PRESTACIONES_SOCIAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000176, NULL, '2010-12-07 16:12:49.0', 100, 'B021', 'U', 'H', NULL, 'Y', 'R_ANTICIPO_UTILIDADES', 'S', '
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0) {
     result= getAttribute("A_ANTICIPO_UTILIDADES");
}', '2010-12-07 16:12:49.0', 100, 'beanshell:R_ANTICIPO_UTILIDADES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000177, NULL, '2010-12-07 16:18:29.0', 100, 'E050', 'U', 'H', NULL, 'Y', 'R_CUOTA_UNIFORMES', 'S', '

result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_UNIFORMES");
}', '2010-12-07 16:18:29.0', 100, 'beanshell:R_CUOTA_UNIFORMES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000045, NULL, '2010-10-27 09:54:06.0', 100, 'Q030', 'U', 'H', NULL, 'Y', 'R_APLICA_DIAS_ADIC_PREST', 'S', 'long oneDay = 86400000;

result=  ((LVE_Payroll.monthsOnPeriod(new Timestamp( (Long) getConcept("CC_FECHA_INGRESO_ANTIGUEDAD") ), new Timestamp (_To.clone().getTime()-oneDay )) % 12.0 ==0.0 
&&  getConcept("CC_AÑOS_ANTIGUEDAD")>1.0)) || ((getConcept("CC_POR_LIQUIDAR") ==1.0 
&&  getConcept("CC_AÑOS_ANTIGUEDAD") !=0.0 
&&  getConcept("CC_MESES_TRABAJADOS") % 12 >=6) )? 1.0 : 0.0;  


', '2012-07-30 15:31:01.0', 100, 'beanshell:R_APLICA_DIAS_ADIC_PREST')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000179, NULL, '2010-12-07 16:26:47.0', 100, 'E071', 'U', 'H', NULL, 'Y', 'R_CUOTA_POLIZA_HCM_FAMILIARES', 'S', '
result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("A_CUOTA_POLIZA_HCM_FAMILIARES");
}', '2010-12-07 16:26:47.0', 100, 'beanshell:R_CUOTA_POLIZA_HCM_FAMILIARES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000191, NULL, '2010-12-08 09:36:20.0', 100, 'V003', 'U', 'H', NULL, 'Y', 'R_MONTO_INTERESES_PRESTACIONES', 'S', 'result=0.0; 

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

', '2012-08-01 11:00:02.0', 100, 'beanshell:R_MONTO_INTERESES_PRESTACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000199, NULL, '2010-12-13 07:44:45.0', 100, 'E032', 'U', 'H', NULL, 'Y', 'R_CUOTA_PRESTAMO_PERSONALES', 'S', '

String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "P1" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()), _Process );', '2011-02-18 10:08:48.0', 100, 'beanshell:R_CUOTA_PRESTAMO_PERSONALES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000168, NULL, '2010-12-07 14:43:48.0', 100, 'D002', 'U', 'H', NULL, 'Y', 'R_DIAS_SUEL_PEND_PAG_VAC', 'S', 'result=0.0; 
if("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES")) && getConcept("CC_APLICAR_CONCEPTO")==1.0 && getConcept("CC_DIAS_VACACIONES") > 0){
     result= getConcept("CC_DIAS_DE_SUELDO_PENDIENTE")* (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}
', '2011-05-16 10:53:47.0', 100, 'beanshell:R_DIAS_SUEL_PEND_PAG_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000201, NULL, '2010-12-13 07:47:33.0', 100, 'E033', 'U', 'H', NULL, 'Y', 'R_CUOTA_PRESTAMO_REMOD_VIVIEND', 'S', '
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HI" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()), _Process );', '2011-02-18 10:08:55.0', 100, 'beanshell:R_CUOTA_PRESTAMO_REMOD_VIVIEND')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000121, NULL, '2010-12-02 15:02:05.0', 100, 'Q033', 'U', 'H', NULL, 'Y', 'R_SUELDO_DIARIO_VARIABLE', 'S', 'result = 0.0;

double monthDays = getAttribute("C_DIAS_DEL_MES");

if (monthDays >0)
    result = getConcept("CC_SUELDO_MENSUAL_VARIABLE") / monthDays;

', '2011-07-01 16:12:36.0', 100, 'beanshell:R_SUELDO_DIARIO_VARIABLE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000273, NULL, '2011-06-21 11:09:10.0', 100, NULL, 'U', 'H', NULL, 'Y', 'R_APLICA', 'S', 'result=1.0; 

String Status =getAttributeString("A_ESTATUS_EMPLEADO");

if (Status.trim().equals("LIQU"))	
          result=0.0;', '2011-06-21 15:34:15.0', 100, 'beanshell:R_CAMBIO_STATUS_CIERRE_LIQUIDA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000195, NULL, '2010-12-08 11:26:15.0', 100, 'A200', 'U', 'H', NULL, 'Y', 'R_ANTIC_UTILIDADES_LOTTT_132', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
    result= getConcept("CC_DIAS_UTILIDADES_POR_MES")*getConcept("CC_MESES_PARA_UTILIDADES")*getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");
}
', '2012-08-06 15:34:21.0', 100, 'beanshell:R_ANTIC_UTILIDADES_LOTTT_132')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000124, NULL, '2010-12-02 16:49:30.0', 100, 'W004', 'U', 'H', NULL, 'Y', 'R_CIERRE_ANTICIPO_PREST_UTIL', 'S', 'String msg=null; 
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
 

', '2011-05-26 10:21:05.0', 100, 'beanshell:R_CIERRE_ANTICIPO_PREST_UTIL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000234, NULL, '2011-01-11 08:08:47.0', 100, 'W012', 'U', 'H', NULL, 'Y', 'R_ACT_CAMPO_SUELDO_PAG_VAC_CIE', 'S', 'result=0.0;
if ("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES"))){
     result=1.0;
     msg = LVE_Payroll.addValueStringConcept("A_SUELDO_PAGADO_VACACIONES",process,"S", _C_BPartner_ID);
     if (msg != null)	
          result=0;
}', '2011-05-19 09:32:34.0', 100, 'beanshell:R_ACT_CAMPO_SUELDO_PAG_VAC_CIE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000236, NULL, '2011-01-12 09:28:39.0', 100, 'A007', 'U', 'H', NULL, 'Y', 'R_INTERESES_PREST_SOC_ANUALES', 'S', '
result=0.0; 

if (!"S".equals(getAttributeString("C_PRESTACIONES_DEPOSITADAS_FIDEICOMISO")) && 
     "S".equals(getAttributeString("C_CALCULAR_INTERES_PRESTACIONES")) && 
    !"S".equals(getAttributeString("C_PAGAR_INTERESES_PRESTACIONES_MENSUAL")) &&
     getConcept("CC_APLICA")==1.0){
     result= LVE_Payroll.generatedValue(get_TrxName(), _Process , _Department , _C_BPartner_ID, "CC_MONTO_INTERESES_PRESTACIONES");
}

', '2011-06-21 11:44:47.0', 100, 'beanshell:R_INTERESES_PREST_SOC_ANUALES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000197, NULL, '2010-12-10 16:58:36.0', 100, 'E030', 'U', 'H', NULL, 'Y', 'R_CUOTA_PRESTAMO_ESTUDIO', 'S', 'Timestamp To= _To.clone();
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )

     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "S1" , new Date  (To.getYear(), To.getMonth(), To.getDate()), _Process );

	', '2011-02-18 10:08:34.0', 100, 'beanshell:R_CUOTA_PRESTAMO_ESTUDIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000172, NULL, '2010-12-07 15:08:45.0', 100, 'A103', 'U', 'H', NULL, 'Y', 'R_ASIGNACION_SUSPENSION', 'S', 'result = 0;

String sql = "SELECT lve_daysnotice(?,?,?,?,?)";
double days = DB.getSQLValue(get_TrxName(), sql, new Object[] {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_SUSPENSION_REM"});

if (days != null && days > 0 && getConcept("CC_APLICA")==1.0)
   result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));', '2011-06-21 11:46:15.0', 100, 'beanshell:R_ASIGNACION_SUSPENSION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000198, NULL, '2010-12-10 16:59:19.0', 100, 'E031', 'U', 'H', NULL, 'Y', 'R_CUOTA_PRESTAMO_COMPRA_VIVIEN', 'S', '
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 
if (getConcept("CC_APLICAR_CONCEPTO")==1.0  &&  ( !"Vacaciones".equals(sContract) || ( "Vacaciones".equals(sContract)  && getConcept("CC_DIAS_VACACIONES") > 0 ) ) )
     result= LVE_Payroll.PaymentOfQuota (get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HB" , new Date  (_To.getYear(), _To.getMonth(), _To.getDate()), _Process );
', '2011-02-18 10:08:07.0', 100, 'beanshell:R_CUOTA_PRESTAMO_COMPRA_VIVIEN')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000227, NULL, '2011-01-10 08:40:02.0', 100, 'W021', 'U', 'H', NULL, 'Y', 'R_CIERRE_FEC_INTER_PREST_MENSU', 'S', '
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

', '2011-05-19 09:21:34.0', 100, 'beanshell:R_CIERRE_FEC_INTER_PREST_MENSU')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000132, NULL, '2010-12-06 10:25:55.0', 100, 'B102', 'U', 'H', NULL, 'Y', 'R_BONO_NACIMIENTO_HIJOS', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_NUMERO_HIJOS_NACIDOS") != null)
{
    result = getAttribute("A_NUMERO_HIJOS_NACIDOS") * getAttribute("C_BONO_NACIMIENTO_HIJOS");
}
', '2010-12-06 10:25:55.0', 100, 'beanshell:R_BONO_NACIMIENTO_HIJOS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000061, NULL, '2010-11-08 08:36:07.0', 100, 'Y055', 'U', 'H', NULL, 'Y', 'R_DIAS_DESC_VAC_INAS_INJUS', 'S', '

result=getConcept("A_DIAS_VACACIONES_INASISTENCIA_INJUST")>=getAttribute("C_DIAS_MIN_DESC_VAC_POR_INASIST_INJUS")?getConcept("A_DIAS_VACACIONES_INASISTENCIA_INJUST"):0;
', '2010-11-08 10:52:13.0', 100, 'beanshell:R_DIAS_DESC_VAC_INAS_INJUS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000068, NULL, '2010-11-08 14:55:12.0', 100, 'Y070', 'U', 'H', NULL, 'Y', 'R_TOPE_SALARIO_BONO_ALIMENT', 'S', 'result= getAttribute("C_TOPE_SALARIOS_BONO_ALIMENTACION")* getAttribute("C_SUELDO_MINIMO"); ', '2011-05-11 09:56:28.0', 100, 'beanshell:R_TOPE_SALARIO_BONO_ALIMENT')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000066, NULL, '2010-11-08 14:18:31.0', 100, 'Y063', 'U', 'H', NULL, 'Y', 'R_SUELDO_LIQUIDADO_VACACIONES', 'S', 'result=getConcept("CC_APLICAR_CONCEPTO");', '2010-11-08 14:18:31.0', 100, 'beanshell:R_SUELDO_LIQUIDADO_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000062, NULL, '2010-11-08 09:06:55.0', 100, 'Y058', 'U', 'H', NULL, 'Y', 'R_VAL_INI_DEVENG_ANUAL_SUEL_ADIC_PRES', 'S', '
result= getConcept("A_TOT_MONTO_DISPONIBLE_INTERESES_PREST"); ', '2010-11-08 11:22:31.0', 100, 'beanshell:R_VAL_INI_DEV_ANU_SUEL_ADI_PRE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000063, NULL, '2010-11-08 11:27:59.0', 100, 'Y059', 'U', 'H', NULL, 'Y', 'R_MONTO_DISPONIBLE_PREST', 'S', '
result= getConcept("A_TOT_MONTO_DISPONIBLE_PRESTACIONES"); ', '2010-11-08 11:28:29.0', 100, 'beanshell:R_MONTO_DISPONIBLE_PREST')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000067, NULL, '2010-11-08 14:38:19.0', 100, 'Y064', 'U', 'H', NULL, 'Y', 'R_TOTAL_DISP_FONDO_AHORRO', 'S', 'result=getConcept("A_TOT_MONTO_DISPONIBLE_FONDO_AHORRO");', '2010-11-08 14:38:19.0', 100, 'beanshell:R_TOTAL_DISP_FONDO_AHORRO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000064, NULL, '2010-11-08 11:37:47.0', 100, 'Y060', 'U', 'H', NULL, 'Y', 'R_MONTO_DISP_INTERESES_PREST', 'S', '
result= getConcept("A_TOT_MONTO_DISPONIBLE_INTERESES_PREST"); ', '2010-11-08 11:40:05.0', 100, 'beanshell:R_MONTO_DISP_INTERESES_PREST')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000058, NULL, '2010-11-05 09:57:01.0', 100, 'Y012', 'U', 'H', NULL, 'Y', 'R_DIAS_UTILIDADES_POR_MES', 'S', '
result= getConcept("A_DIAS_UTILIDADES_CASOS_ESPECIALES")>0 ? getConcept("A_DIAS_UTILIDADES_CASOS_ESPECIALES")/12: getAttribute("C_DIAS_UTILIDADES")/12; 

', '2011-03-31 14:04:50.0', 100, 'beanshell:R_DIAS_UTILIDADES_POR_MES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000098, NULL, '2010-11-23 08:01:01.0', 100, 'Y040-1', 'U', 'H', NULL, 'Y', 'R_APLICAR_RETENCION_FINAL_MES', 'S', '
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
      }', '2011-02-21 16:09:25.0', 100, 'beanshell:R_APLICAR_RETENCION_FINAL_MES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000196, NULL, '2010-12-08 11:33:50.0', 100, 'A201', 'U', 'H', NULL, 'Y', 'R_BONO_FIN_AÑO', 'S', 'result=0.0; 

if (getConcept("CC_APLICA")==1.0 && "S".equals(getAttributeString("C_PAGAR_BONO_FIN_ANO"))) {
     result= getConcept("CC_VALOR_DIAS_BONO_FIN_AÑO_TRAB")* getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");
}', '2011-06-30 08:53:25.0', 100, 'beanshell:R_BONO_FIN_AÑO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000126, NULL, '2010-12-03 16:56:03.0', 100, 'B112', 'U', 'H', NULL, 'Y', 'R_COMISIONES', 'S', 'result = 0.0;
if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_MONTO_PAGAR_COMISIONES", _From)!=null)
   result = getAttribute("A_MONTO_PAGAR_COMISIONES", _From);', '2012-09-13 14:58:32.0', 100, 'beanshell:R_COMISIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000128, NULL, '2010-12-06 08:49:31.0', 100, 'B113', 'U', 'H', NULL, 'Y', 'R_BECA_ESTUDIO', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getConcept("CC_APLICAR_ULTIMA_NOMINA_MES") == 1.0)
{
    result = getAttribute("A_BECA_ESTUDIO");
}', '2011-02-01 09:15:50.0', 100, 'beanshell:R_BECA_ESTUDIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000080, NULL, '2010-11-17 12:04:06.0', 100, 'Y046', 'U', 'H', NULL, 'Y', 'R_DIAS_BASE_BONO_VAC', 'S', 'result = 0.0;

String sContrato = getHR_Payroll().getHR_Contract().getValue();
double iDiasVacPeriodo = getConcept("CC_DIAS_VACACIONES");
boolean bCont_Vac = "N_VAC".equals(sContrato);

if  (!bCont_Vac || (bCont_Vac && iDiasVacPeriodo>0))
    result = getAttribute("A_DIAS_BONO_VACACIONAL_CASO_ESP") > 0 ? getAttribute("A_DIAS_BONO_VACACIONAL_CASO_ESP") : 
             					getAttribute("C_DIAS_BASE_BONO_VACACIONAL");

', '2011-04-25 14:23:31.0', 100, 'beanshell:R_DIAS_BASE_BONO_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000085, NULL, '2010-11-18 14:28:11.0', 100, 'A302', 'U', 'H', NULL, 'Y', 'R_BONO_VACACIONAL', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

   String sContract = getHR_Payroll().getHR_Contract().getValue().trim();
    if ("Vacaciones".equals(sContract)) 
      result=getConcept("CC_DIAS_BONO_VAC_POR_AÑO") * getConcept("CC_SUELDO_DIARIO_VAC");

}', '2011-06-29 14:40:10.0', 100, 'beanshell:R_BONO_VACACIONAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000065, NULL, '2010-11-08 11:52:28.0', 100, 'Y062', 'U', 'H', NULL, 'Y', 'R_AÑOS_ANTIGUEDAD_VACACIONES', 'S', 'Double iAnhosAntiguedad= getConcept("CC_AÑOS_ANTIGUEDAD");
Double iAnhosMaxVac = getAttribute("C_DIAS_TOPE_DISFRUTE_VACACIONES")-getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")+1;

result= iAnhosAntiguedad > iAnhosMaxVac && iAnhosMaxVac > 0 ? iAnhosMaxVac : iAnhosAntiguedad;
		
	', '2012-07-26 08:17:38.0', 100, 'beanshell:R_AÑOS_ANTIGUEDAD_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000073, NULL, '2010-11-10 08:17:12.0', 100, 'U002', 'U', 'H', NULL, 'Y', 'R_REGIMEN_PRESTACIONAL_PA', 'S', 'String sContrato = getHR_Payroll().getHR_Contract().getValue();
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


', '2011-03-23 08:04:41.0', 100, 'beanshell:R_REGIMEN_PRESTACIONAL_PA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000079, NULL, '2010-11-17 11:54:18.0', 100, 'Y054', 'U', 'H', NULL, 'Y', 'R_AÑOS_ANTIGUEDAD_BONO_VAC', 'S', 'result = 0.0;

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



', '2011-04-25 14:24:26.0', 100, 'beanshell:R_AÑOS_ANTIGUEDAD_BONO_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000134, NULL, '2010-12-06 10:50:38.0', 100, 'Q012', 'U', 'H', NULL, 'Y', 'R_INCLUIR_ACUM_INIC_UTILIDADES', 'S', '
Timestamp nextPayroll= LVE_Payroll.nextPayroll(get_TrxName(), _Payroll, "Utilidades", _To, _C_BPartner_ID);
Timestamp lastPayroll= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID, getAD_Org_ID(),"''Utilidades''",  true);
result=0.0;

if ((nextPayroll!=null && nextPayroll.getYear()== getAttribute("C_AÑO_INICIO_OPERACIONES")) && ( lastPayroll!=null & lastPayroll.getYear()!= nextPayroll.getYear()) ){
result= getAttribute("A_MONTO_ACUM_INI_UTILIDADES"); 
}

', '2011-05-12 16:08:17.0', 100, 'beanshell:R_INCLUIR_ACUM_INIC_UTILIDADES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000228, NULL, '2011-01-10 10:33:36.0', 100, 'W020', 'U', 'H', NULL, 'Y', 'R_ACTUALIZAR_SUELDO_MENSUAL', 'S', 'Double value1= getAttribute("A_SUELDO_MENSUAL_USD"); 
result=0.0;

if (value1>0){
     result=1.0;
     msg = LVE_Payroll.addValueConcept("A_SUELDO_MENSUAL_VEB",process,
                new BigDecimal(getConcept("CC_SUELDO_MENSUAL")), _C_BPartner_ID);
     if (msg != null)	
          result=0;
}
', '2011-05-19 09:22:09.0', 100, 'beanshell:R_ACTUALIZAR_SUELDO_MENSUAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000143, NULL, '2010-12-06 14:57:29.0', 100, 'B106', 'U', 'H', NULL, 'Y', 'R_BONO_POR_GRADUACION', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 &&
    getAttribute("C_MONTO_PAGAR_BONO_POR_GRADUACION") > 0 &&
    "S".equals(getAttributeString("A_PAGAR_BONO_GRADUACION")))
{
     result = getAttribute("C_MONTO_PAGAR_BONO_POR_GRADUACION");
}
', '2011-05-16 10:52:55.0', 100, 'beanshell:R_BONO_POR_GRADUACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000021, NULL, '2010-10-13 12:02:58.0', 100, 'Determina los días de descanso en un período dado', 'U', 'H', NULL, 'Y', 'R_DIAS_DESCANSO_PERIODO', 'S', 'int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
String sQuery = "select lve_daysrest(?,?,?) - lve_daysrestnoticeinperiod(?,?,?,?,?,?,?)";


Timestamp From = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp To = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");


From = From.getTime() > _From.getTime() ? From : _From.clone();

To = (To != null  && To.getTime() < _To.getTime() )? To : _To.clone();

int days = DB.getSQLValue(get_TrxName(), sQuery, 
                 new Object[] {From, To, dayrest, getAD_Client_ID(),_Payroll,_C_BPartner_ID,_From,_To,"ASG_NOV_DIAS",dayrest});


result = (double)days;
', '2011-02-21 16:13:38.0', 100, 'beanshell:R_DIAS_DESCANSO_PERIODO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000135, NULL, '2010-12-06 11:10:08.0', 100, 'Q009', 'U', 'H', NULL, 'Y', 'R_MONTO_DIARIO_DEVENGADO_AÑO', 'S', 'String estatus =getAttributeString("A_ESTATUS_EMPLEADO");

Double Aux = estatus.trim().equals("PLIQ") ? 0.0 : getConcept("CC_SALARIO_ESTIMADO_UTILIDADES"); 
Aux = Aux + getConcept("CC_INCLUIR_ACUM_INIC_UTILIDADES")+getConcept("CC_MONTO_DEVENGADO_PERIODO_UTIL");
Double Aux2= (getConcept("CC_MESES_PARA_UTILIDADES") * getAttribute("C_DIAS_DEL_MES"))>0 ? (getConcept("CC_MESES_PARA_UTILIDADES")*getAttribute("C_DIAS_DEL_MES")) : 1.0;

result= Aux2>0 ? Aux/Aux2 : 0.0; ', '2010-12-06 11:12:55.0', 100, 'beanshell:R_MONTO_DIARIO_DEVENGADO_AÑO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000158, NULL, '2010-12-07 10:15:34.0', 100, 'E010', 'U', 'H', NULL, 'Y', 'R_DED_CON_CARACTER_SALARIAL', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && getAttribute("A_DEDUCCION_CON_CARACTER_SALARIAL") > 0)
   result = getAttribute("A_DEDUCCION_CON_CARACTER_SALARIAL");', '2010-12-07 10:15:34.0', 100, 'beanshell:R_DED_CON_CARACTER_SALARIAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000263, NULL, '2011-03-21 16:15:24.0', 100, 'A104', 'U', 'H', NULL, 'Y', 'R_DIAS_DESCANSO_TRABAJADO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnotice =  DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_DESCANSO_TRABAJADO"});
result = daysnotice == null ? 0 : daysnotice;
}', '2011-06-21 11:47:06.0', 100, 'beanshell:R_DIAS_DESCANSO_TRABAJADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000089, NULL, '2010-11-19 11:56:24.0', 100, 'Y036', 'U', 'H', NULL, 'Y', 'R_FEC_INIC_CORT_TRIM_PAG_VAC', 'S', 'long oneDay = 86400000;
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
	  ', '2012-08-08 15:10:15.0', 100, 'beanshell:R_FEC_INIC_CORT_TRIM_PAG_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000117, NULL, '2010-11-30 08:55:07.0', 100, 'Y022', 'U', 'H', NULL, 'Y', 'R_MESES_PARA_UTILIDADES', 'S', 'long oneDay = 86400000;
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
', '2011-06-30 08:57:16.0', 100, 'beanshell:R_MESES_PARA_UTILIDADES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000081, NULL, '2010-11-17 13:54:13.0', 100, 'Y057', 'U', 'H', NULL, 'Y', 'R_DIAS_DISPONIBLES_BONO_VAC', 'S', 'result = 0.0;

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
', '2011-07-01 10:40:00.0', 100, 'beanshell:R_DIAS_DISPONIBLES_BONO_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000082, NULL, '2010-11-18 09:49:53.0', 100, 'Y052', 'U', 'H', NULL, 'Y', 'R_DIAS_ACUM_BONO_VAC', 'S', 'long oneDay = 86400000;
Timestamp From = (Timestamp) _From.clone();
Timestamp date = From; 
date.setDate(1);
date = new Timestamp(date.getTime()-oneDay);

result = getAttribute("A_TOT_DIAS_SIN_CANCELAR_BONO_VACACIONAL", date) + 
              getConcept("CC_DIAS_BONO_VAC_CAUSADO");

', '2011-06-30 09:28:50.0', 100, 'beanshell:R_DIAS_ACUM_BONO_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000122, NULL, '2010-12-02 15:06:52.0', 100, 'A003', 'U', 'H', NULL, 'Y', 'R_FERIADO_LEGAL', 'S', 'result = 0.0;

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
}
else{
    From = getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_From);
    From = new Timestamp(From.getTime() + oneDay);
}

sQuery = "select lve_holidaysinperiod(?,?,?,?)";
double holidaysinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {_Payroll, From, To, dayrest});

sQuery = "select lve_holidaysnoticeinperiod(?,?,?,?,?,?,?)";
double holidaysnoticeinperiod = DB.getSQLValue(get_TrxName(), sQuery, new Object[] {getAD_Client_ID(),_Payroll,_C_BPartner_ID, From, To,"ASG_NOV_DIAS",dayrest});

description = "Feriados del periodo en días: " + (holidaysinperiod - holidaysnoticeinperiod);

result = (holidaysinperiod - holidaysnoticeinperiod) *
             (getAttributeString("A_SUELDO_VARIABLE")=="S" ? 
              getConcept("CC_SUELDO_DIARIO_VARIABLE") : 
             (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")) );
}', '2012-01-30 11:26:05.0', 100, 'beanshell:R_FERIADO_LEGAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000141, NULL, '2010-12-06 14:37:22.0', 100, 'Q010', 'U', 'H', NULL, 'Y', 'R_MONTO_BASE_ISLR', 'S', '
String sContract = getHR_Payroll().getHR_Contract().getValue();
result=0.0; 

if ((!"Vacaciones".equals(sContract)) || getConcept("CC_DIAS_VACACIONES") > 0){

     result= LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption8","Y",_Payroll);

}
', '2011-08-16 15:28:35.0', 100, 'beanshell:R_MONTO_BASE_ISLR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000088, NULL, '2010-11-18 17:00:51.0', 100, 'Q022', 'U', 'H', NULL, 'Y', 'R_SUELDO_MES_VACACIONES', 'S', 'result = 0.0; 

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
}', '2010-11-24 08:06:30.0', 100, 'beanshell:R_SUELDO_MES_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000094, NULL, '2010-11-19 16:41:05.0', 100, 'A300', 'U', 'H', NULL, 'Y', 'R_VACACIONES', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Vacaciones".equals(sContract))
   result = getConcept("CC_DIAS_VACACIONES") * getConcept("CC_SUELDO_DIARIO_VAC");

}', '2011-06-21 11:18:09.0', 100, 'beanshell:R_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000233, NULL, '2011-01-10 15:47:30.0', 100, 'W013', 'U', 'H', NULL, 'Y', 'R_ACT_CAMPO_SUELDO_PAG_VACACIO', 'S', 'result=0.0;

if ("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES"))){
    result=1.0;
    if ("S".equals(getAttributeString("A_SUELDO_PAGADO_VACACIONES"))) {
        msg = LVE_Payroll.addValueStringConcept("A_SUELDO_PAGADO_VACACIONES",process,"", _C_BPartner_ID);
        if (msg != null)
            result=0;
    }
}
', '2011-05-19 09:37:22.0', 100, 'beanshell:R_ACT_CAMPO_SUELDO_PAG_VACACIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000110, NULL, '2010-11-25 16:09:04.0', 100, 'A303', 'U', 'H', NULL, 'Y', 'R_SUELDO_PENDIENTE', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sContract = getHR_Payroll().getHR_Contract().getValue();
if ("S".equals(getAttributeString("C_PAGAR_SUELDO_EN_VACACIONES")) && "Vacaciones".equals(sContract))
{
    result = getConcept("CC_DIAS_DE_SUELDO_PENDIENTE") * getConcept("CC_SUELDO_DIARIO_VAC");
}

}', '2011-06-21 11:19:01.0', 100, 'beanshell:R_SUELDO_PENDIENTE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000264, NULL, '2011-03-21 16:49:49.0', 100, 'A105', 'U', 'H', NULL, 'Y', 'R_DIAS_FERIADO_TRABAJADO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnotice =  DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_FERIADO_TRABAJADO"});
result = daysnotice == null ? 0 : daysnotice;
}
', '2011-06-21 11:48:15.0', 100, 'beanshell:R_DIAS_FERIADO_TRABAJADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000100, NULL, '2010-11-23 16:31:01.0', 100, 'Y018', 'U', 'H', NULL, 'Y', 'R_LUNES_RETENC_NORMAL_ING_EG', 'S', 'import org.compiere.util.*;
Timestamp dateStartEmployee = LVE_Payroll.DateInitialEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee (get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");


if (TimeUtil.isValid(new Timestamp (dateStartRetention   ), _To , dateStartEmployee)){

     result= LVE_Payroll.dayOnPeriod(dateStartEmployee, _To, 1); 

}else{
     
     result= ( (datEndEmployee==null) && (TimeUtil.isValid(_DateStart, _To , dateEndEmployee)) )? LVE_Payroll.dayOnPeriod(new Timestamp (dateStartRetention), dateEndEmployee, 1):LVE_Payroll.dayOnPeriod( new Timestamp (dateStartRetention),_To, 1) ; 

}

', '2011-02-21 16:21:11.0', 100, 'beanshell:R_LUNES_RETENC_NORMAL_ING_EG')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000107, NULL, '2010-11-25 09:43:40.0', 100, 'A301', 'U', 'H', NULL, 'Y', 'R_VAC_EN_FESTIVOS_DESCANSO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

   String sContract = getHR_Payroll().getHR_Contract().getValue();
   double holidayAndRest = 0;


   if ("Vacaciones".equals(sContract))
   {
      holidayAndRest = LVE_Payroll.daysElapsed(_From, _To) - getConcept("CC_DIAS_VACACIONES");
      result = holidayAndRest * getConcept("CC_SUELDO_DIARIO_VAC");
   }

}', '2011-06-29 11:38:42.0', 100, 'beanshell:R_VAC_EN_FESTIVOS_DESCANSO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000242, NULL, '2011-01-13 08:43:13.0', 100, 'W009', 'U', 'H', NULL, 'Y', 'R_CAMBIO_STATUS_CIERRE_LIQUIDA', 'S', 'result=0.0; 
String msg=null; 

String estatus =getAttributeString("A_ESTATUS_EMPLEADO");
Double value1= getConcept("CC_PRESTACIONES_SOCIALES");

if (value1!=0 || estatus.trim().equals("PLIQ")  ){
      msg = LVE_Payroll.addValueStringConcept("A_ESTATUS_EMPLEADO",process,"LIQU", _C_BPartner_ID);
     if (msg != null)	
          result=0;
}', '2011-05-19 09:39:26.0', 100, 'beanshell:R_CAMBIO_STATUS_CIERRE_LIQUIDA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000245, NULL, '2011-01-13 10:22:14.0', 100, 'W025', 'U', 'H', NULL, 'Y', 'R_ACT_FECH_FIN_ULTIMA_VAC_DISF', 'S', 'result=0.0;
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
}', '2011-05-19 09:17:35.0', 100, 'beanshell:R_ACT_FECH_FIN_ULTIMA_VAC_DISF')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000244, NULL, '2011-01-13 09:44:24.0', 100, 'W017', 'U', 'H', NULL, 'Y', 'R_CIERRE_ACUM_FONDO_AHORRO', 'S', 'result=1.0; 
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
}', '2011-05-26 10:24:31.0', 100, 'beanshell:R_CIERRE_ACUM_FONDO_AHORRO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000257, NULL, '2011-02-11 09:12:13.0', 100, 'D100', 'U', 'H', NULL, 'Y', 'R_DEDUCCION_REPOSO', 'S', 'result = 0;

String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
double daysnotice = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From.clone(), _To.clone(), "D_DIAS_DEDUCCION_REPOSO"});

if (daysnotice > 0)
{
        double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
        double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");

        if (daysPaid < daysrestclient)
            daysnotice -= daysrestclient - daysPaid;


        description = "Días de Reposo IVSS: " + daysnotice;
        result = daysnotice * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}', '2011-05-19 11:25:56.0', 100, 'beanshell:R_DEDUCCION_REPOSO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000254, NULL, '2011-01-17 10:18:56.0', 100, 'U005', 'U', 'H', 'INCE PATRONAL', 'Y', 'R_PROVISI_MENSUAL_BONO_FIN_ANO', 'S', 'result=0.0;
if ("S".equals(getAttributeString("C_PAGAR_BONO_FIN_ANO")) && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0){
     result= (getConcept("CC_VALOR_DIAS_BONO_FIN_AÑO_TRAB")/12)* getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");

}', '2011-06-21 11:40:07.0', 100, 'beanshell:R_PROVISI_MENSUAL_BONO_FIN_ANO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000160, NULL, '2010-12-07 10:19:18.0', 100, 'A402', 'U', 'H', NULL, 'Y', 'R_INTERESES_PREST_SOCIALES', 'S', 'result=0.0; 

if (getConcept("CC_POR_LIQUIDAR")==1.0){
      result= getAttribute("A_MONTO_ACUM_INI_INTERESES_PREST_SOC")+getAttribute("A_MONTO_ACUM_INTERESES_PRESTACIONES");
}
', '2012-07-30 15:22:27.0', 100, 'beanshell:R_INTERESES_PREST_SOCIALES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000241, NULL, '2011-01-13 08:19:29.0', 100, 'W024', 'U', 'H', NULL, 'Y', 'R_ACT_ACUM_MONTO_PAG_REPO_IVSS', 'S', 'result=0.0;
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
}', '2012-07-30 15:42:15.0', 100, 'beanshell:R_ACT_ACUM_MONTO_PAG_REPO_IVSS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000253, NULL, '2011-01-17 10:08:00.0', 100, 'U004', 'U', 'H', 'INCE PATRONAL', 'Y', 'R_INCE_PATRONAL', 'S', 'resul=0.0; 
Double mount = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption8","Y",_Payroll);
String sContract = getHR_Payroll().getHR_Contract().getValue();

if (getConcept("CC_APLICAR_CONCEPTO")==1.0 &&  !"Utilidades".equals(sContract) ){
 result= (getAttribute("C_FACTOR_INCE_PATRONAL")/100)* mount;  
     
}', '2012-08-07 10:00:31.0', 100, 'beanshell:R_INCE_PATRONAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000252, NULL, '2011-01-17 09:58:11.0', 100, 'R004', 'U', 'H', 'INCE TRABAJADOR', 'Y', 'R_INCE_TRABAJADOR', 'S', '

result=0.0; 
String sContract = getHR_Payroll().getHR_Contract().getValue();

if (!"Liquidacion".equals(sContract)|| ("Liquidacion".equals(sContract) && getConcept("CC_POR_LIQUIDAR")==1.0) ){
     if ("Liquidacion".equals(sContract)) 
         result=getConcept("CC_UTILIDADES_FRACCIONADAS") * (getAttribute("C_FACTOR_INCE_TRABAJADOR")/100);
     else
         result= (getConcept("CC_ANTIC_UTILIDADES_LOTTT_132") + getConcept("CC_UTILIDADES_LOTTT_132")) * (getAttribute("C_FACTOR_INCE_TRABAJADOR")/100); 
         

}
', '2012-08-07 09:55:45.0', 100, 'beanshell:R_INCE_TRABAJADOR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000251, NULL, '2011-01-17 09:15:55.0', 100, NULL, 'U', 'H', NULL, 'Y', 'R_PRESTAMO_REMOD_VIVI_LIQUIDAC', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();

if ("Liquidacion".equals(sContract)){

     result= LVE_Payroll.PaymentOfQuotaLiquidation(get_TrxName(), getAD_Org_ID() , _C_BPartner_ID , "HI" , new Date  (_To.getYear(), _To.getMonth(), _To.getDay()), _Process );
}', '2011-02-18 10:10:00.0', 100, 'beanshell:R_PRESTAMO_REMOD_VIVI_LIQUIDAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000222, NULL, '2010-12-29 11:22:00.0', 100, 'W006', 'U', 'H', NULL, 'Y', 'R_CIERRE_ANTICIP_UTIL_CONT_UTI', 'S', 'String msg=null; 
result =1.0;

if (getAttribute("A_MONTO_ACUM_ANTICIPO_UTILIDADES")>0) {
   msg = LVE_Payroll.addValueConcept("A_MONTO_ACUM_ANTICIPO_UTILIDADES",process,new BigDecimal(0),_C_BPartner_ID);
   if (msg != null)
       result=0;
}


', '2011-05-19 09:43:50.0', 100, 'beanshell:R_CIERRE_ANTICIP_UTIL_CONT_UTI')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000239, NULL, '2011-01-13 08:11:09.0', 100, 'A100-4', 'U', 'H', NULL, 'Y', 'R_DIAS_REPOSO_IVSS', 'S', 'result = 0;

String sQuery = "SELECT lve_daysnotice(?,?,?,?,?)";
int daysnotice = DB.getSQLValue(get_TrxName(), sQuery, new Object[]  {getAD_Client_ID(), _C_BPartner_ID, _From, _To, "A_DIAS_REPOSO"});
boolean bPay100restingAttri = getAttribute("A_PAGAR_100%_REPOSO") == 1.0;
boolean bPay100restingConst = getAttribute("C_PAGAR_100%_REPOSO") == 1.0;

if (!bPay100restingAttri && bPay100restingConst && daysnotice > 0)
{
  Double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
  long daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");

  if (daysnotice > 0 && daysrestclient <  daysnotice)
  {
        description = "Días de Reposo IVSS: " + (daysnotice - daysrestclient - daysPaid);
        result = daysnotice - daysrestclient - daysPaid;
  }
}', '2011-02-14 08:56:41.0', 100, 'beanshell:R_DIAS_REPOSO_IVSS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000267, NULL, '2011-05-02 08:37:07.0', 100, 'Y071-HORAS', 'U', 'H', NULL, 'Y', 'R_HORAS_JORNADA_TRABAJADOR', 'S', 'String workDay = getAttributeString("A_JORNADA_LABORAL");

result = ("D".equals(workDay)?getAttribute("C_HORAS_JORNADA_DIURNA"):
             ("N".equals(workDay)?getAttribute("C_HORAS_JORNADA_NOCTURNA"):
             getAttribute("C_HORAS_JORNADA_MIXTA")));

', '2011-05-17 11:03:12.0', 100, 'beanshell:R_HORAS_JORNADA_TRABAJADOR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000202, NULL, '2010-12-13 09:36:22.0', 100, 'V004', 'U', 'H', NULL, 'Y', 'R_MONTO_BONO_ALIMENTACION', 'S', 'result=0.0; 

if (getConcept("CC_CANCELAR_BONO_ALIMENTACION")==1.0 && getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= getAttribute("C_VALOR_BONO_ALIMENTARIO")* LVE_Payroll.tributaryUnit(get_TrxName(),getAD_Org_ID(), _From ,  _To)*    
                  getConcept("CC_DIAS_BONO_ALIMENTACION");
}', '2011-05-23 13:51:22.0', 100, 'beanshell:R_MONTO_BONO_ALIMENTACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000009, NULL, '2010-10-11 17:08:24.0', 100, 'Q002', 'U', 'H', NULL, 'Y', 'R_SUELDO_HORA', 'S', 'String jornada = getConceptString("A_JORNADA_LABORAL");

if (jornada == null)
  jornada = "D";  /* Default Diurna */

double sueldo = getConcept("CC_SUELDO_MENSUAL");

double horas = getAttribute("C_HORAS_JORNADA_DIURNA");

if ("N".equals(jornada)) /* Nocturna */
  horas = getAttribute("C_HORAS_JORNADA_NOCTURNA");

if ("M".equals(jornada))  /* Mixta */
  horas = getAttribute("C_HORAS_JORNADA_MIXTA");

description = "Horas jornada " + jornada + "=" + horas;

result =  horas>0 ?  (sueldo / getAttribute("C_DIAS_DEL_MES")) / horas : 0.0;', '2011-01-31 11:06:20.0', 100, 'beanshell:R_SUELDO_HORA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000140, NULL, '2010-12-06 14:24:19.0', 100, 'B104', 'U', 'H', NULL, 'Y', 'R_BONO_CUMPLEAÑOS', 'S', 'result = 0.0;
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
}', '2011-06-21 11:43:03.0', 100, 'beanshell:R_BONO_CUMPLEAÑOS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000226, NULL, '2011-01-10 08:14:38.0', 100, 'W026', 'U', 'H', NULL, 'Y', 'R_ACT_FEC_ULTI_BONO_POST_VAC_P', 'S', 'Double value1= getConcept( "CC_BONO_POST_VACACIONAL");
result=0.0; 

if (value1>0){
     result=1.0;
     msg = LVE_Payroll.addValueDateConcept("A_FECHA_ULTIMO_BONO_POST_VACACIONAL_PAG",process,_To, _C_BPartner_ID);
     if (msg != null)	
        result=0.0;
}', '2011-05-19 09:16:43.0', 100, 'beanshell:R_ACT_FEC_ULTI_BONO_POST_VAC_P')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000217, NULL, '2010-12-27 13:23:29.0', 100, 'A100-1', 'U', 'H', NULL, 'Y', 'R_MONTO_REPOSO_EMPRESA', 'S', 'result = 0;

Double days = getConcept("CC_DIAS_REPOSO_EMPRESA");


if (days > 0 && getConcept("CC_APLICA")==1.0)
{
  if (getAttribute("C_PAGAR_100%_REPOSO") == 0.0 && getAttribute("A_PAGAR_100%_REPOSO") == 0.0)
  {
    Double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
    Double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");
    Double percentclient = getAttribute("C_PORCENTAJE_PAGAR_POR_REPOSO_EMPRESA");
    if (daysPaid < daysrestclient)
       days = (daysrestclient - daysPaid) + ((days - daysrestclient - daysPaid) * percentclient / 100);
    else
       days = days * percentclient / 100;
  }
  description = "Días de Reposo por Cuenta de la Empresa: " + days;
  result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}
   ', '2011-06-21 11:45:16.0', 100, 'beanshell:R_MONTO_REPOSO_EMPRESA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000077, NULL, '2010-11-17 10:05:05.0', 100, 'Y061', 'U', 'H', NULL, 'Y', 'R_FEC_ULT_MES_PROC', 'S', 'long oneDay = 86400000;
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

', '2011-06-08 10:49:22.0', 100, 'beanshell:R_FEC_ULT_MES_PROC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000109, NULL, '2010-11-25 15:48:23.0', 100, 'Y032', 'U', 'H', NULL, 'Y', 'R_DIAS_DE_SUELDO_PENDIENTE', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();
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

', '2012-07-26 16:45:41.0', 100, 'beanshell:R_DIAS_DE_SUELDO_PENDIENTE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000074, NULL, '2010-11-10 08:22:04.0', 100, 'U003', 'U', 'H', 'Ley Régimen Prestacional de Vivienda y Hábitat (Patronal)', 'Y', 'R_LEY_REG_PREST_VIV_HAB_PA', 'S', 'result = 0.0;
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
}', '2012-08-08 11:57:39.0', 100, 'beanshell:R_LEY_REG_PREST_VIV_HAB_PA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000240, NULL, '2011-01-13 08:12:06.0', 100, 'A100-3', 'U', 'H', NULL, 'Y', 'R_DIAS_REPOSO_EMPRESA', 'S', 'result = 0;
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
}', '2011-05-19 11:41:44.0', 100, 'beanshell:R_DIAS_REPOSO_EMPRESA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000133, NULL, '2010-12-06 10:30:57.0', 100, 'Q013', 'U', 'H', NULL, 'Y', 'R_SALARIO_ESTIMADO_UTILIDADES', 'S', '
String sContract = getHR_Payroll().getHR_Contract().getValue();
Timestamp nextPayroll= LVE_Payroll.nextPayroll(get_TrxName(), _Payroll, "Utilidades", _To, _C_BPartner_ID);
Timestamp lastPayroll= LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(),_C_BPartner_ID, getAD_Org_ID(), _Payroll,  true);
result= 0.0;

if( "S".equals(getAttributeString("C_APLICAR_UTILIDADES_SOBRE_DEVENG_ANUAL")) && (nextPayroll!=null && lastPayroll!=null) && (nextPayroll.getTime() > lastPayroll.getTime()) && !"Prestaciones".equals(sContract) ){
 
       GregorianCalendar t1 = new GregorianCalendar(nextPayroll.getYear(),nextPayroll.getMonth(),nextPayroll.getDay());
       GregorianCalendar t2 = new GregorianCalendar(lastPayroll.getYear(),lastPayroll.getMonth(),lastPayroll.getDay());

      result= (t2.get(Calendar.DAY_OF_YEAR) - t1.get(Calendar.DAY_OF_YEAR))* (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES")); 
     
}
', '2011-02-03 15:31:05.0', 100, 'beanshell:R_SALARIO_ESTIMADO_UTILIDADES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000259, NULL, '2011-02-17 14:29:20.0', 100, 'B031', 'U', 'H', NULL, 'Y', 'R_PRESTAMO_COMPRA_VIVIENDA', 'S', '
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "HB", _From, _To ).doubleValue();

', '2011-02-17 15:36:21.0', 100, 'beanshell:R_PRESTAMO_COMPRA_VIVIENDA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000261, NULL, '2011-02-17 15:06:36.0', 100, 'B032', 'U', 'H', NULL, 'Y', 'R_PRESTAMO_PERSONALES', 'S', '
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "P1", _From, _To ).doubleValue();

', '2011-02-17 15:36:26.0', 100, 'beanshell:R_PRESTAMO_PERSONALES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000262, NULL, '2011-02-17 15:07:43.0', 100, 'B033', 'U', 'H', NULL, 'Y', 'R_PRESTAMO_REMODELACION_VIVIEN', 'S', '
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "HI", _From, _To ).doubleValue();

', '2011-02-17 15:36:32.0', 100, 'beanshell:R_PRESTAMO_REMODELACION_VIVIEN')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000258, NULL, '2011-02-17 14:28:39.0', 100, 'B030', 'U', 'H', ' ', 'Y', 'R_PRESTAMO_ESTUDIO', 'S', '
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "S1", _From, _To ).doubleValue();

', '2011-02-17 15:59:27.0', 100, 'beanshell:R_PRESTAMO_ESTUDIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000072, NULL, '2010-11-10 08:07:35.0', 100, 'U001', 'U', 'H', 'Seguro Social Obligatorio (Patronal)', 'Y', 'R_SEGURO_SOCIAL_OBLIGATORIO_PA', 'S', 'String sContrato = getHR_Payroll().getHR_Contract().getValue();
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
     

 

', '2011-03-21 14:53:53.0', 100, 'beanshell:R_SEGURO_SOCIAL_OBLIGATORIO_PA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000260, NULL, '2011-02-17 14:32:44.0', 100, 'B034', 'U', 'H', NULL, 'Y', 'R_PRESTAMO_OTROS', 'S', '
result= LVE_Payroll.AllocationOfLoan(get_TrxName(), getAD_Org_ID(),_C_BPartner_ID, "OT", _From, _To ).doubleValue();

', '2011-02-17 15:36:37.0', 100, 'beanshell:R_PRESTAMO_OTROS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000224, NULL, '2010-12-29 13:19:24.0', 100, 'W007', 'U', 'H', NULL, 'Y', 'R_CIERRE_DIAS_VAC_BONO_VAC_CAU', 'S', 'long oneDay = 86400000;
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
}', '2011-06-30 08:55:42.0', 100, 'beanshell:R_CIERRE_DIAS_VAC_BONO_VAC_CAU')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000265, NULL, '2011-03-30 14:08:57.0', 100, 'A100-1.1', 'U', 'H', NULL, 'Y', 'R_MONTO_REPOSO_EMPRESA_DED', 'S', 'result = 0;

Double days = getConcept("CC_DIAS_REPOSO_EMPRESA");

if (days > 0 && getConcept("CC_APLICA")==1.0)
{
    Double daysPaid = getConcept("CC_DIAS_REPOSO_PAGADO_EMPRESA");
    Double daysrestclient = getAttribute("C_DIAS_REPOSO_PAGAR_POR_CUENTA_EMPRESA");
    if (daysPaid < daysrestclient)
       days = (daysrestclient - daysPaid) + (days - daysrestclient - daysPaid);
    
    description = "Días de Reposo por Cuenta de la Empresa: " + days;
    result = days * (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
}
   ', '2011-06-21 11:45:41.0', 100, 'beanshell:R_MONTO_REPOSO_EMPRESA_DED')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000231, NULL, '2011-01-10 15:36:17.0', 100, 'W015', 'U', 'H', NULL, 'Y', 'R_ACT_MONT_DISPONI_INTERES_PRE', 'S', 'result=1.0;
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
}', '2011-06-10 08:49:11.0', 100, 'beanshell:R_ACT_MONT_DISPONI_INTERES_PRE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000144, NULL, '2010-12-06 14:58:45.0', 100, 'Q011', 'U', 'H', NULL, 'Y', 'R_BASE_INTERES_PRESTA_SOCIALES', 'S', 'result=0.0;

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
', '2011-06-03 09:41:01.0', 100, 'beanshell:R_BASE_INTERES_PRESTA_SOCIALES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000266, NULL, '2011-04-14 09:35:02.0', 100, 'V001-1', 'U', 'H', NULL, 'Y', 'R_DIAS_GARANTIA_PRESTACIONES', 'S', '
result= getAttribute("C_VALOR_ANUAL_PRESTACIONES_SOCIALES") / 12 * 3; 
', '2012-07-30 10:46:38.0', 100, 'beanshell:R_DIAS_GARANTIA_PRESTACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000232, NULL, '2011-01-10 15:41:17.0', 100, 'W014', 'U', 'H', NULL, 'Y', 'R_ACT_MONT_DISP_PREST_CIERRE_P', 'S', 'result=1.0;
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
}', '2012-07-30 11:09:02.0', 100, 'beanshell:R_ACT_MONT_DISP_PREST_CIERRE_P')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000270, NULL, '2011-05-26 15:43:31.0', 100, 'A104', 'U', 'H', NULL, 'Y', 'R_DESCANSO_TRABAJADO', 'S', 'result = 0.0;

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
}
', '2011-06-21 11:16:30.0', 100, 'beanshell:R_DESCANSO_TRABAJADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000194, NULL, '2010-12-08 10:57:01.0', 100, 'U008', 'U', 'H', NULL, 'Y', 'R_PROVISION_MENSUAL_VACACIONES', 'S', 'result=0.0; 

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0) {

     Double value = (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES")>=2) 
                  ? ( ( getConcept("CC_DIAS_BASE_DISFRUTE_VACAC") + (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES")-1)) / 12 ) 
                  : ( getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")/12 ) ; 
     result= value * getConcept("CC_SUELDO_DIARIO_VAC");

}

', '2011-06-21 11:39:19.0', 100, 'beanshell:R_PROVISION_MENSUAL_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000102, NULL, '2012-08-06 16:02:56.0', 100, 'B200', 'U', 'H', NULL, 'Y', 'R_UTILIDADES_LOTTT_132', 'S', 'result=0.0; 
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

}', '2012-08-08 15:10:52.0', 100, 'beanshell:R_UTILIDADES_LOTTT_132')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000011, NULL, '2010-10-12 10:31:37.0', 100, 'B009', 'U', 'H', NULL, 'Y', 'R_HORAS_EXTRAS_NOCTURNAS', 'S', 'String jornada = getConceptString("A_JORNADA_LABORAL");
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
double horas_nov = getConcept("A_NOV_HORAS_EXTRAS_NOCTURNAS");

if (horas != 0.0)
  description = "Horas Extras=" + horas_nov;
result = horas_nov * sueldo_hora * recargo;', '2011-05-13 11:58:13.0', 100, 'beanshell:R_HORAS_EXTRAS_NOCTURNAS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000083, NULL, '2010-11-18 10:12:12.0', 100, 'Y013', 'U', 'H', NULL, 'Y', 'R_DIAS_BONO_VAC_POR_AÑO', 'S', 'long oneDay = 86400000;
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
}', '2011-06-30 09:26:41.0', 100, 'beanshell:R_DIAS_BONO_VAC_POR_AÑO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000076, NULL, '2010-11-16 16:10:01.0', 100, 'Y067', 'U', 'H', NULL, 'Y', 'R_FEC_FIN_ULT_VAC_DISF', 'S', 'String sQuery = ""
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


', '2012-07-27 14:09:00.0', 100, 'beanshell:R_FEC_FIN_ULT_VAC_DISF')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000005, NULL, '2010-10-11 14:30:36.0', 100, 'A001-LIQUIDACION', 'U', 'H', NULL, 'Y', 'R_SUELDO_EN_LIQUIDACION', 'S', 'result = 0.0;

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

', '2011-06-20 10:32:56.0', 100, 'beanshell:R_SUELDO_EN_LIQUIDACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000114, NULL, '2010-11-29 15:10:12.0', 100, 'Y071', 'U', 'H', NULL, 'Y', 'R_HORAS_BONO_ALIMENTACION', 'S', 'LVE_Payroll NV = new LVE_Payroll();
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
}', '2011-06-07 11:02:11.0', 100, 'beanshell:R_HORAS_BONO_ALIMENTACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000027, NULL, '2010-10-14 11:29:23.0', 100, 'Obtiene la cantidad de lunes dentro del período de nomina ', 'U', 'H', NULL, 'Y', 'R_LUNES_PARA_RETENCIONES', 'S', 'result=0.0;
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
}', '2012-08-07 15:40:08.0', 100, 'beanshell:R_LUNES_PARA_RETENCIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000029, NULL, '2010-10-15 09:57:32.0', 100, 'R002', 'U', 'H', NULL, 'Y', 'R_REGIMEN_PRESTACIONAL_TR', 'S', 'String sContrato = getHR_Payroll().getHR_Contract().getValue();
boolean bCont_Vac = "Vacaciones".equals(sContrato);
double cant_lunes = getConcept("CC_LUNES_PARA_RETENCIONES");
double factor = getAttribute("C_FACTOR_REG_PREST_EMPLEO_TRABAJADOR") / 100;
double base_sueldo_minimo = getAttribute("C_TOPE_SAL_MIN_SEGURO_SOCIAL_OBL") * getAttribute("C_SUELDO_MINIMO");
double sueldo_para_ret = getConcept("CC_SUELDO_PARA_RETENCIONES");
double sueldobase = (base_sueldo_minimo > sueldo_para_ret ? sueldo_para_ret : base_sueldo_minimo);

if ((getConcept("CC_APLICAR_RETENCIONES") == 1) && (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1))

   if ( "S".equals(getConceptString("A_SUELDO_VARIABLE"))  )
        
        result= LVE_Payroll.amountRetention ( _C_BPartner_ID,process ,"CC_REGIMEN_PRESTACIONAL_TR",base_sueldo_minimo,factor, cant_lunes,"CC_LUNES_PARA_RETENCIONES");

  else

   result = ( (sueldobase * 12.0 / 52.0) * factor * cant_lunes );



', '2012-08-07 15:13:32.0', 100, 'beanshell:R_REGIMEN_PRESTACIONAL_TR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000137, NULL, '2010-12-06 13:43:46.0', 100, 'Q006', 'U', 'H', NULL, 'Y', 'R_PORCION_DIARIA_UTIL', 'S', 'result=0.0;
if (getConcept("CC_MESES_TRABAJADOS")>=1 &&  getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")== 1.0){
 
Double days = getAttribute("C_DIAS_DEL_MES");

result= days>0 ?  (getConcept("CC_DIAS_UTILIDADES_POR_MES") / days) * getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD") :0.0 ;

}

', '2012-08-08 14:30:08.0', 100, 'beanshell:R_PORCION_DIARIA_UTIL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000099, NULL, '2010-11-23 08:05:11.0', 100, 'Y040-2', 'U', 'H', NULL, 'Y', 'R_NO_APLICAR_RETENCI_FINAL_MES', 'S', 'import java.lang.Math;

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
', '2012-08-07 15:43:18.0', 100, 'beanshell:R_NO_APLICAR_RETENCI_FINAL_MES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000112, NULL, '2010-11-26 08:35:08.0', 100, 'A001-1', 'U', 'H', NULL, 'Y', 'R_DIAS_EFECTIVOS_TRABAJADOS', 'S', 'int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");

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

', '2011-06-07 13:57:06.0', 100, 'beanshell:R_DIAS_EFECTIVOS_TRABAJADOS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000216, NULL, '2010-12-23 08:24:51.0', 100, 'W001', 'U', 'H', NULL, 'Y', 'R_CIERRE_FECHA_ULTIMO_MES_PROC', 'S', '
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
				', '2011-06-30 08:55:22.0', 100, 'beanshell:R_CIERRE_FECHA_ULTIMO_MES_PROC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000235, NULL, '2011-01-12 08:39:24.0', 100, 'A006', 'U', 'H', NULL, 'Y', 'R_INTERESES_PREST_SOC_MENSUAL', 'S', 'Timestamp To = LVE_Payroll.lastDayOfMonth(_From);
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
}', '2011-06-10 08:48:48.0', 100, 'beanshell:R_INTERESES_PREST_SOC_MENSUAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000238, NULL, '2011-01-12 14:33:33.0', 100, 'W010', 'U', 'H', NULL, 'Y', 'R_CIERRE_DIA_VAC_BONO_VAC_USAD', 'S', 'import org.eevolution.model.*;
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
}', '2011-06-30 08:58:58.0', 100, 'beanshell:R_CIERRE_DIA_VAC_BONO_VAC_USAD')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000221, NULL, '2010-12-29 10:40:20.0', 100, 'W003', 'U', 'H', NULL, 'Y', 'R_CIERRE_ACUM_PREST_SOC_INTERE', 'S', 'Double value1=getConcept("CC_MONTO_INTERESES_PRESTACIONES");
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

', '2012-07-30 10:58:07.0', 100, 'beanshell:R_CIERRE_ACUM_PREST_SOC_INTERE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000225, NULL, '2010-12-29 14:30:22.0', 100, 'W008', 'U', 'H', NULL, 'Y', 'R_CIERRE_DIAS_PRESTACIONES_CAU', 'S', 'result =1.0;
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
}', '2012-07-30 11:39:08.0', 100, 'beanshell:R_CIERRE_DIAS_PRESTACIONES_CAU')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000213, NULL, '2010-12-15 12:53:42.0', 100, 'A409', 'U', 'H', NULL, 'Y', 'R_VACACIONES_FRACCIONADAS_LIQU', 'S', '
result=0.0; 
Timestamp dateEndEmployee = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 
if (!LVE_Payroll.typeEndEmployee (get_TrxName(),getAD_Org_ID(),  _C_BPartner_ID,  "''Mensual'',''Quincenal'',''Semanal''", "JD") && getConcept("CC_POR_LIQUIDAR")==1.0){
     
     Double value1= (getConcept("CC_DIAS_BASE_DISFRUTE_VACAC") + (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES")-1))/12 *(LVE_Payroll.monthsOnPeriod(new Timestamp ((long) getConcept("CC_FEC_ING_CAL_VAC_FRAC")),dateEndEmployee));
     Double value2= (getConcept("CC_DIAS_BASE_DISFRUTE_VACAC")/12)*(LVE_Payroll.monthsOnPeriod(new Timestamp ((long) getConcept("CC_FEC_ING_CAL_VAC_FRAC")),dateEndEmployee));
     Double value3= (getConcept("CC_AÑOS_ANTIGUEDAD_VACACIONES") >= 2 ) ? value1 : value2 ;
     result= getConcept("CC_SUELDO_DIARIO_VAC")* value3; 
}
', '2012-07-30 16:14:02.0', 100, 'beanshell:R_VACACIONES_FRACCIONADAS_LIQU')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000087, NULL, '2010-11-18 15:22:20.0', 100, 'Y056', 'U', 'H', NULL, 'Y', 'R_DIAS_DISPONIBLES_VACACIONES', 'S', 'result = 0.0;

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


result = acumAddDays + acumDays + getConcept("CC_DIAS_VACACIONES_CAUSADAS");', '2011-07-01 10:34:34.0', 100, 'beanshell:R_DIAS_DISPONIBLES_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000243, NULL, '2011-01-13 09:35:38.0', 100, 'W016', 'U', 'H', NULL, 'Y', 'R_ACT_DIAS_DISP_VAC_BON_VAC', 'S', 'result=0.0; 
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
', '2012-08-07 15:48:18.0', 100, 'beanshell:R_ACT_DIAS_DISP_VAC_BON_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000204, NULL, '2010-12-13 10:26:57.0', 100, 'U010', 'U', 'H', NULL, 'Y', 'R_APORTE_FONDO_AHORRO_EMPRESA', 'S', 'result=0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
     result= (getAttribute("C_DIAS_BONO_FIN_AÑO")==1) 
             ? ( getAttribute("C_FACTOR_FONDO_AHORRO_EMPRESARIAL")/100* getConcept("CC_APORTE_FONDO_AHORRO_TRABAJAD")) 
             : (getAttribute("C_FACTOR_FONDO_AHORRO_EMPRESARIAL")/ 100* LVE_Payroll.sumConcept(get_TrxName(), "IsOption_9", _From, _To , _C_BPartner_ID,getHR_Payroll().getHR_Contract().getValue())).doubleValue(); 
}', '2012-07-26 16:47:54.0', 100, 'beanshell:R_APORTE_FONDO_AHORRO_EMPRESA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000002, NULL, '2010-10-11 11:31:16.0', 100, 'Q024', 'U', 'H', NULL, 'Y', 'R_SUELDO_MENSUAL', 'S', 'import org.compiere.model.*;

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

', '2012-01-30 11:30:36.0', 100, 'beanshell:R_SUELDO_MENSUAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000274, NULL, '2011-10-04 15:16:22.0', 100, 'LVE_restart_filters', 'U', 'C', NULL, 'Y', 'LVE_restart_filters', 'S', 'if (A_Tab.getValue("C_BPartner_ID") != null && (A_Tab.getValue("HR_Department_ID") != null || A_Tab.getValue("HR_Job_ID") != null ))
	A_Tab.setValue("C_BPartner_ID",null);

if (A_Tab.getValue("C_BPartner_ID_F1") != null && A_Tab.getValue("HR_Job_ID")==null)
	A_Tab.setValue("C_BPartner_ID_F1_ID",null);

if (A_Tab.getValue("C_BPartner_ID_F2") != null && A_Tab.getValue("HR_Department_ID")==null)
	A_Tab.setValue("C_BPartner_ID_F2_ID",null);

result="";', '2011-10-13 16:26:56.0', 100, 'beanshell:LVE_restart_filters')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000203, NULL, '2010-12-13 10:14:40.0', 100, 'E080', 'U', 'H', NULL, 'Y', 'R_APORTE_FONDO_AHORRO_TRABAJAD', 'S', 'result = 0.0; 

if (getConcept("CC_APLICAR_CONCEPTO")==1.0){
    result= getAttribute("A_FACTOR_FONDO_AHORRO_TRABAJADOR")/100 * 
                 LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption_9","Y",_Payroll);
}

', '2012-07-26 08:05:35.0', 100, 'beanshell:R_APORTE_FONDO_AHORRO_TRABAJAD')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000028, NULL, '2010-10-14 14:30:49.0', 100, 'R001', 'U', 'H', 'Seguro Social Obligatorio (Trabajadores)', 'Y', 'R_SEGURO_SOCIAL_OBLIGATORIO_TR', 'S', 'String sContrato = getHR_Payroll().getHR_Contract().getValue();

boolean bCont_Vac = "Vacaciones".equals(sContrato);
double factor = getAttribute("C_FACTOR_IVSS_TRABAJADOR") / 100;
double base_sueldo_minimo = getAttribute("C_TOPE_SAL_MIN_SEGURO_SOCIAL_OBL") * getAttribute("C_SUELDO_MINIMO");
double sueldo_para_ret = getConcept("CC_SUELDO_PARA_RETENCIONES");
double sueldobase = (base_sueldo_minimo > sueldo_para_ret ? sueldo_para_ret : base_sueldo_minimo);

if ((getConcept("CC_APLICAR_RETENCIONES") == 1) && (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1))
{  
   double cant_lunes  = getConcept("CC_LUNES_PARA_RETENCIONES");
   if ( "S".equals(getConceptString("A_SUELDO_VARIABLE"))  )
        
        result= LVE_Payroll.amountRetention ( _C_BPartner_ID,process ,"CC_SEGURO_SOCIAL_OBLIGATORIO_TR",base_sueldo_minimo,factor, cant_lunes,"CC_LUNES_PARA_RETENCIONES");
  else

         result = (sueldobase * 12.0 / 52.0) * factor * cant_lunes; 
}

', '2012-08-07 15:13:10.0', 100, 'beanshell:R_SEGURO_SOCIAL_OBLIGATORIO_TR')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000084, NULL, '2010-11-18 14:26:44.0', 100, 'Y016', 'U', 'H', NULL, 'Y', 'R_DIAS_VACACIONES_CAUSADAS', 'S', 'result = 0.0;

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
}	     ', '2012-08-08 14:11:23.0', 100, 'beanshell:R_DIAS_VACACIONES_CAUSADAS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000025, NULL, '2010-10-14 10:22:50.0', 100, 'Y004', 'U', 'H', NULL, 'Y', 'R_APLICAR_RETENCIONES', 'S', 'result = 0.0;  /* falso, no aplicar */

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

    ', '2012-08-07 14:49:03.0', 100, 'beanshell:R_APLICAR_RETENCIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000078, NULL, '2010-11-17 11:32:30.0', 100, 'Y017', 'U', 'H', NULL, 'Y', 'R_DIAS_BONO_VAC_CAUSADO', 'S', 'result = 0.0;
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
}', '2012-09-17 15:53:57.0', 100, 'beanshell:R_DIAS_BONO_VAC_CAUSADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000148, NULL, '2010-12-06 16:06:59.0', 100, 'Q031', 'U', 'H', NULL, 'Y', 'R_SALARIO_DIARIO_INTEGRAL', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();

result=0.0;

Double variableSalary = LVE_Payroll.ExecutionOfConcepts(get_TrxName(),process,"isoption9","Y",_Payroll) / getAttribute("C_DIAS_DEL_MES");

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && 
   ( !"Liquidacion".equals(sContract) || ( "Liquidacion".equals(sContract) && getConcept("CC_POR_LIQUIDAR")==1.0 ) ) ) {

    Double value=  getConcept("CC_SUELDO_DIARIO") + variableSalary +
                             getConcept("CC_PORCION_DIARIA_BONO_VAC") +
                             getConcept("CC_PORCION_DIARIA_UTIL") ;

    result= value;
}
', '2012-08-27 11:09:41.0', 1000369, 'beanshell:R_SALARIO_DIARIO_INTEGRAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000193, NULL, '2010-12-08 10:41:15.0', 100, 'U007', 'U', 'H', NULL, 'Y', 'R_PROVISION_MENSUAL_BONO_VAC', 'S', 'result=0.0; 

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0) {

     result = (getConcept("CC_DIAS_BASE_BONO_VAC")+getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC"))/12 * getConcept("CC_SUELDO_DIARIO_VAC") ; 
}

', '2012-04-24 09:28:50.0', 100, 'beanshell:R_PROVISION_MENSUAL_BONO_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000036, NULL, '2010-10-25 15:14:29.0', 0, 'Y014', 'U', 'H', NULL, 'Y', 'R_MESES_TRABAJADOS', 'S', 'result = LVE_Payroll.monthsOnPeriod(_DateStart , _To)

', '2012-04-24 08:55:30.0', 100, 'beanshell:R_MESES_TRABAJADOS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000139, NULL, '2010-12-06 14:19:02.0', 100, 'Q007', 'U', 'H', NULL, 'Y', 'R_PORCION_DIARIA_BONO_VAC', 'S', 'result=0.0;
Double days = getAttribute("C_DIAS_DEL_MES");

if(getConcept("CC_MESES_TRABAJADOS")>=1 && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0){

     Double value = (getConcept("CC_DIAS_BASE_BONO_VAC")+getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC")) / 12;

     Double salary =  getConcept("CC_SUELDO_MENSUAL") / days;

     result= salary > 0 ?  value / days * salary : 0.0;  

}

', '2012-07-31 13:38:06.0', 100, 'beanshell:R_PORCION_DIARIA_BONO_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000091, NULL, '2010-11-19 14:45:05.0', 100, 'Q021', 'U', 'H', 'Salario promedio de los ultimos 3 meses, si el salario del trabajador es variable', 'Y', 'R_PROMEDIO_TRIM_VAC', 'S', 'result = 0;
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

', '2012-08-01 10:24:02.0', 100, 'beanshell:R_PROMEDIO_TRIM_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000054, NULL, '2010-10-29 08:40:54.0', 100, 'Y049', 'U', 'H', NULL, 'Y', 'R_DISFRUTAR_DIAS_ADIC_VAC', 'S', 'if (getAttributeString("C_DISFRUTAR_DIAS_ADICIONALES_VACACIONES").trim().toUpperCase().equals("S") && 
   (getAttributeString("A_DISFRUTAR_DIAS_ADICIONALES_VACACIONES")==null || 
    getAttributeString("A_DISFRUTAR_DIAS_ADICIONALES_VACACIONES").trim().toUpperCase().equals("S"))){
     result=1.0;
}else
     result=0.0;
', '2012-07-26 08:25:38.0', 100, 'beanshell:R_DISFRUTAR_DIAS_ADIC_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000192, NULL, '2010-12-08 09:44:53.0', 100, 'U006', 'U', 'H', NULL, 'Y', 'R_PROVISION_MENSUAL_UTILIDADES', 'S', 'result=0.0; 

if (getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0) {
     result= getConcept("CC_DIAS_UTILIDADES_POR_MES") * getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD"); 
}', '2012-09-17 15:52:35.0', 100, 'beanshell:R_PROVISION_MENSUAL_UTILIDADES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000189, NULL, '2010-12-08 08:58:36.0', 100, 'V001', 'U', 'H', 'Causación de los días correspondiente a la garantía de prestaciones sociales, según los artículos N° 122 y 142; y disposición transitoria 2da', 'Y', 'R_GARANTIA_PREST_SOCIALES', 'S', 'result=0.0;

Timestamp dateBreak = getAttributeDate("C_AÑO_CORTE_ANTIGUEDAD_L_O_T_T_T");
Integer monthDateBreak = LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INGRESO_ANTIGUEDAD")) , dateBreak);
Integer month = 0;

if (monthDateBreak > 3)
    month = LVE_Payroll.monthsOnPeriod(dateBreak , _To);
else
    month = LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INGRESO_ANTIGUEDAD")) , _To);

if (month>=3 && month%3==0 && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI")==1.0 && getConcept("CC_APLICA")==1.0)
   result= getConcept("CC_SALARIO_PARA_PRESTACIONES") / getAttribute("C_DIAS_DEL_MES") * getConcept("CC_DIAS_GARANTIA_PRESTACIONES"); ', '2012-09-17 15:52:49.0', 100, 'beanshell:R_GARANTIA_PREST_SOCIALES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000049, NULL, '2010-10-28 15:19:46.0', 100, 'Y053', 'U', 'H', NULL, 'Y', 'R_FECHA_INGRESO_CALCULO_VACACIONES', 'S', 'Timestamp dateIniEmployee = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Semanal'', ''Quincenal''");
Timestamp dateEndPayroll = _To.clone();

dateIniEmployee.setYear(dateEndPayroll.getYear());	      
result = dateIniEmployee.getTime();

', '2012-07-26 16:46:07.0', 100, 'beanshell:R_FECHA_INGRESO_CAL_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000093, NULL, '2010-11-19 16:10:55.0', 100, 'Q019', 'U', 'H', 'Artículo 121. El salario base para el cálculo de lo que corresponda al trabajador o trabajadora por concepto de vacaciones, será el salario normal devengado en el mes efectivo de labores inmediatamente anterior a la oportunidad del disfrute.  En caso de salario por unidad de obra, por pieza, a destajo o a comisión, será el promedio del salario normal devengado durante los tres meses inmediatamente anteriores a la oportunidad del disfrute.  ', 'Y', 'R_SUELDO_DIARIO_VAC', 'S', 'String sContract = getHR_Payroll().getHR_Contract().getValue();
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
result = value;', '2012-08-01 10:27:29.0', 100, 'beanshell:R_SUELDO_DIARIO_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000157, NULL, '2010-12-07 10:02:05.0', 100, 'A401', 'U', 'H', NULL, 'Y', 'R_PRES_SOC_DIAS_ADIC_FIN_RELAC', 'S', '
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



', '2012-08-08 15:09:09.0', 100, 'beanshell:R_PRES_SOC_DIAS_ADIC_FIN_RELAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000190, NULL, '2010-12-08 09:24:22.0', 100, 'V002', 'U', 'H', NULL, 'Y', 'R_MONTO_PRES_SOC_DIAS_ADIC', 'S', 'result=0.0; 

if (getConcept("CC_APLICA")==1.0)
{
    long oneDay = 86400000;
    Integer month= LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INGRESO_ANTIGUEDAD")),new Timestamp (_To.clone().getTime()-oneDay ));

    Double additionalDays = getConcept("CC_DIAS_ADIC_PRESTACIONES");
    Double topAdditionalDays = getAttribute("C_TOPE_DIAS_ADIC_PRESTACIONES");

    if ( (month%12)==0 && getConcept("CC_AÑOS_ANTIGUEDAD")>1  && getConcept("CC_APLI_PRES_FEC_ULT_PROCESAMI") == 1.0 ) 
         result= (additionalDays > topAdditionalDays ? topAdditionalDays : additionalDays) * getConcept("CC_SALARIO_PARA_PRESTACIONES") / getAttribute("C_DIAS_DEL_MES");
}', '2012-08-08 15:09:33.0', 100, 'beanshell:R_MONTO_PRES_SOC_DIAS_ADIC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000269, NULL, '2011-05-03 08:13:25.0', 100, 'Y071-FROM', 'U', 'H', NULL, 'Y', 'R_FECHA_INICIO', 'S', 'Timestamp From = _From.clone();

Timestamp dtStartEmployee= LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''");

if (From.getTime() > dtStartEmployee.getTime())    
   dtStartEmployee = From;  

result = dtStartEmployee.getTime();', '2011-06-07 11:40:53.0', 100, 'beanshell:R_FECHA_INICIO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000156, NULL, '2010-12-07 09:34:01.0', 100, 'A400', 'U', 'H', NULL, 'Y', 'R_PRESTACIONES_SOCIALES', 'S', 'result=0.0;
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


', '2012-08-08 15:16:42.0', 100, 'beanshell:R_PRESTACIONES_SOCIALES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000214, NULL, '2010-12-15 13:18:40.0', 100, 'A410', 'U', 'H', NULL, 'Y', 'R_BONO_VACACIONAL_FRACCIONADO', 'S', 'result= 0.0;

Timestamp dateEndEmployee = LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''"); 

if (!LVE_Payroll.typeEndEmployee (get_TrxName(),getAD_Org_ID(),  _C_BPartner_ID,  "''Mensual'',''Quincenal'',''Semanal''", "JD") && getConcept("CC_POR_LIQUIDAR")==1.0){

      Integer month= LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FEC_ING_CAL_VAC_FRAC")), dateEndEmployee);
      Double value1= (getConcept("CC_DIAS_BASE_BONO_VAC")+ getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC"))/12*month;
      Double value2= (getConcept("CC_DIAS_BASE_BONO_VAC")/12)* month;
      result= (getConcept("CC_AÑOS_ANTIGUEDAD_BONO_VAC") >= 1 ? value1:value2 )* getConcept("CC_SUELDO_DIARIO_VAC");
} 

', '2012-07-30 16:14:24.0', 100, 'beanshell:R_BONO_VACACIONAL_FRACCIONADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000268, NULL, '2011-05-02 16:09:55.0', 100, 'Y071-TO', 'U', 'H', NULL, 'Y', 'R_FECHA_FIN', 'S', 'Timestamp To = _To;

Timestamp dtEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''"); 

if (dtEndEmployee == null || (dtEndEmployee!=null && To.getTime() < dtEndEmployee.getTime()))    
   dtEndEmployee = To;

result = dtEndEmployee.getTime();
', '2011-05-02 16:15:21.0', 100, 'beanshell:R_FECHA_FIN')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000146, NULL, '2010-12-06 15:22:31.0', 100, 'B107', 'U', 'H', NULL, 'Y', 'R_BONO_POST_VACACIONAL', 'S', 'result = 0.0;

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
', '2012-07-26 16:23:07.0', 100, 'beanshell:R_BONO_POST_VACACIONAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000101, NULL, '2012-08-02 16:03:00.0', 100, 'A413', 'U', 'H', NULL, 'Y', 'R_DESCANSOYFERIADO_VAC_VENC', 'S', 'result= 0.0;
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
}', '2012-08-06 10:48:25.0', 100, 'beanshell:R_DESCANSOYFERIADO_VAC_VENC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000086, NULL, '2010-11-18 15:10:07.0', 100, 'Y037', 'U', 'H', NULL, 'Y', 'R_FEC_FINAL_CORT_TRIM_PAG_VAC', 'S', 'Timestamp lastDate = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''", true);

result= lastDate.getTime();', '2012-07-26 10:17:09.0', 100, 'beanshell:R_FEC_FINAL_CORT_TRIM_PAG_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000030, NULL, '2010-10-15 10:18:05.0', 100, 'Y200', 'U', 'H', NULL, 'Y', 'R_ANTIGUEDAD_SUPERIOR_UN_AÑO', 'S', 'Timestamp dateIni = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''");

if (dateIni == null)    dateIni = new Timestamp(0);

if (LVE_Payroll.yearsElapsed(dateIni, _To.clone())>0)
   result =1.0;
else
   result = 0.0; ', '2011-04-06 11:37:02.0', 100, 'beanshell:R_ANTIGUEDAD_SUPERIOR_UN_AÑO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000256, NULL, '2011-02-08 11:02:40.0', 100, 'A100-G', 'U', 'H', 'Retorna los días de reposo que han sido pagados por cuenta de la empresa en los ultimos "X" días, hasta el día anterior al inicio de la nómina actual; en donde "X" viene dado por lo definido en la constante C_DIAS_CONTINUOS_PARA_PAGAR_NUEVO_REPOSO.', 'Y', 'R_DIAS_REPOSO_PAGADO_EMPRESA', 'S', 'long oneDay = 86400000;
long continuousdays = getAttribute("C_DIAS_CONTINUOS_PARA_PAGAR_NUEVO_REPOSO") ; 
Timestamp From = _From.clone();
Timestamp To = _From.clone();
From.setTime(From.getTime() - (continuousdays * oneDay));
To.setTime(To.getTime() - oneDay);

BigDecimal sumConcept = LVE_Payroll.sumConcept(get_TrxName(), From, To , "CC_DIAS_REPOSO_EMPRESA", _C_BPartner_ID, "''Mensual'',''Quincenal'',''Semanal''");

result = sumConcept == null ? 0 : sumConcept.doubleValue();
', '2012-07-26 16:05:56.0', 100, 'beanshell:R_DIAS_REPOSO_PAGADO_EMPRESA')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000138, NULL, '2010-12-06 13:48:01.0', 100, 'B103', 'U', 'H', NULL, 'Y', 'R_BONO_ASISTENCIA_PUNTUAL', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 &&
    getAttribute("C_MONTO_BONO_ASISTENCIA_PUNTUAL") > 0 &&
    "S".equals(getAttributeString("A_PAGAR_BONO_ASISTENCIA_PUNTUAL")))
{
    double months = LVE_Payroll.periodExecutionContract(get_TrxName(), _C_BPartner_ID, getHR_Payroll().getHR_Contract().getValue(), "D", process) / getAttribute("C_DIAS_DEL_MES");
    result = getAttribute("C_MONTO_BONO_ASISTENCIA_PUNTUAL") * months;
}
', '2012-07-26 16:21:25.0', 100, 'beanshell:R_BONO_ASISTENCIA_PUNTUAL')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000129, NULL, '2010-12-06 09:10:42.0', 100, 'B114', 'U', 'H', NULL, 'Y', 'R_PRIMA_POR_HIJOS', 'S', 'result = 0.0;

if (getConcept("CC_APLICAR_CONCEPTO") == 1.0 && 
    getConcept("CC_APLICAR_ULTIMA_NOMINA_MES") == 1.0 &&
    getConcept("CC_NUMERO_HIJOS_PRIMA") > 0 &&
    getAttribute("C_MONTO_PAGAR_DE_PRIMA_POR_HIJOS") > 0 &&
    "S".equals(getAttributeString("A_PAGAR_PRIMA_POR_HIJO")))
{
   double months = LVE_Payroll.periodExecutionContract(get_TrxName(), _C_BPartner_ID, getHR_Payroll().getHR_Contract().getValue(), "D", process) / getAttribute("C_DIAS_DEL_MES");
   result = getAttribute("C_MONTO_PAGAR_DE_PRIMA_POR_HIJOS") * getConcept("CC_NUMERO_HIJOS_PRIMA") * months;
}', '2012-07-26 16:26:40.0', 100, 'beanshell:R_PRIMA_POR_HIJOS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000108, NULL, '2010-11-25 09:51:10.0', 100, 'Y027', 'U', 'H', NULL, 'Y', 'R_APLICAR_CAL_AÑO_INIC_OPERACI', 'S', '
result=0.0;

Timestamp dateNextPayroll= LVE_Payroll.nextPayroll(get_TrxName(), _Payroll, getHR_Payroll().getHR_Contract().getValue(), _To, _C_BPartner_ID);

if( (dateNextPayroll !=null) && ( getAttribute("C_AÑO_INICIO_OPERACIONES") == dateNextPayroll.getYear() ) ){
   result=1.0;
} 
', '2012-07-26 16:44:54.0', 100, 'beanshell:R_APLICAR_CAL_AÑO_INIC_OPERACI')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000163, NULL, '2010-12-07 11:43:35.0', 100, 'A407', 'U', 'H', NULL, 'Y', 'R_UTILIDADES_FRACCIONADAS', 'S', '
result=0.0; 

if(getConcept("CC_POR_LIQUIDAR")==1.0){
    Timestamp dateEndEmployee= LVE_Payroll.DateEndEmployee(get_TrxName(),_C_BPartner_ID,getAD_Org_ID(),"''Mensual'',''Quincenal'',''Semanal''");
    Double days = getConcept("CC_DIAS_UTILIDADES_POR_MES") * 
                            LVE_Payroll.monthsOnPeriod(new Timestamp((long)getConcept("CC_FECHA_INICIO_UTIL_FRAC")), dateEndEmployee);
    result= days * getConcept("CC_SUELDO_DIARIO_PARA_UTILIDAD");

}', '2012-08-01 11:10:25.0', 100, 'beanshell:R_UTILIDADES_FRACCIONADAS')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000075, NULL, '2010-11-10 10:51:43.0', 100, 'Y026', 'U', 'H', NULL, 'Y', 'R_FECHA_INICIO_UTIL_FRAC', 'S', 'long oneDay = 86400000;  
Timestamp dateIniEmployee = LVE_Payroll.DateInitialEmployee(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Mensual'',''Quincenal'',''Semanal''");
Timestamp dateAfterLastPayroll = LVE_Payroll.lastDateOfProcessGenerated(get_TrxName(), _C_BPartner_ID, getAD_Org_ID(), "''Utilidades''", true);

dateReturn = dateIniEmployee;

if (dateAfterLastPayroll != null)
{
  dateAfterLastPayroll.setTime(dateAfterLastPayroll.getTime()+oneDay);

  dateReturn = dateIniEmployee.getTime() > dateAfterLastPayroll.getTime() ? dateIniEmployee : dateAfterLastPayroll; 
}

result = dateReturn.getTime();', '2011-06-30 08:57:36.0', 100, 'beanshell:R_FECHA_INICIO_UTIL_FRAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000246, NULL, '2011-01-13 15:20:37.0', 100, 'B111', 'U', 'H', NULL, 'Y', 'R_RETROACTIVO_SUELDO', 'S', '

result=0.0;
Timestamp From= _From.clone();
Timestamp To= _To.clone();
String sContract = getHR_Payroll().getHR_Contract().getValue();

Boolean valor= org.compiere.util.TimeUtil.isValid(From,To,(Timestamp)  getAttributeDate("C_FECHA_PAGO_RETROACTIVO"));
 
if(valor && ("Quincenal".equals(sContract) || "Semanal".equals(sContract) ) &&  getConcept("CC_APLICAR_CONCEPTO")==1.0){
     Double valor= getAttribute("A_RETROACTIVO_INICIAL_SUELDO");

    result = valor >0 ? valor :  LVE_Payroll. retroactiveValue (get_TrxName(),  _C_BPartner_ID ,  _Department , From, To) ; 

//(LVE_Payroll.monthsOnPeriod(From, To) * getConcept("CC_SUELDO") - LVE_Payroll.generatedValue (get_TrxName() ,_C_BPartner_ID,"CC_SUELDO",  //getAD_Org_ID(), (Timestamp)  getAttributeDate("C_FECHA_INICIO_RETROACTIVO"), (Timestamp)  getAttributeDate("C_FECHA_FIN_RETROACTIVO") ) );

}', '2012-07-26 16:25:24.0', 100, 'beanshell:R_RETROACTIVO_SUELDO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000048, NULL, '2010-10-27 14:39:32.0', 100, 'Y010', 'U', 'H', ' ', 'Y', 'R_BASE_%_CALCULO_INTERES_PREST', 'S', 'Timestamp dFecUltCalcPres;
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
   result=0.0;', '2012-07-26 16:41:21.0', 100, 'beanshell:R_BASE_%_CALCULO_INTERES_PREST')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000150, NULL, '2010-12-06 16:29:06.0', 100, 'Q023', 'U', 'H', NULL, 'Y', 'R_MONTO_BASE_PARA_LRPVH', 'S', 'result=0.0;
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
', '2012-07-26 16:38:33.0', 100, 'beanshell:R_MONTO_BASE_PARA_LRPVH')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000113, NULL, '2010-11-26 08:42:17.0', 100, 'Y028', 'U', 'H', NULL, 'Y', 'R_CANCELAR_BONO_ALIMENTACION', 'S', 'import org.eevolution.model.*;
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
  result=1.0;', '2012-07-26 16:45:21.0', 100, 'beanshell:R_CANCELAR_BONO_ALIMENTACION')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000212, NULL, '2010-12-15 11:16:45.0', 100, 'A406', 'U', 'H', 'Art 80 LOTTT  ..Se considerará despido indirecto: a) La exigencia que haga el patrono o la patrona al trabajador o trabajadora para que realice un trabajo de índole manifiestamente distinta de aquel al que está obligado por Decreto 8.938 Pág. 38 el contrato o por la Ley, o que sea incompatible con la dignidad y capacidad profesional del trabajador o trabajadora, o de que preste sus servicios en condiciones que acarreen un cambio de su residencia, salvo que en el contrato se haya convenido lo contrario o la naturaleza del trabajo, implique cambios sucesivos de residencia para el trabajador o trabajadora, o que el cambio sea justificado y no acarree perjuicio a éste. b) La reducción del salario. c) El traslado del trabajador o trabajadora a un puesto inferior. d) El cambio arbitrario del horario de trabajo. e) Otros hechos semejantes que alteren las condiciones existentes de trabajo. En todos estos casos el trabajador o la trabajadora tendrá derecho a recibir, además de sus prestaciones sociales, un
monto equivalente a éstas por concepto de indemnización.
', 'Y', 'R_INDEMNIZACION_DESPIDO_INJUST', 'S', '
result = getConcept("CC_PRESTACIONES_SOCIALES");
', '2012-08-01 11:21:55.0', 100, 'beanshell:R_INDEMNIZACION_DESPIDO_INJUST')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000023, NULL, '2010-10-13 16:06:10.0', 100, 'A002', 'U', 'H', NULL, 'Y', 'R_DIAS_DESCANSO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {
long oneDay = 86400000;
int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
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
description = "Días de descanso del periodo: " + (restdays);
} 
', '2012-09-17 15:48:59.0', 100, 'beanshell:R_DIAS_DESCANSO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000229, NULL, '2011-01-10 11:06:39.0', 100, 'W019', 'U', 'H', NULL, 'Y', 'R_CIERRE_FEC_ANUAL_VACACIONES', 'S', 'long oneDay = 86400000;

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
}', '2012-09-17 15:53:14.0', 100, 'beanshell:R_CIERRE_FEC_ANUAL_VACACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000123, NULL, '2010-12-02 15:20:21.0', 100, 'Q004', 'U', 'H', 'Salario Para Prestaciones Mensual - Art 122:  El salario base para el cálculo de lo que corresponda al trabajador y trabajadora por concepto de prestaciones sociales, y de indemnizaciones por motivo de la terminación de la relación de trabajo, será el último salario devengado, calculado de manera que integre todos los conceptos salariales percibidos por el trabajador o trabajadora. 
En caso de salario por unidad de obra, por pieza, a destajo, a comisión o de cualquier otra modalidad de salario variable, la base para el cálculo será el promedio del salario devengado durante los seis meses inmediatamente anteriores, calculado de manera que integre todos los conceptos salariales percibidos por el trabajador o trabajadora.', 'Y', 'R_SALARIO_PARA_PRESTACIONES', 'S', 'result=0.0; 
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
}', '2012-09-17 15:50:20.0', 100, 'beanshell:R_SALARIO_PARA_PRESTACIONES')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000069, NULL, '2010-11-08 15:14:39.0', 100, 'Y080', 'U', 'H', NULL, 'Y', 'R_APLI_PRES_FEC_ULT_PROCESAMI', 'S', 'String contract=  getHR_Payroll().getHR_Contract().getValue();

if (    ("Prestaciones".equals(contract) &&  _To.getTime() <=  getAttributeDate("A_FECHA_FIN_ULTIMO_MES_PROC",_To).getTime()) || ! "Prestaciones".equals(contract)){
     result=1.0;
}else{
    result=0.0;
}', '2012-09-17 15:54:20.0', 100, 'beanshell:R_APLI_PRES_FEC_ULT_PROCESAMI')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000151, NULL, '2010-12-06 16:30:39.0', 100, 'B109', 'U', 'H', NULL, 'Y', 'R_BONO_VEHICULO_MOTO', 'S', 'result = 0.0;

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

', '2012-09-13 15:10:13.0', 100, 'beanshell:R_BONO_VEHICULO_MOTO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000272, NULL, '2011-06-20 09:16:03.0', 100, 'A001', 'U', 'H', NULL, 'Y', 'R_SUELDO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sContract = getHR_Payroll().getHR_Contract().getValue();
int dayrest = (int)getAttribute("C_DIA_SEMANA_DESCANSO");
double monthdays = (int)getAttribute("C_DIAS_DEL_MES");
double valueReturn = 0;
double dedDays = getConcept("CC_DEDUCIR_DIAS_EGRESO")  + getConcept("CC_DEDUCIR_DIAS_INGRESO");

description = "Días deducir: " + dedDays;
if (!"Vacaciones".equals(sContract) && !"Liquidacion".equals(sContract)) 
{
    switch (sContract)
    {
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
}', '2012-09-17 15:48:36.0', 100, 'beanshell:R_SUELDO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000271, NULL, '2011-05-26 15:56:36.0', 100, 'A105', 'U', 'H', NULL, 'Y', 'R_FERIADO_TRABAJADO', 'S', 'result = 0.0;

if (getConcept("CC_APLICA")==1.0) {

String sueldo_variable = getConceptString("A_SUELDO_VARIABLE");

if (sueldo_variable == null)
  sueldo_variable = "N";

double sueldo_diario;
if (sueldo_variable.equals("S")) {
   sueldo_diario = getConcept("CC_SUELDO_DIARIO_VARIABLE");
  } else {
    sueldo_diario = (getConcept("CC_SUELDO_MENSUAL") / getAttribute("C_DIAS_DEL_MES"));
  }
double dias_desc_trab = getConcept("CC_DIAS_FERIADO_TRABAJADO");
result = sueldo_diario * dias_desc_trab;
}
', '2012-09-17 15:49:26.0', 100, 'beanshell:R_FERIADO_TRABAJADO')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000136, NULL, '2010-12-06 11:20:15.0', 100, 'Q008', 'U', 'H', 'Salario del mes anterior + promedio de los elementos salariales variables + porción de bono vacacional', 'Y', 'R_SUELDO_DIARIO_PARA_UTILIDAD', 'S', 'result=0.0; 
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

result= ((salaryAccum + (salaryVariable / divisor)) / getAttribute("C_DIAS_DEL_MES")) + getConcept("CC_PORCION_DIARIA_BONO_VAC");', '2012-09-17 15:50:41.0', 100, 'beanshell:R_SUELDO_DIARIO_PARA_UTILIDAD')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000090, NULL, '2010-11-19 14:17:23.0', 100, 'Q020', 'U', 'H', NULL, 'Y', 'R_SUELDO_MES_ANTERIOR_VAC', 'S', 'result = 0.0;
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
}', '2012-09-17 15:51:13.0', 100, 'beanshell:R_SUELDO_MES_ANTERIOR_VAC')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 1000106, NULL, '2010-11-24 15:25:05.0', 100, 'Q035', 'U', 'H', NULL, 'Y', 'R_SUELDO_MENSUAL_VARIABLE', 'S', 'import org.eevolution.model.*;
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

result = salary;', '2012-09-17 15:51:33.0', 100, 'beanshell:R_SUELDO_MENSUAL_VARIABLE')
;
INSERT INTO ADEMPIERE.AD_RULE(ad_client_id, ad_org_id, ad_rule_id, accesslevel, created, createdby, description, entitytype, eventtype, help, isactive, name, ruletype, script, updated, updatedby, value)
  VALUES(@ad_client_id, 0, 2000033, NULL, '2010-10-15 11:01:54.0', 100, 'R003', 'U', 'H', 'Ley Régimen Prestacional de Vivienda y Hábitat (Trabajador)', 'Y', 'R_LEY_REG_PREST_VIV_HAB', 'S', '
String sContrato = getHR_Payroll().getHR_Contract().getValue();

boolean bCont_Vac = "Vacaciones".equals(sContrato);
double factor = getAttribute("C_FACTOR_REG_PREST_VIVIENDA_H_TRABAJADOR");


if (getConcept("CC_APLICAR_RETENCIONES_LRPVH") == 1.0 && 
   (bCont_Vac || getConcept("CC_APLICAR_CONCEPTO") == 1.0)){
   
   result = getConcept("CC_MONTO_BASE_PARA_LRPVH") * factor / 100;
}', '2012-09-17 15:51:46.0', 100, 'beanshell:R_LEY_REG_PREST_VIV_HAB');

COMMIT;

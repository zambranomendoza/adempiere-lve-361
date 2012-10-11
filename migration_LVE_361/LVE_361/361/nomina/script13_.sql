/*

Descripción: Consultas asociadas a la configuración contable de nómina
Desarrollado por: Ing. Jenny Cecilia Rodriguez - Double Click Sistemas, C.A.

Instrucciones:
- Reemplazar:
    @ad_client_id por el id de la compañía
    @AD_Org_ID por el id de la organización
    @cuentaGasto por el id de la combinación contable de la Cuenta de gasto de empleados 
    @cuentaPagoAnt por el id de la combinación contable de la Cuenta de pago anticipado de empleados
- Ejecutar los scripts

*/

-- Crear un nuevo valor de la lista de la referencia C_DocType para los documentos de CXP de nómina
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,CreatedBy,Updated,UpdatedBy,Created,AD_Org_ID,IsActive,AD_Client_ID) 
VALUES ((SELECT MAX(AD_Ref_List_ID) + 1 FROM AD_Ref_List),183,'DCS','AHR','AP Invoice of Payroll',100,now(),100,now(),0,'Y',0)
GO
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy 
FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=
(SELECT ad_ref_list_id FROM ad_ref_list WHERE name = 'AP Invoice of Payroll' and value = 'AHR') 
AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
GO
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='CxP de Nómina',Updated=now(),UpdatedBy=100 WHERE AD_Language='es_VE' AND 
AD_Ref_List_ID =(select ad_ref_list_id  from ad_ref_list where name = 'AP Invoice of Payroll' and value = 'AHR' order by ad_ref_list_id desc limit 1 offset 0)
GO 
--Crear tipo de documento CxP de Nómina
INSERT INTO C_DocType (AD_Client_ID,AD_Org_ID,AD_PrintFormat_ID,C_DocType_ID,Created,CreatedBy,DocBaseType,DocumentCopies,GenerateWithholding,GL_Category_ID,HasCharges,HasProforma,IsActive,IsCreateCounter,IsDefault,IsDefaultCounterDoc,IsDocNoControlled,IsIndexed,IsInTransit,IsOverwriteDateOnComplete,IsOverwriteSeqOnComplete,IsPickQAConfirm,IsPrepareSplitDocument,IsShipConfirm,IsSOTrx,IsSplitWhenDifference,Name,PrintName,Updated,UpdatedBy) 
VALUES (@AD_Client_ID,0,null,(select max(C_DocType_ID) + 1 from C_DocType),now(),100,'AHR',1,'N',(select GL_Category_id from GL_Category where name = 'AP Invoice' and categorytype= 'D' and ad_client_id=@AD_Client_ID),'N','N','Y','Y','N','N','Y','Y','N','N','N','N','Y','N','N','N','CxP de Nómina','CxP de Nómina',now(),100)
GO
--Configurar las combinaciones contables correspondientes a la cuenta de gastos y a la de pago de anticipo de los empleados
UPDATE C_BP_Employee_Acct 
SET E_Expense_Acct=@cuentaGasto
WHERE C_AcctSchema_ID=@cuentaPagoAnt AND 
C_BPartner_ID in 
              (select c_bpartner_id 
                 from c_bpartner 
                where isemployee = 'Y' and isactive = 'Y' and c_bpartner_id in (select c_bpartner_id from ad_user where isinpayroll = 'Y'))
GO


--Crear los cargos que afectan las CxP de nómina
--Sueldos y Salarios
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) 
VALUES ('N','N',(select C_TaxCategory_ID from C_TaxCategory where name = 'EXENTO'),0,
(select max(c_charge_id)+1 from c_charge),'N','Sueldos y Salarios',@AD_Org_ID,100,'Y',now(),100,now(),@AD_Client_ID)
GO
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy 
FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' 
AND t.C_Charge_ID=(select c_charge_id from c_charge where name = 'Sueldos y Salarios') 
AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
GO
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) 
SELECT (select c_charge_id from c_charge where name = 'Sueldos y Salarios'), p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=@AD_Client_ID 
AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID 
AND e.C_Charge_ID=(select c_charge_id from c_charge where name = 'Sueldos y Salarios'))
GO

--Retención de Seguro Social
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) 
VALUES ('N','N',(select C_TaxCategory_ID from C_TaxCategory where name = 'EXENTO'),0,
(select max(c_charge_id)+1 from c_charge),'N','Retención de Seguro Social',@AD_Org_ID,100,'Y',now(),100,now(),@AD_Client_ID)
GO
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy 
FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' 
AND t.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de Seguro Social') 
AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
GO
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) 
SELECT (select c_charge_id from c_charge where name = 'Retención de Seguro Social'), p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=@AD_Client_ID 
AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID 
AND e.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de Seguro Social'))
GO

--Retención de LPH
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) 
VALUES ('N','N',(select C_TaxCategory_ID from C_TaxCategory where name = 'EXENTO'),0,
(select max(c_charge_id)+1 from c_charge),'N','Retención de LPH',@AD_Org_ID,100,'Y',now(),100,now(),@AD_Client_ID)
GO
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy 
FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' 
AND t.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de LPH') 
AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
GO
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) 
SELECT (select c_charge_id from c_charge where name = 'Retención de LPH'), p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=@AD_Client_ID 
AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID 
AND e.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de LPH'))
GO

--Retención de ISLR
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) 
VALUES ('N','N',(select C_TaxCategory_ID from C_TaxCategory where name = 'EXENTO'),0,
(select max(c_charge_id)+1 from c_charge),'N','Retención de ISLR',@AD_Org_ID,100,'Y',now(),100,now(),@AD_Client_ID)
GO
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy 
FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' 
AND t.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de ISLR') 
AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
GO
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) 
SELECT (select c_charge_id from c_charge where name = 'Retención de ISLR'), p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=@AD_Client_ID 
AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID 
AND e.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de ISLR'))
GO

--Retención de INCES
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) 
VALUES ('N','N',(select C_TaxCategory_ID from C_TaxCategory where name = 'EXENTO'),0,
(select max(c_charge_id)+1 from c_charge),'N','Retención de INCES',@AD_Org_ID,100,'Y',now(),100,now(),@AD_Client_ID)
GO
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy 
FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' 
AND t.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de INCES') 
AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
GO
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) 
SELECT (select c_charge_id from c_charge where name = 'Retención de INCES'), p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct 
FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=@AD_Client_ID 
AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID 
AND e.C_Charge_ID=(select c_charge_id from c_charge where name = 'Retención de INCES'))
GO

-- Asociar el Cargo de Sueldos y Salarios a los conceptos
update hr_concept set c_charge_id = (select c_charge_id from c_charge where name = 'Sueldos y Salarios') 
where description in 
('A002','A107','A104','A105','A003','B101','B113','B102','B106','B112','B114','E073','B110','E030','E031','E032','E033','E034','E050',
'E076','E100','A005','A100-2','B030','B031','B032','B033','B034','B103','B104','E010','A100-1','A103','A104','A105','A106','A110',
'B111','D100','E070','E071','A100-1.1','A111','E060','E072','E075','E077','E078','E090','A101','A001','B008','B009','B100','B105',
'B107','B108','B109','E074','D101','E011','E020') and type = 'E' and ispaid = 'Y'
go 
-- Asociar el Cargo de Retención de Seguro Social a los conceptos
update hr_concept set c_charge_id = (select c_charge_id from c_charge where name = 'Retención de Seguro Social') 
where description in ('R001','R002') and type = 'E' and ispaid = 'Y'
go
-- Asociar el Cargo de Retención de Retención de LPH a los conceptos
update hr_concept set c_charge_id = (select c_charge_id from c_charge where name = 'Retención de LPH') 
where description in ('R003') and type = 'E' and ispaid = 'Y'
go
-- Asociar el Cargo de Retención de ISLR a los conceptos
update hr_concept set c_charge_id = (select c_charge_id from c_charge where name = 'Retención de ISLR') 
where description in ('R005') and type = 'E' and ispaid = 'Y'
go
-- Asociar el Cargo de Retención de INCES a los conceptos
update hr_concept set c_charge_id = (select c_charge_id from c_charge where name = 'Retención de INCES')  
where description in ('R004') and type = 'E' and ispaid = 'Y'
go



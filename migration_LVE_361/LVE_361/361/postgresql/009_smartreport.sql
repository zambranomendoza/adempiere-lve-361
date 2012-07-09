
-- 27/06/2012 04:24:00 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Reference (AD_Client_ID,AD_Org_ID,AD_Reference_ID,Created,CreatedBy,EntityType,IsActive,IsOrderByValue,Name,Updated,UpdatedBy,ValidationType) VALUES (0,0,(SELECT MAX(AD_Reference_ID)+1 FROM AD_Reference),CURRENT_TIMESTAMP,100,'DCS','Y','N','PA_Report smj_ReportLine ',CURRENT_TIMESTAMP,100,'L')
;

-- 27/06/2012 04:24:00 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=(SELECT MAX(AD_Reference_ID) FROM AD_Reference) AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 27/06/2012 04:27:56 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,(SELECT MAX(AD_Reference_ID) FROM AD_Reference),(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Underlined Descriptions',CURRENT_TIMESTAMP,100,'D')
;

-- 27/06/2012 04:27:56 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:28:04 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Descripción Subrayada',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:28:28 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,(SELECT MAX(AD_Reference_ID) FROM AD_Reference),(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Line',CURRENT_TIMESTAMP,100,'L')
;

-- 27/06/2012 04:28:28 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:28:34 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Línea',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:28:55 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,(SELECT MAX(AD_Reference_ID) FROM AD_Reference),(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Centered Title',CURRENT_TIMESTAMP,100,'T')
;

-- 27/06/2012 04:28:55 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:29:13 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Título Centrado',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:29:34 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,(SELECT MAX(AD_Reference_ID) FROM AD_Reference),(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Blank Line',CURRENT_TIMESTAMP,100,'S')
;

-- 27/06/2012 04:29:34 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:29:43 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Línea en Blanco',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:30:06 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,(SELECT MAX(AD_Reference_ID) FROM AD_Reference),(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Total Line',CURRENT_TIMESTAMP,100,'X')
;

-- 27/06/2012 04:30:06 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:30:17 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Línea de Total',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:30:43 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,(SELECT MAX(AD_Reference_ID) FROM AD_Reference),(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Doble Line for Total',CURRENT_TIMESTAMP,100,'Z')
;

-- 27/06/2012 04:30:43 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:30:56 PM VET
-- Lista de validación que despliega los valores para nuevos tipos de lineas en los reportes financieros
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Línea Doble para Total',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:40:08 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 FROM AD_Element),0,'smj_ReportLine',CURRENT_TIMESTAMP,100,'DCS','Y','Report Line','Report Line',CURRENT_TIMESTAMP,100)
;

-- 27/06/2012 04:40:08 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2012 04:40:26 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Línea de Reporte',PrintName='Línea de Reporte',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND AD_Language='es_VE'
;

-- 27/06/2012 04:41:40 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,17,(SELECT MAX(AD_Reference_ID) FROM AD_Reference),448,'smj_ReportLine',CURRENT_TIMESTAMP,100,'DCS',2,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Report Line',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 04:41:40 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/06/2012 08:02:31 AM VET
-- Modificar ventana Report Line Set
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Column_ID) FROM AD_Column),(SELECT MAX(AD_Field_ID)+1 FROM AD_Field),0,376,CURRENT_TIMESTAMP,100,2,'DCS','Y','Y','Y','N','N','N','N','N','Report Line',CURRENT_TIMESTAMP,100)
;

-- 28/06/2012 08:02:31 AM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/06/2012 08:07:49 AM VET
-- Modificar ventana Report Line Set
UPDATE AD_Field SET DisplayLogic='@LineType@=L',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field)
;

-- 28/06/2012 08:08:14 AM VET
-- Modificar ventana Report Line Set
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Línea de Reporte',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND AD_Language='es_VE'
;

-- 27/06/2012 04:53:34 PM VET
-- Adicionar campos a la tabla "T_Report "
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,10,544,'smj_ReportLine',CURRENT_TIMESTAMP,100,'DCS',2,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Report Line',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 04:53:34 PM VET
-- Adicionar campos a la tabla "T_Report "
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/06/2012 04:33:12 PM VET
-- Agregar dos nuevos valores al campo tipo de linea
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,241,(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Tabbed Text',CURRENT_TIMESTAMP,100,'H')
;

-- 27/06/2012 04:33:12 PM VET
-- Agregar dos nuevos valores al campo tipo de linea
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:33:21 PM VET
-- Agregar dos nuevos valores al campo tipo de linea
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Texto Tabulado',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:33:49 PM VET
-- Agregar dos nuevos valores al campo tipo de linea
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,241,(SELECT MAX(AD_Ref_List_ID)+1 FROM AD_Ref_List),CURRENT_TIMESTAMP,100,'DCS','Y','Customized Line',CURRENT_TIMESTAMP,100,'L')
;

-- 27/06/2012 04:33:49 PM VET
-- Agregar dos nuevos valores al campo tipo de linea
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2012 04:34:02 PM VET
-- Agregar dos nuevos valores al campo tipo de linea
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Línea Personalizada',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Ref_List_ID=(SELECT MAX(AD_Ref_List_ID) FROM AD_Ref_List) AND AD_Language='es_VE'
;

-- 27/06/2012 04:37:05 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 FROM AD_Element),0,'smj_HierarchyLevel',CURRENT_TIMESTAMP,100,'DCS','Y','Tab Level','Tab Level ',CURRENT_TIMESTAMP,100)
;

-- 27/06/2012 04:37:05 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2012 04:37:18 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nivel de Tabulador ',PrintName='Nivel de Tabulador ',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND AD_Language='es_VE'
;

-- 27/06/2012 04:38:13 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,11,448,'smj_HierarchyLevel',CURRENT_TIMESTAMP,100,'DCS',1,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Tab Level',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 04:38:13 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;


-- 28/06/2012 08:02:31 AM VET
-- Modificar ventana Report Line Set
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Column_ID) FROM AD_Column),(SELECT MAX(AD_Field_ID)+1 FROM AD_Field),0,376,CURRENT_TIMESTAMP,100,1,'DCS','Y','Y','Y','N','N','N','N','N','Tab Level',CURRENT_TIMESTAMP,100)
;

-- 28/06/2012 08:02:31 AM VET
-- Modificar ventana Report Line Set
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/06/2012 08:06:28 AM VET
-- Modificar ventana Report Line Set
UPDATE AD_Field SET DisplayLogic='@LineType@=H',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field)
;

-- 28/06/2012 08:07:25 AM VET
-- Modificar ventana Report Line Set
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Nivel de Tabulador',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND AD_Language='es_VE'
;

-- 27/06/2012 04:51:29 PM VET
-- Adicionar campos a la tabla "T_Report "
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,11,544,'smj_HierarchyLevel',CURRENT_TIMESTAMP,100,'DCS',1,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Tab Level',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 04:51:29 PM VET
-- Adicionar campos a la tabla "T_Report "
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/06/2012 04:45:18 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 FROM AD_Element),0,'smj_FixedPercentage',CURRENT_TIMESTAMP,100,'DCS','Y','Fixed Percentage','Fixed Percentage',CURRENT_TIMESTAMP,100)
;

-- 27/06/2012 04:45:18 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2012 04:45:39 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Porcentaje Fijo',PrintName='Porcentaje Fijo',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND AD_Language='es_VE'
;

-- 27/06/2012 04:46:21 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,11,448,'smj_FixedPercentage',CURRENT_TIMESTAMP,100,'0','DCS',2,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Fixed Percentage',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 04:46:21 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/06/2012 08:02:31 AM VET
-- Modificar ventana Report Line Set
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Column_ID) FROM AD_Column),(SELECT MAX(AD_Field_ID)+1 FROM AD_Field),0,376,CURRENT_TIMESTAMP,100,2,'DCS','Y','Y','Y','N','N','N','N','N','Fixed Percentage',CURRENT_TIMESTAMP,100)
;

-- 28/06/2012 08:02:31 AM VET
-- Modificar ventana Report Line Set
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/06/2012 08:08:40 AM VET
-- Modificar ventana Report Line Set
UPDATE AD_Field SET DisplayLogic='@CalculationType@=P',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field)
;

-- 28/06/2012 08:09:12 AM VET
-- Modificar ventana Report Line Set
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Porcentaje Fijo',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND AD_Language='es_VE'
;

-- 27/06/2012 04:54:15 PM VET
-- Adicionar campos a la tabla "T_Report "
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,DefaultValue,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,11,544,'smj_FixedPercentage',CURRENT_TIMESTAMP,100,'0','DCS',2,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Fixed Percentage',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 04:54:15 PM VET
-- Adicionar campos a la tabla "T_Report "
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/06/2012 04:47:14 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
ALTER TABLE PA_ReportLine ADD COLUMN smj_HierarchyLevel NUMERIC(10) DEFAULT NULL 
;

-- 27/06/2012 04:48:22 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
ALTER TABLE PA_ReportLine ADD COLUMN smj_ReportLine VARCHAR(2) DEFAULT NULL 
;

-- 27/06/2012 04:48:29 PM VET
-- Adicionar campos a la tabla "PA_ReportLine"
ALTER TABLE PA_ReportLine ADD COLUMN smj_FixedPercentage NUMERIC(10) DEFAULT '0' 
;

-- 27/06/2012 04:54:23 PM VET
-- Adicionar campos a la tabla "T_Report "
ALTER TABLE T_Report ADD COLUMN smj_HierarchyLevel NUMERIC(10) DEFAULT NULL 
;

-- 27/06/2012 04:54:32 PM VET
-- Adicionar campos a la tabla "T_Report "
ALTER TABLE T_Report ADD COLUMN smj_ReportLine VARCHAR(2) DEFAULT NULL 
;

-- 27/06/2012 04:54:39 PM VET
-- Adicionar campos a la tabla "T_Report "
ALTER TABLE T_Report ADD COLUMN smj_FixedPercentage NUMERIC(10) DEFAULT '0' 
;

-- 27/06/2012 05:15:33 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 FROM AD_Element),0,'smj_prePeriodName',CURRENT_TIMESTAMP,100,'DCS','Y','Prefix Text for Period ','Prefix Text for Period ',CURRENT_TIMESTAMP,100)
;

-- 27/06/2012 05:15:33 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2012 05:15:57 PM VET
-- Adicionar campos a la tabla "PA_Report  "
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Texto de Prefijo para Periodo',PrintName='Texto de Prefijo para Periodo',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND AD_Language='es_VE'
;

-- 27/06/2012 05:16:31 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,10,445,'smj_prePeriodName',CURRENT_TIMESTAMP,100,'DCS',20,'Y','Y','N','N','N','N','N','N','N','Y','N','N','Y','Prefix Text for Period ',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 05:16:31 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/06/2012 08:10:57 AM VET
-- Modificar ventana Financial Report
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Column_ID) FROM AD_Column),(SELECT MAX(AD_Field_ID)+1 FROM AD_Field),0,372,CURRENT_TIMESTAMP,100,20,'DCS','Y','Y','Y','N','N','N','N','N','Prefix Text for Period ',CURRENT_TIMESTAMP,100)
;

-- 28/06/2012 08:10:57 AM VET
-- Modificar ventana Financial Report
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;


-- 28/06/2012 08:12:18 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Texto de Prefijo para Periodo',Description='Texto de Prefijo para Periodo',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND AD_Language='es_VE'
;

-- 28/06/2012 08:11:26 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=57034
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=54234
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=6268
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field)
;

-- 27/06/2012 05:17:09 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 FROM AD_Element),0,'smj_posPeriodName',CURRENT_TIMESTAMP,100,'DCS','Y','Suffix Text for Period ','Suffix Text for Period ',CURRENT_TIMESTAMP,100)
;

-- 27/06/2012 05:17:09 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2012 05:17:24 PM VET
-- Adicionar campos a la tabla "PA_Report  "
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Texto de Sufijo para Periodo',PrintName='Texto de Sufijo para Periodo',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM AD_Element) AND AD_Language='es_VE'
;

-- 27/06/2012 05:17:48 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,(SELECT MAX(AD_Column_ID)+1 FROM AD_Column),(SELECT MAX(AD_Element_ID) FROM AD_Element),0,10,445,'smj_posPeriodName',CURRENT_TIMESTAMP,100,'DCS',20,'Y','Y','N','N','N','N','N','N','N','Y','N','N','Y','Suffix Text for Period ',0,CURRENT_TIMESTAMP,100,0)
;

-- 27/06/2012 05:17:48 PM VET
-- Adicionar campos a la tabla "PA_Report  "
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM AD_Column) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/06/2012 08:10:57 AM VET
-- Modificar ventana Financial Report
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Column_ID) FROM AD_Column),(SELECT MAX(AD_Field_ID)+1 FROM AD_Field),0,372,CURRENT_TIMESTAMP,100,20,'DCS','Y','Y','Y','N','N','N','N','N','Suffix Text for Period ',CURRENT_TIMESTAMP,100)
;

-- 28/06/2012 08:10:57 AM VET
-- Modificar ventana Financial Report
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/06/2012 08:12:48 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Texto de Sufijo para Periodo',Description='Texto de Sufijo para Periodo',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field) AND AD_Language='es_VE'
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field)
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=6267
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=4737
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=6265
;

-- 28/06/2012 08:11:27 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=54235
;

-- 28/06/2012 08:11:49 AM VET
-- Modificar ventana Financial Report
UPDATE AD_Field SET IsSameLine='Y',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=(SELECT MAX(AD_Field_ID) FROM AD_Field)
;

-- 27/06/2012 05:17:55 PM VET
-- Adicionar campos a la tabla "PA_Report  "
ALTER TABLE PA_Report ADD COLUMN smj_prePeriodName VARCHAR(20) DEFAULT NULL 
;

-- 27/06/2012 05:18:03 PM VET
-- Adicionar campos a la tabla "PA_Report  "
ALTER TABLE PA_Report ADD COLUMN smj_posPeriodName VARCHAR(20) DEFAULT NULL 
;


-- 28/06/2012 08:15:04 AM VET
-- Modificar el proceso "FinReport "
UPDATE AD_Process SET Classname='com.smj.process.SmjReport',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Process_ID=202
;

INSERT INTO LVE_SqlScript
(LVE_SqlScript_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Date1,
LastScript,ScriptUser) VALUES
((select case when max(LVE_SqlScript_ID) is null then 1000000 else max(LVE_SqlScript_ID)+1 end from LVE_SqlScript),0,0,'Y',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,
'009_smartreport.sql',
'Edickson Martinez')
;


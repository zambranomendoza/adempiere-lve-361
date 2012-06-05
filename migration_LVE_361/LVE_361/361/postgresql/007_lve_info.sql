begin;
-- 22-may-2012 9:07:07 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Window (AD_Client_ID,AD_Org_ID,AD_Window_ID,Created,CreatedBy,EntityType,IsActive,IsBetaFunctionality,IsDefault,IsSOTrx,
Name,Processing,Updated,UpdatedBy,WindowType) VALUES (0,0,(SELECT MAX(AD_Window_ID)+1 FROM AD_Window ),
CURRENT_TIMESTAMP,100,'DCS','Y','N','N','Y','LVE Info','N',CURRENT_TIMESTAMP,100,'M')
;

-- 22-may-2012 9:07:07 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Window_Trl (AD_Language,AD_Window_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) 
SELECT l.AD_Language,t.AD_Window_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy 
FROM AD_Language l, AD_Window t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Window_ID=(SELECT MAX(AD_Window_ID) FROM AD_Window )
 AND NOT EXISTS (SELECT * FROM AD_Window_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Window_ID=t.AD_Window_ID)
;



INSERT INTO adempiere.AD_Window_Access(ad_window_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_window_id)from ad_window ), 50002, 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y');
INSERT INTO adempiere.AD_Window_Access(ad_window_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_window_id) from ad_window ), 0, 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y');
INSERT INTO adempiere.AD_Window_Access(ad_window_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_window_id) from ad_window ), 102, 11, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y');
INSERT INTO adempiere.AD_Window_Access(ad_window_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_window_id) from ad_window ), 103, 11, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y');
INSERT INTO adempiere.AD_Window_Access(ad_window_id, ad_role_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, isreadwrite)
  VALUES((select max(ad_window_id) from ad_window ), 50001, 0, 0, 'Y', CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP, 0, 'Y');

-- 22-may-2012 9:07:12 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,AD_Client_ID,IsActive,AD_Org_ID,Updated,CreatedBy,UpdatedBy,AD_Table_ID,Created,ImportTable,IsHighVolume,IsView,IsChangeLog,EntityType,IsDeleteable,ReplicationType,TableName,Name) VALUES ('N','4',0,'Y',0,CURRENT_TIMESTAMP,100,100,(SELECT MAX(AD_Table_ID)+1 FROM  AD_Table ),CURRENT_TIMESTAMP,'N','N','N','N','DCS','N','L','LVE_Info','LVE_Info')
;

-- 22-may-2012 9:07:12 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=(SELECT MAX(AD_Table_ID) FROM  AD_Table ) AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 22-may-2012 9:07:12 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Sequence (AD_Client_ID,AD_Org_ID,AD_Sequence_ID,Created,CreatedBy,CurrentNext,CurrentNextSys,Description,IncrementNo,IsActive,IsAudited,IsAutoSequence,IsTableID,Name,StartNewYear,StartNo,Updated,UpdatedBy) VALUES (0,0,(SELECT MAX(AD_Sequence_ID)+1 FROM  AD_Sequence ),CURRENT_TIMESTAMP,100,1000000,50000,'Table LVE_Info',1,'Y','N','Y','Y','LVE_Info','N',1000000,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:12 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 FROM  AD_Element ) ,0,'LVE_Info_ID',CURRENT_TIMESTAMP,100,'DCS','Y','LVE_Info','LVE_Info',CURRENT_TIMESTAMP,100)
;


-- 22-may-2012 9:07:12 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) FROM  AD_Element ) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;


-- 22-may-2012 9:07:13 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'N',0,0,'Y',10,'N',13,'Y',CURRENT_TIMESTAMP,'Y',(SELECT MAX(AD_Element_ID)FROM  AD_Element ),100,'N','N','N','LVE_Info_ID','LVE_Info')
;

-- 22-may-2012 9:07:13 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:13 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
CREATE TABLE LVE_Info (LVE_Info_ID NUMERIC(10) NOT NULL, CONSTRAINT LVE_Info_Key PRIMARY KEY (LVE_Info_ID))
;

-- 22-may-2012 9:07:13 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,AD_Val_Rule_ID,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ('@#AD_Client_ID@',(SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',0,0,'Y',10,'N',19,'Y',CURRENT_TIMESTAMP,129,'N',102,100,'N','N','N','AD_Client_ID','Client/Tenant for this installation.','Client')
;

-- 22-may-2012 9:07:13 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:13 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN AD_Client_ID NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:14 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,AD_Val_Rule_ID,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ('@#AD_Org_ID@',(SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',0,0,'Y',10,'N',19,'Y',CURRENT_TIMESTAMP,104,'N',113,100,'N','N','N','AD_Org_ID','Organizational entity within client','Organization')
;

-- 22-may-2012 9:07:14 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:14 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN AD_Org_ID NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:14 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'The Created field indicates the date that this record was created.','N',0,0,'Y',7,'N',16,'Y',CURRENT_TIMESTAMP,'N',245,100,'N','N','N','Created','Date this record was created','Created')
;

-- 22-may-2012 9:07:14 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:14 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN Created TIMESTAMP NOT NULL
;

-- 22-may-2012 9:07:15 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,110,'Y','N','N',100,CURRENT_TIMESTAMP,'The Created By field indicates the user who created this record.','N',0,0,'Y',10,'N',18,'Y',CURRENT_TIMESTAMP,'N',246,100,'N','N','N','CreatedBy','User who created this records','Created By')
;

-- 22-may-2012 9:07:15 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:15 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN CreatedBy NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:15 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ('Y',(SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',0,0,'Y',1,'N',20,'Y',CURRENT_TIMESTAMP,'N',348,100,'N','Y','N','IsActive','The record is active in the system','Active')
;

-- 22-may-2012 9:07:15 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:15 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL
;

-- 22-may-2012 9:07:16 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'The Updated field indicates the date that this record was updated.','N',0,0,'Y',7,'N',16,'Y',CURRENT_TIMESTAMP,'N',607,100,'N','N','N','Updated','Date this record was updated','Updated')
;

-- 22-may-2012 9:07:16 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:16 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN Updated TIMESTAMP NOT NULL
;

-- 22-may-2012 9:07:16 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,110,'Y','N','N',100,CURRENT_TIMESTAMP,'The Updated By field indicates the user who updated this record.','N',0,0,'Y',10,'N',18,'Y',CURRENT_TIMESTAMP,'N',608,100,'N','N','N','UpdatedBy','User who updated this records','Updated By')
;

-- 22-may-2012 9:07:16 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:16 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN UpdatedBy NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:17 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'Name','N',0,0,'Y',60,'Y',10,'Y',CURRENT_TIMESTAMP,'N',469,100,'N','N','N','Name','Name','Name')
;

-- 22-may-2012 9:07:17 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:17 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN Name VARCHAR(60) DEFAULT NULL 
;

-- 22-may-2012 9:07:17 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'N',0,0,'Y',120,'N',10,'Y',CURRENT_TIMESTAMP,'N',1943,100,'N','N','N','LocationComment','Additional comments or remarks concerning the location','Location comment')
;

-- 22-may-2012 9:07:17 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:17 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN LocationComment VARCHAR(120) DEFAULT NULL 
;

-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 from AD_Element ),0,'Web',CURRENT_TIMESTAMP,100,'DCS','Y','Web','Web',CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) from AD_Element ) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;


-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'N',0,0,'Y',60,'N',10,'Y',CURRENT_TIMESTAMP,'N',(SELECT MAX(AD_Element_ID) from AD_Element ),100,'N','N','N','Web','Web')
;

-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN Web VARCHAR(60) DEFAULT NULL 
;

-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'N',0,0,'Y',60,'Y',10,'Y',CURRENT_TIMESTAMP,'N',1839,100,'N','N','N','ContactName','Business Partner Contact Name','Contact Name')
;

-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:18 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN ContactName VARCHAR(60) DEFAULT NULL 
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'The Phone field identifies a telephone number','N',0,0,'Y',40,'N',10,'Y',CURRENT_TIMESTAMP,'N',505,100,'N','N','N','Phone','Identifies a telephone number','Phone')
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN Phone VARCHAR(40) DEFAULT NULL 
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'The 2nd Phone field identifies an alternate telephone number.','N',0,0,'Y',40,'N',10,'Y',CURRENT_TIMESTAMP,'N',506,100,'N','N','N','Phone2','Identifies an alternate telephone number.','2nd Phone')
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN Phone2 VARCHAR(40) DEFAULT NULL 
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'The Fax identifies a facsimile number for this Business Partner or  Location','N',0,0,'Y',40,'N',10,'Y',CURRENT_TIMESTAMP,'N',301,100,'N','N','N','Fax','Facsimile number','Fax')
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:19 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN Fax VARCHAR(40) DEFAULT NULL 
;

-- 22-may-2012 9:07:20 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((SELECT MAX(AD_Column_ID)+1 FROM  AD_Column ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'The Email Address is the Electronic Mail ID for this User and should be fully qualified (e.g. joe.smith@company.com). The Email Address is used to access the self service application functionality from the web.','N',0,0,'Y',60,'N',10,'Y',CURRENT_TIMESTAMP,'N',881,100,'N','N','N','EMail','Electronic Mail Address','EMail Address')
;

-- 22-may-2012 9:07:20 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(SELECT MAX(AD_Column_ID) FROM  AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:20 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_Info ADD COLUMN EMail VARCHAR(60) DEFAULT NULL 
;

-- 22-may-2012 9:07:21 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Tab (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_Table_ID,AD_Window_ID,CommitWarning,Created,CreatedBy,EntityType,HasTree,IsActive,IsAdvancedTab,IsInfoTab,IsInsertRecord,IsReadOnly,IsSingleRow,IsSortTab,IsTranslationTab,Name,Processing,SeqNo,TabLevel,Updated,UpdatedBy) VALUES (0,0,(SELECT MAX(AD_Tab_ID)+1 FROM  AD_Tab ),(SELECT MAX(AD_Table_ID) FROM  AD_Table ),(SELECT MAX(AD_Window_ID) FROM AD_Window ),NULL,CURRENT_TIMESTAMP,100,'DCS','N','Y','N','N','N','Y','Y','N','N','LVE Info','N',10,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:21 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, CommitWarning,Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.CommitWarning,t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ) AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 22-may-2012 9:07:21 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Client' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Client/Tenant for this installation.',10,'DCS','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','Y','Y','Y','N','N','N','N','Client',10,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:21 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:22 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Organization' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Organizational entity within client',10,'DCS','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','Y','Y','N','N','N','Y','Organization',20,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:22 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:22 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Active' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'The record is active in the system',1,'DCS','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','Y','Y','Y','N','N','N','N','Active',30,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:22 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:22 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_FieldGroup (AD_Client_ID,AD_FieldGroup_ID,AD_Org_ID,Created,CreatedBy,EntityType,FieldGroupType,IsActive,IsCollapsedByDefault,Name,Updated,UpdatedBy) VALUES (0,(select  max (AD_FieldGroup_ID)+1 from AD_FieldGroup ),0,CURRENT_TIMESTAMP,100,'DCS','L','Y','N','Consultant',CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:22 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_FieldGroup_Trl (AD_Language,AD_FieldGroup_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_FieldGroup_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_FieldGroup t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_FieldGroup_ID=(select  max (AD_FieldGroup_ID) from AD_FieldGroup ) AND NOT EXISTS (SELECT * FROM AD_FieldGroup_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_FieldGroup_ID=t.AD_FieldGroup_ID)
;


-- 22-may-2012 9:07:22 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_FieldGroup_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,
SortNo,Updated,UpdatedBy)
 VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Name' ),(select max(AD_FieldGroup_ID) from AD_FieldGroup),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),
 CURRENT_TIMESTAMP,100,'Name',60,'DCS','Name','Y','Y','Y','N','N','N','N','Name',40,0,
 CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Location comment' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Additional comments or remarks concerning the location',120,'DCS','Y','Y','Y','N','N','N','N','Location comment',50,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Web' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,60,'DCS','Y','Y','Y','N','N','N','Y','Web',60,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Contact Name' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Business Partner Contact Name',60,'DCS','Y','Y','Y','N','N','N','N','Contact Name',70,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:23 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Phone' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Identifies a telephone number',40,'DCS','The Phone field identifies a telephone number','Y','Y','Y','N','N','N','N','Phone',80,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='2nd Phone' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Identifies an alternate telephone number.',40,'DCS','The 2nd Phone field identifies an alternate telephone number.','Y','Y','Y','N','N','N','Y','2nd Phone',90,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy)
 VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Fax' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Facsimile number',40,'DCS','The Fax identifies a facsimile number for this Business Partner or  Location','Y','Y','Y','N','N','N','N','Fax',100,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='EMail Address' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Electronic Mail Address',60,'DCS','The Email Address is the Electronic Mail ID for this User and should be fully qualified (e.g. joe.smith@company.com). The Email Address is used to access the self service application functionality from the web.','Y','Y','Y','N','N','N','Y','EMail Address',110,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='LVE_Info' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,10,'DCS','Y','Y','N','N','N','N','N','LVE_Info',0,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:24 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Table (IsSecurityEnabled,AccessLevel,AD_Client_ID,IsActive,AD_Org_ID,Updated,CreatedBy,UpdatedBy,AD_Table_ID,Created,ImportTable,IsHighVolume,IsView,IsChangeLog,EntityType,IsDeleteable,ReplicationType,TableName,Name) VALUES ('N','4',0,'Y',0,CURRENT_TIMESTAMP,100,100,(select max(ad_table_id)+1 from ad_table ),CURRENT_TIMESTAMP,'N','N','N','N','DCS','N','L','LVE_SqlScript','LVE_SqlScript')
;

-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Table_Trl (AD_Language,AD_Table_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Table_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Table t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Table_ID=(select max(AD_Field_ID) from AD_Field) AND NOT EXISTS (SELECT * FROM AD_Table_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Table_ID=t.AD_Table_ID)
;

-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Sequence (AD_Client_ID,AD_Org_ID,AD_Sequence_ID,Created,CreatedBy,CurrentNext,CurrentNextSys,Description,IncrementNo,IsActive,IsAudited,IsAutoSequence,IsTableID,Name,StartNewYear,StartNo,Updated,UpdatedBy) VALUES (0,0,(SELECT MAX(AD_Sequence_ID)+1 FROM  AD_Sequence ),CURRENT_TIMESTAMP,100,1000000,50000,'Table LVE_SqlScript',1,'Y','N','Y','Y','LVE_SqlScript','N',1000000,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 from AD_Element ),0,'LVE_SqlScript_ID',CURRENT_TIMESTAMP,100,'DCS','Y','LVE_SqlScript','LVE_SqlScript',CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) from AD_Element ) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;


-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'N',0,0,'Y',10,'N',13,'Y',CURRENT_TIMESTAMP,'Y',(SELECT MAX(AD_Element_ID) from AD_Element ),100,'N','N','N','LVE_SqlScript_ID','LVE_SqlScript')
;

-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:25 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
CREATE TABLE LVE_SqlScript (LVE_SqlScript_ID NUMERIC(10) NOT NULL, CONSTRAINT LVE_SqlScript_Key PRIMARY KEY (LVE_SqlScript_ID))
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,AD_Val_Rule_ID,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ('@#AD_Client_ID@',(select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','N',0,0,'Y',10,'N',19,'Y',CURRENT_TIMESTAMP,129,'N',102,100,'N','N','N','AD_Client_ID','Client/Tenant for this installation.','Client')
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN AD_Client_ID NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,AD_Val_Rule_ID,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ('@#AD_Org_ID@',(select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','N',0,0,'Y',10,'N',19,'Y',CURRENT_TIMESTAMP,104,'N',113,100,'N','N','N','AD_Org_ID','Organizational entity within client','Organization')
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN AD_Org_ID NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'The Created field indicates the date that this record was created.','N',0,0,'Y',7,'N',16,'Y',CURRENT_TIMESTAMP,'N',245,100,'N','N','N','Created','Date this record was created','Created')
;

-- 22-may-2012 9:07:26 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:27 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN Created TIMESTAMP NOT NULL
;

-- 22-may-2012 9:07:27 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,110,'Y','N','N',100,CURRENT_TIMESTAMP,'The Created By field indicates the user who created this record.','N',0,0,'Y',10,'N',18,'Y',CURRENT_TIMESTAMP,'N',246,100,'N','N','N','CreatedBy','User who created this records','Created By')
;

-- 22-may-2012 9:07:27 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:27 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN CreatedBy NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:27 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (DefaultValue,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ('Y',(select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','N',0,0,'Y',1,'N',20,'Y',CURRENT_TIMESTAMP,'N',348,100,'N','Y','N','IsActive','The record is active in the system','Active')
;

-- 22-may-2012 9:07:27 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:27 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN IsActive CHAR(1) DEFAULT 'Y' CHECK (IsActive IN ('Y','N')) NOT NULL
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'Y','N','N',100,CURRENT_TIMESTAMP,'The Updated field indicates the date that this record was updated.','N',0,0,'Y',7,'N',16,'Y',CURRENT_TIMESTAMP,'N',607,100,'N','N','N','Updated','Date this record was updated','Updated')
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN Updated TIMESTAMP NOT NULL
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,110,'Y','N','N',100,CURRENT_TIMESTAMP,'The Updated By field indicates the user who updated this record.','N',0,0,'Y',10,'N',18,'Y',CURRENT_TIMESTAMP,'N',608,100,'N','N','N','UpdatedBy','User who updated this records','Updated By')
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN UpdatedBy NUMERIC(10) NOT NULL
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 from AD_Element ),0,'LastScript',CURRENT_TIMESTAMP,100,'DCS','Y','LastScript','Last Script SQL',CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:28 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) from AD_Element ) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;


-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'N',0,0,'Y',60,'N',10,'Y',CURRENT_TIMESTAMP,'N',(SELECT MAX(AD_Element_ID) from AD_Element ),100,'N','N','N','LastScript','LastScript')
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN LastScript VARCHAR(60) DEFAULT NULL 
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,(SELECT MAX(AD_Element_ID)+1 from AD_Element ),0,'ScriptUser',CURRENT_TIMESTAMP,100,'DCS','Y','Script User','Script User',CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=(SELECT MAX(AD_Element_ID) from AD_Element ) AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'N',0,0,'Y',80,'N',10,'Y',CURRENT_TIMESTAMP,'N',(SELECT MAX(AD_Element_ID) from AD_Element ),100,'N','N','N','ScriptUser','Script User')
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN ScriptUser VARCHAR(80) DEFAULT NULL 
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,CreatedBy,Updated,Help,IsParent,AD_Client_ID,AD_Org_ID,IsActive,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,Created,IsKey,AD_Element_ID,UpdatedBy,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,ColumnName,Description,Name) VALUES ((select max(AD_Column_id)+1 from AD_Column ),(select max(ad_table_id) from ad_table ),'DCS',0,'N','N','N',100,CURRENT_TIMESTAMP,'The Date field identifies a calendar date on which business will not be conducted.','N',0,0,'Y',7,'N',15,'Y',CURRENT_TIMESTAMP,'N',262,100,'N','N','N','Date1','Date when business is not conducted','Date')
;

-- 22-may-2012 9:07:29 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=(select max(AD_Column_id) from AD_Column ) AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22-may-2012 9:07:30 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
ALTER TABLE LVE_SqlScript ADD COLUMN Date1 TIMESTAMP DEFAULT NULL 
;

-- 22-may-2012 9:07:30 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Tab (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_Table_ID,AD_Window_ID,CommitWarning,Created,CreatedBy,EntityType,HasTree,IsActive,IsAdvancedTab,IsInfoTab,IsInsertRecord,IsReadOnly,IsSingleRow,IsSortTab,IsTranslationTab,Name,Processing,SeqNo,TabLevel,Updated,UpdatedBy) VALUES (0,0,(SELECT MAX(AD_Tab_ID)+1 FROM  AD_Tab ),(select max(ad_table_id) from ad_table ),(SELECT MAX(AD_Window_ID) FROM AD_Window ),NULL,CURRENT_TIMESTAMP,100,'DCS','N','Y','N','N','N','Y','N','N','N','LVE Scripts','N',20,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:30 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, CommitWarning,Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.CommitWarning,t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ) AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- 22-may-2012 9:07:30 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Client' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Client/Tenant for this installation.',10,'DCS','A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.','Y','Y','Y','N','N','N','N','Client',10,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:30 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(ad_field_id) from ad_field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:30 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Organization' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Organizational entity within client',10,'DCS','An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.','Y','Y','Y','N','N','N','N','Organization',20,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(ad_field_id) from ad_field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Active' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'The record is active in the system',1,'DCS','There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.','Y','Y','Y','N','N','N','N','Active',30,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(ad_field_id) from ad_field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_FieldGroup (AD_Client_ID,AD_FieldGroup_ID,AD_Org_ID,Created,CreatedBy,EntityType,FieldGroupType,IsActive,IsCollapsedByDefault,Name,Updated,UpdatedBy) VALUES (0,(select  max (AD_FieldGroup_ID)+1 from AD_FieldGroup ),0,CURRENT_TIMESTAMP,100,'DCS','L','Y','N','Last Script',CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_FieldGroup_Trl (AD_Language,AD_FieldGroup_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_FieldGroup_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_FieldGroup t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_FieldGroup_ID=(select max(ad_fieldGroup_id) from AD_fieldGroup) AND NOT EXISTS (SELECT * FROM AD_FieldGroup_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_FieldGroup_ID=t.AD_FieldGroup_ID)
;


-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_FieldGroup_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,
(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='LastScript' ),(select max(AD_FieldGroup_ID) from AD_FieldGroup),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,60,'DCS','Y','Y','Y','N','N','N','N','LastScript',40,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(ad_field_id) from ad_field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Script User' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,80,'DCS','Y','Y','Y','N','N','N','N','Script User',50,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:31 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(ad_field_id) from ad_field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:32 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='Date' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,'Date when business is not conducted',7,'DCS','The Date field identifies a calendar date on which business will not be conducted.','Y','Y','Y','N','N','N','N','Date',60,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:32 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(ad_field_id) from ad_field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:32 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,SeqNo,SortNo,Updated,UpdatedBy) VALUES (0,(select AD_Column_ID from AD_Column where  ad_table_id = (select max (ad_table_id) from ad_table)
 and name='LVE_SqlScript' ),(select max(AD_Field_ID)+1 from AD_Field),0,(SELECT MAX(AD_Tab_ID) FROM  AD_Tab ),CURRENT_TIMESTAMP,100,10,'DCS','Y','Y','N','N','N','N','N','LVE_SqlScript',0,0,CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:32 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=(select max(ad_field_id) from ad_field) AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22-may-2012 9:07:32 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu ("action",AD_Client_ID,AD_Menu_ID,AD_Org_ID,AD_Window_ID,Created,CreatedBy,EntityType,IsActive,IsReadOnly,IsSOTrx,IsSummary,Name,Updated,UpdatedBy) VALUES ('W',0,(select  max (AD_Menu_ID)+1 from AD_Menu ),0,(SELECT MAX(AD_Window_ID) FROM AD_Window ),CURRENT_TIMESTAMP,100,'DCS','Y','N','N','N','LVE Info',CURRENT_TIMESTAMP,100)
;

-- 22-may-2012 9:07:32 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=(select max(ad_menu_id) from ad_menu) AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 22-may-2012 9:07:32 VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_TREENODEMM(AD_Client_ID, AD_Org_ID, CreatedBy, UpdatedBy, Parent_ID, SeqNo, AD_Tree_ID, Node_ID)VALUES(0, 0, 0, 0, 0,999, 10, (select  max (AD_Menu_ID) from AD_Menu ))
;

-- Incluye el punto de menu de la ventana LVE Info (Node_ID=1000096) dentro del menu de la localizacion Venezuela (Parent_ID=1000000) ubicandolo de ultimo (SeqNo=99)
UPDATE AD_TreeNodeMM SET Parent_ID=1000000, SeqNo=99, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=(select  max (AD_Menu_ID) from AD_Menu )
;



INSERT INTO LVE_Info
(LVE_Info_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,
Name,LocationComment,Web,ContactName,Phone,Phone2,Fax,EMail) VALUES
((select case when max(LVE_Info_ID)is null then 1000000 else  max(LVE_Info_ID)+1 end from LVE_Info) ,0,0,'Y',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,
'Double Click Sistemas C.A.',
'Av. Libertador con Calle 33, C.C. El Recreo, Nivel III, Local 39, Barquisimeto, Estado Lara',
'www.dcs.net.ve',
'Orlando Curieles',
'0251-4454389',
'0414-5282565 / 0412-2882229',
'0251-4454389',
'ocurieles@dcs.net.ve / ocurieles@dcsla.com')
;


INSERT INTO LVE_SqlScript
(LVE_SqlScript_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Date1,
LastScript,ScriptUser) VALUES
((select case when max(LVE_SqlScript_ID) is null then 1000000 else max(LVE_SqlScript_ID)+1 end from LVE_SqlScript),0,0,'Y',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,
'007_lve_info.sql',
'Edickson Martinez')
;
commit;


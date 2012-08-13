-- Development for Ads. Angel Parra - Double Click Sistemas C.A. - Agosto 2012 - Barquisimeto - Lara - Venezuela
-- 13-ago-2012 14:56:13 VET

INSERT INTO AD_SysConfig (Name,AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,IsActive) VALUES ('skip_validation_tab',(SELECT COALESCE(MAX(AD_SysConfig_ID,1000000)) FROM AD_SysConfig),'DCS','O','LVE_Client','Insert all windows you want to skip the validation of tabs, please separate each window with the character semicolon ";"',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,0,0,100,100,'Y')
;


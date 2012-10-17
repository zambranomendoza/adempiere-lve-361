-- Original contribution by Ads. Angel Parra - Double Click Sistemas C.A. - Barquisimeto - Lara - Venezuela - aparra@dcs.net.ve - arpr18@gmail.com
-- Please replace the value of @Client_ID@ for you AD_Client_ID

UPDATE AD_Client SET ModelValidationClasses = 'org.doubleclick.model.LVE_CInvoiceModel' WHERE AD_Client_ID = @Client_ID@
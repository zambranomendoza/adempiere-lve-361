-- 18/09/2012 11:32:10 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Menu_Trl SET IsTranslated='Y',Name='Depósito Bancario'WHERE AD_Menu_ID=(select ad_menu_id from ad_menu where name = 'LVE_Deposit') AND AD_Language='es_VE'
;

-- 18/09/2012 11:32:20 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Window_Trl SET IsTranslated='Y',Name='Depósito Bancario' WHERE AD_Window_ID=(select ad_window_id from ad_window where name = 'LVE_Deposit') AND AD_Language='es_VE'
;

-- 18/09/2012 11:32:25 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Depósito Bancario' WHERE AD_Tab_ID=(select ad_tab_id from ad_tab where name = 'Deposit') AND AD_Language='es_VE'
;

-- 18/09/2012 11:32:40 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Línea de Depósito' WHERE AD_Tab_ID=(select ad_tab_id from ad_tab where name = 'Deposit Line') AND AD_Language='es_VE'
;

-- 18/09/2012 11:33:08 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET MandatoryLogic='@IsCash@=''Y''' WHERE AD_Column_ID=(select AD_Column_ID from ad_column where name = 'Bank Account' and ad_table_id = (select ad_table_id from ad_table where tablename = 'LVE_DepositLine'))
;

-- 18/09/2012 11:33:21 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Column SET MandatoryLogic='@IsCash@=''N''' WHERE AD_Column_ID=(select AD_Column_ID from ad_column where name = 'Payment' and ad_table_id = (select ad_table_id from ad_table where tablename = 'LVE_DepositLine'))
;

-- 18/09/2012 11:34:28 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Trl SET IsTranslated='Y',Name='Conciliar / Anular',Description=NULL,Help='Crea Conciliación o Anula la Linea de Depósito' WHERE AD_Process_ID=(select ad_process_id from ad_process where value = 'LVE_DepositCreateBankStatement') AND AD_Language='es_VE'
;

-- 18/09/2012 11:34:48 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Conciliar / Anular',PrintName='Conciliar / Anular' WHERE AD_Element_ID=(select ad_element_id from ad_element where columnname = 'Conciliate') AND AD_Language='es_VE'
;

-- 18/09/2012 11:35:07 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Conciliar / Anular',Updated=TO_TIMESTAMP('2012-09-18 11:35:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=(select AD_Process_Para_ID from AD_Process_Para_Trl where name = 'Conciliate or Void') AND AD_Language='es_VE'
;

UPDATE AD_Field SET SeqNo=100 WHERE AD_Field_ID=(select ad_field_id from ad_field where name = 'Is Cash Book')
;

-- 18/09/2012 12:11:41 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System ConfiguratorAcar Motor II, C.A.
UPDATE AD_Field SET IsCentrallyMaintained='N' WHERE AD_Field_ID=(select ad_field_id from ad_field where name = 'Bank Account' and ad_tab_id = (select ad_tab_id from ad_tab where name = 'Deposit'))
;

update ad_field set iscentrallymaintained = 'Y' where name = 'Is Cash Book'
;

UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Cuenta Bancaria',Description='Cuenta Bancaria',Help=NULL WHERE AD_Field_ID=(select ad_field_id from ad_field where name = 'Bank Account' and ad_tab_id = (select ad_tab_id from ad_tab where name = 'Deposit')) AND AD_Language='es_VE'
;

-- 18/09/2012 12:11:41 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET IsCentrallyMaintained='N' WHERE AD_Field_ID=(select ad_field_id from ad_field where name = 'Bank Account' and ad_tab_id = (select ad_tab_id from ad_tab where name = 'Deposit Line'))
;

-- 18/09/2012 12:11:49 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field_Trl SET Name='Caja',Description=NULL,Help=NULL WHERE AD_Field_ID=(select ad_field_id from ad_field where name = 'Bank Account' and ad_tab_id = (select ad_tab_id from ad_tab where name = 'Deposit Line')) AND AD_Language='es_VE'
;

-- 18/09/2012 12:12:07 PM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Depósito Bancario' WHERE AD_Field_ID=(select ad_field_id from ad_field where name = 'Bank Deposit' and ad_tab_id = (select ad_tab_id from ad_tab where name = 'Deposit Line')) AND AD_Language='es_VE'
;

UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Depósito Bancario',PrintName='Depósito Bancario' WHERE AD_Element_ID=(select ad_element_id from ad_element where columnname = 'LVE_Deposit_ID') AND AD_Language='es_VE'
;

UPDATE AD_Column SET AD_Val_Rule_ID=NULL,Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Column_ID=5046
;

-- 25/09/2012 11:19:16 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET DisplayLogic='@TenderType@ !''X'' | 1=1',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=4030
;

-- 25/09/2012 11:19:29 AM VET
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_Field SET DisplayLogic='@TenderType@=''X'' & 1 = 0',Updated=CURRENT_TIMESTAMP,UpdatedBy=100 WHERE AD_Field_ID=52052
;

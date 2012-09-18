DROP INDEX m_warehouse_name;

CREATE UNIQUE INDEX m_warehouse_name
  ON m_warehouse
  USING btree
  (ad_client_id, ad_org_id, name);

DROP INDEX m_pricelist_name;

CREATE UNIQUE INDEX m_pricelist_name
  ON m_pricelist
  USING btree
  (ad_client_id, ad_org_id, name);

DROP INDEX c_paymentterm_name;

CREATE UNIQUE INDEX c_paymentterm_name
  ON c_paymentterm
  USING btree
  (ad_client_id, ad_org_id, name);


INSERT INTO LVE_SqlScript
(LVE_SqlScript_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,Date1,
LastScript,ScriptUser) VALUES
((select case when max(LVE_SqlScript_ID) is null then 1000000 else max(LVE_SqlScript_ID)+1 end from LVE_SqlScript),0,0,'Y',CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,0,CURRENT_TIMESTAMP,
'010_warehousename.sql',
'Angel Parra')
;

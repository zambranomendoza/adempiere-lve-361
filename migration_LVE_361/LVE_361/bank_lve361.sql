-- Original contribution by Angel Parra - aparra@dcsla.net.ve --- arpr18@gmail.com  for Double Click Sistemas C.A.
-- Date:      09/07/2012
-- Updated: 09/07/2012
-- Note: if you want to run script , you must  replaced all occurrences @ID_CLIENT@  the company that is creating
-- Example for GardenAdmin el @ID_CLIENT@ you should change  to 11

BEGIN;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01920',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO BICENTENARIO BANCO UNIVERSAL, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01519',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO CARONI, C.A., BANCO UNIVERSAL, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('04217',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO DE VENEZUELA, S.A.C.A., BANCO UNIVERSAL, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01212',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO PROVINCIAL, S.A.C.A., BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('00418',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANESCO, BANCO UNIVERSAL, S.A.C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('04721',(select max(C_Bank_ID)+1 from C_Bank ),'N','100% BANCO, BANCO COMERCIAL, C.A',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('00421',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO ACTIVO, C.A. BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01717',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO AGRICOLA DE VENEZUELA, C.A. BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01410',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO DEL CARIBE, C.A. BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('13411',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO DEL TESORO, C.A. BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01714',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO EXTERIOR, C.A., BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('02911',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO MERCANTIL, C.A.,BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01392',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO NACIONAL DE CREDITO, C.A. BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('13812',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO OCCIDENTAL DE DESCUENTO, C.A',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('03421',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO PLAZA, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('14221',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCRECER, S.A. BANCO DESARROLLO',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('14521',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANPLUS BANCO COMERCIAL, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('10910',(select max(C_Bank_ID)+1 from C_Bank ),'N','BFC BANCO FONDO COMUN, C.A BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('00816',(select max(C_Bank_ID)+1 from C_Bank ),'N','CITIBANK, N.A., BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01112',(select max(C_Bank_ID)+1 from C_Bank ),'N','CORP BANCA, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01715',(select max(C_Bank_ID)+1 from C_Bank ),'N','DEL SUR BANCA UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('03814',(select max(C_Bank_ID)+1 from C_Bank ),'N','SOFITASA BANCA UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('04116',(select max(C_Bank_ID)+1 from C_Bank ),'N','VENEZOLANO CREDITO S.A., BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01422',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO DE LA GENTE EMPRENDEDORA,C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('13921',(select max(C_Bank_ID)+1 from C_Bank ),'N','MI BANCO, BANCO DE DESARROLLO',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('02621',(select max(C_Bank_ID)+1 from C_Bank ),'N','INSTITUTO MUNICIPAL DE CREDITO POPULAR(I.M.C.P.)',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01922',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO ESPIRITO SANTO, S.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('03621',(select max(C_Bank_ID)+1 from C_Bank ),'N','COMERCIO EXTERIOR, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('14321',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCAMIGA, BANCO DE DESARROLLO,C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('02421',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO INDUSTRIAL DE VENEZUELA, C.A.',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

INSERT INTO C_Bank (RoutingNo,C_Bank_ID,IsOwnBank,Name,AD_Org_ID,Updated,IsActive,Created,CreatedBy,UpdatedBy,AD_Client_ID) VALUES ('01919',(select max(C_Bank_ID)+1 from C_Bank ),'N','BANCO INTERNACIONAL DE DESARROLLO, C.A. BANCO UNIVERSAL',0,CURRENT_TIMESTAMP,'Y',CURRENT_TIMESTAMP,100,100,@ID_CLIENT@)
;

COMMIT;

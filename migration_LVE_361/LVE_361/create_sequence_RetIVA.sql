-- Original contribution by Angel Parra - aparra@dcs.net.ve --- arpr18@gmail.com  for Double Click Sistemas C.A.
-- Date:      24/09/2012
-- Updated: 24/09/2012
-- Note: if you want to run script , you must  replaced all occurrences @ID_CLIENT@  the company that is creating
-- Example for GardenAdmin el @ID_CLIENT@ you should change  to 11

INSERT INTO AD_Sequence (IncrementNo,StartNewYear,CurrentNextSys,IsTableID,StartNo,CurrentNext,IsAudited,IsAutoSequence,AD_Sequence_ID,DecimalPattern,Name,AD_Org_ID,AD_Client_ID,Updated,UpdatedBy,Created,CreatedBy,IsActive) VALUES (1,'N',100,'Y',1000000,1,'N','Y',(SELECT COALESCE(MAX(AD_SEQUENCE_ID)+1,0) FROM AD_SEQUENCE),'00000000','NroRetenIVA',0,@ID_CLIENT@,CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,'Y')
;


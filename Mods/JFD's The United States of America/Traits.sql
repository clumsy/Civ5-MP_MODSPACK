--==========================================================================================================================	
-- Policies
--==========================================================================================================================	
INSERT INTO Policies
			(Type, 								UnitGoldMaintenanceMod, UnhappinessMod, GreatGeneralRateModifier, 	GreatAdmiralRateModifier, 	UnitPurchaseCostModifier, 	MilitaryProductionModifier)
VALUES		('POLICY_JFD_LINCOLN_SPEECH_ONE',	0,						0,				0, 							0, 							0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_TWO',	-15,					0,				0, 							0, 							0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_THREE', 0,						0,				30, 						30, 						0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_FOUR',	0,						0,				0, 							0, 							0, 							20),
			('POLICY_JFD_LINCOLN_SPEECH_FIVE',	0,						-15,			0, 							0, 							0, 							0),
			('POLICY_JFD_LINCOLN_SPEECH_SIX',	0,						0,				0, 							0, 							-15, 						0);			
--==========================================================================================================================	
-- Policy_FreePromotions
--==========================================================================================================================	
INSERT INTO Policy_FreePromotions 
			(PolicyType, 						PromotionType)
VALUES		('POLICY_JFD_LINCOLN_SPEECH_ONE', 	'PROMOTION_JFD_LINCOLN_SPEECH_ONE');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 							Description, 							ShortDescription)
VALUES		('TRAIT_JFD_AMERICA_LINCOLN', 	'TXT_KEY_TRAIT_JFD_AMERICA_LINCOLN', 	'TXT_KEY_TRAIT_JFD_AMERICA_LINCOLN_SHORT');
--==========================================================================================================================	
--==========================================================================================================================	
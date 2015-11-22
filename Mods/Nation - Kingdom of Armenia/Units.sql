--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 							 Class, Cost, Moves, FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, SpreadReligion,	ReligionSpreads, ReligiousStrength,	UnitArtInfoEraVariation, UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_MAMIKONIAN'),		 Class, Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_MAMIKONIAN'), 	('TXT_KEY_CIV5_JFD_MAMIKONIAN_TEXT'), 	('TXT_KEY_UNIT_JFD_MAMIKONIAN_HELP'), 	('TXT_KEY_UNIT_JFD_MAMIKONIAN_STRATEGY'),	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 1,				4,				 1000,				0,						('ART_DEF_UNIT_JFD_MAMIKONIAN'),  0,					('JFD_UNIT_FLAG_MAMIKONIAN_ATLAS'),	MoveRate, 3, 				('JFD_ARMENIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	

INSERT INTO Units 	
			(Type, 					 		 ShowInPedia,	Class, Cost, Moves, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	WorkRate, CombatLimit, SpreadReligion, ReligionSpreads, ReligiousStrength, UnitArtInfoEraVariation, UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_MAMIKONIAN_PROPHET'), 0,				Class, Cost, Moves, Capture, CivilianAttackPriority, Special, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_MAMIKONIAN'), 	('TXT_KEY_CIV5_JFD_MAMIKONIAN_TEXT'), 	('TXT_KEY_UNIT_JFD_MAMIKONIAN_HELP'), 	('TXT_KEY_UNIT_JFD_MAMIKONIAN_STRATEGY'),	AdvancedStartCost, 	WorkRate, CombatLimit, SpreadReligion, ReligionSpreads, ReligiousStrength, 0,						('ART_DEF_UNIT_JFD_MAMIKONIAN'),  0,					('JFD_UNIT_FLAG_MAMIKONIAN_ATLAS'),	MoveRate, 3, 				('JFD_ARMENIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_MISSIONARY');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MAMIKONIAN'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MAMIKONIAN_PROPHET'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_MAMIKONIAN'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_AITypes 	
			(UnitType, 						 UnitAIType)
SELECT		('UNIT_JFD_MAMIKONIAN_PROPHET'), UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_MAMIKONIAN'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_MAMIKONIAN_PROPHET'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Flavors 
			(UnitType, 					FlavorType, 		Flavor)
VALUES		('UNIT_JFD_MAMIKONIAN',	 	'FLAVOR_RELIGION', 	10);
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
SELECT		('UNIT_JFD_MAMIKONIAN'), 		BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Builds 	
			(UnitType, 						 BuildType)
SELECT		('UNIT_JFD_MAMIKONIAN_PROPHET'), BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Builds 	
			(UnitType, 						 BuildType)
SELECT		('UNIT_JFD_MAMIKONIAN'),		 BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_PROPHET');

INSERT INTO Unit_Builds 	
			(UnitType, 						 BuildType)
SELECT		('UNIT_JFD_MAMIKONIAN_PROPHET'), BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_MAMIKONIAN'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_MAMIKONIAN_PROPHET'),PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_MAMIKONIAN',			'PROMOTION_RIVAL_TERRITORY'),
			('UNIT_JFD_MAMIKONIAN', 		'PROMOTION_JFD_MAMIKONIAN'),
			('UNIT_JFD_MAMIKONIAN_PROPHET', 'PROMOTION_RIVAL_TERRITORY'),
			('UNIT_JFD_MAMIKONIAN_PROPHET', 'PROMOTION_JFD_MAMIKONIAN');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 						UniqueName)
VALUES		('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_VARDAN'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_HAMAZASP'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_SHUSHANIK'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_HMAYEAK'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_VAHAN'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_VARD'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_VASAK'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_ENMANUEL'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_GAGHIK'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_MAMAK'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_MUSEL'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_KAHAN_GAIL'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_SMBAT_THE_VALIANT'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_GRIGOR'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_ARTACHES'),
			('UNIT_JFD_MAMIKONIAN', 		'TXT_KEY_GREAT_PERSON_JFD_HAMAZASPIAN');			
--==========================================================================================================================
--==========================================================================================================================		
		
			
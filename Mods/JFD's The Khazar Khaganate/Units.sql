--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 							 Class, Cost, Moves, FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_KHAGAN_BEK'),		 Class, Cost, Moves, FaithCost, CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_KHAGAN_BEK'), 	('TXT_KEY_CIV5_JFD_KHAGAN_BEK_TEXT'), 	('TXT_KEY_UNIT_JFD_KHAGAN_BEK_HELP'), 	('TXT_KEY_UNIT_JFD_KHAGAN_BEK_STRATEGY'),	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, 0,						('ART_DEF_UNIT_JFD_KHAGAN_BEK'),  0,					('JFD_UNIT_FLAG_KHAGAN_BEK_ATLAS'),	MoveRate, 2, 				('JFD_KHAZARIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_KHAGAN_BEK_PROPHET'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_AITypes 	
			(UnitType, 						 UnitAIType)
SELECT		('UNIT_JFD_KHAGAN_BEK_PROPHET'), UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_KHAGAN_BEK'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_KHAGAN_BEK', 		'PROMOTION_JFD_KHAGAN_BEK'),
			('UNIT_JFD_KHAGAN_BEK', 		'PROMOTION_JFD_KHAGAN_BEK_XP');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 						UniqueName)
VALUES		('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_IBRIS'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BUSIR'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BIHAR'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_PARSBIT'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_ZACHARIAH'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BULAN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BANJAMIN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_AARON_II'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_JOSEPH_BEN_AARON'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_DAVID_OF_TAMAN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_GEORGIUS_TZUL'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BALGITZIN'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_BARJIK'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_LEBEDIAS'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_SERACH'),
			('UNIT_JFD_KHAGAN_BEK', 		'TXT_KEY_GREAT_PERSON_JFD_OBADIAH');			
--==========================================================================================================================
--==========================================================================================================================		
		
			
--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Type, 					 Class, Cost, Moves,	FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 					Civilopedia, 										Help, 								Strategy,								AdvancedStartCost,	WorkRate,	CombatLimit, DontShowYields, UnitArtInfoEraVariation,	UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_VOIVODE'),	 Class, Cost, Moves,	FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_VOIVODE'), 	('TXT_KEY_CIVILOPEDIA_UNITS_JFD_VOIVODE_TEXT'), 	('TXT_KEY_UNIT_JFD_VOIVODE_HELP'), 	('TXT_KEY_UNIT_JFD_VOIVODE_STRATEGY'),	AdvancedStartCost, 	100,		CombatLimit, DontShowYields, 0,							('ART_DEF_UNIT_JFD_VOIVODE'),	0,					('JFD_UNIT_FLAG_VOIVODE_ATLAS'),	MoveRate, 3, 				('JFD_POLAND_LITHUANIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_VOIVODE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_VOIVODE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_VOIVODE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
SELECT		('UNIT_JFD_VOIVODE'), 	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
VALUES		('UNIT_JFD_VOIVODE', 	'BUILD_REPAIR');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_VOIVODE'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName)
VALUES		('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_01'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_02'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_03'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_04'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_05'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_06'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_07'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_08'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_09'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_10'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_11'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_12'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_13'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_14'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_15'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_16'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_17'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_18'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_19'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_20'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_21'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_22'),
			('UNIT_JFD_VOIVODE', 	'TXT_KEY_GREAT_PERSON_JFD_VOIVODE_23');
--==========================================================================================================================	
--==========================================================================================================================				
		
			
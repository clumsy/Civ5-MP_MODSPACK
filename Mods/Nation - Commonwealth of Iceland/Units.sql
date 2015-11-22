--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class, 	Type, 				FoundAbroad,	Pillage, CivilianAttackPriority, Special, Cost,  WorkRate,	CombatLimit,	BaseCultureTurnsToCount, Moves, CombatClass, Domain, DefaultUnitAI,	Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport,	MilitaryProduction, Pillage,	IgnoreBuildingDefense, AdvancedStartCost, ObsoleteTech, XPValueAttack,	XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					MoveRate, UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT		Class, 		('UNIT_JFD_SKALD'), 1,				Pillage, CivilianAttackPriority, Special, Cost,  WorkRate,	CombatLimit,	BaseCultureTurnsToCount, Moves, CombatClass, Domain, DefaultUnitAI,	('TXT_KEY_UNIT_JFD_SKALD'), 	('TXT_KEY_CIV5_JFD_SKALD_TEXT'), 	('TXT_KEY_UNIT_JFD_SKALD_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_SKALD'),	MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense, AdvancedStartCost, ObsoleteTech, XPValueAttack,	XPValueDefense,	GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_JFD_SKALD'),	MoveRate, 0,					('JFD_UNIT_FLAG_SKALD_ATLAS'),	3, 				('JFD_ICELAND_ATLAS')
FROM Units WHERE (Type = 'UNIT_WRITER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SKALD'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WRITER');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_SKALD'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WRITER');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_SKALD'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WRITER');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 			PromotionType)
VALUES		('UNIT_JFD_SKALD',	'PROMOTION_JFD_SKALD'),
			('UNIT_JFD_SKALD',	'PROMOTION_ALLWATER_EMBARKATION'),
			('UNIT_JFD_SKALD',	'PROMOTION_DEFENSIVE_EMBARKATION');			
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 	
			(UnitType, 			UniqueName,							GreatWorkType)
VALUES		('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_01',	'GREAT_WORK_SKALD_01'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_02',	'GREAT_WORK_SKALD_02'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_03',	'GREAT_WORK_SKALD_03'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_04',	'GREAT_WORK_SKALD_04'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_05',	'GREAT_WORK_SKALD_05'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_06',	'GREAT_WORK_SKALD_06'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_07',	'GREAT_WORK_SKALD_07'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_08',	'GREAT_WORK_SKALD_08'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_09',	'GREAT_WORK_SKALD_09'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_10',	'GREAT_WORK_SKALD_10'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_11',	'GREAT_WORK_SKALD_11'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_12',	'GREAT_WORK_SKALD_12'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_13',	'GREAT_WORK_SKALD_13'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_14',	'GREAT_WORK_SKALD_14'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_15',	'GREAT_WORK_SKALD_15'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_16',	'GREAT_WORK_SKALD_16'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_17',	'GREAT_WORK_SKALD_17'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_18',	'GREAT_WORK_SKALD_18'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_19',	'GREAT_WORK_SKALD_19'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_20',	'GREAT_WORK_SKALD_20'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_21',	'GREAT_WORK_SKALD_21'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_22',	'GREAT_WORK_SKALD_22'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_23',	'GREAT_WORK_SKALD_23'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_24',	'GREAT_WORK_SKALD_24'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_25',	'GREAT_WORK_SKALD_25'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_26',	'GREAT_WORK_SKALD_26'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_27',	'GREAT_WORK_SKALD_27'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_28',	'GREAT_WORK_SKALD_28'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_29',	'GREAT_WORK_SKALD_29'),
			('UNIT_JFD_SKALD',	'TXT_KEY_JFD_SKALD_UNIQUE_NAME_30',	'GREAT_WORK_SKALD_30');
--==========================================================================================================================	
--==========================================================================================================================	
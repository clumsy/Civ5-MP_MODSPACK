--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, Type, 						WorkRate,	Cost, Moves, CivilianAttackPriority, Special, Domain,	DefaultUnitAI, 	Description,							Help,										Strategy,										Civilopedia,								AdvancedStartCost, WorkRate, CombatLimit, GoldenAgeTurns, UnitArtInfo,							UnitArtInfoEraVariation, UnitFlagAtlas,							UnitFlagIconOffset, IconAtlas,						PortraitIndex,	MoveRate)
SELECT		Class, 	('UNIT_JFD_KONTREADMIRAL'),	1,			Cost, Moves, CivilianAttackPriority, Special, Domain,	DefaultUnitAI,	('TXT_KEY_UNIT_JFD_KONTREADMIRAL'),		('TXT_KEY_UNIT_JFD_KONTREADMIRAL_HELP'),	('TXT_KEY_UNIT_JFD_KONTREADMIRAL_STRATEGY'),	('TXT_KEY_UNIT_JFD_KONTREADMIRAL_PEDIA'),	AdvancedStartCost, WorkRate, CombatLimit, GoldenAgeTurns, ('ART_DEF_UNIT_JFD_KONTREADMIRAL'),	UnitArtInfoEraVariation, ('JFD_UNIT_FLAG_KONTREADMIRAL_ATLAS'),	0,					('JFD_DENMARK_NORWAY_ATLAS'),	2,				MoveRate
FROM Units WHERE (Type = 'UNIT_GREAT_ADMIRAL');
--------------------------------	
-- Denmark
--------------------------------	
INSERT OR REPLACE INTO Units 	
			(Class,	Type, 						PrereqTech, Cost, 	Moves, 	Combat,		RangedCombat,	Range,	CombatClass,				Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas, 						MoveRate)
SELECT		Class,	('UNIT_JFD_LONGBOAT'), 		PrereqTech, Cost, 	Moves, 	Combat-2,	Combat+2,		2,		('UNITCOMBAT_NAVALRANGED'), Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_LONGBOAT'), 	('TXT_KEY_UNIT_JFD_LONGBOAT_TEXT'), ('TXT_KEY_UNIT_JFD_LONGBOAT_STRATEGY'), ('TXT_KEY_UNIT_JFD_LONGBOAT_HELP'), MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, ('ART_DEF_UNIT_JFD_LONGBOAT'),	0,					('JFD_UNIT_FLAG_LONGBOAT_ATLAS'), 	3, 				('JFD_DENMARK_NORWAY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Units 	
			(Class,	Type, 							PrereqTech, Cost, 	Moves, 	Combat,		RangedCombat,	Range,	CombatClass, Domain, DefaultUnitAI, Description, 					ShowInPedia,	Help, 								MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas, 						MoveRate)
SELECT		Class,	('UNIT_JFD_LONGBOAT_UPGRADE'), 	PrereqTech, Cost, 	Moves, 	Combat-2,	RangedCombat-2,	2,		CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_LONGBOAT'), 	0,				('TXT_KEY_UNIT_JFD_LONGBOAT_HELP'), MilitarySupport, MilitaryProduction, Pillage, Mechanized, ObsoleteTech, AdvancedStartCost, XPValueAttack, MinAreaSize, XPValueDefense, ('ART_DEF_UNIT_JFD_LONGBOAT'),	0,					('JFD_UNIT_FLAG_LONGBOAT_ATLAS'), 	3, 				('JFD_DENMARK_NORWAY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_GALLEASS');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');
--------------------------------	
-- Denmark
--------------------------------	
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_LONGBOAT'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GALLEASS');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');	
--------------------------------	
-- Denmark
--------------------------------	
INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_LONGBOAT'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GALLEASS');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');
--------------------------------	
-- Denmark
--------------------------------	
INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_LONGBOAT'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GALLEASS');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_KONTREADMIRAL'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_ADMIRAL');

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_DANISH_SKI_INFANTRY';
INSERT OR REPLACE INTO Unit_FreePromotions 
			(UnitType, 						PromotionType)
VALUES		('UNIT_DANISH_SKI_INFANTRY',	'PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY_MOVES'),
			('UNIT_DANISH_SKI_INFANTRY',	'PROMOTION_JFD_DANO_NORWEGIAN_SKI_INFANTRY'),
			('UNIT_JFD_KONTREADMIRAL',		'PROMOTION_JFD_KONTREADMIRAL_DEFENSE'),
			('UNIT_JFD_KONTREADMIRAL',		'PROMOTION_JFD_KONTREADMIRAL_ATTRITION'),
			('UNIT_JFD_KONTREADMIRAL',		'PROMOTION_JFD_DANO_NORWEGIAN_GARRISON'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_OCEAN_IMPASSABLE'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_OCEAN_IMPASSABLE'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_JFD_LONGBOAT', 			'PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT'),
			('UNIT_JFD_LONGBOAT_UPGRADE', 	'PROMOTION_JFD_LAND_UNIT_BONUS_LONGBOAT');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 					UniqueName)
VALUES		('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_01'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_02'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_03'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_04'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_05'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_06'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_07'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_08'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_09'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_10'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_11'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_12'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_13'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_14'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_15'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_16'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_17'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_18'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_19'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_20'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_21'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_22'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_23'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_24'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_25'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_26'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_27'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_28'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_29'),
			('UNIT_JFD_KONTREADMIRAL',	'TXT_KEY_GREAT_PERSON_JFD_KONTREADMIRAL_30');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
-- Denmark
--------------------------------	
INSERT OR REPLACE INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_LONGBOAT'),			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_TRIREME');

INSERT OR REPLACE INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_LONGBOAT_UPGRADE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GALLEASS');	
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 					BuildType)
VALUES		('UNIT_JFD_KONTREADMIRAL', 	'BUILD_JFD_SEA_FORTRESS');
--==========================================================================================================================
--==========================================================================================================================		
		
			
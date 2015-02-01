--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						 Strategy, 								  Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 					MoveRate)
SELECT		Class, 	('UNIT_JFD_FRANCISCA'), PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_FRANCISCA'), ('TXT_KEY_CIV5_JFD_FRANCISCA_TEXT'), ('TXT_KEY_UNIT_JFD_FRANCISCA_STRATEGY'), ('TXT_KEY_UNIT_JFD_FRANCISCA_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_HAND_AXE_BARBARIAN'), ('EXPANSION2_UNIT_FLAG_ATLAS'), 	9,					3, 				('JFD_THE_FRANKS_ATLAS'), 	MoveRate
FROM Units WHERE (Type = 'UNIT_SWORDSMAN');

INSERT INTO Units 	
			(Type, 					 Class, Cost, Moves,	FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Help, 								Strategy,								AdvancedStartCost,	WorkRate,	CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_PALADIN'),	 Class, Cost, Moves+2,	FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_PALADIN'), 	('TXT_KEY_CIV5_JFD_PALADIN_TEXT'), 	('TXT_KEY_UNIT_JFD_PALADIN_HELP'), 	('TXT_KEY_UNIT_JFD_PALADIN_STRATEGY'),	AdvancedStartCost, 	100,		CombatLimit, DontShowYields, 0,						('ART_DEF_UNIT_JFD_PALADIN'),	0,					('JFD_UNIT_FLAG_PALADIN_ATLAS'),	MoveRate, 2, 				('JFD_THE_FRANKS_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_FRANCISCA'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_PALADIN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_FRANCISCA'), UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWORDSMAN');	

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_PALADIN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_FRANCISCA'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SWORDSMAN');	

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_PALADIN'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
SELECT		('UNIT_JFD_PALADIN'), 	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Builds
			(UnitType,				BuildType)
VALUES		('UNIT_JFD_PALADIN',	'BUILD_JFD_SIEGE_UNIT');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_PALADIN'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_FRANCISCA'), UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_FRANCISCA', 	'PROMOTION_JFD_BONUS_VS_MELEE');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 					UniqueName)
VALUES		('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_01'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_02'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_03'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_04'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_05'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_06'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_07'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_08'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_09'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_10'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_11'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_12'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_13'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_14'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_15'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_16'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_17'),
			('UNIT_JFD_PALADIN', 		'TXT_KEY_GREAT_PERSON_JFD_PALADIN_18');
--==========================================================================================================================	
--==========================================================================================================================				
		
			
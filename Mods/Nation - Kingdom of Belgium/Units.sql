--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 					PrereqTech, Class, Combat,		RangedCombat,	Cost, Moves, 	Range, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 					Civilopedia, 							Help, 									Strategy,								ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_CHASSEUR'),	PrereqTech, Class, Combat-4,	RangedCombat-4, Cost, Moves+1,	Range, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_JFD_CHASSEUR'), 	('TXT_KEY_CIV5_JFD_CHASSEUR_TEXT'), 	('TXT_KEY_UNIT_JFD_CHASSEUR_HELP'), 	('TXT_KEY_UNIT_JFD_CHASSEUR_STRATEGY'), ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_CHASSEUR'),  	0,					('JFD_UNIT_FLAG_CHASSEUR_ATLAS'),	MoveRate,	2, 				('JFD_BELGIUM_ATLAS')
FROM Units WHERE (Type = 'UNIT_GATLINGGUN');

INSERT INTO Units 	
			(Type, 							PrereqTech, Class, Capture, Cost, Moves, CivilianAttackPriority, Domain, ShowInPedia, 	DefaultUnitAI,	Description, Civilopedia, Help, Strategy, AdvancedStartCost, WorkRate, 	CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas)
SELECT		('UNIT_JFD_BELGIAN_WORKER'),	PrereqTech, Class, Capture, Cost, Moves, CivilianAttackPriority, Domain, 0,				DefaultUnitAI,	Description, Civilopedia, Help, Strategy, AdvancedStartCost, WorkRate,	CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas
FROM Units WHERE (Type = 'UNIT_WORKER');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_CHASSEUR'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_BELGIAN_WORKER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WORKER');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_CHASSEUR'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GATLINGGUN');

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_BELGIAN_WORKER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WORKER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_CHASSEUR'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GATLINGGUN');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_BELGIAN_WORKER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WORKER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_CHASSEUR'), 			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
SELECT		('UNIT_JFD_BELGIAN_WORKER'),	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_WORKER');

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_JFD_BELGIAN_WORKER' AND BuildType = 'BUILD_PLANTATION';
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_JFD_BELGIAN_WORKER', 	'BUILD_JFD_BELGIAN_PLANTATION');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_CHASSEUR', 	'PROMOTION_JFD_CHASSEUR'),	
			('UNIT_JFD_CHASSEUR', 	'PROMOTION_ONLY_DEFENSIVE');
--==========================================================================================================================
--==========================================================================================================================		
		
			
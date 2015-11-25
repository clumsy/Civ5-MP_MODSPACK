--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 						PrereqTech, Class, Combat,		RangedCombat,	Cost, Moves, 	Range, 	FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 							Civilopedia, 								Help, 										Strategy,										ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, NoBadGoodies, WorkRate,	IgnoreBuildingDefense, UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SAMI_BOAZOVAZZI'),	PrereqTech, Class, Combat-1,	5, 				Cost, Moves,	2, 		FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_MC_UNIT_SAMI_BOAZOVAZZI'), 	('TXT_KEY_MC_CIV5_SAMI_BOAZOVAZZI_TEXT'), 	('TXT_KEY_MC_UNIT_HELP_SAMI_BOAZOVAZZI'), 	('TXT_KEY_MC_UNIT_SAMI_BOAZOVAZZI_STRATEGY'),	ObsoleteTech,	NULL,						Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, NoBadGoodies,	100,		IgnoreBuildingDefense, ('ART_DEF_UNIT_SAMI_BOAZOVAZZI'),  	0,					('BOAZOVAZZI_FLAG'),				MoveRate,	2, 				('SAMI_ATLAS')
FROM Units WHERE (Type = 'UNIT_SCOUT');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SAMI_BOAZOVAZZI'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SHOSHONE_PATHFINDER');		
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_SAMI_BOAZOVAZZI'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SHOSHONE_PATHFINDER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_SAMI_BOAZOVAZZI'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SCOUT');

INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, 		Flavor)
VALUES		('UNIT_SAMI_BOAZOVAZZI', 			'FLAVOR_GROWTH', 	14);
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
VALUES		('UNIT_SAMI_BOAZOVAZZI', 			'UNITCLASS_ARCHER');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_SAMI_BOAZOVAZZI', 		'BUILD_SAMI_HERD');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
SELECT		('UNIT_SAMI_BOAZOVAZZI'), 			PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_SCOUT');

INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_SAMI_BOAZOVAZZI', 			'PROMOTION_ONLY_DEFENSIVE');
--==========================================================================================================================
--==========================================================================================================================
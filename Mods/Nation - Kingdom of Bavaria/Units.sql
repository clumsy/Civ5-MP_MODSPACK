--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 						PrereqTech,				Class,					Combat, 	Cost,		Moves, FaithCost,		RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 						Civilopedia, 							Help, 									Strategy,									GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_HARTSCHIER'),	('TECH_METALLURGY'),	('UNITCLASS_LANCER'),	Combat+6,	Cost+75,	Moves, FaithCost+170,	RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_JFD_HARTSCHIER'), 	('TXT_KEY_CIV5_JFD_HARTSCHIER_TEXT'), 	('TXT_KEY_UNIT_JFD_HARTSCHIER_HELP'), 	('TXT_KEY_UNIT_JFD_HARTSCHIER_STRATEGY'), 	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_HARTSCHIER'),	0,					('JFD_UNIT_FLAG_HARTSCHIER_ATLAS'),	MoveRate,	2, 				('JFD_BAVARIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_PIKEMAN');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_HARTSCHIER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_HARTSCHIER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_HARTSCHIER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_HARTSCHIER', 	'PROMOTION_FORMATION_1'),
			('UNIT_JFD_HARTSCHIER', 	'PROMOTION_JFD_HUBERTUSODEN'),
			('UNIT_JFD_HARTSCHIER', 	'PROMOTION_JFD_HARTSCHIER');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 			BuildType)
VALUES		('UNIT_WORKER', 	'BUILD_JFD_SCHLOSS');
--==========================================================================================================================
--==========================================================================================================================		
		
			
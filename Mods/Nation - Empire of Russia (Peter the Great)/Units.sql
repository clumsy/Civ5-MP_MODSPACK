--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 					PrereqTech, Class, Combat, 	Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 					Civilopedia, 							Help, 									Strategy,								ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_STRELTSY'),	PrereqTech, Class, Combat,  Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_JFD_STRELTSY'), 	('TXT_KEY_CIV5_JFD_STRELTSY_TEXT'), 	('TXT_KEY_UNIT_JFD_STRELTSY_HELP'), 	('TXT_KEY_UNIT_JFD_STRELTSY_STRATEGY'), ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_STRELTSY'),  	0,					('JFD_UNIT_FLAG_STRELTSY_ATLAS'),	MoveRate,	2, 				('JFD_RUSSIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_STRELTSY'), 				SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSKETMAN');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_JFD_STRELTSY'), 				UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_STRELTSY'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_JFD_STRELTSY'), 				UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MUSKETMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_STRELTSY', 			'PROMOTION_JFD_STRETLSY');			
--==========================================================================================================================
--==========================================================================================================================		
		
			
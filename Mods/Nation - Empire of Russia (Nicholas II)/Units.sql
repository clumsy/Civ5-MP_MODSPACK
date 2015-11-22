--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 						PrereqTech, Class, Combat, 		Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, 	DefaultUnitAI, 	Description, 						Civilopedia, 							Help, 									Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,						UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_OPOLCHENIYE'),	PrereqTech, Class, Combat-10,  	Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	DefaultUnitAI, ('TXT_KEY_UNIT_JFD_OPOLCHENIYE'), 	('TXT_KEY_CIV5_JFD_OPOLCHENIYE_TEXT'), 	('TXT_KEY_UNIT_JFD_OPOLCHENIYE_HELP'), 	('TXT_KEY_UNIT_JFD_OPOLCHENIYE_STRATEGY'), 	ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_OPOLCHENIYE'),  0,					('JFD_UNIT_FLAG_OPOLCHENIYE_ATLAS'),	MoveRate,	3, 				('JFD_RUSSIA_NICHOLAS_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_OPOLCHENIYE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_OPOLCHENIYE', 	'PROMOTION_CITY_PENALTY');
--==========================================================================================================================
--==========================================================================================================================		
		
			
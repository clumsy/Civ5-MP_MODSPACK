--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		Class, 		('UNIT_JFD_HIGHLANDER'), 	PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_HIGHLANDER'), 	('TXT_KEY_CIV5_JFD_HIGHLANDER_TEXT'), 	('TXT_KEY_UNIT_JFD_HIGHLANDER_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_HIGHLANDER'),	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_JFD_HIGHLANDER'),	0,					('JFD_UNIT_FLAG_HIGHLANDER_ATLAS'),	2, 				('JFD_SCOTLAND_ATLAS')
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_HIGHLANDER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_HIGHLANDER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_HIGHLANDER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_HIGHLANDER', 	'PROMOTION_JFD_HIGHLANDER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_HIGHLANDER'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');		
--==========================================================================================================================	
--==========================================================================================================================	
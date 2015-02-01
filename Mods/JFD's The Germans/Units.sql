--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 					PrereqTech,	Combat,		FaithCost,		RequiresFaithPurchaseEnabled, Cost,		Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT		Class,	('UNIT_JFD_SLAGANZ'), 	PrereqTech, Combat-2,	FaithCost-30,	RequiresFaithPurchaseEnabled, Cost-15, 	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SLAGANZ'), 	('TXT_KEY_CIV5_JFD_SLAGANZ_TEXT'),	('TXT_KEY_UNIT_JFD_SLAGANZ_STRATEGY'), 	('TXT_KEY_UNIT_JFD_SLAGANZ_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_SLAGANZ'), 	('JFD_UNIT_FLAG_SLAGANZ_ATLAS'),	0,					2, 				('JFD_GERMANS_ATLAS')
FROM Units WHERE (Type = 'UNIT_WARRIOR');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SLAGANZ'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WARRIOR');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_SLAGANZ'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WARRIOR');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_SLAGANZ'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WARRIOR');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_SLAGANZ', 	'PROMOTION_JFD_SLAGANZ_INFO');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_SLAGANZ'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_WARRIOR');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds 	
			(UnitType, 			BuildType)
VALUES		('UNIT_WORKER', 	'BUILD_JFD_ENCAMPMENT'),
			('UNIT_WORKER', 	'BUILD_JFD_ENCAMPMENT_UPGRADE_DEER'),
			('UNIT_WORKER', 	'BUILD_JFD_ENCAMPMENT_UPGRADE_HORSE'),
			('UNIT_WORKER', 	'BUILD_JFD_ENCAMPMENT_UPGRADE_IRON');
--==========================================================================================================================	
--==========================================================================================================================	
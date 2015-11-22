--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 					PrereqTech,				Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagAtlas, 				UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT		Class,	('UNIT_JFD_HUSCARL'), 	('TECH_METAL_CASTING'), Combat, FaithCost, RequiresFaithPurchaseEnabled, Cost, 	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_HUSCARL'), 	('TXT_KEY_CIV5_JFD_HUSCARL_TEXT'),	('TXT_KEY_UNIT_JFD_HUSCARL_STRATEGY'), 	('TXT_KEY_UNIT_JFD_HUSCARL_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_U_SAXON_HUSCARL'), 	('HARALD_UNIT_FLAG_ATLAS'), 2,					2, 				('JFD_ANGLO_SAXONS_ATLAS')
FROM Units WHERE (Type = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_HUSCARL'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LONGSWORDSMAN');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_HUSCARL'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_HUSCARL'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================	
INSERT INTO Unit_ResourceQuantityRequirements 
			(UnitType, 				ResourceType)
VALUES		('UNIT_JFD_HUSCARL', 	'RESOURCE_IRON');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_HUSCARL', 	'PROMOTION_JFD_HUSCARL_INFO');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_HUSCARL'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LONGSWORDSMAN');
--==========================================================================================================================	
--==========================================================================================================================	
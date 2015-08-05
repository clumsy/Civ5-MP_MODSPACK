--==========================================================================================================================	
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 	Type, 								PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 								Strategy, 										Help, 										MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 							UnitFlagIconOffset, UnitFlagAtlas,							PortraitIndex, 	IconAtlas,			MoveRate)
SELECT		Class, 		('UNIT_TUSCAN_CONDOTTIERE'), 		PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TUSCAN_CONDOTTIERE'), 	('TXT_KEY_CIV5_TUSCAN_CONDOTTIERE_TEXT'), 	('TXT_KEY_UNIT_TUSCAN_CONDOTTIERE_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TUSCAN_CONDOTTIERE'),  	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_TUSCAN_CONDOTTIERE'),	0,					('UNIT_FLAG_TUSCAN_CONDOTTIERE_ATLAS'),	4, 				('TUSCANY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_KNIGHT');
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_TUSCAN_CONDOTTIERE'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TUSCAN_CONDOTTIERE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_KNIGHT');
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_TUSCAN_CONDOTTIERE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_TUSCAN_CONDOTTIERE'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_TUSCAN_CONDOTTIERE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_TUSCAN_CONDOTTIERE'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_KNIGHT');

INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_TUSCAN_CONDOTTIERE', 	'PROMOTION_FREE_COMPANY');
--==========================================================================================================================		
--==========================================================================================================================
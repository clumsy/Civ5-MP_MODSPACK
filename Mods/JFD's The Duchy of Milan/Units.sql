--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 					PrereqTech,			Range, RangedCombat,	Combat,		FaithCost,		RequiresFaithPurchaseEnabled, Cost,		Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT		Class,	('UNIT_JFD_RIBAULT'), 	('TECH_ECONOMICS'),	Range, RangedCombat-10, Combat-10,	FaithCost+20,	RequiresFaithPurchaseEnabled, Cost+10,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_RIBAULT'), 	('TXT_KEY_CIV5_JFD_RIBAULT_TEXT'),	('TXT_KEY_UNIT_JFD_RIBAULT_STRATEGY'), ('TXT_KEY_UNIT_JFD_RIBAULT_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_RIBAULT'), 	('JFD_UNIT_FLAG_RIBAULT_ATLAS'),	0,					3, 				('JFD_MILAN_ATLAS')
FROM Units WHERE (Type = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_RIBAULT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GATLINGGUN');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_RIBAULT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_RIBAULT'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_RIBAULT', 	'PROMOTION_SECOND_ATTACK'),
			('UNIT_JFD_RIBAULT', 	'PROMOTION_JFD_RIBAULT');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_RIBAULT'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GATLINGGUN');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 							 Class, Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,		CombatClass, Domain, DefaultUnitAI, Description, 								Civilopedia, 									Help, 											Strategy,											Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, UnitArtInfo,					 XPValueAttack, XPValueDefense, UnitFlagIconOffset, UnitFlagAtlas,						 MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_SAMOGITIAN_WARRIOR'), Class, Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat-4,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SAMOGITIAN_WARRIOR'), 	('TXT_KEY_CIV5_JFD_SAMOGITIAN_WARRIOR_TEXT'), 	('TXT_KEY_UNIT_JFD_SAMOGITIAN_WARRIOR_HELP'), 	('TXT_KEY_UNIT_JFD_SAMOGITIAN_WARRIOR_STRATEGY'),	Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, ('ART_DEF_UNIT_JFD_SAMOGITIAN'), XPValueAttack, XPValueDefense, 0,					 ('JFD_UNIT_FLAG_SAMOGITIAN_ATLAS'), MoveRate, 3, 				('JFD_LITHUANIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_SWORDSMAN');	

INSERT INTO Units 	
			(Type, 							 ShowInPedia, 	Class, Cost, Moves, Capture,	CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, Civilopedia, Help, Strategy, WorkRate, SpreadReligion, ReligionSpreads, ReligiousStrength, AdvancedStartCost, CombatLimit, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_LITHUANIAN_PROPHET'), 0,				Class, Cost, Moves, Capture,	CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, Civilopedia, Help, Strategy, WorkRate, SpreadReligion, ReligionSpreads, ReligiousStrength, AdvancedStartCost, CombatLimit, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	MoveRate, PortraitIndex, 	IconAtlas
FROM Units WHERE (Type = 'UNIT_PROPHET');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SAMOGITIAN_WARRIOR'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_JFD_SAMOGITIAN_WARRIOR'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWORDSMAN');

INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_JFD_LITHUANIAN_PROPHET'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_JFD_SAMOGITIAN_WARRIOR'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SWORDSMAN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_SAMOGITIAN_WARRIOR'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SWORDSMAN');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 							BuildType)
SELECT		('UNIT_JFD_LITHUANIAN_PROPHET'), 	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_SAMOGITIAN_WARRIOR', 'PROMOTION_JFD_DOUBLE_MOVES'),
			('UNIT_JFD_SAMOGITIAN_WARRIOR', 'PROMOTION_JFD_CONVERTS_TO_PAGANS');
			
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_JFD_LITHUANIAN_PROPHET'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PROPHET');
--==========================================================================================================================
--==========================================================================================================================		
		
			
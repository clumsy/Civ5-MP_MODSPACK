--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 		FaithCost, 		RequiresFaithPurchaseEnabled, Moves,	HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagAtlas, 							UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT		Class, 	('UNIT_JFD_HUSSAR'), 	PrereqTech, Combat, Cost+15,	FaithCost+30, 	RequiresFaithPurchaseEnabled, Moves+1, 	 HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_HUSSAR_DESC'), 	('TXT_KEY_JFD_HUSSAR_TEXT'), 	('TXT_KEY_JFD_HUSSAR_STRATEGY'), 	('TXT_KEY_JFD_HUNGARY_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_HUSSAR'), ('UNITS_HUNGARIAN_HUSSAR_FLAG_ATLAS'), 	0,					2, 				('JFD_HUNGARY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_CAVALRY');
--------------------------------	
-- Austria
--------------------------------
UPDATE Units
SET Description = 'TXT_KEY_JFD_DRAGOON_DESC',
	Civilopedia = 'TXT_KEY_JFD_DRAGOON_TEXT',
	Strategy = 'TXT_KEY_JFD_DRAGOON_STRATEGY',
	Help = 'TXT_KEY_JFD_DRAGOON_HELP',
	Moves = 4,
	ObsoleteTech = null
WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_HUSSAR'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_HUSSAR'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_HUSSAR'), 	FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
SELECT		('UNIT_JFD_HUSSAR'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================	
-- Unit_FreePromotions
--==========================================================================================================================		
INSERT INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_HUSSAR', 	'PROMOTION_EXTRA_SIGHT_I'),
			('UNIT_JFD_HUSSAR', 	'PROMOTION_FLANK_ATTACK_BONUS'),
			('UNIT_JFD_HUSSAR', 	'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_JFD_HUSSAR', 	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_JFD_HUSSAR', 	'PROMOTION_CITY_PENALTY');
--------------------------------	
-- Austria
--------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_AUSTRIAN_HUSSAR';
INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_JFD_CEREMONIAL_DRAGOONS'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_JFD_DRAGOON_MOUNTED_BONUS'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_JFD_DRAGOON_EXPERIENCE_BONUS'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
			('UNIT_AUSTRIAN_HUSSAR', 	'PROMOTION_CITY_PENALTY');
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_HUSSAR'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CAVALRY');	
--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
-- Dromon
UPDATE Units
SET Help = 'TXT_KEY_JFD_DROMON_HELP', Strategy = 'TXT_KEY_JFD_DROMON_STRATEGY'
WHERE Type = 'UNIT_BYZANTINE_DROMON';
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass, Cost, GreatPeopleRateModifier, GoldMaintenance, PrereqTech,	Description, 						Civilopedia, 							Help, 									Strategy,								 		ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_JFD_STOUDION'),	BuildingClass, Cost, GreatPeopleRateModifier, GoldMaintenance, PrereqTech,	('TXT_KEY_BUILDING_JFD_STOUDION'),	('TXT_KEY_BUILDING_TURKISH_BATH_TEXT'), ('TXT_KEY_BUILDING_JFD_STOUDION_HELP'), 	('TXT_KEY_BUILDING_JFD_STOUDION_STRATEGY'),	ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				('JFD_BYZANTIUM_ALEXIOS_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_GARDEN');	
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	('BUILDING_JFD_STOUDION'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_GARDEN');
--------------------------------
-- Building_YieldChanges 
--------------------------------	
INSERT INTO Building_YieldChanges 
		(BuildingType, 				YieldType, 		Yield)
VALUES	('BUILDING_JFD_STOUDION', 	'YIELD_FAITH',	2);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_BYZANTIUM', 					'BUILDINGCLASS_GARDEN',		'BUILDING_JFD_STOUDION');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM' AND UnitType = 'UNIT_BYZANTINE_CATAPHRACT';	
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ByzantiumTheodora_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,													Description)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL', 'TXT_KEY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL');
------------------------------
-- Policy_BuildingClassTourismModifiers
------------------------------
INSERT INTO Policy_BuildingClassTourismModifiers
		(PolicyType, 												BuildingClassType,			TourismModifier)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL', 	'BUILDINGCLASS_PALACE',		15);
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 												BuildingClassType,			YieldType,			YieldChange)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL', 	'BUILDINGCLASS_GARDEN',		'YIELD_CULTURE',	2);
--==========================================================================================================================
--==========================================================================================================================
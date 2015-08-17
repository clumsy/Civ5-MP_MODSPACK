--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_KilwaDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,										Description,										CityStateTradeChange) 
VALUES		('POLICY_JFD_KILWA_MARKET_TOWNS',			'TXT_KEY_DECISIONS_JFD_KILWA_FOSTER_MARKET_TOWNS',	200),
			('POLICY_JFD_KILWA_CORAL_CONSTRUCTION',		'TXT_KEY_DECISIONS_JFD_KILWA_CORAL_CONSTRUCTION',	0);
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldModifiers 
			(PolicyType, 							BuildingClassType,			YieldType,			YieldMod) 
VALUES 		('POLICY_JFD_KILWA_CORAL_CONSTRUCTION',	'BUILDINGCLASS_HARBOR',		'YIELD_PRODUCTION',	10);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 											DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_JFD_KILWA_CORAL_CONSTRUCTION', 	'BUILDING_JFD_KILWA_CORAL_CONSTRUCTION', 	'TXT_KEY_BUILDING_JFD_KILWA_CORAL_CONSTRUCTION');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 										BuildingClass, 									GreatWorkCount,	Cost, FaithCost, PrereqTech, NeverCapture,	Description, 										Help)
VALUES		('BUILDING_JFD_KILWA_CORAL_CONSTRUCTION',	'BUILDINGCLASS_JFD_KILWA_CORAL_CONSTRUCTION', 	-1,				-1,   -1, 		 NULL, 		 1,				'TXT_KEY_BUILDING_JFD_KILWA_CORAL_CONSTRUCTION', 	'TXT_KEY_BUILDING_JFD_KILWA_CORAL_CONSTRUCTION_HELP');
--==========================================================================================================================
-- Building_FeatureYieldChanges
--==========================================================================================================================
INSERT INTO Building_FeatureYieldChanges 
			(BuildingType, 								FeatureType,		YieldType,				Yield) 
VALUES 		('BUILDING_JFD_KILWA_CORAL_CONSTRUCTION',	'FEATURE_ATOLL',	'YIELD_PRODUCTION',		1);
--==========================================================================================================================
--==========================================================================================================================


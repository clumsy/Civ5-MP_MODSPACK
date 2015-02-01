--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_AngloSaxonsDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,									Description,									HappinessPerTradeRoute, PolicyCostModifier) 
VALUES		('POLICY_JFD_ANGLO_SAXONS_DOMBOC',		'TXT_KEY_DECISIONS_JFD_ANGLO_SAXONS_DOMBOC',	100,					-10);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 							DefaultBuilding, 			Description)
VALUES		('BUILDINGCLASS_JFD_BURGHAL', 	'BUILDING_JFD_BURGHAL', 	'TXT_KEY_BUILDING_JFD_BURGHAL');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						BuildingClass, 					Defense,	ExtraCityHitPoints,	GreatWorkCount,	Cost, FaithCost, PrereqTech, NukeImmune,	ConquestProb,	Description, 						Help)
VALUES		('BUILDING_JFD_BURGHAL',	'BUILDINGCLASS_JFD_BURGHAL', 	300,		10,					-1,				-1,   -1, 		 NULL, 		 1,				100,			'TXT_KEY_BUILDING_JFD_BURGHAL', 	'TXT_KEY_BUILDING_JFD_BURGHAL_HELP');
--==========================================================================================================================	
--==========================================================================================================================	

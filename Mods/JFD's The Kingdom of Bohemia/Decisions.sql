--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_BohemiaDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,							Description) 
VALUES		('POLICY_JFD_BOHEMIA_SILVER',	'TXT_KEY_DECISIONS_JFD_BOHEMIA_ISSUE_PRAGUE_GROSCHEN');
--==========================================================================================================================
-- Policy_BuildingClassYieldModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldModifiers 
			(PolicyType,					BuildingClassType,		YieldType,		YieldMod) 
VALUES		('POLICY_JFD_BOHEMIA_SILVER',	'BUILDINGCLASS_MINT',	'YIELD_GOLD',	10);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 										DefaultBuilding, 					Description)
VALUES		('BUILDINGCLASS_JFD_PRAGUE_RENOVATION', 	'BUILDING_JFD_PRAGUE_RENOVATION', 	'TXT_KEY_BUILDING_JFD_PRAGUE_RENOVATION');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								BuildingClass, 							GreatWorkSlotType,					GreatWorkCount,	Cost, FaithCost, PrereqTech, NukeImmune,	ConquestProb,	Description, 									Help,													IconAtlas,				PortraitIndex)
VALUES		('BUILDING_JFD_PRAGUE_RENOVATION',	'BUILDINGCLASS_JFD_PRAGUE_RENOVATION', 	'GREAT_WORK_SLOT_ART_ARTIFACT',		1,				-1,   -1, 		 NULL, 		 1,				100,			'TXT_KEY_BUILDING_JFD_RENOVATE_PRAGUE_CASTLE', 	'TXT_KEY_BUILDING_JFD_RENOVATE_PRAGUE_CASTLE_HELP',		'JFD_BOHEMIA_ATLAS',	2);
--==========================================================================================================================	
--==========================================================================================================================	

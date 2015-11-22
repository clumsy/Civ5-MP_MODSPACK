--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ScotlandDecisions.lua');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 					DefaultBuilding, 							Description, 								MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_JFD_ROYAL_SOCIETY_EDINBURGH', 	'BUILDING_DECISIONS_JFD_ROYAL_SOCIETY_EDINBURGH', 	'TXT_KEY_DECISIONS_JFD_ROYAL_SOCIETY_EDINBURGH',   -1,					1);
--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings			
			(Type, 										BuildingClass, 			  						Cost, 	FaithCost,	GreatWorkCount,	GlobalGreatPeopleRateModifier,	PrereqTech, Help,													Description, 										Civilopedia,											IconAtlas,		PortraitIndex,	NeverCapture)
VALUES		('BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH', 	'BUILDINGCLASS_JFD_ROYAL_SOCIETY_EDINBURGH', 	-1, 	-1,			0,				20,								NULL, 		'TXT_KEY_BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH_HELP',	'TXT_KEY_BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH', 	'TXT_KEY_BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH_PEDIA',	'TECH_ATLAS_1',	25,				1);
--==========================================================================================================================
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges 
			(BuildingType,								YieldType,			Yield) 
VALUES		('BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH',	'YIELD_SCIENCE',	2),
			('BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH',	'YIELD_GOLD',		2),
			('BUILDING_JFD_ROYAL_SOCIETY_EDINBURGH',	'YIELD_CULTURE',	2);
--==========================================================================================================================
--==========================================================================================================================


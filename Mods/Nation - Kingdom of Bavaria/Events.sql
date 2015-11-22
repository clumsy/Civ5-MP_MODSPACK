--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_BavariaEvents.lua');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 					InstantSpyRankChange,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 									Help)
VALUES		('BUILDING_JFD_BAVARIA_ILLUMINATI', 	'BUILDINGCLASS_JFD_BAVARIA', 	1,						-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BAVARIA_ILLUMINATI', 	'TXT_KEY_BUILDING_JFD_BAVARIA_ILLUMINATI_HELP');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,								Description) 
VALUES		('POLICY_JFD_BAVARIA_NEW_OPERA',	'TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA');
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassTourismModifiers
			(PolicyType,						BuildingClassType,					TourismModifier)
VALUES		('POLICY_JFD_BAVARIA_NEW_OPERA',	'BUILDINGCLASS_MUSICIANS_GUILD',	10);
--==========================================================================================================================
--==========================================================================================================================


--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_BavariaDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,									Description,										GreatMusicianRateModifier) 
VALUES		('POLICY_JFD_BAVARIA_STATE_ORCHESTRA',	'TXT_KEY_DECISIONS_JFD_BAVARIA_STATE_ORCHESTRA',	25);
--==========================================================================================================================
-- Policy_BuildingClassCultureChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassCultureChanges
			(PolicyType,							BuildingClassType,					CultureChange)
VALUES		('POLICY_JFD_BAVARIA_STATE_ORCHESTRA',	'BUILDINGCLASS_MUSICIANS_GUILD',	1);
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassHappiness
			(PolicyType,							BuildingClassType,					Happiness)
VALUES		('POLICY_JFD_BAVARIA_STATE_ORCHESTRA',	'BUILDINGCLASS_MUSICIANS_GUILD',	2);
--==========================================================================================================================
--==========================================================================================================================


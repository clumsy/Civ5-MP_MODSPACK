--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Sri_Lanka_Decisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,											Description) 
VALUES		('POLICY_SRI_LANKA_MULTILINGUALISM',			'TXT_KEY_DECISIONS_SRI_LANKA_MULTILINGUALISM');
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 							BuildingClassType,				YieldType,			YieldChange) 
VALUES 		('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_LIBRARY',		'YIELD_CULTURE',	1),
			('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_UNIVERSITY',		'YIELD_CULTURE',	1),
			('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_PUBLIC_SCHOOL',	'YIELD_CULTURE',	1),
			('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_LABORATORY',		'YIELD_CULTURE',	1);
--==========================================================================================================================
-- Policy_BuildingClassHappiness
--==========================================================================================================================
INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType, 							BuildingClassType,				Happiness) 
VALUES 		('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_LIBRARY',		1),
			('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_UNIVERSITY',		1),
			('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_PUBLIC_SCHOOL',	1),
			('POLICY_SRI_LANKA_MULTILINGUALISM',	'BUILDINGCLASS_LABORATORY',		1);
--==========================================================================================================================
--==========================================================================================================================
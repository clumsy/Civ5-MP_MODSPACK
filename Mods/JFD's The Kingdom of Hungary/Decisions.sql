--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_HungaryDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,									Description,									UnitPurchaseCostModifier) 
VALUES		('POLICY_JFD_HUNGARY_ARCHDIOCESE',		'TXT_KEY_DECISIONS_JFD_HUNGARY_ARCHDIOCESE',	0),
			('POLICY_JFD_HUNGARY_BLACK_ARMY',		'TXT_KEY_DECISIONS_JFD_HUNGARY_BLACK_ARMY',		-33);
--==========================================================================================================================
-- Policy_CityYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType, 						BuildingClassType, 			YieldType, 		YieldChange)
VALUES		('POLICY_JFD_HUNGARY_ARCHDIOCESE', 	'BUILDINGCLASS_CATHEDRAL', 	'YIELD_FAITH',	1);
--==========================================================================================================================
--==========================================================================================================================


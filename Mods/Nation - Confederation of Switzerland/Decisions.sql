--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_SwitzerlandDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================	
INSERT INTO Policies
			(Type,									Description,												MedianTechPercentChange)
VALUES		('POLICY_JFD_SWITZERLAND_SECRECY_LAWS',	'TXT_KEY_DECISIONS_JFD_SWITZERLAND_BANK_SECRECY',			0),
			('POLICY_JFD_SWITZERLAND_RESEARCH',		'TXT_KEY_DECISIONS_JFD_SWITZERLAND_FOREIGN_RESEARCHERS',	50);
--==========================================================================================================================
-- Policy_BuildingClassYieldModifiers
--==========================================================================================================================	
INSERT INTO Policy_BuildingClassYieldModifiers
			(PolicyType,							BuildingClassType,		YieldType,		YieldMod)
VALUES		('POLICY_JFD_SWITZERLAND_SECRECY_LAWS',	'BUILDINGCLASS_BANK',	'YIELD_GOLD',	15);
--==========================================================================================================================
-- Policy_BuildingClassYieldModifiers
--==========================================================================================================================	
INSERT INTO Policy_BuildingClassHappiness
			(PolicyType,							BuildingClassType,		Happiness)
VALUES		('POLICY_JFD_SWITZERLAND_SECRECY_LAWS',	'BUILDINGCLASS_BANK',	1);
--==========================================================================================================================
--==========================================================================================================================


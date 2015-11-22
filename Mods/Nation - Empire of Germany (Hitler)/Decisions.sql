--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_GermanyHitlerDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,										Description) 
VALUES		('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE',		'TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_LUFTWAFFE'),
			('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP',	'TXT_KEY_DECISIONS_JFD_NAZI_GERMANY_FUHRERPRINZIP');
--==========================================================================================================================
-- Policy_BuildingClassHappiness
--==========================================================================================================================
INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType, 								BuildingClassType,				Happiness)
VALUES		('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_CONSTABLE',		2),
			('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_POLICE_STATION',	2);
--==========================================================================================================================
-- Policy_BuildingClassProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 								BuildingClassType,				ProductionModifier)
VALUES		('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_CONSTABLE',		50),
			('POLICY_JFD_NAZI_GERMANY_FUHRERPRINZIP', 	'BUILDINGCLASS_POLICE_STATION',	50);
--==========================================================================================================================
-- Policy_UnitCombatProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_UnitCombatProductionModifiers 
			(PolicyType, 							UnitCombatType,				ProductionModifier)
VALUES		('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 	'UNITCOMBAT_BOMBER',		10),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 	'UNITCOMBAT_FIGHTER',		10),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 	'UNITCOMBAT_HELICOPTER',	10);
--==========================================================================================================================
-- Policy_UnitCombatFreeExperiences
--==========================================================================================================================
INSERT INTO Policy_UnitCombatFreeExperiences 
			(PolicyType, 							UnitCombatType,				FreeExperience)
VALUES		('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 	'UNITCOMBAT_FIGHTER',		20),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 	'UNITCOMBAT_BOMBER',		20),
			('POLICY_JFD_NAZI_GERMANY_LUFTWAFFE', 	'UNITCOMBAT_HELICOPTER',	20);
--==========================================================================================================================
--==========================================================================================================================


--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TCM_AurelianDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,						Description) 
VALUES		('POLICY_TCM_SOL_INVICTUS',	'TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_SOL_INVICTUS');

INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType,				BuildingClassType,		ProductionModifier) 
VALUES		('POLICY_TCM_SOL_INVICTUS',	'BUILDINGCLASS_TEMPLE',	100);

INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType,				BuildingClassType,		YieldType, YieldChange) 
VALUES		('POLICY_TCM_SOL_INVICTUS',	'BUILDINGCLASS_TEMPLE',	'YIELD_GOLD', 1);

INSERT INTO Policies 
			(Type,						Description,										BuildingGoldMaintenanceMod) 
VALUES		('POLICY_TCM_CORRUPTION',	'TXT_KEY_DECISIONS_TCM_AURELIAN_ROME_CORRUPTION',	'-25');


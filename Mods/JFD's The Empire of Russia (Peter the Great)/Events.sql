--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_RussiaPeterEvents.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,							Description,										CityGrowthMod, BuildingProductionModifier) 
VALUES		('POLICY_JFD_GRAND_EMBASSY_1',	'TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_1',	0,				0),
			('POLICY_JFD_GRAND_EMBASSY_2',	'TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_2',	0,				5),
			('POLICY_JFD_GRAND_EMBASSY_3',	'TXT_KEY_EVENT_JFD_PETER_GRAND_EMBASSY_OUTCOME_3',	5,				0);
--==========================================================================================================================
-- Policy_UnitCombatProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_UnitCombatProductionModifiers 
			(PolicyType,					UnitCombatType,				ProductionModifier) 
VALUES		('POLICY_JFD_GRAND_EMBASSY_1',	'UNITCOMBAT_NAVALMELEE',	10),
			('POLICY_JFD_GRAND_EMBASSY_1',	'UNITCOMBAT_NAVALRANGED',	10);
--==========================================================================================================================
--==========================================================================================================================
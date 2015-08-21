--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('TCM_AurelianEvents.lua');
--==========================================================================================================================
--==========================================================================================================================

INSERT INTO Buildings			
			(Type, 								BuildingClass, 			  				Cost, 	FaithCost,	GreatWorkCount,	PrereqTech, SpecialistType,			SpecialistCount,	Help,															Description, 											Civilopedia,									IconAtlas,		PortraitIndex,	NeverCapture)
VALUES		('BUILDING_TCM_AURELIAN_MINT', 			'BUILDINGCLASS_TCM_AURELIANDUMMY', 	-1, 	-1,			-1,				null, 		null,					0,					'TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_RESULT_1',	'TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_1', 	null,											null,			0,				1);

INSERT INTO Building_ResourceYieldChanges 
			(BuildingType,					ResourceType,	YieldType,		Yield) 
VALUES		('BUILDING_TCM_AURELIAN_MINT', 'RESOURCE_GOLD', 'YIELD_GOLD',	1),
VALUES		('BUILDING_TCM_AURELIAN_MINT', 'RESOURCE_SILVER', 'YIELD_GOLD',	1),
VALUES		('BUILDING_TCM_AURELIAN_MINT', 'RESOURCE_COPPER', 'YIELD_GOLD',	1);





INSERT INTO Policies 
			(Type,						Description) 
VALUES		('POLICY_TCM_MINT_WORKERS_1',	'TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS'),
VALUES		('POLICY_TCM_MINT_WORKERS_2',	'TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS');

INSERT INTO Policy_BuildingClassYieldModifiers 
			(PolicyType,				BuildingClassType,        YieldType,    YieldMod) 
VALUES		('POLICY_TCM_MINT_WORKERS_1',	'BUILDINGCLASS_MINT', 'YIELD_GOLD', 10);

INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType,				BuildingClassType,		Happiness) 
VALUES		('POLICY_TCM_MINT_WORKERS_2',	'BUILDINGCLASS_MINT',	1);



--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================		
INSERT INTO BuildingClasses
			(Type, 											DefaultBuilding, 						Description)													
VALUES	    ('BUILDINGCLASS_CARAL_DUMMY',					'BUILDING_CARAL_DUMMY_PROD', 			'TXT_KEY_CARAL_DUMMY_TRIBUTE');				
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings
			(Type, 									BuildingClass, 					Cost, 	FaithCost,	GreatWorkCount, PrereqTech, Description,							Civilopedia,											Strategy,												ArtDefineTag,					MinAreaSize,	HurryCostModifier,	NeverCapture,	NukeImmune,		PortraitIndex,	IconAtlas)													
VALUES		('BUILDING_CARAL_DUMMY_PROD',			'BUILDINGCLASS_CARAL_DUMMY',	-1, 	-1,			-1, 			null,		'TXT_KEY_CARAL_DUMMY_TRIBUTE',			'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_TEXT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_STRATEGY',	'ART_DEF_BUILDING_GRANARY',		-1,				25,					1,				1,				21,				'BW_ATLAS_1'),
			('BUILDING_CARAL_DUMMY_FOOD',			'BUILDINGCLASS_CARAL_DUMMY',	-1, 	-1,			-1, 			null,		'TXT_KEY_CARAL_DUMMY_TRIBUTE_FOOD',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_TEXT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_STRATEGY',	'ART_DEF_BUILDING_GRANARY',		-1,				25,					1,				1,				21,				'BW_ATLAS_1'),
			('BUILDING_CARAL_DUMMY_GOLD',			'BUILDINGCLASS_CARAL_DUMMY',	-1, 	-1,			-1, 			null,		'TXT_KEY_CARAL_DUMMY_TRIBUTE_GOLD',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_TEXT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_STRATEGY',	'ART_DEF_BUILDING_GRANARY',		-1,				25,					1,				1,				21,				'BW_ATLAS_1'),
			('BUILDING_CARAL_DUMMY_CULT',			'BUILDINGCLASS_CARAL_DUMMY',	-1, 	-1,			-1, 			null,		'TXT_KEY_CARAL_DUMMY_TRIBUTE_CULT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_TEXT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_STRATEGY',	'ART_DEF_BUILDING_GRANARY',		-1,				25,					1,				1,				21,				'BW_ATLAS_1'),
			('BUILDING_CARAL_DUMMY_SCIE',			'BUILDINGCLASS_CARAL_DUMMY',	-1, 	-1,			-1, 			null,		'TXT_KEY_CARAL_DUMMY_TRIBUTE_SCIE',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_TEXT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_STRATEGY',	'ART_DEF_BUILDING_GRANARY',		-1,				25,					1,				1,				21,				'BW_ATLAS_1'),
			('BUILDING_CARAL_DUMMY_FAIT',			'BUILDINGCLASS_CARAL_DUMMY',	-1, 	-1,			-1, 			null,		'TXT_KEY_CARAL_DUMMY_TRIBUTE_FAIT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_TEXT',		'TXT_KEY_BUILDING_NORTE_CHICO_SEA_RESOURCES_STRATEGY',	'ART_DEF_BUILDING_GRANARY',		-1,				25,					1,				1,				21,				'BW_ATLAS_1');											
--==========================================================================================================================
-- Building_BuildingClassYieldChanges
--==========================================================================================================================		
INSERT INTO Building_YieldChanges 
			(BuildingType, 						YieldType,				Yield)
VALUES		('BUILDING_CARAL_DUMMY_PROD', 		'YIELD_PRODUCTION',		1),	
			('BUILDING_CARAL_DUMMY_FOOD', 		'YIELD_FOOD',			1),
			('BUILDING_CARAL_DUMMY_GOLD',		'YIELD_GOLD',			1),
			('BUILDING_CARAL_DUMMY_CULT',       'YIELD_CULTURE',		1),
			('BUILDING_CARAL_DUMMY_SCIE',		'YIELD_SCIENCE',		1),
			('BUILDING_CARAL_DUMMY_FAIT',      	'YIELD_FAITH',			1);
--==========================================================================================================================	
--==========================================================================================================================
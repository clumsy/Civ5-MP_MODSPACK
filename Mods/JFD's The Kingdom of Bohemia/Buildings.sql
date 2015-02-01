--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		DefaultBuilding, 					Description)
VALUES		('BUILDINGCLASS_JFD_BOHEMIA', 		'BUILDING_JFD_BOHEMIAN_DELEGATES', 	'TXT_KEY_BUILDING_JFD_BOHEMIAN_DELEGATES');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	Description,					 Help,								Civilopedia,					Strategy,								ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_JFD_HRAD'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	('TXT_KEY_BUILDING_JFD_HRAD'),	('TXT_KEY_BUILDING_JFD_HRAD_HELP'),	('TXT_KEY_CIV5_JFD_HRAD_TEXT'),	('TXT_KEY_BUILDING_JFD_HRAD_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('JFD_BOHEMIA_ATLAS'),	66, 			2
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	

INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 					Defense,	ReligiousPressureModifier,	ExtraLeagueVotes,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 									Help)
VALUES		('BUILDING_JFD_BOHEMIAN_DEFENSE', 		'BUILDINGCLASS_JFD_BOHEMIA', 	100,		0,							1,					-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BOHEMIAN_DEFENSE', 		'TXT_KEY_BUILDING_JFD_BOHEMIAN_DEFENSE_HELP'),
			('BUILDING_JFD_BOHEMIAN_DELEGATES', 	'BUILDINGCLASS_JFD_BOHEMIA', 	0,			0,							1,					-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BOHEMIAN_DELEGATES', 	'TXT_KEY_BUILDING_JFD_BOHEMIAN_DELEGATES_HELP'),
			('BUILDING_JFD_BOHEMIAN_PRESSURE', 		'BUILDINGCLASS_JFD_BOHEMIA', 	0,			100,						0,					-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BOHEMIAN_PRESSURE', 		'TXT_KEY_BUILDING_JFD_BOHEMIAN_PRESSURE_HELP');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================					
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 			BuildingClassType)
SELECT		('BUILDING_JFD_HRAD'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 			FlavorType,					Flavor)
VALUES		('BUILDING_JFD_HRAD', 	'FLAVOR_CITY_DEFENSE',		50),
			('BUILDING_JFD_HRAD', 	'FLAVOR_TILE_IMPROVEMENT',	10),
			('BUILDING_JFD_HRAD', 	'FLAVOR_GOLD',				50);
--==========================================================================================================================	
-- Building_ResourceYieldModifiers
--==========================================================================================================================					
INSERT INTO Building_ResourceYieldModifiers 
			(BuildingType, 			ResourceType,		YieldType,		Yield)
VALUES		('BUILDING_JFD_HRAD',	'RESOURCE_COW',		'YIELD_GOLD',	5),
			('BUILDING_JFD_HRAD',	'RESOURCE_SHEEP',	'YIELD_GOLD',	5),
			('BUILDING_JFD_HRAD',	'RESOURCE_WHEAT',	'YIELD_GOLD',	5),
			('BUILDING_JFD_HRAD',	'RESOURCE_STONE',	'YIELD_GOLD',	5);
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================					
INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 			ResourceType,		YieldType,		Yield)
VALUES		('BUILDING_JFD_HRAD',	'RESOURCE_COW',		'YIELD_GOLD',	1),
			('BUILDING_JFD_HRAD',	'RESOURCE_SHEEP',	'YIELD_GOLD',	1),
			('BUILDING_JFD_HRAD',	'RESOURCE_WHEAT',	'YIELD_GOLD',	1),
			('BUILDING_JFD_HRAD',	'RESOURCE_STONE',	'YIELD_GOLD',	1);
--==========================================================================================================================		
--==========================================================================================================================		

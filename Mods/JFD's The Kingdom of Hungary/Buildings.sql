--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT OR REPLACE INTO BuildingClasses 
			(DefaultBuilding, 							Type, 											Description)
VALUES		('BUILDING_JFD_VEGVAR_ATTRITION', 			'BUILDINGCLASS_JFD_VEGVAR',						'TXT_KEY_BUILDING_JFD_VEGVAR_DEFENSE'),
			('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM', 	'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM', 	'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM'),
			('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2', 'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM_2', 'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 						BuildingClass, Cost,	GoldMaintenance,	PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	Description,					 Help,									Civilopedia,								Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_JFD_VEGVAR'),	BuildingClass, Cost+30,	GoldMaintenance,	PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	('TXT_KEY_BUILDING_JFD_VEGVAR'), ('TXT_KEY_BUILDING_JFD_VEGVAR_HELP'),	('TXT_KEY_CIV5_BUILDINGS_JFD_VEGVAR_TEXT'),	('TXT_KEY_BUILDING_JFD_VEGVAR_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('JFD_HUNGARY_ATLAS'),	66, 			3	
FROM Buildings WHERE Type = 'BUILDING_CASTLE';		

INSERT OR REPLACE INTO Buildings 
			(Type, 											BuildingClass, 									GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, TechEnhancedTourism,	EnhancedYieldTech,	ReligiousPressureModifier,	NeverCapture,	Description, 										Help)
VALUES		('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM', 		'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM',	-1,				-1, 	-1,			0,					NULL, 		2,						'TECH_RADIO',		0,							1,				'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM',	'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_HELP'),
			('BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2', 	'BUILDINGCLASS_JFD_AUSTRIAN_DRAGOON_TOURISM_2',	-1,				-1, 	-1,			0,					NULL, 		4,						'TECH_RADIO',		0,							1,				'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM',	'TXT_KEY_BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2_HELP'),
			('BUILDING_JFD_VEGVAR_FAITH', 					'BUILDINGCLASS_JFD_VEGVAR',						-1,				-1, 	-1,			0,					NULL, 		0,						null,				0,							1,				'TXT_KEY_BUILDING_JFD_VEGVAR_FAITH', 				'TXT_KEY_BUILDING_JFD_VEGVAR_FAITH_HELP'),
			('BUILDING_JFD_VEGVAR_PRESSURE', 				'BUILDINGCLASS_JFD_VEGVAR',						-1,				-1, 	-1,			0,					NULL, 		0,						null,				25,							1,				'TXT_KEY_BUILDING_JFD_VEGVAR_PRESSURE', 			'TXT_KEY_BUILDING_JFD_VEGVAR_PRESSURE_HELP'),
			('BUILDING_JFD_VEGVAR_ATTRITION', 				'BUILDINGCLASS_JFD_VEGVAR',						-1,				-1, 	-1,			0,					NULL, 		0,						null,				0,							1,				'TXT_KEY_BUILDING_JFD_VEGVAR_ATTRITION', 			'TXT_KEY_BUILDING_JFD_VEGVAR_ATTRITION_HELP');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================					
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_JFD_VEGVAR'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_YieldChanges 
			(BuildingType, 							YieldType,			Yield)
VALUES		('BUILDING_JFD_VEGVAR_FAITH', 			'YIELD_FAITH',		1);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,				Flavor)
VALUES		('BUILDING_JFD_VEGVAR', 	'FLAVOR_CITY_DEFENSE',	50),
			('BUILDING_JFD_VEGVAR', 	'FLAVOR_RELIGION',		10);
--==========================================================================================================================		
--==========================================================================================================================		

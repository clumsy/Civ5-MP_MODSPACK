--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT OR REPLACE INTO BuildingClasses 
			(DefaultBuilding, 					Type, 								Description)
VALUES		('BUILDING_JFD_ANGLO_POLICY', 		'BUILDINGCLASS_JFD_ANGLO_POLICY', 	'TXT_KEY_BUILDING_JFD_ANGLO_POLICY');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT OR REPLACE INTO Buildings 
			(Type, 							BuildingClass, 						PolicyCostModifier, GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 							Help)
VALUES		('BUILDING_JFD_ANGLO_CULTURE', 	'BUILDINGCLASS_JFD_ANGLO_POLICY',	0,					-1,				-1, 	-1,			0,					NULL, 		1,				'TXT_KEY_BUILDING_JFD_ANGLO_CULTURE',	'TXT_KEY_BUILDING_JFD_ANGLO_CULTURE_HELP'),
			('BUILDING_JFD_ANGLO_POLICY', 	'BUILDINGCLASS_JFD_ANGLO_POLICY',	-20,				-1,				-1, 	-1,			0,					NULL, 		1,				'TXT_KEY_BUILDING_JFD_ANGLO_POLICY',	'TXT_KEY_BUILDING_JFD_ANGLO_POLICY_HELP');

INSERT INTO Buildings 	
			(Type, 							Happiness,	BuildingClass, Cost, GoldMaintenance, PrereqTech,				Description, 							Civilopedia, 							Help, 										Strategy,								 		ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_SHIRE_COURT'),	2,			BuildingClass, Cost, GoldMaintenance, ('TECH_CIVIL_SERVICE'),	('TXT_KEY_BUILDING_JFD_SHIRE_COURT'), ('TXT_KEY_CIV5_JFD_SHIRE_COURT_TEXT'), 	('TXT_KEY_BUILDING_JFD_SHIRE_COURT_HELP'), 	('TXT_KEY_BUILDING_JFD_SHIRE_COURT_STRATEGY'),	ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				('JFD_ANGLO_SAXONS_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType, Flavor)
SELECT		('BUILDING_JFD_SHIRE_COURT'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');	
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType,					YieldType,			Yield)
VALUES		('BUILDING_JFD_ANGLO_CULTURE',	'YIELD_CULTURE',	2);
--==========================================================================================================================	
--==========================================================================================================================	
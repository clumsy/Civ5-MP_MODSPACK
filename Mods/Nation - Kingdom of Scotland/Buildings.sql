--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JFD_SCOTLAND', 	'BUILDING_JFD_SCOTTISH_WRITER_E', 	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						GreatWorkCount, GreatWorkSlotType,				BuildingClass, PrereqTech, Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, Description, 						Civilopedia, 							Help, 									Strategy,									ArtDefineTag, PortraitIndex, IconAtlas)
SELECT		('BUILDING_JFD_COLLEGE'),	1,				'GREAT_WORK_SLOT_LITERATURE',	BuildingClass, PrereqTech, Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, ('TXT_KEY_BUILDING_JFD_COLLEGE'),	('TXT_KEY_CIV5_JFD_COLLEGE_TEXT'),		('TXT_KEY_BUILDING_JFD_COLLEGE_HELP'),	('TXT_KEY_BUILDING_JFD_COLLEGE_STRATEGY'),	ArtDefineTag, 3, 			('JFD_SCOTLAND_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';	

INSERT INTO Buildings 	
			(Type, 						 		BuildingClass, 					SpecialistType, 		GoldenAgeModifier,	GreatPeopleRateChange,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 								Help)
VALUES		('BUILDING_JFD_SCOTTISH_COLLEGE', 	'BUILDINGCLASS_JFD_SCOTLAND',	null,					10,					0,						-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_COLLEGE',	'TXT_KEY_BUILDING_JFD_SCOTTISH_COLLEGE_HELP'),
			('BUILDING_JFD_SCOTTISH_WRITER_M', 	'BUILDINGCLASS_JFD_SCOTLAND',	'SPECIALIST_WRITER', 	0,					3,						-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS',	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS_HELP'),
			('BUILDING_JFD_SCOTTISH_WRITER_S', 	'BUILDINGCLASS_JFD_SCOTLAND',	'SPECIALIST_WRITER', 	0,					3,						-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS',	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS_HELP'),
			('BUILDING_JFD_SCOTTISH_WRITER_E', 	'BUILDINGCLASS_JFD_SCOTLAND',	'SPECIALIST_WRITER', 	0,					3,						-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS', 	'TXT_KEY_BUILDING_JFD_SCOTTISH_WRITERS_HELP');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_JFD_COLLEGE'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';		
--==========================================================================================================================	
-- Building_FeatureYieldChanges
--==========================================================================================================================	
INSERT INTO Building_FeatureYieldChanges 	
			(BuildingType, 				FeatureType, YieldType, Yield)
SELECT		('BUILDING_JFD_COLLEGE'),	FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';	
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================	
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_JFD_COLLEGE'),	YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType, Flavor)
SELECT		('BUILDING_JFD_COLLEGE'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_Flavors
			(BuildingType,				FlavorType,				Flavor)
VALUES		('BUILDING_JFD_COLLEGE',	'FLAVOR_CULTURE',		10),
			('BUILDING_JFD_COLLEGE',	'FLAVOR_GREAT_PEOPLE',	10);
--==========================================================================================================================	
--==========================================================================================================================	
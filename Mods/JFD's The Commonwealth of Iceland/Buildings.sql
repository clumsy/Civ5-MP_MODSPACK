--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
		(Type, 						 	DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_JFD_ICELAND', 	'BUILDING_JFD_ICELAND_GREAT_WRITING', 	'TXT_KEY_BUILDING_JFD_ICELAND_GREAT_WRITING');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 							AllowsWaterRoutes,	GreatWorkCount, GreatWorkSlotType,	BuildingClass, PrereqTech, Cost,	FaithCost,		UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag, PortraitIndex,	IconAtlas)
SELECT		('BUILDING_JFD_THINGSTEAD'),	1,					GreatWorkCount,	GreatWorkSlotType,	BuildingClass, PrereqTech, Cost-20, FaithCost-40,	UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, ('TXT_KEY_BUILDING_JFD_THINGSTEAD'),	('TXT_KEY_CIV5_JFD_THINGSTEAD_TEXT'),	('TXT_KEY_BUILDING_JFD_THINGSTEAD_HELP'),	('TXT_KEY_BUILDING_JFD_THINGSTEAD_STRATEGY'),	ArtDefineTag, 4, 				('JFD_ICELAND_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';	

INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 					GreatWorkSlotType,				UnmoddedHappiness,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 									PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_ICELAND_GREAT_WRITING', 	'BUILDINGCLASS_JFD_ICELAND',	'GREAT_WORK_SLOT_LITERATURE',	0,					1, 				-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_ICELAND_GREAT_WRITING',	2,				'JFD_ICELAND_ATLAS'),
			('BUILDING_JFD_ICELAND_HAPPINESS',		'BUILDINGCLASS_JFD_ICELAND',	null,							2,					-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_ICELAND_HAPPINESS',		0,				null);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_THINGSTEAD'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_AMPHITHEATER';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 					YieldType, Yield)
SELECT		('BUILDING_JFD_THINGSTEAD'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_AMPHITHEATER';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, Flavor)
SELECT		('BUILDING_JFD_THINGSTEAD'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_AMPHITHEATER';

INSERT INTO Building_Flavors
			(BuildingType,				FlavorType,					Flavor)
VALUES		('BUILDING_JFD_THINGSTEAD',	'FLAVOR_WATER_CONNECTION',	15),
			('BUILDING_JFD_THINGSTEAD',	'FLAVOR_HAPPINESS',			10),
			('BUILDING_JFD_THINGSTEAD',	'FLAVOR_EXPANSION',			20);
--==========================================================================================================================	
--==========================================================================================================================	
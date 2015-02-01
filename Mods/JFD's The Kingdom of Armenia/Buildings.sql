--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_ARMENIAN_FAITH', 		'BUILDING_JFD_ARMENIAN_FAITH', 			'TXT_KEY_BUILDING_JFD_ARMENIAN_FAITH');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								 BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, GreatWorkSlotType, 				   GreatWorkCount,	NeverCapture, 	Description, 									Civilopedia, 									Help, 												Strategy,												ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_ARMENIAN_MONASTERY'), BuildingClass, PrereqTech, Cost, GoldMaintenance, MinAreaSize, ('GREAT_WORK_SLOT_ART_ARTIFACT'),  1, 				1, 				('TXT_KEY_BUILDING_JFD_MOUNTAIN_MONASTERY'), 	('TXT_KEY_CIV5_JFD_MOUNTAIN_MONASTERY_TEXT'),   ('TXT_KEY_BUILDING_JFD_MOUNTAIN_MONASTERY_HELP'), 	('TXT_KEY_BUILDING_JFD_MOUNTAIN_MONASTERY_STRATEGY'),	ArtDefineTag, 4, 				('JFD_ARMENIA_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 								TrainedFreePromotion, 		NearbyMountainRequired,	GreatWorkCount, Cost, FaithCost, PrereqTech, NoOccupiedUnhappiness, NeverCapture,	Description, 									Help)
VALUES		('BUILDING_JFD_ARMENIAN_CONVERSION', 	'BUILDINGCLASS_JFD_ARMENIAN_FAITH', 		null, 						0,						-1, 			-1,   -1, 		 null, 		 1,						1,				'TXT_KEY_BUILDING_JFD_ARMENIAN_CONVERSION', 	'TXT_KEY_BUILDING_JFD_ARMENIAN_CONVERSION_HELP'),
			('BUILDING_JFD_ARMENIAN_FAITH', 		'BUILDINGCLASS_JFD_ARMENIAN_FAITH', 		null, 						0,						-1, 			-1,   -1, 		 null, 		 0,						1,				'TXT_KEY_BUILDING_JFD_ARMENIAN_FAITH', 			'TXT_KEY_BUILDING_JFD_ARMENIAN_FAITH_HELP');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						 YieldType, Yield)
SELECT		('BUILDING_JFD_ARMENIAN_MONASTERY'), YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';		

INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType, 		Yield)
VALUES		('BUILDING_JFD_ARMENIAN_FAITH', 	'YIELD_FAITH', 	2);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 						 BuildingClassType)
SELECT		('BUILDING_JFD_ARMENIAN_MONASTERY'), BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 						 FlavorType, Flavor)
SELECT		('BUILDING_JFD_ARMENIAN_MONASTERY'), FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
			(BuildingType, 						 FlavorType, 		Flavor)
VALUES		('BUILDING_JFD_ARMENIAN_MONASTERY', 'FLAVOR_CULTURE', 	10),
			('BUILDING_JFD_ARMENIAN_MONASTERY', 'FLAVOR_SCIENCE', 	5);
--==========================================================================================================================	
--==========================================================================================================================	
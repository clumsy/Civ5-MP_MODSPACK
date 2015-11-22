--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_SACRED_GROVE_FAITH', 		'BUILDING_JFD_SACRED_GROVE_FAITH',		'TXT_KEY_BUILDING_JFD_SACRED_GROVE_FAITH'),
			('BUILDINGCLASS_JFD_SACRED_GROVE_HAPPINESS', 	'BUILDING_JFD_SACRED_GROVE_HAPPINESS', 	'TXT_KEY_BUILDING_JFD_SACRED_GROVE_HAPPINESS');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 							BuildingClass, Cost, GoldMaintenance, MinAreaSize, NeverCapture, 	Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_SACRED_GROVE'),	BuildingClass, Cost, GoldMaintenance, MinAreaSize, 1, 				('TXT_KEY_BUILDING_JFD_SACRED_GROVE'), 	('TXT_KEY_CIV5_JFD_SACRED_GROVE_TEXT'), ('TXT_KEY_BUILDING_JFD_SACRED_GROVE_HELP'), ('TXT_KEY_BUILDING_JFD_SACRED_GROVE_STRATEGY'),	ArtDefineTag, 2, 				('JFD_LITHUANIA_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_SHRINE';		

INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 									Happiness,	GreatWorkCount, Cost, FaithCost, PrereqTech, TrainedFreePromotion,		Description, 									Help)
VALUES		('BUILDING_JFD_SACRED_GROVE_FAITH', 		'BUILDINGCLASS_JFD_SACRED_GROVE_FAITH', 		0,			-1, 			-1,   -1, 		 null, 		 null,						'TXT_KEY_BUILDING_JFD_SACRED_GROVE_FAITH',		'TXT_KEY_BUILDING_JFD_SACRED_GROVE_FAITH_HELP'),
			('BUILDING_JFD_SACRED_GROVE_HAPPINESS', 	'BUILDINGCLASS_JFD_SACRED_GROVE_HAPPINESS', 	1,			-1, 			-1,   -1, 		 null, 		 null,						'TXT_KEY_BUILDING_JFD_SACRED_GROVE_HAPPINESS', 'TXT_KEY_BUILDING_JFD_SACRED_GROVE_HAPPINESS_HELP');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						 YieldType, Yield)
SELECT		('BUILDING_JFD_SACRED_GROVE'),		 YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_SHRINE';		
--==========================================================================================================================	
-- Building_FeatureYieldChanges
--==========================================================================================================================	
INSERT INTO Building_FeatureYieldChanges 	
			(BuildingType, 							FeatureType,		YieldType, 		Yield)
VALUES		('BUILDING_JFD_SACRED_GROVE_FAITH', 	'FEATURE_FOREST',	'YIELD_FAITH', 	1);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 						 FlavorType, Flavor)
SELECT		('BUILDING_JFD_SACRED_GROVE'),		 FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
			(BuildingType, 						 FlavorType, 			Flavor)
VALUES		('BUILDING_JFD_SACRED_GROVE',		'FLAVOR_HAPPINESS',		30),
			('BUILDING_JFD_SACRED_GROVE',		'FLAVOR_EXPANSION', 	15);
--==========================================================================================================================	
--==========================================================================================================================	
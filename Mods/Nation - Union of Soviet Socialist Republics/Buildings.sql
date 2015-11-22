--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_JFD_USSR_LENIN', 			'BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'TXT_KEY_BUILDING_JFD_USSR_LENIN');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================		
INSERT INTO Buildings 	
			(Type, 									BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 									Civilopedia, 									Help, 												Strategy,								 				ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_LENIN_COMMISSARIAT'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, ('TXT_KEY_BUILDING_JFD_LENIN_COMMISSARIAT'), 	('TXT_KEY_CIV5_JFD_LENIN_COMMISSARIAT_TEXT'), 	('TXT_KEY_BUILDING_JFD_LENIN_COMMISSARIAT_HELP'), 	('TXT_KEY_BUILDING_JFD_LENIN_COMMISSARIAT_STRATEGY'),	ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 2, 				('JFD_USSR_LENIN_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');	

INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 					FoodKept,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 								Help)
VALUES		('BUILDING_JFD_WORKER_PRODUCTION', 			'BUILDINGCLASS_JFD_USSR_LENIN', 0,			-1, 			-1,   -1, 		 null, 		 'TXT_KEY_BUILDING_JFD_WORKER_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_WORKER_PRODUCTION_HELP'),
			('BUILDING_JFD_LENIN_FOOD', 				'BUILDINGCLASS_JFD_USSR_LENIN', 1,			-1, 			-1,   -1, 		 null, 		 'TXT_KEY_BUILDING_JFD_LENIN_FOOD', 		'TXT_KEY_BUILDING_JFD_LENIN_FOOD_HELP');
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_JFD_WORKER_PRODUCTION', 				'YIELD_PRODUCTION', 	15);		
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 							FlavorType, Flavor)
SELECT		('BUILDING_JFD_LENIN_COMMISSARIAT'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');	
		
INSERT INTO Building_Flavors 
			(BuildingType, 							FlavorType, 					Flavor)
VALUES		('BUILDING_JFD_LENIN_COMMISSARIAT', 	'FLAVOR_GROWTH', 				50);	
--==========================================================================================================================		
--==========================================================================================================================		
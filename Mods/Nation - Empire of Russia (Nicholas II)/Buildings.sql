--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 		'BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'TXT_KEY_BUILDING_JFD_NICHOLAS_RUSSIA');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 							Civilopedia, 							Help, 										Strategy,								 	 ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_GUBERNIYA'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, ('TXT_KEY_BUILDING_JFD_GUBERNIYA'), 	('TXT_KEY_CIV5_JFD_GUBERNIYA_TEXT'), 	('TXT_KEY_BUILDING_JFD_GUBERNIYA_HELP'), 	('TXT_KEY_BUILDING_JFD_GUBERNIYA_STRATEGY'), ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 2, 				('JFD_RUSSIA_NICHOLAS_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');	

INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 							WonderProductionModifier,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 											Help)
VALUES		('BUILDING_JFD_GUBERNIYA_PRODUCTION', 			'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	0,							-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_GUBERNIYA_PRODUCTION', 			'TXT_KEY_BUILDING_JFD_GUBERNIYA_PRODUCTION_HELP'),
			('BUILDING_JFD_GUBERNIYA_GROWTH', 				'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	0,							-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_GUBERNIYA_GROWTH', 				'TXT_KEY_BUILDING_JFD_GUBERNIYA_GROWTH_HELP'),
			('BUILDING_JFD_WONDER_PRODUCTION', 				'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	1,							-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_WONDER_PRODUCTION', 				'TXT_KEY_BUILDING_JFD_WONDER_PRODUCTION_HELP'),
			('BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'BUILDINGCLASS_JFD_NICHOLAS_RUSSIA', 	0,							-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'TXT_KEY_BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH_HELP');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_JFD_WE_LOVE_THE_KING_DAY_FAITH', 	'YIELD_FAITH', 			1);
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_JFD_GUBERNIYA_GROWTH', 				'YIELD_FOOD', 			10),
			('BUILDING_JFD_GUBERNIYA_PRODUCTION', 			'YIELD_PRODUCTION', 	5);			
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType, Flavor)
SELECT		('BUILDING_JFD_GUBERNIYA'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');	

INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType,				Flavor)
VALUES		('BUILDING_JFD_GUBERNIYA',	'FLAVOR_PRODUCTION',	20),
			('BUILDING_JFD_GUBERNIYA',	'FLAVOR_GROWTH',		30);
--==========================================================================================================================	
--==========================================================================================================================	
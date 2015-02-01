--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 									Description)
VALUES		('BUILDINGCLASS_JFD_STALIN_SATELLITES', 	'BUILDING_JFD_SOVIET_STALIN_CULT_OF_PERSONALITY', 	'TXT_KEY_BUILDING_JFD_STALIN_SATELLITES');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 									BuildingClass, Cost, GoldMaintenance, PrereqTech, EspionageModifier, Espionage, Description, 											Civilopedia, 												Help, 											Strategy,								 				ArtDefineTag, 	MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_STALIN_COMMISSARIAT'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, EspionageModifier, Espionage, ('TXT_KEY_BUILDING_JFD_STALIN_COMMISSARIAT_DESC'), 	('TXT_KEY_CIV5_BUILDINGS_JFD_STALIN_COMMISSARIAT_TEXT'), 	('TXT_KEY_BUILDING_JFD_STALIN_COMMISSARIAT_HELP'), 	('TXT_KEY_BUILDING_JFD_STALIN_COMMISSARIAT_STRATEGY'),	ArtDefineTag,	MinAreaSize, NeverCapture, HurryCostModifier, 2, 				('JFD_USSR_STALIN_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_CONSTABLE';	

INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 							GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	NukeImmune, Description, 								Help,											PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_STALIN_SATELLITES', 		'BUILDINGCLASS_JFD_STALIN_SATELLITES', 	-1,				-1,   -1, 		 null, 		 1,				1,			'TXT_KEY_BUILDING_JFD_STALIN_SATELLITES', 	'TXT_KEY_BUILDING_JFD_STALIN_SATELLITES_HELP',	0,				'JFD_USSR_STALIN_ATLAS');
--==========================================================================================================================
-- Building_DomainProductionModifiers
--==========================================================================================================================		
INSERT INTO Building_DomainProductionModifiers 
			(BuildingType, 							DomainType, 		Modifier)
VALUES		('BUILDING_JFD_STALIN_SATELLITES', 		'DOMAIN_LAND', 		10);
--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 
			(BuildingType, 							FlavorType, 					Flavor)
VALUES		('BUILDING_JFD_STALIN_COMMISSARIAT', 	'FLAVOR_ESPIONAGE', 			25),
			('BUILDING_JFD_STALIN_COMMISSARIAT', 	'FLAVOR_HAPPINESS', 			75),
			('BUILDING_JFD_STALIN_COMMISSARIAT', 	'FLAVOR_MILITARY_TRAINING', 	50);	
--==========================================================================================================================	
--==========================================================================================================================	
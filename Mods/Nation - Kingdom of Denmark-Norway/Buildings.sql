--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 									DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_JFD_DENMARK_NORWAY', 	'BUILDING_JFD_DENMARK_NORWAY', 	'TXT_KEY_BUILDING_JFD_DENMARK_NORWAY');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 	BuildingClass, 							SpecialistType,			SpecialistCount,	AllowsWaterRoutes,	Water,	Cost, FaithCost, PrereqTech, Description, 								Help,										PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_DENMARK_NORWAY', 'BUILDINGCLASS_JFD_DENMARK_NORWAY', 	'SPECIALIST_MERCHANT',	1,					1,					1,		-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_DENMARK_NORWAY', 	'TXT_KEY_BUILDING_JFD_DENMARK_NORWAY_HELP',	2,				'EXPANSION_TECH_ATLAS_1');
--==========================================================================================================================	
--==========================================================================================================================	
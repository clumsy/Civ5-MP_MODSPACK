--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 DefaultBuilding, 					Description)
VALUES		('BUILDINGCLASS_JFD_GREAT_BRITAIN', 'BUILDING_JFD_VICTORIAN_SCIENCE',	'TXT_KEY_BUILDING_JFD_VICTORIAN_SCIENCE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================		
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 						GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	Description, 										Help,												IconAtlas,					PortraitIndex)
VALUES		('BUILDING_JFD_VICTORIAN_SCIENCE', 		'BUILDINGCLASS_JFD_GREAT_BRITAIN', -1, 				-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_JFD_VICTORIAN_SCIENCE', 			'TXT_KEY_BUILDING_JFD_VICTORIAN_SCIENCE_HELP',		null,						0),
			('BUILDING_JFD_REDCOAT_PRODUCTION', 	'BUILDINGCLASS_JFD_GREAT_BRITAIN', -1, 				-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_JFD_REDCOAT_PRODUCTION', 			'TXT_KEY_BUILDING_JFD_REDCOAT_PRODUCTION_HELP',		'JFD_GREAT_BRITAIN_ATLAS',  3);
--==========================================================================================================================								
-- Building_YieldModifiers																																	
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers
			(BuildingType, 							YieldType, 			Yield)
VALUES		('BUILDING_JFD_VICTORIAN_SCIENCE', 		'YIELD_SCIENCE',	1),
			('BUILDING_JFD_REDCOAT_PRODUCTION', 	'YIELD_PRODUCTION',	1);
--==========================================================================================================================		
--==========================================================================================================================		
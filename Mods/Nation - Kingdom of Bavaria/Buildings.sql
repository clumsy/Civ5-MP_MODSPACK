--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 	DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_JFD_BAVARIA', 	'BUILDING_JFD_BAVARIAN_MUSIC', 	'TXT_KEY_BUILDING_JFD_BAVARIAN_CULTURE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 					GreatWorkSlotType,			GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 											Help,													PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_BAVARIAN_CULTURE', 			'BUILDINGCLASS_JFD_BAVARIA', 	null,						-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BAVARIAN_CULTURE', 				'TXT_KEY_BUILDING_JFD_BAVARIAN_CULTURE_HELP',			0,				null),
			('BUILDING_JFD_BAVARIAN_MUSIC', 			'BUILDINGCLASS_JFD_BAVARIA', 	'GREAT_WORK_SLOT_MUSIC',	1, 				-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_BAVARIAN_MUSIC', 				null,													14,				'TECH_ATLAS_2');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 						YieldType, 			Yield)
VALUES		('BUILDING_JFD_BAVARIAN_CULTURE', 	'YIELD_CULTURE', 	1);
--==========================================================================================================================	
--==========================================================================================================================	
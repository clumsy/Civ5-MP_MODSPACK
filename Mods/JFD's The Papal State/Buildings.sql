--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_SWISS_GUARD_TOURISM', 	'BUILDING_JFD_SWISS_GUARD_TOURISM', 	'TXT_KEY_BUILDING_JFD_SWISS_GUARD_TOURISM'),
			('BUILDINGCLASS_JFD_CHAPEL_MUSIC', 			'BUILDING_JFD_CHAPEL_MUSIC', 			'TXT_KEY_BUILDING_JFD_CHAPEL'),
			('BUILDINGCLASS_JFD_CHAPEL_ART', 			'BUILDING_JFD_CHAPEL_ART', 				'TXT_KEY_BUILDING_JFD_CHAPEL');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								BuildingClass, Cost, Capital, NukeImmune, MinAreaSize, Defense, ArtInfoCulturalVariation, DisplayPosition, GreatWorkSlotType, GreatWorkCount, NeverCapture, Description, 								Civilopedia, 									Help, 	Strategy,											PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_APOSTOLIC_PALACE'), 	BuildingClass, Cost, Capital, NukeImmune, MinAreaSize, Defense, ArtInfoCulturalVariation, DisplayPosition, GreatWorkSlotType, GreatWorkCount, NeverCapture, ('TXT_KEY_BUILDING_JFD_APOSTOLIC_PALACE'), 	('TXT_KEY_BUILDING_JFD_APOSTOLIC_PALACE_TEXT'), Help, 	('TXT_KEY_BUILDING_JFD_APOSTOLIC_PALACE_STRATEGY'),	PortraitIndex, 	IconAtlas
FROM Buildings WHERE (Type = 'BUILDING_PALACE');
	
INSERT INTO Buildings 	
			(Type, 							BuildingClass,						GreatWorkSlotType, 				   GreatWorkCount,	Cost, GoldMaintenance, MinAreaSize, NeverCapture, 	Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CHAPEL_ART'),	('BUILDINGCLASS_JFD_CHAPEL_ART'),	('GREAT_WORK_SLOT_ART_ARTIFACT'),  1, 				Cost, GoldMaintenance, MinAreaSize, 1, 				('TXT_KEY_BUILDING_JFD_CHAPEL'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
			(Type, 							BuildingClass,						GreatWorkSlotType, 			GreatWorkCount,	Cost, GoldMaintenance, MinAreaSize, NeverCapture, 	Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CHAPEL_MUSIC'),	('BUILDINGCLASS_JFD_CHAPEL_MUSIC'),	('GREAT_WORK_SLOT_MUSIC'),  1, 				Cost, GoldMaintenance, MinAreaSize, 1, 				('TXT_KEY_BUILDING_JFD_CHAPEL'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

INSERT INTO Buildings 	
			(Type, 								BuildingClass,	GreatWorkSlotType, 				GreatWorkCount,	PrereqTech, Cost, GoldMaintenance, MinAreaSize, NeverCapture, 	Description, 						Civilopedia, 						Help, 									Strategy,									ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CHAPEL_WRITING'),	BuildingClass,	('GREAT_WORK_SLOT_LITERATURE'),	1, 				PrereqTech, Cost, GoldMaintenance, MinAreaSize, 1, 				('TXT_KEY_BUILDING_JFD_CHAPEL'), 	('TXT_KEY_CIV5_JFD_CHAPEL_TEXT'),   ('TXT_KEY_BUILDING_JFD_CHAPEL_HELP'), 	('TXT_KEY_BUILDING_JFD_CHAPEL_STRATEGY'),	ArtDefineTag, 4, 				('JFD_PAPAL_STATES_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 								EnhancedYieldTech,  TechEnhancedTourism, GreatWorkCount, Cost, FaithCost, PrereqTech,	Description, 								Help)
VALUES		('BUILDING_JFD_SWISS_GUARD_TOURISM', 	'BUILDINGCLASS_JFD_SWISS_GUARD_TOURISM',	'TECH_RADIO',		2,					 -1, 			 -1,   -1, 		  null, 		'TXT_KEY_BUILDING_JFD_SWISS_GUARD_TOURISM', 'TXT_KEY_BUILDING_JFD_SWISS_GUARD_TOURISM_HELP'),
			('BUILDING_JFD_CHAPEL_FAITH', 			'BUILDINGCLASS_JFD_SWISS_GUARD_TOURISM',	null,				0,					 -1, 			 -1,   -1, 		  null, 		'TXT_KEY_BUILDING_JFD_CHAPEL_FAITH',		'TXT_KEY_BUILDING_JFD_CHAPEL_FAITH_HELP');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 
			(BuildingType, 						YieldType, 			Yield)
VALUES		('BUILDING_JFD_CHAPEL_FAITH', 		'YIELD_FAITH', 		1),
			('BUILDING_JFD_CHAPEL_ART', 		'YIELD_FAITH', 		1),
			('BUILDING_JFD_CHAPEL_MUSIC', 		'YIELD_FAITH', 		1),
			('BUILDING_JFD_CHAPEL_WRITING', 	'YIELD_FAITH', 		1),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_FAITH', 		1),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_GOLD', 		3),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_PRODUCTION', 3),
			('BUILDING_JFD_APOSTOLIC_PALACE', 	'YIELD_SCIENCE', 	3);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				 BuildingClassType)
SELECT		('BUILDING_JFD_CHAPEL_ART'), BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_CHAPEL_MUSIC'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT		('BUILDING_JFD_CHAPEL_WRITING'), BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 					 FlavorType,		Flavor)
VALUES		('BUILDING_JFD_CHAPEL_ART',		'FLAVOR_RELIGION',	10),
			('BUILDING_JFD_CHAPEL_ART',		'FLAVOR_CULTURE',	10),
			('BUILDING_JFD_CHAPEL_MUSIC',	'FLAVOR_RELIGION',	10),
			('BUILDING_JFD_CHAPEL_MUSIC',	'FLAVOR_CULTURE',	10),
			('BUILDING_JFD_CHAPEL_WRITING', 'FLAVOR_RELIGION',	10),
			('BUILDING_JFD_CHAPEL_WRITING', 'FLAVOR_CULTURE',	10);
--==========================================================================================================================	
--==========================================================================================================================	
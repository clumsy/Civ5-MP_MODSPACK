--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================		
INSERT INTO BuildingClasses
			(Type, 									DefaultBuilding, 				Description, 										MaxGlobalInstances, MaxPlayerInstances)													
VALUES	    ('BUILDINGCLASS_JFD_SWISS_MANPOWER',	'BUILDING_JFD_SWISS_MANPOWER', 	'TXT_KEY_CIVIL_WAR_SCENARIO_RESOURCE_MANPOWER', 	-1, 				4);		
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================		
INSERT INTO Buildings
			(Type, 									 BuildingClass, 						Cost, 	FaithCost,	GreatWorkCount, GoldMaintenance,	PrereqTech, 	MilitaryProductionModifier,	Description,						Help)
VALUES		('BUILDING_JFD_SWISS_MANPOWER',			 'BUILDINGCLASS_JFD_SWISS_MANPOWER', 	-1, 	-1,			-1, 			0,  				null,			20,							'TXT_KEY_JFD_BUILDING_MANPOWER',	'TXT_KEY_JFD_BUILDING_MANPOWER_HELP'),
			('BUILDING_JFD_SWISS_MANPOWER_HANDICAP', 'BUILDINGCLASS_JFD_SWISS_MANPOWER', 	-1, 	-1,			-1, 			0,  				null,			10,							'TXT_KEY_JFD_BUILDING_MANPOWER',	'TXT_KEY_JFD_BUILDING_MANPOWER_HANDICAP_HELP');
	
INSERT INTO Buildings 
		(Type, 						BuildingClass, 	Cost, 	FaithCost,	UnlockedByBelief, GoldMaintenance, FreeStartEra, 	PrereqTech, Help, 									Description,						Civilopedia, 						Strategy, 									ArtDefineTag,	MinAreaSize, HurryCostModifier,	IconAtlas,					ConquestProb, PortraitIndex)
SELECT	('BUILDING_JFD_KASERNE'), 	BuildingClass, 	Cost, 	FaithCost,	UnlockedByBelief, GoldMaintenance, FreeStartEra,	PrereqTech, ('TXT_KEY_BUILDING_HELP_JFD_KASERNE'),	('TXT_KEY_BUILDING_JFD_KASERNE'),	('TXT_KEY_CIV5_JFD_KASERNE_TEXT'),	('TXT_KEY_BUILDING_JFD_KASERNE_STRATEGY'),	ArtDefineTag,	MinAreaSize, HurryCostModifier, ('JFD_SWITZERLAND_ATLAS'),	ConquestProb, 2
FROM Buildings WHERE (Type = 'BUILDING_ARMORY');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================				
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 				BuildingClassType)
SELECT	('BUILDING_JFD_KASERNE'), 	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_ARMORY');	
--==========================================================================================================================	
-- Building_PrereqBuildingClasses
--==========================================================================================================================				
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 				BuildingClassType, NumBuildingNeeded)
SELECT	('BUILDING_JFD_KASERNE'), 	BuildingClassType, NumBuildingNeeded
FROM Building_PrereqBuildingClasses WHERE (BuildingType = 'BUILDING_ARMORY');	
--==========================================================================================================================	
-- Building_ResourceQuantity
--==========================================================================================================================	
INSERT INTO Building_ResourceQuantity
			(BuildingType, 						ResourceType, 				Quantity)
VALUES		('BUILDING_JFD_KASERNE', 			'RESOURCE_JFD_MANPOWER', 	2);		
--==========================================================================================================================	
-- Building_DomainFreeExperiences
--==========================================================================================================================			
INSERT INTO Building_DomainFreeExperiences 
		(BuildingType, 				DomainType, Experience)
SELECT	('BUILDING_JFD_KASERNE'), 	DomainType, Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_ARMORY');	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType, Flavor)
SELECT	('BUILDING_JFD_KASERNE'), 	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_ARMORY');	

INSERT INTO Building_Flavors 
			(BuildingType, 						FlavorType, 					Flavor)
VALUES		('BUILDING_JFD_KASERNE', 			'FLAVOR_GOLD', 					10);	
--==========================================================================================================================		
--==========================================================================================================================		
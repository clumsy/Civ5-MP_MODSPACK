--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 
		(Type, 					BuildingClass, 	Cost, 	FaithCost,	UnlockedByBelief, GoldMaintenance, FreeStartEra, 	PrereqTech,				Help, 								Description,					Civilopedia, 					Strategy, 								ArtDefineTag,	MinAreaSize, HurryCostModifier,	IconAtlas,					ConquestProb, PortraitIndex)
SELECT	('BUILDING_JFD_DOJO'), 	BuildingClass, 	Cost, 	FaithCost,	UnlockedByBelief, GoldMaintenance, FreeStartEra,	'TECH_METAL_CASTING',	('TXT_KEY_BUILDING_HELP_JFD_DOJO'),	('TXT_KEY_BUILDING_JFD_DOJO'),	('TXT_KEY_CIV5_JFD_DOJO_TEXT'),	('TXT_KEY_BUILDING_JFD_DOJO_STRATEGY'),	ArtDefineTag,	MinAreaSize, HurryCostModifier, ('JFD_JAPAN_TOJO_ATLAS'),	ConquestProb, 3
FROM Buildings WHERE (Type = 'BUILDING_ARMORY');
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================				
INSERT INTO Building_ClassesNeededInCity 
		(BuildingType, 			BuildingClassType)
SELECT	('BUILDING_JFD_DOJO'), 	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_ARMORY');	
--==========================================================================================================================	
-- Building_PrereqBuildingClasses
--==========================================================================================================================				
INSERT INTO Building_PrereqBuildingClasses 
		(BuildingType, 			BuildingClassType, NumBuildingNeeded)
SELECT	('BUILDING_JFD_DOJO'), 	BuildingClassType, NumBuildingNeeded
FROM Building_PrereqBuildingClasses WHERE (BuildingType = 'BUILDING_ARMORY');		
--==========================================================================================================================	
-- Building_DomainFreeExperiences
--==========================================================================================================================			
INSERT INTO Building_DomainFreeExperiences 
		(BuildingType, 			DomainType, Experience)
SELECT	('BUILDING_JFD_DOJO'), 	DomainType, Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_ARMORY');	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 
		(BuildingType, 			FlavorType, Flavor)
SELECT	('BUILDING_JFD_DOJO'), 	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_ARMORY');	

INSERT INTO Building_Flavors 
			(BuildingType, 			FlavorType, 		Flavor)
VALUES		('BUILDING_JFD_DOJO', 	'FLAVOR_CULTURE', 	20);	
--==========================================================================================================================		
--==========================================================================================================================		
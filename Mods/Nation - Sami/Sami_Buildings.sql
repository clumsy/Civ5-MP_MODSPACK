--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								BuildingClass, Cost, GoldMaintenance, 	PrereqTech, 		Description, 									Civilopedia, 								Help, 										Strategy,										ArtDefineTag, 	MinAreaSize, ConquestProb, 	HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_SAMI_SIEIDI'),			BuildingClass, Cost, 0, 				('TECH_CALENDAR'), 	('TXT_KEY_MC_BUILDING_SAMI_SIEIDI'), 			('TXT_KEY_MC_BUILDING_SAMI_SIEIDI_PEDIA'), 	('TXT_KEY_MC_BUILDING_SAMI_SIEIDI_HELP'), 	('TXT_KEY_MC_BUILDING_SAMI_SIEIDI_STRATEGY'),	ArtDefineTag,	MinAreaSize, 100, 			HurryCostModifier, 3, 				('SAMI_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_TEMPLE');	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType, 		Flavor)
VALUES		('BUILDING_SAMI_SIEIDI',			'FLAVOR_CULTURE', 	25),
			('BUILDING_SAMI_SIEIDI',			'FLAVOR_RELIGION', 	25);
--==========================================================================================================================
-- Building_ClassesNeededInCity
--==========================================================================================================================		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 								BuildingClassType)
SELECT		('BUILDING_SAMI_SIEIDI'),					BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_TEMPLE');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 				DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_JFD_POLAND_LITHUANIA', 		'BUILDING_JFD_POLAND_LITHUANIA_HAPPINESS', 	'TXT_KEY_BUILDING_JFD_POLAND_LITHUANIA_HAPPINESS'),
			('BUILDINGCLASS_JFD_POLAND', 				'BUILDING_JFD_POLAND_VOIVODE_GROWTH', 		'TXT_KEY_BUILDING_JFD_POLAND_VOIVODE_GROWTH');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 						BuildingClass, Cost, GoldMaintenance, PrereqTech, SpecialistType,	SpecialistCount, TradeRouteRecipientBonus,	TradeRouteTargetBonus,	Description,						Help,									Civilopedia,						Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,						ConquestProb, 	PortraitIndex)
SELECT		('BUILDING_JFD_ESTATE'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, SpecialistType,	SpecialistCount, TradeRouteRecipientBonus,	TradeRouteTargetBonus,	('TXT_KEY_BUILDING_JFD_ESTATE'),	('TXT_KEY_BUILDING_JFD_ESTATE_HELP'),	('TXT_KEY_CIV5_JFD_ESTATE_TEXT'),	('TXT_KEY_BUILDING_JFD_ESTATE_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	('JFD_POLAND_LITHUANIA_ATLAS'),	66, 			2
FROM Buildings WHERE Type = 'BUILDING_BANK';	

INSERT OR REPLACE INTO Buildings 	
			(Type, 						 					BuildingClass, 							FoodKept,	Happiness,	GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 											Help)
VALUES		('BUILDING_JFD_POLAND_LITHUANIA_HAPPINESS', 	'BUILDINGCLASS_JFD_POLAND_LITHUANIA', 	0,			1,			-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_POLAND_LITHUANIA_HAPPINESS', 	'TXT_KEY_BUILDING_JFD_POLAND_LITHUANIA_HAPPINESS_HELP'),
			('BUILDING_JFD_POLAND_VOIVODE_GROWTH', 			'BUILDINGCLASS_JFD_POLAND', 			0,			0,			-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_POLAND_VOIVODE_GROWTH', 			'TXT_KEY_BUILDING_JFD_POLAND_VOIVODE_GROWTH_HELP'),
			('BUILDING_JFD_POLAND_MILITARY_PRODUCTION', 	'BUILDINGCLASS_JFD_POLAND', 			20,			0,			-1, 			-1,   -1, 		 NULL, 		 'TXT_KEY_BUILDING_JFD_POLAND_MILITARY_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_POLAND_MILITARY_PRODUCTION_HELP');
--------------------------------	
-- Ducal Stables
--------------------------------	
UPDATE Buildings
SET TrainedFreePromotion = 'PROMOTION_SPAWN_GENERALS_I', Help = 'TXT_KEY_BUILDING_JFD_DUCAL_STABLES_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_DUCAL_STABLES_STRATEGY'
WHERE Type = 'BUILDING_DUCAL_STABLE';
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================					
INSERT INTO Building_ClassesNeededInCity
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_JFD_ESTATE'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_BANK';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors
			(BuildingType, 				FlavorType, Flavor)
SELECT		('BUILDING_JFD_ESTATE'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_BANK';	

INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,					Flavor)
VALUES		('BUILDING_JFD_ESTATE', 	'FLAVOR_HAPPINESS',			30),
			('BUILDING_JFD_ESTATE', 	'FLAVOR_TILE_IMPROVEMENT',	10),
			('BUILDING_JFD_ESTATE', 	'FLAVOR_EXPANSION',			10);
--==========================================================================================================================	
-- Building_ResourceYieldChanges
--==========================================================================================================================
DELETE FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_DUCAL_STABLE' AND YieldType = 'YIELD_GOLD';					
INSERT INTO Building_ResourceYieldChanges 
			(BuildingType, 				ResourceType,		YieldType,		Yield)
VALUES		('BUILDING_JFD_ESTATE', 	'RESOURCE_SHEEP',	'YIELD_GOLD',	1),
			('BUILDING_JFD_ESTATE', 	'RESOURCE_HORSE',	'YIELD_GOLD',	1),
			('BUILDING_JFD_ESTATE', 	'RESOURCE_COW',		'YIELD_GOLD',	1);
--==========================================================================================================================	
-- Building_UnitCombatFreeExperiences
--==========================================================================================================================					
DELETE FROM Building_UnitCombatFreeExperiences WHERE BuildingType = 'BUILDING_DUCAL_STABLE';	
INSERT INTO Building_UnitCombatFreeExperiences 
			(BuildingType, 				UnitCombatType,			Experience)
VALUES		('BUILDING_JFD_ESTATE', 	'UNITCOMBAT_MOUNTED',	15);
--==========================================================================================================================	
-- Building_UnitCombatProductionModifiers
--==========================================================================================================================					
INSERT OR REPLACE INTO Building_UnitCombatProductionModifiers 
			(BuildingType, 									UnitCombatType,			Modifier)
VALUES		('BUILDING_JFD_POLAND_MILITARY_PRODUCTION', 	'UNITCOMBAT_MOUNTED',	15);
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT OR REPLACE INTO Building_YieldChanges 
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_JFD_ESTATE'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_BANK';	
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================					
INSERT INTO Building_YieldModifiers 
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_JFD_ESTATE'),	YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_BANK';
--==========================================================================================================================		
--==========================================================================================================================		

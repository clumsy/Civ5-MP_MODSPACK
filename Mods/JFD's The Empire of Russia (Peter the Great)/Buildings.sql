--=======================================================================================================================
-- BuildingClasses
--=======================================================================================================================
INSERT INTO BuildingClasses
			(Type, 										DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_PETRINE_EXPANSION', 	'BUILDING_JFD_PETRINE_EXPANSION', 		'TXT_KEY_BUILDING_JFD_PETRINE_EXPANSION_DESC');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings		
			(Type, 								BuildingClass, 			  					Cost, 	FaithCost,	GreatWorkCount,	GoldMaintenance, PlotCultureCostModifier,	PrereqTech, Help,												Description, 									NeverCapture)
VALUES		('BUILDING_JFD_PETRINE_EXPANSION', 	'BUILDINGCLASS_JFD_PETRINE_EXPANSION', 		-1, 	-1,			-1,				0, 				 -1,						NULL, 		'TXT_KEY_BUILDING_JFD_PETRINE_EXPANSION_HELP',		'TXT_KEY_BUILDING_JFD_PETRINE_EXPANSION', 		1);
--------------------------------	
-- Russia (Catherine)
--------------------------------
UPDATE Buildings
SET Cost = Cost+25, PlotBuyCostModifier = 0, PlotCultureCostModifier = 0, Defense = 400
WHERE Type = 'BUILDING_KREPOST';

INSERT INTO Buildings 	
			(Type, 					BuildingClass, Cost,	GoldMaintenance, PrereqTech, Description, 						Civilopedia, 						Help, 									Strategy,								 PlotBuyCostModifier,	ArtDefineTag, 	MinAreaSize, ConquestProb, GreatPeopleRateModifier,	FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_BANYA'),	BuildingClass, Cost+15, GoldMaintenance, PrereqTech, ('TXT_KEY_BUILDING_JFD_BANYA'), 	('TXT_KEY_CIV5_JFD_BANYA_TEXT'), 	('TXT_KEY_BUILDING_JFD_BANYA_HELP'), 	('TXT_KEY_BUILDING_JFD_BANYA_STRATEGY'), -15,					ArtDefineTag,	MinAreaSize, ConquestProb, GreatPeopleRateModifier,	FreshWater,	HurryCostModifier, 3, 				('JFD_RUSSIA_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_GARDEN');	
--==========================================================================================================================	
-- Building_ResourceYieldModifiers
--==========================================================================================================================		
-- Russia (Catherine)
--------------------------------
INSERT INTO Building_ResourceYieldModifiers
			(BuildingType,			ResourceType,		YieldType,			Yield)
SELECT		'BUILDING_JFD_BANYA',	Type,				'YIELD_PRODUCTION', 10
FROM Resources WHERE ResourceClassType IN ('RESOURCECLASS_RUSH', 'RESOURCECLASS_MODERN') AND NOT Type IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
-- Russia (Catherine)
--------------------------------
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_JFD_BANYA'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_GARDEN');	

INSERT INTO Building_Flavors
			(BuildingType,			FlavorType,			Flavor)
VALUES		('BUILDING_JFD_BANYA', 'FLAVOR_PRODUCTION',	25),
			('BUILDING_JFD_BANYA', 'FLAVOR_EXPANSION',	25),
			('BUILDING_JFD_BANYA', 'FLAVOR_GOLD',		20);
--==========================================================================================================================	
--==========================================================================================================================	
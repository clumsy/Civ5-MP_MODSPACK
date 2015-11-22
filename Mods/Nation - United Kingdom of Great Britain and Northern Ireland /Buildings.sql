--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 DefaultBuilding, 					Description)
VALUES		('BUILDINGCLASS_JFD_UNITED_KINGDOM', 'BUILDING_JFD_SEA_TRADE_PRODUCTION',	'TXT_KEY_BUILDING_JFD_SEA_TRADE_RANGE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================		
INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 						GreatWorkCount, Cost,	FaithCost,	PrereqTech,			Description, 										Help)
VALUES		('BUILDING_JFD_SEA_TRADE_PRODUCTION', 		'BUILDINGCLASS_JFD_UNITED_KINGDOM', -1,				-1,		-1,			null, 				'TXT_KEY_BUILDING_JFD_SEA_TRADE_PRODUCTION', 		'TXT_KEY_BUILDING_JFD_SEA_TRADE_PRODUCTION_HELP'),
			('BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'BUILDINGCLASS_JFD_UNITED_KINGDOM',	-1,				-1,		-1,			null, 				'TXT_KEY_BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION_HELP');
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldChanges
			(BuildingType, 								YieldType, 			Yield)
VALUES		('BUILDING_JFD_SEA_TRADE_PRODUCTION', 		'YIELD_PRODUCTION', 1);	
--==========================================================================================================================	
-- Building_DomainProductionModifiers
--==========================================================================================================================		
INSERT INTO Building_DomainProductionModifiers
			(BuildingType, 								DomainType, 		Modifier)
VALUES		('BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'DOMAIN_SEA', 		5),	
			('BUILDING_JFD_NAVAL_AND_AIR_PRODUCTION', 	'DOMAIN_AIR', 		5);
--==========================================================================================================================		
--==========================================================================================================================		
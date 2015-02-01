--=======================================================================================================================
-- BuildingClasses
--=======================================================================================================================
INSERT INTO BuildingClasses
			(Type, 						DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_OMAN', 'BUILDING_JFD_MINAA_NAVAL_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_MINAA_NAVAL_PRODUCTION');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings		
			(Type, 									BuildingClass, 			  	Cost, 	FaithCost,	GreatWorkCount,	GoldMaintenance, PrereqTech, Help,												Description, 									NeverCapture)
VALUES		('BUILDING_JFD_MINAA_NAVAL_PRODUCTION', 'BUILDINGCLASS_JFD_OMAN', 	-1, 	-1,			-1,				0, 				 null, 		'TXT_KEY_BUILDING_JFD_MINAA_NAVAL_PRODUCTION_HELP',	'TXT_KEY_BUILDING_JFD_MINAA_NAVAL_PRODUCTION', 	1);
--==========================================================================================================================
-- Building_DomainProductionModifiers
--==========================================================================================================================
INSERT INTO Building_DomainProductionModifiers
			(BuildingType,								DomainType,		Modifier)
VALUES		('BUILDING_JFD_MINAA_NAVAL_PRODUCTION',		'DOMAIN_SEA',	5);
--==========================================================================================================================	
--==========================================================================================================================	
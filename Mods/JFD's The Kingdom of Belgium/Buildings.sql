--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								BuildingClass, Cost, GoldMaintenance, 	PrereqTech, Description, 								Civilopedia, 								Help, 											Strategy,											ArtDefineTag, 	MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_CHOCOLATE_HOUSE'),	BuildingClass, Cost, 0, 				PrereqTech, ('TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE'), ('TXT_KEY_CIV5_JFD_CHOCOLATE_HOUSE_TEXT'), 	('TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_HELP'), 	('TXT_KEY_BUILDING_JFD_CHOCOLATE_HOUSE_STRATEGY'),	ArtDefineTag,	MinAreaSize, ConquestProb, HurryCostModifier, 3, 				('JFD_BELGIUM_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_THEATRE');	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 	
			(BuildingType, 						FlavorType, Flavor)
SELECT		('BUILDING_JFD_CHOCOLATE_HOUSE'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_THEATRE');	
--==========================================================================================================================	
-- Building_ResourceQuantity
--==========================================================================================================================		
INSERT INTO Building_ResourceQuantity 	
			(BuildingType, 						ResourceType, 			Quantity)
VALUES		('BUILDING_JFD_CHOCOLATE_HOUSE',	'RESOURCE_JFD_PRALINE', 1);
--==========================================================================================================================	
--==========================================================================================================================	
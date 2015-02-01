--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================			
INSERT OR REPLACE INTO BuildingClasses 
			(DefaultBuilding, 					Type, 									Description)
VALUES		('BUILDING_JFD_MILAN_INVESTMENTS', 	'BUILDINGCLASS_JFD_MILAN_INVESTMENTS', 	'TXT_KEY_BUILDING_JFD_MILAN_INVESTMENTS');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT OR REPLACE INTO Buildings 
			(Type, 								BuildingClass, 							GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	PrereqTech, NeverCapture,	Description, 								Help)
VALUES		('BUILDING_JFD_MILAN_INVESTMENTS', 	'BUILDINGCLASS_JFD_MILAN_INVESTMENTS',	-1,				-1, 	-1,			0,					NULL, 		1,				'TXT_KEY_BUILDING_JFD_MILAN_INVESTMENTS',	'TXT_KEY_BUILDING_JFD_MILAN_INVESTMENTS_HELP');

INSERT INTO Buildings 	
			(Type, 						Defense,	CapturePlunderModifier, BuildingClass, Cost, SpecialistType, SpecialistCount, TradeRouteRecipientBonus, TradeRouteTargetBonus, GoldMaintenance, PrereqTech,	Description, 						Civilopedia, 						Help, 									Strategy,								 	ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_PALAZZO'),	400,		100,					BuildingClass, Cost, SpecialistType, SpecialistCount, TradeRouteRecipientBonus, TradeRouteTargetBonus, GoldMaintenance, PrereqTech,	('TXT_KEY_BUILDING_JFD_PALAZZO'),	('TXT_KEY_CIV5_JFD_PALAZZO_TEXT'), 	('TXT_KEY_BUILDING_JFD_PALAZZO_HELP'), 	('TXT_KEY_BUILDING_JFD_PALAZZO_STRATEGY'),	ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 2, 				('JFD_MILAN_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_BANK');	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType, Flavor)
SELECT		('BUILDING_JFD_PALAZZO'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_BANK');	

INSERT INTO Building_Flavors 	
			(BuildingType, 				FlavorType,				Flavor)
VALUES		('BUILDING_JFD_PALAZZO',	'FLAVOR_GREAT_PEOPLE',	20),
			('BUILDING_JFD_PALAZZO',	'FLAVOR_CITY_DEFENSE',	10);
--==========================================================================================================================	
-- Building_HurryModifiers
--==========================================================================================================================	
INSERT INTO Building_HurryModifiers 	
			(BuildingType, 						HurryType,		HurryCostModifier)
VALUES		('BUILDING_JFD_MILAN_INVESTMENTS',	'HURRY_GOLD',	-5);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_JFD_PALAZZO'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_BANK');	
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================	
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_JFD_PALAZZO'),	YieldType, Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_BANK');	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_JFD_PALAZZO'),	YieldType, Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_BANK');	
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 									DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_JFD_SHUL',				'BUILDING_JFD_SHUL_GOLD',		'TXT_KEY_BUILDING_JFD_SHUL_GOLD'),
			('BUILDINGCLASS_JFD_ISINGLASS_TRADE',	'BUILDING_JFD_ISINGLASS_TRADE',	'TXT_KEY_BUILDING_JFD_ISINGLASS_TRADE');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 					BuildingClass, PrereqTech,			Cost, GoldMaintenance,  MinAreaSize, TradeRouteLandGoldBonus, 	ConquestProb, 	Description, 					Civilopedia, 						Help, 								Strategy,								ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_SHUL'),	BuildingClass, ('TECH_CURRENCY'),	Cost, 0,				MinAreaSize, 200, 						66, 			('TXT_KEY_BUILDING_JFD_SHUL'), 	('TXT_KEY_CIV5_JFD_SHUL_TEXT'),		('TXT_KEY_BUILDING_JFD_SHUL_HELP'), ('TXT_KEY_BUILDING_JFD_SHUL_STRATEGY'),	ArtDefineTag, 3, 				('JFD_KHAZARIA_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
			(Type, 						 		BuildingClass, 							NumTradeRouteBonus,	TradeRouteLandGoldBonus, 	Defense,	GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	 Description, 								Help)
VALUES		('BUILDING_JFD_ISINGLASS_TRADE', 	'BUILDINGCLASS_JFD_ISINGLASS_TRADE', 	2,					0, 							0,			-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_ISINGLASS_TRADE', 	'TXT_KEY_BUILDING_JFD_ISINGLASS_TRADE_HELP'),
			('BUILDING_JFD_BEK_MOUNTED_XP', 	'BUILDINGCLASS_JFD_SHUL',				0,					0, 							0,			-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_BEK_MOUNTED_XP', 		'TXT_KEY_BUILDING_JFD_BEK_MOUNTED_XP_HELP'),
			('BUILDING_JFD_SHUL_GOLD', 			'BUILDINGCLASS_JFD_SHUL',				0,					100, 						0,			-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_SHUL_GOLD', 			'TXT_KEY_BUILDING_JFD_SHUL_GOLD_HELP'),
			('BUILDING_JFD_NEGATIVE_DEFENSE', 	'BUILDINGCLASS_JFD_SHUL',				0,					0, 							-100,		-1, 			-1,		-1, 		null, 		1,				'TXT_KEY_BUILDING_JFD_NEGATIVE_DEFENSE',	'TXT_KEY_BUILDING_JFD_NEGATIVE_DEFENSE_HELP');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 			YieldType, Yield)
SELECT		('BUILDING_JFD_SHUL'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	
--==========================================================================================================================	
-- Building_UnitCombatFreeExperiences
--==========================================================================================================================	
INSERT INTO Building_UnitCombatFreeExperiences 	
			(BuildingType, 					UnitCombatType,			Experience)
VALUES		('BUILDING_JFD_BEK_MOUNTED_XP',	'UNITCOMBAT_MOUNTED',	10);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 			BuildingClassType)
SELECT		('BUILDING_JFD_SHUL'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_JFD_SHUL'),	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, 					Flavor)
VALUES		('BUILDING_JFD_SHUL',	'FLAVOR_I_LAND_TRADE_ROUTE', 	10),
			('BUILDING_JFD_SHUL',	'FLAVOR_I_TRADE_ORIGIN', 		10);
--==========================================================================================================================	
--==========================================================================================================================	
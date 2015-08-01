--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------	
INSERT INTO Improvements
		(Type,								BuildableOnResources,	SpecificCivRequired,	NearbyEnemyDamage,	CivilizationType,			   Description,							 Help,													Civilopedia,										 ArtDefineTag,						   DefenseModifier, PillageGold, PortraitIndex,	IconAtlas)
SELECT	('IMPROVEMENT_JFD_MOTTE_BAILEY'),	1,						1,						5,					('CIVILIZATION_JFD_NORMANDY'), ('TXT_KEY_IMPROVEMENT_MOTTE_BAILEY'), ('TXT_KEY_CIV5_IMPROVEMENTS_JFD_MOTTE_BAILEY_HELP'),	('TXT_KEY_CIV5_JFD_IMPROVEMENTS_MOTTE_BAILEY_TEXT'), ('ART_DEF_IMPROVEMENT_MOTTE_BAILEY'), DefenseModifier, PillageGold, 1,				('JFD_NORMANDY_IMPROVEMENT_ATLAS')
FROM Improvements WHERE (Type = 'IMPROVEMENT_FORT');
--------------------------------	
-- Improvement_ValidTerrains
--------------------------------		
INSERT INTO Improvement_ValidTerrains 	
		(ImprovementType, 					TerrainType)
SELECT	('IMPROVEMENT_JFD_MOTTE_BAILEY'),	TerrainType
FROM Improvement_ValidTerrains WHERE (ImprovementType = 'IMPROVEMENT_FORT');
--------------------------------	
-- Improvement_TechYieldChanges
--------------------------------		
INSERT INTO Improvement_TechYieldChanges 	
		(ImprovementType, 					TechType,		YieldType,		Yield)
SELECT	('IMPROVEMENT_JFD_MOTTE_BAILEY'),	TechType,		YieldType,		Yield
FROM Improvement_TechYieldChanges WHERE (ImprovementType = 'IMPROVEMENT_PASTURE');
--------------------------------
-- Improvement_ResourceTypes
--------------------------------
INSERT INTO Improvement_ResourceTypes 
		(ImprovementType, 					ResourceType)
VALUES	('IMPROVEMENT_JFD_MOTTE_BAILEY', 	'RESOURCE_HORSE'),	
		('IMPROVEMENT_JFD_MOTTE_BAILEY', 	'RESOURCE_SHEEP'),
		('IMPROVEMENT_JFD_MOTTE_BAILEY', 	'RESOURCE_COW');
--------------------------------
-- Improvement_ResourceType_Yields
--------------------------------
INSERT INTO Improvement_ResourceType_Yields 	
		(ImprovementType, 					ResourceType,		YieldType,		Yield)
SELECT	('IMPROVEMENT_JFD_MOTTE_BAILEY'),	ResourceType,		YieldType,		Yield
FROM Improvement_ResourceType_Yields WHERE (ImprovementType = 'IMPROVEMENT_PASTURE');

INSERT INTO Improvement_ResourceType_Yields
		(ImprovementType, 					ResourceType,		YieldType,		Yield)
VALUES	('IMPROVEMENT_JFD_MOTTE_BAILEY', 	'RESOURCE_HORSE',	'YIELD_GOLD',	1),	
		('IMPROVEMENT_JFD_MOTTE_BAILEY', 	'RESOURCE_SHEEP',	'YIELD_GOLD',	1),
		('IMPROVEMENT_JFD_MOTTE_BAILEY', 	'RESOURCE_COW',		'YIELD_GOLD',	1);
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
--------------------------------	
INSERT INTO Builds
		(Type,						PrereqTech, ImprovementType, 				  Time, Recommendation, Description,					Help,									 Recommendation,						Kill, CtrlDown, OrderPriority,	IconIndex,  IconAtlas,						HotKey, EntityEvent)
SELECT	('BUILD_JFD_MOTTE_BAILEY'),	PrereqTech, ('IMPROVEMENT_JFD_MOTTE_BAILEY'), Time, Recommendation, ('TXT_KEY_BUILD_MOTTE_BAILEY'),	('TXT_KEY_BUILD_JFD_MOTTE_BAILEY_HELP'), ('TXT_KEY_BUILD_MOTTE_BAILEY_REC'),	Kill, CtrlDown, 1,				0,			('JFD_NORMANDY_BUILD_ATLAS'),	HotKey,	EntityEvent
FROM Builds WHERE (Type = 'BUILD_FORT');
--------------------------------	
-- BuildFeatures
--------------------------------	
INSERT INTO BuildFeatures
		(BuildType, 				FeatureType, PrereqTech, Time, Remove)
SELECT	('BUILD_JFD_MOTTE_BAILEY'),	FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE (BuildType = 'BUILD_FORT');
--------------------------------	
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 
		(UnitType, 			BuildType)
VALUES	('UNIT_WORKER', 	'BUILD_JFD_MOTTE_BAILEY');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT	('UNIT_JFD_CHEVALIER'),		Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_CHEVALIER_DESC'), ('TXT_KEY_JFD_CHEVALIER_TEXT'), ('TXT_KEY_JFD_CHEVALIER_STRATEGY'), ('TXT_KEY_JFD_CHEVALIER_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_CHEVALIER'),	('JFD_CHEVALIER_FLAG_ART_ATLAS'), 	0,					2, 				('JFD_NORMANDY_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_KNIGHT');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	('UNIT_JFD_CHEVALIER'),		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_KNIGHT');
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	('UNIT_JFD_CHEVALIER'),		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_KNIGHT');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,	Flavor)
SELECT	('UNIT_JFD_CHEVALIER'),		FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_KNIGHT');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	('UNIT_JFD_CHEVALIER'),		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_KNIGHT');
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	('UNIT_JFD_CHEVALIER'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_KNIGHT');

DELETE FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_JFD_CHEVALIER') AND (PromotionType = 'PROMOTION_CITY_PENALTY');
INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_CHEVALIER', 		'PROMOTION_COVER_1'),
		('UNIT_JFD_CHEVALIER', 		'PROMOTION_COVER_2');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_JFD_CHEVALIER'),		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_JFD_WILLIAM_I', 			'TXT_KEY_LEADER_JFD_WILLIAM_I', 'TXT_KEY_LEADER_JFD_WILLIAM_I_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_WILLIAM_I', 	'WilliamI_Scene.xml',	7, 						2, 						3, 							8, 			5, 				4, 				5, 						4, 				5, 			4, 			4, 				4, 			3, 			'JFD_NORMANDY_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_WILLIAM_I', 			'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_WILLIAM_I', 			'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_WILLIAM_I', 			'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_JFD_WILLIAM_I', 			'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_WILLIAM_I', 			'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_WILLIAM_I', 			'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_JFD_WILLIAM_I', 			'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_WILLIAM_I', 			'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_WILLIAM_I', 			'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_WILLIAM_I', 			'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_JFD_WILLIAM_I', 			'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_WILLIAM_I', 			'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------			
-- Leader_Flavors
--------------------------------									
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_WILLIAM_I', 			'FLAVOR_OFFENSE', 					6),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_RECON', 					5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_RANGED', 					5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_MOBILE', 					7),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_AIR', 						3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_EXPANSION', 				2),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_GOLD', 						6),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_CULTURE', 					3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_HAPPINESS', 				3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_WONDER', 					3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_NUKE', 						2),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_ESPIONAGE', 				3),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_WILLIAM_I', 			'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_WILLIAM_I', 			'TRAIT_JFD_NORMANDY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 						ShortDescription,						FreeBuildingOnConquest)
VALUES	('TRAIT_JFD_NORMANDY', 				'TXT_KEY_TRAIT_JFD_NORMANDY', 		'TXT_KEY_TRAIT_JFD_NORMANDY_SHORT',		'BUILDING_CASTLE');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description,						ShortDescription, 						 Adjective, 							 Civilopedia,							CivilopediaTag,					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 						DawnOfManQuote,						 DawnOfManImage)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		('TXT_KEY_CIV_JFD_NORMANDY_DESC'),	('TXT_KEY_CIV_JFD_NORMANDY_SHORT_DESC'), ('TXT_KEY_CIV_JFD_NORMANDY_ADJECTIVE'), ('TXT_KEY_CIV5_JFD_NORMANDY_TEXT_1'),  ('TXT_KEY_CIV5_JFD_NORMANDY'),	('PLAYERCOLOR_JFD_NORMANDY'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_NORMANDY_ATLAS'), 0, 				('JFD_NORMANDY_ALPHA_ATLAS'), 	('England'), 	('JFD_NormandyMap_512.dds'),	('TXT_KEY_CIV5_DAWN_NORMANDY_TEXT'), ('WilliamI_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_FRANCE');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,					CityName)
VALUES  ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_1'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_2'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_3'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_4'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_5'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_6'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_7'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_8'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_9'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_10'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_11'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_12'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_13'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_14'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_15'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_16'),
        ('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_17'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_18'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_19'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_20'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_21'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_22'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_23'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_24'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_25'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_26'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_27'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_28'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_29'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_30'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_31'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_32'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_33'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_34'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_35'),
		('CIVILIZATION_JFD_NORMANDY',		'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NORMANDY_36');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	('CIVILIZATION_JFD_NORMANDY'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_JFD_NORMANDY'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--------------------------------	
-- Civilization_Leaders
--------------------------------	
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_NORMANDY',		'LEADER_JFD_WILLIAM_I');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_NORMANDY', 		'UNITCLASS_KNIGHT',		'UNIT_JFD_CHEVALIER');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
SELECT	('CIVILIZATION_JFD_NORMANDY'), 		ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_0'),	
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_1'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_2'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_3'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_4'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_5'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_6'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_7'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_8'),
		('CIVILIZATION_JFD_NORMANDY', 		'TXT_KEY_SPY_NAME_JFD_NORMANDY_9');
--==========================================================================================================================
--==========================================================================================================================
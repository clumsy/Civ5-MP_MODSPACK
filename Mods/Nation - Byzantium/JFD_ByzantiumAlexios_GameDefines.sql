--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 						 Description, 						 Help, 									  Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_LANTERNAS',  'TXT_KEY_PROMOTION_JFD_LANTERNAS',	 'TXT_KEY_PROMOTION_JFD_LANTERNAS_HELP',  'AS2D_IF_LEVELUP', 	1, 				48, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LANTERNAS');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 					Class, 	PrereqTech, RangedCombat, Range, Special, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						 Strategy, 								  Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,							MoveRate)
SELECT	('UNIT_JFD_LANTERNAS'), Class,	PrereqTech, RangedCombat, Range, Special, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_LANTERNAS'),	('TXT_KEY_CIV5_JFD_LANTERNAS_TEXT'), ('TXT_KEY_UNIT_JFD_LANTERNAS_STRATEGY'), ('TXT_KEY_UNIT_HELP_JFD_LANTERNAS'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_LANTERNAS'), 0,					('JFD_LANTERNAS_FLAG_ART_ATLAS'),	2, 				('JFD_BYZANTIUM_ALEXIOS_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_GALLEASS');

-- Cataphract
UPDATE Units
SET Class = 'UNITCLASS_KNIGHT', PrereqTech = 'TECH_CHIVALRY', Moves = 3, Combat = 23, Cost = 120, FaithCost = 240, ObsoleteTech = 'TECH_MILITARY_SCIENCE', GoodyHutUpgradeUnitClass = 'UNITCLASS_CAVALRY', Help = 'TXT_KEY_JFD_CATAPHRACT_HELP', Strategy = 'TXT_KEY_JFD_CATAPHRACT_STRATEGY'
WHERE Type = 'UNIT_BYZANTINE_CATAPHRACT';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	('UNIT_JFD_LANTERNAS'),		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GALLEASS');
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	('UNIT_JFD_LANTERNAS'),		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GALLEASS');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,	Flavor)
SELECT	('UNIT_JFD_LANTERNAS'),		FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GALLEASS');
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	('UNIT_JFD_LANTERNAS'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GALLEASS');

INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_LANTERNAS', 		'PROMOTION_JFD_LANTERNAS'),
		('UNIT_JFD_LANTERNAS', 		'PROMOTION_WITHDRAW_BEFORE_MELEE');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_JFD_LANTERNAS'),		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GALLEASS');		

-- Sipahi
UPDATE Unit_ClassUpgrades
SET UnitClassType = 'UNITCLASS_CAVALRY'
WHERE UnitType = 'UNIT_BYZANTINE_CATAPHRACT';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders		
		(Type, 							Description, 				 CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_ALEXIOS', 			'TXT_KEY_LEADER_JFD_ALEXIOS', 'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ALEXIOS', 	'AlexiosI_Scene.xml',	8, 						2, 						3, 							9, 			5, 				3, 				2, 						3, 				4, 			3, 			4, 				2, 			3, 			'JFD_BYZANTIUM_ALEXIOS_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ALEXIOS', 			'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_ALEXIOS', 			'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_ALEXIOS', 			'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_JFD_ALEXIOS', 			'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_JFD_ALEXIOS', 			'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_JFD_ALEXIOS', 			'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_ALEXIOS', 			'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ALEXIOS', 			'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_ALEXIOS', 			'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_ALEXIOS', 			'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_ALEXIOS', 			'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_ALEXIOS', 			'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------				
-- Leader_Flavors
--------------------------------										
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_ALEXIOS', 			'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_RECON', 					4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_RANGED', 					6),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_MOBILE', 					6),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_AIR', 						2),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_GOLD', 						6),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_SCIENCE', 					6),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_CULTURE', 					6),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_WONDER', 					2),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_RELIGION', 					6),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_NUKE', 						2),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_ALEXIOS', 			'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_ALEXIOS', 			'TRAIT_JFD_BYZANTIUM_ALEXIOS');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_JFD_BYZANTIUM_ALEXIOS', 'TXT_KEY_TRAIT_JFD_BYZANTIUM_ALEXIOS', 	'TXT_KEY_TRAIT_JFD_BYZANTIUM_ALEXIOS_SHORT');	
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,											Description,											GarrisonedCityRangeStrikeModifier)
VALUES	('POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_OFF', 'TXT_KEY_POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_OFF',	0),
		('POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_ON',	'TXT_KEY_POLICY_JFD_BYZANTIUM_ALEXIOS_GOLDEN_AGE_ON',	100);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 										Description,								ShortDescription, 									Adjective, 										 CivilopediaTag,	DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 								DawnOfManQuote,									DawnOfManImage)
SELECT	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),		('TXT_KEY_CIV_JFD_BYZANTIUM_ALEXIOS_DESC'),	('TXT_KEY_CIV_JFD_BYZANTIUM_ALEXIOS_SHORT_DESC'),	('TXT_KEY_CIV_JFD_BYZANTIUM_ALEXIOS_ADJECTIVE'),  CivilopediaTag,	('PLAYERCOLOR_JFD_BYZANTIUM_ALEXIOS'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_BYZANTIUM_ALEXIOS_ATLAS'), 0, 			('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS'), 	('Byzantium'), 	('JFD_ByzantiumAlexiosMap_512.dds'),	('TXT_KEY_CIV5_DAWN_BYZANTIUM_ALEXIOS_TEXT'),	('AlexiosI_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_BYZANTIUM');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
SELECT	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),		CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_BYZANTIUM');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_BYZANTIUM');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_BYZANTIUM');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_BYZANTIUM');
--------------------------------	
-- Civilization_Leaders
--------------------------------	
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',		'LEADER_JFD_ALEXIOS');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS', 		'UNITCLASS_GALLEASS',	'UNIT_JFD_LANTERNAS'),
		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS', 		'UNITCLASS_KNIGHT',		'UNIT_BYZANTINE_CATAPHRACT');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
SELECT	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_BYZANTIUM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
SELECT	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'), 	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_BYZANTIUM');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS', 	1);
--==========================================================================================================================
--==========================================================================================================================
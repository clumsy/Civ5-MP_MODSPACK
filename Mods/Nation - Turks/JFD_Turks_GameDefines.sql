--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 						 Description, 						 Help, 									Sound, 				CityAttack,	LostWithUpgrade,	CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_BOMBARD',	'TXT_KEY_PROMOTION_JFD_BOMBARD',	 'TXT_KEY_PROMOTION_JFD_BOMBARD_HELP',	'AS2D_IF_LEVELUP',	350,		1,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BOMBARD');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech,			Combat,   RangedCombat,	Range, Cost,	 ExtraMaintenanceCost,	FaithCost,		RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 					MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT	('UNIT_JFD_BOMBARD'),		Class, ('TECH_GUNPOWDER'),	Combat-2, 16,			Range, Cost+50,  0,						FaithCost+100,  RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_BOMBARD_DESC'), ('TXT_KEY_JFD_BOMBARD_TEXT'), ('TXT_KEY_JFD_BOMBARD_STRATEGY'), ('TXT_KEY_JFD_BOMBARD_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_BOMBARD'),	('JFD_BOMBARD_FLAG_ART_ATLAS'), 	0,					2, 				('JFD_TURKS_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_CANNON');

-- Janissary
UPDATE Units
SET Help = 'TXT_KEY_JFD_JANISSARY_HELP', Strategy = 'TXT_KEY_JFD_JANISSARY_STRATEGY'
WHERE Type = 'UNIT_OTTOMAN_JANISSARY';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	('UNIT_JFD_BOMBARD'),		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CANNON');
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	('UNIT_JFD_BOMBARD'),		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CANNON');
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType,	Flavor)
SELECT	('UNIT_JFD_BOMBARD'),		FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CANNON');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	('UNIT_JFD_BOMBARD'),		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_CANNON');
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
INSERT INTO Unit_FreePromotions 
		(UnitType, 					PromotionType)
VALUES	('UNIT_JFD_BOMBARD', 		'PROMOTION_RANGE'),
		('UNIT_JFD_BOMBARD', 		'PROMOTION_JFD_BOMBARD'),
		('UNIT_JFD_BOMBARD', 		'PROMOTION_SIGHT_PENALTY'),
		('UNIT_JFD_BOMBARD', 		'PROMOTION_MUST_SET_UP'),
		('UNIT_JFD_BOMBARD', 		'PROMOTION_NO_DEFENSIVE_BONUSES');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_JFD_BOMBARD'),		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CANNON');	
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 				 CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES	('LEADER_JFD_MEHMED', 			'TXT_KEY_LEADER_JFD_MEHMED', 'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_MEHMED', 	'Mehmed_Scene.xml',	8, 						2, 						3, 							7, 			4, 				2, 				4, 						3, 				3, 			3, 			4, 				2, 			7, 			'JFD_TURKS_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MEHMED', 			'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_MEHMED', 			'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JFD_MEHMED', 			'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_MEHMED', 			'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_MEHMED', 			'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_JFD_MEHMED', 			'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_MEHMED', 			'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MEHMED', 			'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_MEHMED', 			'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_MEHMED', 			'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_MEHMED', 			'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_MEHMED', 			'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------			
-- Leader_Flavors
--------------------------------									
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_MEHMED', 			'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_MEHMED', 			'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_MEHMED', 			'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_MEHMED', 			'FLAVOR_RECON', 					4),
		('LEADER_JFD_MEHMED', 			'FLAVOR_RANGED', 					7),
		('LEADER_JFD_MEHMED', 			'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_NAVAL', 					3),
		('LEADER_JFD_MEHMED', 			'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_AIR', 						2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_MEHMED', 			'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JFD_MEHMED', 			'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_GOLD', 						4),
		('LEADER_JFD_MEHMED', 			'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_MEHMED', 			'FLAVOR_CULTURE', 					6),
		('LEADER_JFD_MEHMED', 			'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_MEHMED', 			'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_JFD_MEHMED', 			'FLAVOR_WONDER', 					2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_RELIGION', 					5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_MEHMED', 			'FLAVOR_NUKE', 						2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_ESPIONAGE', 				4),
		('LEADER_JFD_MEHMED', 			'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_MEHMED', 			'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_MEHMED', 			'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_MEHMED', 			'TRAIT_JFD_TURKS');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 					ShortDescription)
VALUES	('TRAIT_JFD_TURKS', 			'TXT_KEY_TRAIT_JFD_TURKS', 		'TXT_KEY_TRAIT_JFD_TURKS_SHORT');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,									Description,				HappinessPerGarrisonedUnit)
VALUES	('POLICY_JFD_TURKS_GARRISON_CULTURE',	'TXT_KEY_TRAIT_JFD_TURKS',	1);	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 							Description,					ShortDescription, 						Adjective, 							  CivilopediaTag,	DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 						DawnOfManQuote,						DawnOfManImage)
SELECT	('CIVILIZATION_JFD_TURKS'),		('TXT_KEY_CIV_JFD_TURKS_DESC'),	('TXT_KEY_CIV_JFD_TURKS_SHORT_DESC'),	('TXT_KEY_CIV_JFD_TURKS_ADJECTIVE'),  CivilopediaTag,	('PLAYERCOLOR_JFD_TURKS'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_TURKS_ATLAS'), 0, 			('JFD_TURKS_ALPHA_ATLAS'), 	('Ottoman'), 	('JFD_TurksMehmedMap_512.dds'),	('TXT_KEY_CIV5_DAWN_TURKS_TEXT'),	('Mehmed_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_OTTOMAN');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_BURSA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_EDIRNE'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_ANKARA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_KONYA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_SAMSUN'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_GAZIANTEP'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_DIYARBAKIR'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_IZMIR'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_KAYSERI'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_MALATYA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_MARSIN'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_ANTALYA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_ZONGULDAK'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_DENIZLI'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_OIDU'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_MUGLA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_ESKISEHIR'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_INEBOLU'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_SINOP'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_ADANA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_TARSUS'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_ARTUIN'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_BODRUM'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_EREGLI'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_SILIFKE'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_SIVAS'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_AMASYA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_MARMARIS'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_TRABZON'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_ERZURUM'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_URFA'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_IZMIT'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_BITLIS'),
		('CIVILIZATION_JFD_TURKS', 	'TXT_KEY_CITY_NAME_MARMARIS');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	('CIVILIZATION_JFD_TURKS'),		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_OTTOMAN');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_JFD_TURKS'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_OTTOMAN');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_JFD_TURKS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_OTTOMAN');
--------------------------------	
-- Civilization_Leaders
--------------------------------	
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_TURKS',		'LEADER_JFD_MEHMED');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_OTTOMAN', 		'BUILDINGCLASS_GARDEN',		'BUILDING_JFD_HAMMAM');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_OTTOMAN_JANISSARY';	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_TURKS', 		'UNITCLASS_CANNON',		'UNIT_JFD_BOMBARD'),
		('CIVILIZATION_JFD_TURKS', 		'UNITCLASS_MUSKETMAN',	'UNIT_OTTOMAN_JANISSARY');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
SELECT	('CIVILIZATION_JFD_TURKS'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_OTTOMAN');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
SELECT	('CIVILIZATION_JFD_TURKS'), 	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_OTTOMAN');
--==========================================================================================================================
--==========================================================================================================================
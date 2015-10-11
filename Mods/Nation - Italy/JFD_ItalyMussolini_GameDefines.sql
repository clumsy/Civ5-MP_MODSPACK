--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
			(Type, 										DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_ITALIAN_PRODUCTION', 	'BUILDING_JFD_ITALIAN_PRODUCTION', 		'TXT_KEY_BUILDING_JFD_ITALIAN_PRODUCTION_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings		
			(Type, 								BuildingClass, 			  				BuildingProductionModifier, Cost, 	FaithCost,	GreatWorkCount, PlotCultureCostModifier, Help,												Description, 									NeverCapture)
VALUES		('BUILDING_JFD_ITALIAN_PRODUCTION', 'BUILDINGCLASS_JFD_ITALIAN_PRODUCTION', 15,							-1, 	-1,			-1,				-1,						 'TXT_KEY_BUILDING_JFD_ITALIAN_PRODUCTION_HELP',		'TXT_KEY_BUILDING_JFD_ITALIAN_PRODUCTION', 		1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_JFD_MUSSOLINI', 	'TXT_KEY_LEADER_JFD_MUSSOLINI', 'TXT_KEY_LEADER_JFD_MUSSOLINI_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_MUSSOLINI', 	'Mussolini_Scene.xml',	8, 						3, 						6, 							8, 			4, 				4, 				4, 						4, 				3, 			4, 			2, 				2, 			4, 			'JFD_ITALY_ATLAS', 1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_MUSSOLINI', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_MUSSOLINI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_MUSSOLINI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_JFD_MUSSOLINI', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JFD_MUSSOLINI', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_MUSSOLINI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_MUSSOLINI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------		
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_MUSSOLINI', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_MUSSOLINI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_MUSSOLINI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_MUSSOLINI', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_JFD_MUSSOLINI', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_MUSSOLINI', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_RECON', 					6),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_RANGED', 					5),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_NAVAL', 					8),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_NAVAL_RECON', 				7),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_NAVAL_GROWTH', 				7),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_GROWTH', 					4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_GOLD', 						4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_GREAT_PEOPLE', 				3),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_AIRLIFT', 					1),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_MUSSOLINI', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_MUSSOLINI', 	'TRAIT_JFD_ITALY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription)
VALUES		('TRAIT_JFD_ITALY',		'TXT_KEY_TRAIT_JFD_ITALY', 		'TXT_KEY_TRAIT_JFD_ITALY_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 									Description, 									Help, 												Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_CARABINEIRI', 			'TXT_KEY_PROMOTION_JFD_CARABINEIRI', 			'TXT_KEY_PROMOTION_JFD_CARABINEIRI_HELP',			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CARABINEIRI'),
			('PROMOTION_JFD_CARABINEIRI_POLICING', 	'TXT_KEY_PROMOTION_JFD_CARABINEIRI_POLICING', 	'TXT_KEY_PROMOTION_JFD_CARABINEIRI_POLICING_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CARABINEIRI_POLICING');
------------------------------	
-- UnitPromotions_UnitCombatMods
------------------------------		
INSERT INTO UnitPromotions_UnitCombatMods
			(PromotionType,					UnitCombatType,		Modifier)
VALUES		('PROMOTION_JFD_CARABINEIRI',	'UNITCOMBAT_GUN',	15);
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		Class,		('UNIT_JFD_CARABINEIRI'), 	PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_CARABINEIRI'), ('TXT_KEY_CIV5_JFD_CARABINEIRI_TEXT'), 	('TXT_KEY_UNIT_JFD_CARABINEIRI_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_CARABINEIRI'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_CARABINEIRI'), 	0,					('JFD_CARABINEIRI_FLAG_ART_ATLAS'),	2, 				('JFD_ITALY_ATLAS')
FROM Units WHERE (Type = 'UNIT_INFANTRY');

INSERT INTO Units 	
			(Class, 	Type, 								PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 											Strategy, 										Help, 										MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Pillage, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 								UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		Class,		('UNIT_JFD_CAIO_DUILIO_CLASS'), 	PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_CAIO_DUILIO_CLASS'),	('TXT_KEY_CIVILOPEDIA_UNITS_CAIO_DUILIO_CLASS_TEXT'), 	('TXT_KEY_UNIT_CAIO_DUILIO_CLASS_STRATEGY'), 	('TXT_KEY_UNIT_HELP_CAIO_DUILIO_CLASS'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Pillage, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_CONFEDERATE_IRONCLAD'), 	1,					('CIVIL_WAR_UNIT_FLAG_ATLAS'),	3, 				('CIVIL_WAR_UNIT_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_IRONCLAD');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_CARABINEIRI'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_CAIO_DUILIO_CLASS'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_CARABINEIRI'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_JFD_CAIO_DUILIO_CLASS'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_CARABINEIRI'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_CAIO_DUILIO_CLASS'), UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_CARABINEIRI'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_CAIO_DUILIO_CLASS'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_JFD_CAIO_DUILIO_CLASS'), ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_CARABINEIRI'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_INFANTRY');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_CAIO_DUILIO_CLASS'), UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_IRONCLAD');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_CARABINEIRI', 		'PROMOTION_JFD_CARABINEIRI'),
			('UNIT_JFD_CARABINEIRI', 		'PROMOTION_JFD_CARABINEIRI_POLICING'),
			('UNIT_JFD_CAIO_DUILIO_CLASS', 	'PROMOTION_STEAM_POWERED'),
			('UNIT_JFD_CAIO_DUILIO_CLASS', 	'PROMOTION_HEAVY_PAYLOAD'),
			('UNIT_JFD_CAIO_DUILIO_CLASS', 	'PROMOTION_COASTAL_RAIDER_1');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations
			(Type, 							Description, 					ShortDescription, 						Adjective, 								Civilopedia,						CivilopediaTag,				DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_ITALY'), 	('TXT_KEY_CIV_JFD_ITALY_DESC'), ('TXT_KEY_CIV_JFD_ITALY_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_ITALY_ADJECTIVE'),	('TXT_KEY_CIV5_JFD_ITALY_TEXT_1'),	('TXT_KEY_CIV5_JFD_ITALY'), ('PLAYERCOLOR_JFD_ITALY'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_ITALY_ATLAS'),	0, 				('JFD_ITALY_ALPHA_ATLAS'), ('Rome'), 		('ItalyMap512.dds'), 	('TXT_KEY_CIV_JFD_MUSSOLINI_DAWN'), 	('DOM_Mussolini.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_NAME_ROME'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_MILAN'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_NAPLES'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_TURIN'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_PALERMO'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_VENICE'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_GENOA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_FLORENCE'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_BOLOGNA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_BARI'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_CATANIA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_VERONA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_PARMA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_LIVORNO'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_CAGLIARI'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_FOGGIA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_SALERNO'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_FORLI'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_PISA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_ASTI'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_MESSINA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_TRIESTE'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_PRATO'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_VICENZA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_BRESCIA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_MODENA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_PADUA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_SIRACUSA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_FERRARA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_NOVARA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_TARANTO'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_PERUGIA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_LATINA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_BERGAMO'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_PESCARA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_MONZA'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_SASSARI'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_RIMINI'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_TERNI'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_CITY_JFD_ITALY_VITTORIA');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------	
INSERT INTO Civilization_FreeBuildingClasses
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_ITALY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_ITALY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_ITALY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--------------------------------	
-- Civilization_Leaders
--------------------------------	
INSERT INTO Civilization_Leaders
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_ITALY',		'LEADER_JFD_MUSSOLINI');
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_ITALY', 		'UNITCLASS_INFANTRY',	'UNIT_JFD_CARABINEIRI'),
			('CIVILIZATION_JFD_ITALY', 		'UNITCLASS_IRONCLAD', 	'UNIT_JFD_CAIO_DUILIO_CLASS');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_0'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_1'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_2'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_3'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_4'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_5'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_6'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_7'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_8'),
			('CIVILIZATION_JFD_ITALY', 		'TXT_KEY_SPY_NAME_JFD_ITALY_9');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean
			(CivilizationType, 				StartAlongOcean)
VALUES		('CIVILIZATION_JFD_ITALY', 		1);
--==========================================================================================================================
--==========================================================================================================================
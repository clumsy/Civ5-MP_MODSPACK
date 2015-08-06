
INSERT INTO Units 	
			(Type, 					Class, 	PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 				   Civilopedia, 					Strategy, 							 Help, 							  MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_ANZAC'),		Class,	PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_ANZAC'),  ('TXT_KEY_UNIT_JFD_ANZAC_TEXT'), ('TXT_KEY_UNIT_JFD_ANZAC_STRATEGY'), ('TXT_KEY_UNIT_HELP_JFD_ANZAC'), MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_ANZAC'), 0,					('JFD_ANZAC_FLAG_ART_ATLAS'),	2, 				('JFD_NEW_ZEALAND_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');

INSERT INTO Units 	
			(Type, 					Class, 	PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					 Civilopedia, 						 Strategy, 								 Help, 								 MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Pillage, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		('UNIT_JFD_DEFENDER'), 	Class,	PrereqTech, Combat,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_DEFENDER'), ('TXT_KEY_UNIT_JFD_DEFENDER_TEXT'), ('TXT_KEY_UNIT_JFD_DEFENDER_STRATEGY'), ('TXT_KEY_UNIT_HELP_JFD_DEFENDER'), MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Pillage, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_DEFENDER'), 	0,					('JFD_DEFENDER_FLAG_ART_ATLAS'),	3, 				('JFD_NEW_ZEALAND_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_IRONCLAD');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_ANZAC'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DEFENDER'),		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_ANZAC'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_DEFENDER'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_ANZAC'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_DEFENDER'),		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_ANZAC'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_DEFENDER'),		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 					ResourceType)
SELECT		('UNIT_JFD_DEFENDER'),		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_IRONCLAD');	
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_JFD_DEFENDER'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_IRONCLAD');

DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_DEFENDER' AND PromotionType = 'PROMOTION_FIRE_SUPPORT';
INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_ANZAC', 			'PROMOTION_JFD_ANZAC'),
			('UNIT_JFD_DEFENDER', 		'PROMOTION_EXTRA_SIGHT_I'),
			('UNIT_JFD_DEFENDER', 		'PROMOTION_JFD_DEFENDER_INFO');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_SEDDON', 		'TXT_KEY_LEADER_JFD_SEDDON', 	'TXT_KEY_LEADER_JFD_SEDDON_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_SEDDON', 	'Seddon_Scene.xml',		6, 						2, 						3, 							6, 			5, 				3, 				5, 						4, 				2, 			2, 			3, 				4, 			7, 			'JFD_NEW_ZEALAND_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_SEDDON', 		'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_SEDDON', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_SEDDON', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_JFD_SEDDON', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_SEDDON', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_SEDDON', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_SEDDON', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_SEDDON', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_SEDDON', 		'MINOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_SEDDON', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_SEDDON', 		'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_JFD_SEDDON', 		'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_SEDDON', 		'FLAVOR_OFFENSE', 					5),
			('LEADER_JFD_SEDDON', 		'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_JFD_SEDDON', 		'FLAVOR_RECON', 					6),
			('LEADER_JFD_SEDDON', 		'FLAVOR_RANGED', 					3),
			('LEADER_JFD_SEDDON', 		'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_SEDDON', 		'FLAVOR_NAVAL', 					7),
			('LEADER_JFD_SEDDON', 		'FLAVOR_NAVAL_RECON', 				7),
			('LEADER_JFD_SEDDON', 		'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_JFD_SEDDON', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JFD_SEDDON', 		'FLAVOR_AIR', 						3),
			('LEADER_JFD_SEDDON', 		'FLAVOR_EXPANSION', 				12),
			('LEADER_JFD_SEDDON', 		'FLAVOR_GROWTH', 					7),
			('LEADER_JFD_SEDDON', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_INFRASTRUCTURE', 			3),
			('LEADER_JFD_SEDDON', 		'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_GOLD', 						6),
			('LEADER_JFD_SEDDON', 		'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_SEDDON', 		'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_SEDDON', 		'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_WONDER', 					6),
			('LEADER_JFD_SEDDON', 		'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_SEDDON', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_SEDDON', 		'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_SEDDON', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_SEDDON', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_SEDDON', 		'FLAVOR_ESPIONAGE', 				3),
			('LEADER_JFD_SEDDON', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_SEDDON', 		'FLAVOR_I_TRADE_DESTINATION', 		8),
			('LEADER_JFD_SEDDON', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_SEDDON', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
			('LEADER_JFD_SEDDON', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		8),
			('LEADER_JFD_SEDDON', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_SEDDON', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_SEDDON', 		'TRAIT_JFD_NEW_ZEALAND');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 							Description, 						ShortDescription)
VALUES		('TRAIT_JFD_NEW_ZEALAND', 		'TXT_KEY_TRAIT_JFD_NEW_ZEALAND', 	'TXT_KEY_TRAIT_JFD_NEW_ZEALAND_SHORT');	
--==========================================================================================================================	
-- MINOR CIVILIZATIONS
--==========================================================================================================================	
-- MinorCivilizations
--------------------------------			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_PORT_VILA_DESC', ShortDescription = 'TXT_KEY_CITYSTATE_JFD_PORT_VILA_SHORT_DESC', Adjective = 'TXT_KEY_CITYSTATE_JFD_PORT_VILA_ADJECTIVE', Civilopedia = 'TXT_KEY_CIV5_JFD_PORT_VILA_TEXT_1'
WHERE Type = 'MINOR_CIV_WELLINGTON';
--------------------------------		
-- MinorCivilization_CityNames
--------------------------------			
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_PORT_VILA_DESC'
WHERE MinorCivType = 'MINOR_CIV_WELLINGTON';
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 								Description,							ShortDescription, 							 Adjective, 								 Civilopedia,								CivilopediaTag,						DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote,								DawnOfManImage)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'),	('TXT_KEY_CIV_JFD_NEW_ZEALAND_DESC'),	('TXT_KEY_CIV_JFD_NEW_ZEALAND_SHORT_DESC'),  ('TXT_KEY_CIV_JFD_NEW_ZEALAND_ADJECTIVE'),  ('TXT_KEY_CIV5_JFD_NEW_ZEALAND_TEXT_1'),   ('TXT_KEY_CIV5_JFD_NEW_ZEALAND'),	('PLAYERCOLOR_JFD_NEW_ZEALAND'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_NEW_ZEALAND_ATLAS'), 	0, 				('JFD_NEW_ZEALAND_ALPHA_ATLAS'), 	('England'), 	('NewZealandMap512.dds'),	('TXT_KEY_CIV5_DAWN_NEW_ZEALAND_TEXT'),		('Seddon_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SWEDEN');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
            (CivilizationType,                 CityName)
VALUES      ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_1'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_2'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_3'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_4'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_5'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_6'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_7'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_8'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_9'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_10'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_11'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_12'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_13'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_14'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_15'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_16'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_17'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_18'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_19'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_20'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_21'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_22'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_23'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_24'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_25'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_26'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_27'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_28'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_29'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_30'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_31'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_32'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_33'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_34'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_35'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_36'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_37'),
            ('CIVILIZATION_JFD_NEW_ZEALAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_JFD_NEW_ZEALAND_38');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');

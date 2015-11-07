--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 						Adjective, 								Civilopedia, 						CivilopediaTag, 				DefaultPlayerColor,		 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				AlphaIconAtlas, 			 PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					   DawnOfManImage)
SELECT		('CIVILIZATION_TCM_HYKSOS'), 	('TXT_KEY_CIV_TCM_HYKSOS_DESC'), 	('TXT_KEY_CIV_TCM_HYKSOS_SHORT_DESC'), ('TXT_KEY_CIV_TCM_HYKSOS_ADJECTIVE'), 	('TXT_KEY_CIV5_TCM_HYKSOS_TEXT_1'),	('TXT_KEY_CIV5_TCM_HYKSOS'), 	('PLAYERCOLOR_TCM_HYKSOS'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_HYKSOS_ATLAS'),  ('TCM_HYKSOS_ALPHA_ATLAS'),  0, 				('EGYPT'),	 	('tcmHyksosMap.dds'), 	('TXT_KEY_CIV5_DOM_TCM_HYKSOS_TEXT'), ('tcmHyksosDOM.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_EGYPT';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_01'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_02'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_03'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_04'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_05'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_06'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_07'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_08'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_09'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_10'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_11'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_12'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_13'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_14'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_15'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_16'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_17'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_18'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_19'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_20'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_21'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_22'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_23'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_24'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_25'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_26'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_27'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_28'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_29'),
			('CIVILIZATION_TCM_HYKSOS', 		'TXT_KEY_CITY_NAME_TCM_HYKSOS_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_TCM_HYKSOS', 	'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_TCM_HYKSOS'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_HYKSOS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_EGYPT';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_TCM_HYKSOS', 	'LEADER_TCM_APOPHIS');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_TCM_HYKSOS', 	'UNITCLASS_CHARIOT_ARCHER', 	'UNIT_TCM_HEQA_KHASUT_NOT_FORT');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_TCM_HYKSOS', 	'BUILDINGCLASS_BARRACKS', 	'BUILDING_TCM_MEKTER');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_TCM_HYKSOS', 	'RELIGION_JUDAISM');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_0'),	
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_1'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_2'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_3'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_4'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_5'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_6'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_7'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_8'),
			('CIVILIZATION_TCM_HYKSOS', 	'TXT_KEY_SPY_NAME_TCM_HYKSOS_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_River 
			(CivilizationType, 			StartAlongRiver)
VALUES		('CIVILIZATION_TCM_HYKSOS', 	1);	
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_HYKSOS_ICON',			0.788,	0.259,	0.169,	1),
			('COLOR_PLAYER_TCM_HYKSOS_BACKGROUND',		0.294,	0,		0.055,		1); 
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_TCM_HYKSOS',			'COLOR_PLAYER_TCM_HYKSOS_ICON', 		'COLOR_PLAYER_TCM_HYKSOS_BACKGROUND', 			'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 								CivilopediaTag, 					 ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_TCM_APOPHIS', 		'TXT_KEY_LEADER_TCM_APOPHIS', 		'TXT_KEY_LEADER_TCM_APOPHIS_PEDIA_TEXT', 	'TXT_KEY_LEADER_TCM_APOPHIS_PEDIA', 'tcmApophisScene.xml',	7, 						6, 						5, 							8, 			5, 				4, 				7, 						3, 				2, 			6, 			2, 				7, 			9, 			'TCM_HYKSOS_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_APOPHIS', 	'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_TCM_APOPHIS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_TCM_APOPHIS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
			('LEADER_TCM_APOPHIS', 	'MAJOR_CIV_APPROACH_GUARDED', 		3),
			('LEADER_TCM_APOPHIS', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_TCM_APOPHIS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_TCM_APOPHIS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_APOPHIS', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_TCM_APOPHIS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_TCM_APOPHIS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_TCM_APOPHIS', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_TCM_APOPHIS', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_TCM_APOPHIS', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_RECON', 					5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_RANGED', 					6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_MOBILE', 					6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_NAVAL', 					3),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_AIR', 						5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_GROWTH', 					6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_GOLD', 						5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_CULTURE', 					6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_WONDER', 					7),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_RELIGION', 					7),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_SPACESHIP', 				6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_NUKE', 						7),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_USE_NUKE', 					9),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_APOPHIS', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_TCM_APOPHIS', 	'TRAIT_TCM_APOPHIS_HYKSOS');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 							Description, 							ShortDescription)
VALUES		('TRAIT_TCM_APOPHIS_HYKSOS', 	'TXT_KEY_TRAIT_TCM_APOPHIS_HYKSOS', 	'TXT_KEY_TRAIT_TCM_APOPHIS_HYKSOS_SHORT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_APOPHIS_PEACE', 	'tcmHyksosPeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_APOPHIS_WAR',	'tcmHyksosWar', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_APOPHIS_PEACE', 		'SND_LEADER_MUSIC_TCM_APOPHIS_PEACE', 	'GAME_MUSIC', 	80, 		80, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_APOPHIS_WAR', 			'SND_LEADER_MUSIC_TCM_APOPHIS_WAR', 	'GAME_MUSIC', 	80, 		80, 		1,			0);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 			DefaultBuilding, 									Description)
VALUES		('BUILDINGCLASS_TCM_HYKSOS_DUMMY', 		'BUILDING_TCM_DUMMY_HYKSOS_SCIENCE_AND_CULTURE', 	'TXT_KEY_TRAIT_TCM_APOPHIS_HYKSOS_SHORT');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 					    BuildingClass, Cost, GoldMaintenance, PrereqTech, NeverCapture,	Description,						Help,									Civilopedia,						Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, IconAtlas,				PortraitIndex)
SELECT		('BUILDING_TCM_MEKTER'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, NeverCapture,	('TXT_KEY_BUILDING_TCM_MEKTER'),	('TXT_KEY_BUILDING_TCM_MEKTER_HELP'),	('TXT_KEY_CIV5_TCM_MEKTER_TEXT'),	('TXT_KEY_BUILDING_TCM_MEKTER_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, ('TCM_HYKSOS_ATLAS'), 	3
FROM Buildings WHERE Type = 'BUILDING_BARRACKS';		

INSERT INTO Buildings 	
			(Type, 													 BuildingClass, 					GreatWorkCount, Cost, FaithCost, NukeImmune, ConquestProb, PrereqTech,	Description, 								Help,										PortraitIndex, 	IconAtlas)
VALUES		('BUILDING_TCM_DUMMY_HYKSOS_SCIENCE_AND_CULTURE',		'BUILDINGCLASS_TCM_HYKSOS_DUMMY', 	-1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_TRAIT_TCM_APOPHIS_HYKSOS_SHORT', 	'TXT_KEY_TRAIT_TCM_APOPHIS_HYKSOS_SHORT',	0, 				'TCM_HYKSOS_ATLAS');
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,						Flavor)
VALUES		('BUILDING_TCM_MEKTER', 	'FLAVOR_MILITARY_TRAINING',		40);
--==========================================================================================================================	
-- Building_DomainFreeExperiences
--==========================================================================================================================					
INSERT INTO Building_DomainFreeExperiences 
			(BuildingType, 				DomainType,			Experience)
VALUES		('BUILDING_TCM_MEKTER', 	'DOMAIN_LAND',		15),
			('BUILDING_TCM_MEKTER', 	'DOMAIN_SEA',		15),
			('BUILDING_TCM_MEKTER', 	'DOMAIN_AIR',		15);
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_YieldChanges 
			(BuildingType, 										YieldType,			Yield)
VALUES		('BUILDING_TCM_DUMMY_HYKSOS_SCIENCE_AND_CULTURE',	'YIELD_SCIENCE',	1),
			('BUILDING_TCM_DUMMY_HYKSOS_SCIENCE_AND_CULTURE',	'YIELD_CULTURE',	1);
--==========================================================================================================================
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 					  			PrereqTech, Range, Combat, RangedCombat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 													Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 		IconAtlas,			MoveRate)
SELECT		Class,		('UNIT_TCM_HEQA_KHASUT_NOT_FORT'),  PrereqTech,	Range, Combat, 11, 			 Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_HEQA_KHASUT'), ('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TCM_HEQA_KHASUT_TEXT'), 	('TXT_KEY_UNIT_TCM_HEQA_KHASUT_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_HEQA_KHASUT'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_TCM_HEQA_KHASUT'),	0,					('TCM_UNIT_FLAG_HEQA_KHASUT_ATLAS'), 2, 				('TCM_HYKSOS_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_CHARIOT_ARCHER');

INSERT INTO Units 	
			(Class, 	Type, 					  		PrereqTech, WorkRate, Range, Combat, RangedCombat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 													Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 		IconAtlas,			MoveRate)
SELECT		Class,		('UNIT_TCM_HEQA_KHASUT_FORT'),  -1, 		115,	  Range, Combat, 11, 			 -1,   -1, 			 -1, 		-1, 						  Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_HEQA_KHASUT'), ('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TCM_HEQA_KHASUT_TEXT'), 	('TXT_KEY_UNIT_TCM_HEQA_KHASUT_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_HEQA_KHASUT'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_TCM_HEQA_KHASUT'),	0,					('TCM_UNIT_FLAG_HEQA_KHASUT_ATLAS'), 2, 				('TCM_HYKSOS_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_CHARIOT_ARCHER');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_HEQA_KHASUT_FORT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_HEQA_KHASUT_NOT_FORT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_HEQA_KHASUT_FORT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');	

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_HEQA_KHASUT_NOT_FORT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
VALUES		('UNIT_TCM_HEQA_KHASUT_FORT', 		'UNITCLASS_KNIGHT'),
			('UNIT_TCM_HEQA_KHASUT_NOT_FORT', 	'UNITCLASS_KNIGHT');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,				Flavor)
VALUES		('UNIT_TCM_HEQA_KHASUT_FORT', 	'FLAVOR_OFFENSE',		4),
			('UNIT_TCM_HEQA_KHASUT_FORT', 	'FLAVOR_RANGED',		9),
			('UNIT_TCM_HEQA_KHASUT_FORT', 	'FLAVOR_MOBILE',		3);
--==========================================================================================================================	
-- Unit_FreePromotions
--==========================================================================================================================		
INSERT INTO Unit_FreePromotions 	
			(UnitType, 									PromotionType)
VALUES		('UNIT_TCM_HEQA_KHASUT_FORT', 				'PROMOTION_ROUGH_TERRAIN_ENDS_TURN'),
			('UNIT_TCM_HEQA_KHASUT_FORT', 				'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_TCM_HEQA_KHASUT_FORT',				'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_TCM_HEQA_KHASUT_NOT_FORT', 			'PROMOTION_ROUGH_TERRAIN_ENDS_TURN'),
			('UNIT_TCM_HEQA_KHASUT_NOT_FORT', 			'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_TCM_HEQA_KHASUT_NOT_FORT',			'PROMOTION_ONLY_DEFENSIVE');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_TCM_HEQA_KHASUT_FORT', 	'BUILD_FORT');
--==========================================================================================================================	
--==========================================================================================================================
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_APOPHIS','RESPONSE_FIRST_GREETING','TXT_KEY_LEADER_TCM_APOPHIS_FIRSTGREETING%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_APOPHIS','RESPONSE_DEFEATED','TXT_KEY_LEADER_TCM_APOPHIS_DEFEATED%','1');
--==========================================================================================================================	
--==========================================================================================================================	
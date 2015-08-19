--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 						Description, 					ShortDescription, 					 Adjective, 							Civilopedia, 						CivilopediaTag, 			DefaultPlayerColor,		  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,			AlphaIconAtlas, 		 PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_TCM_SONG'), 	('TXT_KEY_CIV_TCM_SONG_DESC'), 	('TXT_KEY_CIV_TCM_SONG_SHORT_DESC'), ('TXT_KEY_CIV_TCM_SONG_ADJECTIVE'), 	('TXT_KEY_CIV5_TCM_SONG_TEXT_1'),	('TXT_KEY_CIV5_TCM_SONG'), 	('PLAYERCOLOR_TCM_SONG'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_SONG_ATLAS'),  ('TCM_SONG_ALPHA_ATLAS'),  0, 			('CHINA'),	 	('tcmSongMap.dds'), 	('TXT_KEY_CIV5_DOM_TCM_SONG_TEXT'), ('tcmSongDOM.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_01'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_02'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_03'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_04'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_05'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_06'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_07'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_08'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_09'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_10'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_11'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_12'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_13'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_14'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_15'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_16'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_17'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_18'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_19'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_20'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_21'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_22'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_23'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_24'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_25'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_26'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_27'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_28'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_29'),
			('CIVILIZATION_TCM_SONG', 		'TXT_KEY_CITY_NAME_TCM_SONG_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_TCM_SONG', 		'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
SELECT		('CIVILIZATION_TCM_SONG'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_SONG'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_TCM_SONG', 	'LEADER_TCM_TAIZU');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_TCM_SONG', 	'UNITCLASS_GALLEASS', 	'UNIT_TCM_JUNK_SHIP'),
			('CIVILIZATION_TCM_SONG', 	'UNITCLASS_MUSKETMAN', 	'UNIT_TCM_FIRE_LANCER');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_TCM_SONG', 	'RELIGION_CONFUCIANISM');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_0'),	
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_1'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_2'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_3'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_4'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_5'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_6'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_7'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_8'),
			('CIVILIZATION_TCM_SONG', 	'TXT_KEY_SPY_NAME_TCM_SONG_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_River 
			(CivilizationType, 			StartAlongRiver)
VALUES		('CIVILIZATION_TCM_SONG', 	1);	
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_SONG_ICON',				0.788,	0.627,	0.314,	1),
			('COLOR_PLAYER_TCM_SONG_BACKGROUND',		0.176,	0.161,	0.494,	1); 
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 						SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_TCM_SONG',			'COLOR_PLAYER_TCM_SONG_ICON', 		'COLOR_PLAYER_TCM_SONG_BACKGROUND', 			'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 				  ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_TCM_TAIZU', 		'TXT_KEY_LEADER_TCM_TAIZU', 		'TXT_KEY_LEADER_TCM_TAIZU_PEDIA_TEXT', 	'TXT_KEY_LEADER_TCM_TAIZU_PEDIA', 'tcmTaizuScene.xml',	4, 						7, 						6, 							4, 			5, 				7, 				6, 						7, 				7, 			5, 			3, 				6, 			3, 			'TCM_SONG_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_TAIZU', 	'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_TCM_TAIZU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_TCM_TAIZU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_TCM_TAIZU', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_TCM_TAIZU', 	'MAJOR_CIV_APPROACH_AFRAID', 		6),
			('LEADER_TCM_TAIZU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_TCM_TAIZU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_TAIZU', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_TCM_TAIZU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_TCM_TAIZU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_TCM_TAIZU', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_TCM_TAIZU', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_TCM_TAIZU', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_TCM_TAIZU', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_TCM_TAIZU', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_TCM_TAIZU', 	'FLAVOR_RECON', 					5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_RANGED', 					5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_MOBILE', 					3),
			('LEADER_TCM_TAIZU', 	'FLAVOR_NAVAL', 					8),
			('LEADER_TCM_TAIZU', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_TCM_TAIZU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_TCM_TAIZU', 	'FLAVOR_AIR', 						5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_GROWTH', 					8),
			('LEADER_TCM_TAIZU', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_TCM_TAIZU', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_TCM_TAIZU', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_TCM_TAIZU', 	'FLAVOR_GOLD', 						5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_TCM_TAIZU', 	'FLAVOR_CULTURE', 					6),
			('LEADER_TCM_TAIZU', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_TCM_TAIZU', 	'FLAVOR_GREAT_PEOPLE', 				9),
			('LEADER_TCM_TAIZU', 	'FLAVOR_WONDER', 					7),
			('LEADER_TCM_TAIZU', 	'FLAVOR_RELIGION', 					5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_TCM_TAIZU', 	'FLAVOR_SPACESHIP', 				9),
			('LEADER_TCM_TAIZU', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_TCM_TAIZU', 	'FLAVOR_NUKE', 						7),
			('LEADER_TCM_TAIZU', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_TCM_TAIZU', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_TCM_TAIZU', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_TCM_TAIZU', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
			('LEADER_TCM_TAIZU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_TAIZU', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_TCM_TAIZU', 	'TRAIT_TCM_TAIZU_SONG');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)
VALUES		('TRAIT_TCM_TAIZU_SONG', 	'TXT_KEY_TRAIT_TCM_TAIZU_SONG', 	'TXT_KEY_TRAIT_TCM_TAIZU_SONG_SHORT');

INSERT INTO Trait_SpecialistYieldChanges
			(TraitType, 				SpecialistType, 		YieldType,		Yield)
VALUES		('TRAIT_TCM_TAIZU_SONG', 	'SPECIALIST_ENGINEER',	'YIELD_FOOD',	1),
			('TRAIT_TCM_TAIZU_SONG', 	'SPECIALIST_SCIENTIST',	'YIELD_FOOD',	1),
			('TRAIT_TCM_TAIZU_SONG', 	'SPECIALIST_MERCHANT',	'YIELD_FOOD',	1),
			('TRAIT_TCM_TAIZU_SONG', 	'SPECIALIST_WRITER',	'YIELD_FOOD',	1),
			('TRAIT_TCM_TAIZU_SONG', 	'SPECIALIST_ARTIST',	'YIELD_FOOD',	1),
			('TRAIT_TCM_TAIZU_SONG', 	'SPECIALIST_MUSICIAN',	'YIELD_FOOD',	1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_TAIZU_PEACE', 	'tcmSongPeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_TAIZU_WAR',		'tcmSongWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_TAIZU_PEACE', 			'SND_LEADER_MUSIC_TCM_TAIZU_PEACE', 	'GAME_MUSIC', 	80, 		80, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_TAIZU_WAR', 			'SND_LEADER_MUSIC_TCM_TAIZU_WAR', 		'GAME_MUSIC', 	80, 		80, 		1,			0);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 			DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_TCM_SONG', 				'BUILDING_TCM_SONG_ENGINEER', 				'TXT_KEY_CIV_TCM_SONG_DESC');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings 	
			(Type, 								 BuildingClass, 			MilitaryProductionModifier,			SpecialistType,		   SpecialistCount, GreatWorkCount, Cost, FaithCost, NukeImmune, ConquestProb, PrereqTech,	Description, 						Help,								PortraitIndex, 	IconAtlas)
VALUES		('BUILDING_TCM_SONG_ENGINEER',		'BUILDINGCLASS_TCM_SONG', 	0,									'SPECIALIST_ENGINEER',	1,			 	 -1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_CIV_TCM_SONG_ENGINEER', 	'TXT_KEY_CIV_TCM_SONG_ENGINEER',	0, 				'TCM_SONG_ATLAS'),
			('BUILDING_TCM_SONG_SCIENTIST',		'BUILDINGCLASS_TCM_SONG', 	0,									'SPECIALIST_SCIENTIST',	1,			 	 -1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_CIV_TCM_SONG_SCIENTIST', 	'TXT_KEY_CIV_TCM_SONG_SCIENTIST',	0, 				'TCM_SONG_ATLAS'),
			('BUILDING_TCM_SONG_MERCHANT',		'BUILDINGCLASS_TCM_SONG', 	0,									'SPECIALIST_MERCHANT',	1,			 	 -1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_CIV_TCM_SONG_MERCHANT', 	'TXT_KEY_CIV_TCM_SONG_MERCHANT',	0, 				'TCM_SONG_ATLAS'),
			('BUILDING_TCM_SONG_WRITER',		'BUILDINGCLASS_TCM_SONG', 	0,									'SPECIALIST_WRITER',	1,			 	 -1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_CIV_TCM_SONG_WRITER', 		'TXT_KEY_CIV_TCM_SONG_WRITER',		0, 				'TCM_SONG_ATLAS'),
			('BUILDING_TCM_SONG_ARTIST',		'BUILDINGCLASS_TCM_SONG', 	0,									'SPECIALIST_ARTIST',	1,			 	 -1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_CIV_TCM_SONG_ARTIST',		'TXT_KEY_CIV_TCM_SONG_ARTIST',		0, 				'TCM_SONG_ATLAS'),
			('BUILDING_TCM_SONG_MUSICIAN',		'BUILDINGCLASS_TCM_SONG', 	0,									'SPECIALIST_MUSICIAN',	1,			 	 -1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_CIV_TCM_SONG_MUSICIAN', 	'TXT_KEY_CIV_TCM_SONG_MUSICIAN',	0, 				'TCM_SONG_ATLAS'),
			('BUILDING_TCM_SONG_PRODUCTION',	'BUILDINGCLASS_TCM_SONG', 	25,									-1,			 		   -1,				 -1, 			 -1,   -1, 		  1,		  0,			NULL, 		'TXT_KEY_CIV_TCM_SONG_DESC', 		'TXT_KEY_CIV_TCM_SONG_DESC',		0, 				'TCM_SONG_ATLAS');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
--INSERT INTO Building_YieldChanges 
--			(BuildingType, 				YieldType,		Yield)
--VALUES		('BUILDING_TCM_SONG_FOOD',	'YIELD_FOOD',	1);
--==========================================================================================================================
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech,	Combat, RangedCombat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 													Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,					  PortraitIndex, 	IconAtlas,			MoveRate)
SELECT		Class,		('UNIT_TCM_JUNK_SHIP'), 	PrereqTech, Combat,	RangedCombat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, 4,     Range, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_JUNK_SHIP'), ('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TCM_JUNK_SHIP_TEXT'), 	('TXT_KEY_UNIT_TCM_JUNK_SHIP_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_JUNK_SHIP'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, ('ART_DEF_UNIT_TCM_JUNK_SHIP'),	0,					('TCM_UNIT_FLAG_JUNK_SHIP_ATLAS'), 3, 				('TCM_SONG_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_GALLEASS');

INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech,	Combat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 												Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 		IconAtlas,			MoveRate)
SELECT		Class,		('UNIT_TCM_FIRE_LANCER'), 	PrereqTech, Combat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_FIRE_LANCER'), ('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TCM_FIRE_LANCER_TEXT'), 	('TXT_KEY_UNIT_TCM_FIRE_LANCER_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_FIRE_LANCER'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, Conscription, ('ART_DEF_UNIT_TCM_FIRE_LANCER'),	0,					('TCM_UNIT_FLAG_FIRE_LANCER_ATLAS'), 2, 				('TCM_SONG_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');

INSERT INTO Units 	
			(Class, 	Type, 								PrereqTech,	Range, NoMaintenance, Combat, RangedCombat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 													Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 		IconAtlas,			MoveRate)
SELECT		Class,		('UNIT_TCM_RANGED_FIRE_LANCER'), 	-1,			1,	   1,			  Combat, 24,			  -1,	-1,			  FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_FIRE_LANCER'), ('TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TCM_FIRE_LANCER_TEXT'), 	('TXT_KEY_UNIT_TCM_FIRE_LANCER_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_FIRE_LANCER'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, -1,				   Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, Conscription, ('ART_DEF_UNIT_TCM_FIRE_LANCER'),	0,					('TCM_UNIT_FLAG_FIRE_LANCER_ATLAS'), 2, 				('TCM_SONG_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_MUSKETMAN');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_JUNK_SHIP'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GALLEASS');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_FIRE_LANCER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSKETMAN');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_RANGED_FIRE_LANCER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSKETMAN');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_JUNK_SHIP'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GALLEASS');	

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_FIRE_LANCER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSKETMAN');	

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_RANGED_FIRE_LANCER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CROSSBOWMAN');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
VALUES		('UNIT_TCM_JUNK_SHIP',	 			'UNITCLASS_FRIGATE'),
			('UNIT_TCM_FIRE_LANCER', 			'UNITCLASS_RIFLEMAN'),
			('UNIT_TCM_RANGED_FIRE_LANCER', 	'UNITCLASS_RIFLEMAN');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,				Flavor)
VALUES		('UNIT_TCM_JUNK_SHIP',		'FLAVOR_NAVAL',			16),
			('UNIT_TCM_JUNK_SHIP', 		'FLAVOR_NAVAL_RECON',	8),
			('UNIT_TCM_FIRE_LANCER', 	'FLAVOR_OFFENSE',		9),
			('UNIT_TCM_FIRE_LANCER', 	'FLAVOR_DEFENSE',		12);
--==========================================================================================================================	
-- Unit_FreePromotions
--==========================================================================================================================		
INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
VALUES		('UNIT_TCM_JUNK_SHIP', 					'PROMOTION_OCEAN_IMPASSABLE'),
			('UNIT_TCM_JUNK_SHIP', 					'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_TCM_JUNK_SHIP',					'PROMOTION_GREAT_GENERAL');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_TAIZU','RESPONSE_FIRST_GREETING','TXT_KEY_LEADER_TCM_TAIZU_FIRSTGREETING%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_TAIZU','RESPONSE_DEFEATED',		'TXT_KEY_LEADER_TCM_TAIZU_DEFEATED%','1');
--==========================================================================================================================	
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 											Description, 											Help, 														Sound, 				NearbyEnemyCombatMod, NearbyEnemyCombatRange, LostWithUpgrade, AttackMod, DefenseMod, CannotBeChosen,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_TCM_SONG_JUNK_DEFENSE',				'TXT_KEY_PROMOTION_TCM_SONG_JUNK_DEFENSE',				'TXT_KEY_PROMOTION_TCM_SONG_JUNK_DEFENSE_HELP',				'AS2D_IF_LEVELUP',	0,					  0,					  0,				 0,			100,		1,					59, 		'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_SONG_JUNK_DEFENSE'),
			('PROMOTION_TCM_SONG_FIRE_LANCER_DEFENSE',		'TXT_KEY_PROMOTION_TCM_SONG_FIRE_LANCER_DEFENSE',		'TXT_KEY_PROMOTION_TCM_SONG_FIRE_LANCER_DEFENSE_HELP',		'AS2D_IF_LEVELUP',	-15,				  2,					  1,				 0,			0,			1,					59, 		'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_SONG_FIRE_LANCER_DEFENSE');
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
UPDATE Leaders
SET DoFWillingness = 8,
	Forgiveness = 8
WHERE Type = 'LEADER_DIDO';

INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_JFD_HANNIBAL', 	'TXT_KEY_LEADER_JFD_HANNIBAL', 		'TXT_KEY_LEADER_JFD_HANNIBAL_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HANNIBAL', 	'Hannibal_Scene.xml',	8, 						2, 						3, 							7, 			6, 				4, 				4, 						2, 				6, 			2, 			4, 				2, 			3, 			'JFD_CARTHAGE_HANNIBAL_ATLAS',	1);	
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
UPDATE Leader_MajorCivApproachBiases
SET Bias = 8
WHERE LeaderType = 'LEADER_DIDO' AND MajorCivApproachType IN ('MAJOR_CIV_APPROACH_FRIENDLY');

UPDATE Leader_MajorCivApproachBiases
SET Bias = 4
WHERE LeaderType = 'LEADER_DIDO' AND MajorCivApproachType IN ('MAJOR_CIV_APPROACH_WAR', 'MAJOR_CIV_APPROACH_HOSTILE');

INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
			('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_GUARDED', 		1),
			('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
UPDATE Leader_Flavors
SET Flavor = 7
WHERE LeaderType = 'LEADER_DIDO' AND FlavorType IN ('FLAVOR_I_TRADE_DESTINATION', 'FLAVOR_I_LAND_TRADE_ROUTE', 'FLAVOR_CITY_DEFENSE');

UPDATE Leader_Flavors
SET Flavor = 4
WHERE LeaderType = 'LEADER_DIDO' AND FlavorType IN ('FLAVOR_OFFENSE', 'FLAVOR_MILITARY_TRAINING', 'FLAVOR_MOBILE', 'FLAVOR_EXPANSION');

INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_HANNIBAL', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_RANGED', 					3),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL', 					6),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_GOLD', 						4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_HANNIBAL', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
DELETE FROM Leader_Traits WHERE LeaderType = 'LEADER_DIDO';
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_HANNIBAL', 	'TRAIT_JFD_CARTHAGE_HANNIBAL'),
			('LEADER_DIDO', 			'TRAIT_JFD_CARTHAGE_DIDO');
--==========================================================================================================================				
--==========================================================================================================================		
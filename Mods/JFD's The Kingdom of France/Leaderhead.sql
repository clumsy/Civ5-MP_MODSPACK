--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_LOUIS_XIV', 	'TXT_KEY_LEADER_JFD_LOUIS_XIV', 	'TXT_KEY_LEADER_JFD_LOUIS_XIV_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_LOUIS_XIV', 	'Louis_Scene.xml',	8, 						8, 						5, 							8, 			4, 				7, 				5, 						4, 				3, 			8, 			4, 				8, 			8, 			'JFD_FRANCE_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
DELETE FROM Leader_MajorCivApproachBiases Where LeaderType = 'LEADER_NAPOLEON';
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LOUIS_XIV', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_LOUIS_XIV', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_LOUIS_XIV', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_LOUIS_XIV', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_LOUIS_XIV', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_LOUIS_XIV', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_LOUIS_XIV', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4),
			('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_WAR', 			9),
			('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_HOSTILE', 		8),
			('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_NAPOLEON', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
DELETE FROM Leader_MajorCivApproachBiases Where LeaderType = 'LEADER_NAPOLEON';
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LOUIS_XIV', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_LOUIS_XIV', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_LOUIS_XIV', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_LOUIS_XIV', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_JFD_LOUIS_XIV', 	'MINOR_CIV_APPROACH_BULLY', 		9),
			('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_NAPOLEON', 		'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
DELETE FROM Leader_Flavors Where LeaderType = 'LEADER_NAPOLEON';
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_RECON', 					5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_RANGED', 					5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_MOBILE', 					4),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_GOLD', 						2),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_WONDER', 					9),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_RELIGION', 					7),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_ESPIONAGE', 				8),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_LOUIS_XIV', 	'FLAVOR_AIR_CARRIER', 				5),
			('LEADER_NAPOLEON', 		'FLAVOR_OFFENSE', 					9),
			('LEADER_NAPOLEON', 		'FLAVOR_DEFENSE', 					6),
			('LEADER_NAPOLEON', 		'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_NAPOLEON', 		'FLAVOR_MILITARY_TRAINING', 		9),
			('LEADER_NAPOLEON', 		'FLAVOR_RECON', 					4),
			('LEADER_NAPOLEON', 		'FLAVOR_RANGED', 					4),
			('LEADER_NAPOLEON', 		'FLAVOR_MOBILE', 					9),
			('LEADER_NAPOLEON', 		'FLAVOR_NAVAL', 					3),
			('LEADER_NAPOLEON', 		'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_NAPOLEON', 		'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_NAPOLEON', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_NAPOLEON', 		'FLAVOR_AIR', 						4),
			('LEADER_NAPOLEON', 		'FLAVOR_EXPANSION', 				9),
			('LEADER_NAPOLEON', 		'FLAVOR_GROWTH', 					5),
			('LEADER_NAPOLEON', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_NAPOLEON', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_NAPOLEON', 		'FLAVOR_PRODUCTION', 				5),
			('LEADER_NAPOLEON', 		'FLAVOR_GOLD', 						6),
			('LEADER_NAPOLEON', 		'FLAVOR_SCIENCE', 					5),
			('LEADER_NAPOLEON', 		'FLAVOR_CULTURE', 					6),
			('LEADER_NAPOLEON', 		'FLAVOR_HAPPINESS', 				7),
			('LEADER_NAPOLEON', 		'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_NAPOLEON', 		'FLAVOR_WONDER', 					3),
			('LEADER_NAPOLEON', 		'FLAVOR_RELIGION', 					6),
			('LEADER_NAPOLEON', 		'FLAVOR_DIPLOMACY', 				6),
			('LEADER_NAPOLEON', 		'FLAVOR_SPACESHIP', 				3),
			('LEADER_NAPOLEON', 		'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_NAPOLEON', 		'FLAVOR_NUKE', 						2),
			('LEADER_NAPOLEON', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_NAPOLEON', 		'FLAVOR_ESPIONAGE', 				7),
			('LEADER_NAPOLEON', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_NAPOLEON', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_NAPOLEON', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_NAPOLEON', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_NAPOLEON', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_NAPOLEON', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_NAPOLEON', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
DELETE FROM Leader_Traits WHERE LeaderType = 'LEADER_NAPOLEON';					
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_LOUIS_XIV', 	'TRAIT_ENHANCED_CULTURE'),
			('LEADER_NAPOLEON', 		'TRAIT_JFD_NAPOLEONIC_FRANCE');
--==========================================================================================================================				
--==========================================================================================================================		
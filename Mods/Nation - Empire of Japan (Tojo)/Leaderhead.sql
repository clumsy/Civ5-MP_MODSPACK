--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 				Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_TOJO', 	'TXT_KEY_LEADER_JFD_TOJO', 	'TXT_KEY_LEADER_JFD_TOJO_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_TOJO', 	'Tojo_Scene.xml',	8, 						2, 						2, 							8, 			7, 				5, 				5, 						5, 				9, 			4, 			2, 				2, 			4, 			'JFD_JAPAN_TOJO_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_TOJO', 	'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_JFD_TOJO', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
			('LEADER_JFD_TOJO', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_TOJO', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_JFD_TOJO', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_TOJO', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_TOJO', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_TOJO', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_JFD_TOJO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_TOJO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_TOJO', 	'MINOR_CIV_APPROACH_CONQUEST', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_TOJO', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_TOJO', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_TOJO', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_TOJO', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_TOJO', 	'FLAVOR_RECON', 					5),
			('LEADER_JFD_TOJO', 	'FLAVOR_RANGED', 					5),
			('LEADER_JFD_TOJO', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_TOJO', 	'FLAVOR_NAVAL', 					9),
			('LEADER_JFD_TOJO', 	'FLAVOR_NAVAL_RECON', 				9),
			('LEADER_JFD_TOJO', 	'FLAVOR_NAVAL_GROWTH', 				9),
			('LEADER_JFD_TOJO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	9),
			('LEADER_JFD_TOJO', 	'FLAVOR_AIR', 						9),
			('LEADER_JFD_TOJO', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_JFD_TOJO', 	'FLAVOR_GROWTH', 					4),
			('LEADER_JFD_TOJO', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_TOJO', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_TOJO', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_TOJO', 	'FLAVOR_GOLD', 						4),
			('LEADER_JFD_TOJO', 	'FLAVOR_SCIENCE', 					9),
			('LEADER_JFD_TOJO', 	'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_TOJO', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_TOJO', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_TOJO', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_TOJO', 	'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_TOJO', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_TOJO', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_TOJO', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_TOJO', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_TOJO', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_TOJO', 	'FLAVOR_ESPIONAGE', 				8),
			('LEADER_JFD_TOJO', 	'FLAVOR_AIRLIFT', 					8),
			('LEADER_JFD_TOJO', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_TOJO', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_TOJO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_TOJO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_TOJO', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_TOJO', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_TOJO', 	'TRAIT_JFD_JAPAN_TOJO');
--==========================================================================================================================				
--==========================================================================================================================		
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_CHRISTIAN', 	'TXT_KEY_LEADER_JFD_CHRISTIAN', 	'TXT_KEY_LEADER_JFD_CHRISTIAN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CHRISTIAN', 	'Christian_Scene.xml',	6, 						7, 						4, 							8, 			6, 				4, 				3, 						6, 				4, 			7, 			8, 				9, 			2, 			'JFD_DENMARK_NORWAY_ATLAS', 1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JFD_CHRISTIAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_JFD_CHRISTIAN', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_CHRISTIAN', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_MOBILE', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL', 					9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL_RECON', 				9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL_GROWTH', 				9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	9),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_GOLD', 						8),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_WONDER', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_CHRISTIAN', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_CHRISTIAN', 	'TRAIT_JFD_DENMARK_NORWAY');
--==========================================================================================================================				
--==========================================================================================================================		
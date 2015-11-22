--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_CHURCHILL', 	'TXT_KEY_LEADER_JFD_CHURCHILL', 'TXT_KEY_LEADER_JFD_CHURCHILL_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CHURCHILL', 	'Churchill_Scene.xml',	9, 						3, 						8, 							8, 			6, 				9, 				6, 						5, 				8, 			4, 			4, 				6, 			6, 			'JFD_UNITED_KINGDOM_ATLAS', 1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JFD_CHURCHILL', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================		
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_CHURCHILL', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_CHURCHILL', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_RANGED', 					3),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL', 					9),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL_RECON', 				8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL_GROWTH', 				8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_AIR', 						9),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_CHURCHILL', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_CHURCHILL', 	'TRAIT_JFD_UNITED_KINGDOM');
--==========================================================================================================================				
--==========================================================================================================================		
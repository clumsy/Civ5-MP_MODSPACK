--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_JFD_SIGISMUND', 	'TXT_KEY_LEADER_JFD_SIGISMUND', 	'TXT_KEY_LEADER_JFD_SIGISMUND_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_SIGISMUND', 	'Sigismund_Scene.xml',	5, 						4, 						9, 							6, 			7, 				5, 				4, 						5, 				6, 			4, 			5, 				4, 			2, 			'JFD_POLAND_LITHUANIA_ATLAS',	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_SIGISMUND', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_JFD_SIGISMUND', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_SIGISMUND', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_SIGISMUND', 	'MAJOR_CIV_APPROACH_GUARDED', 		3),
			('LEADER_JFD_SIGISMUND', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_SIGISMUND', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_SIGISMUND', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_SIGISMUND', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_SIGISMUND', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_SIGISMUND', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_SIGISMUND', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_SIGISMUND', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_SIGISMUND', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_MOBILE', 					7),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_GOLD', 						8),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_RELIGION', 					3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_DIPLOMACY', 				9),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_SIGISMUND', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_SIGISMUND', 	'TRAIT_JFD_POLAND_LITHUANIA');
--==========================================================================================================================			
--==========================================================================================================================	
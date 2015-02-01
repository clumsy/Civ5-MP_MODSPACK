--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_BULAN', 	'TXT_KEY_LEADER_JFD_BULAN', 	'TXT_KEY_LEADER_JFD_BULAN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_BULAN', 	'Bulan_Scene.xml',	4, 						2, 						2, 							6, 			3, 				2, 				3, 						4, 				2, 			2, 			3, 				2, 			6, 			'JFD_KHAZARIA_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_BULAN', 		'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_BULAN', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_BULAN', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_JFD_BULAN', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JFD_BULAN', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_BULAN', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_BULAN', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_BULAN', 		'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_BULAN', 		'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_BULAN', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_JFD_BULAN', 		'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_JFD_BULAN', 		'MINOR_CIV_APPROACH_BULLY', 		8);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_BULAN', 		'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_BULAN', 		'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_BULAN', 		'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_BULAN', 		'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_JFD_BULAN', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_BULAN', 		'FLAVOR_RANGED', 					4),
			('LEADER_JFD_BULAN', 		'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_BULAN', 		'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_BULAN', 		'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_BULAN', 		'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_BULAN', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_BULAN', 		'FLAVOR_AIR', 						2),
			('LEADER_JFD_BULAN', 		'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_BULAN', 		'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_BULAN', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_BULAN', 		'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_BULAN', 		'FLAVOR_PRODUCTION', 				3),
			('LEADER_JFD_BULAN', 		'FLAVOR_GOLD', 						8),
			('LEADER_JFD_BULAN', 		'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_BULAN', 		'FLAVOR_CULTURE', 					3),
			('LEADER_JFD_BULAN', 		'FLAVOR_HAPPINESS', 				3),
			('LEADER_JFD_BULAN', 		'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_BULAN', 		'FLAVOR_WONDER', 					3),
			('LEADER_JFD_BULAN', 		'FLAVOR_RELIGION', 					8),
			('LEADER_JFD_BULAN', 		'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_BULAN', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_BULAN', 		'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_BULAN', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_BULAN', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_BULAN', 		'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_BULAN', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_BULAN', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_BULAN', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_BULAN', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_BULAN', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_BULAN', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_BULAN', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_BULAN', 		'TRAIT_JFD_KHAZARIA');
--==========================================================================================================================				
--==========================================================================================================================		
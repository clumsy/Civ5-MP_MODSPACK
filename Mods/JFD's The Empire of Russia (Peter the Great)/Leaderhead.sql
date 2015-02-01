--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_PETER', 		'TXT_KEY_LEADER_JFD_PETER', 		'TXT_KEY_LEADER_JFD_PETER_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PETER', 		'Peter_Scene.xml',	6, 						3, 						4, 							5, 			5, 				6, 				4, 						8, 				5, 			4, 			6, 				8, 			3, 			'JFD_RUSSIA_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PETER', 		'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_PETER', 		'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_PETER', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_JFD_PETER', 		'MAJOR_CIV_APPROACH_GUARDED', 		2),
			('LEADER_JFD_PETER', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_PETER', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JFD_PETER', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PETER', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_PETER', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_PETER', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_PETER', 		'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_JFD_PETER', 		'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_PETER', 		'FLAVOR_OFFENSE', 					4),
			('LEADER_JFD_PETER', 		'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_PETER', 		'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_PETER', 		'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JFD_PETER', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_PETER', 		'FLAVOR_RANGED', 					3),
			('LEADER_JFD_PETER', 		'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_PETER', 		'FLAVOR_NAVAL', 					5),
			('LEADER_JFD_PETER', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_PETER', 		'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_PETER', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_PETER', 		'FLAVOR_AIR', 						3),
			('LEADER_JFD_PETER', 		'FLAVOR_EXPANSION', 				9),
			('LEADER_JFD_PETER', 		'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_PETER', 		'FLAVOR_TILE_IMPROVEMENT', 			3),
			('LEADER_JFD_PETER', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_PETER', 		'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_PETER', 		'FLAVOR_GOLD', 						4),
			('LEADER_JFD_PETER', 		'FLAVOR_SCIENCE', 					7),
			('LEADER_JFD_PETER', 		'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_PETER', 		'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_PETER', 		'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_PETER', 		'FLAVOR_WONDER', 					4),
			('LEADER_JFD_PETER', 		'FLAVOR_RELIGION', 					3),
			('LEADER_JFD_PETER', 		'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_PETER', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_PETER', 		'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_PETER', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_PETER', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_PETER', 		'FLAVOR_ESPIONAGE', 				4),
			('LEADER_JFD_PETER', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_PETER', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_PETER', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_PETER', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_PETER', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_PETER', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_PETER', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_PETER', 		'TRAIT_JFD_PETRINE_RUSSIA');
--==========================================================================================================================				
--==========================================================================================================================		
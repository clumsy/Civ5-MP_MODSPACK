--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_LINCOLN', 		'TXT_KEY_LEADER_JFD_LINCOLN', 		'TXT_KEY_LEADER_JFD_LINCOLN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_LINCOLN', 		'Lincoln_Scene.xml',	3, 						2, 						3, 							3, 			8, 				8, 				4, 						9, 				9, 			3, 			8, 				5, 			1, 			'JFD_AMERICA_LINCOLN_ATLAS', 0);	
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_GUARDED', 		1),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_JFD_LINCOLN', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_CONQUEST', 		1),
			('LEADER_JFD_LINCOLN', 		'MINOR_CIV_APPROACH_BULLY', 		1);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_LINCOLN', 		'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_CITY_DEFENSE', 				8),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_RANGED', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL', 					6),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_AIR', 						4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_EXPANSION', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_GOLD', 						4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_HAPPINESS', 				7),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_WONDER', 					3),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_RELIGION', 					2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_LINCOLN', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_LINCOLN', 		'TRAIT_JFD_AMERICA_LINCOLN');
--==========================================================================================================================				
--==========================================================================================================================		
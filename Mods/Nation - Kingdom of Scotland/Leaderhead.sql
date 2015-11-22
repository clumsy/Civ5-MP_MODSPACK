--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_JAMES', 	'TXT_KEY_LEADER_JFD_JAMES', 	'TXT_KEY_LEADER_JFD_JAMES_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_JAMES', 	'James_Scene.xml',	5, 						5, 						5, 							5, 			5, 				7, 				6, 						5, 				6, 			4, 			6, 				4, 			4, 			'JFD_SCOTLAND_ATLAS',	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_JAMES', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JFD_JAMES', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_JAMES', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_JFD_JAMES', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_JFD_JAMES', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_JAMES', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JFD_JAMES', 	'FLAVOR_RECON', 					5),
			('LEADER_JFD_JAMES', 	'FLAVOR_RANGED', 					5),
			('LEADER_JFD_JAMES', 	'FLAVOR_MOBILE', 					4),
			('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_JAMES', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_JAMES', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_JAMES', 	'FLAVOR_EXPANSION', 				4),
			('LEADER_JFD_JAMES', 	'FLAVOR_GROWTH', 					7),
			('LEADER_JFD_JAMES', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_JAMES', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_JAMES', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_JAMES', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_JAMES', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_JFD_JAMES', 	'FLAVOR_CULTURE', 					7),
			('LEADER_JFD_JAMES', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_JAMES', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_JAMES', 	'FLAVOR_WONDER', 					4),
			('LEADER_JFD_JAMES', 	'FLAVOR_RELIGION', 					7),
			('LEADER_JFD_JAMES', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_JFD_JAMES', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_JFD_JAMES', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_JAMES', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_JAMES', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_JAMES', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_JFD_JAMES', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_JAMES', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_JAMES', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_JAMES', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_JAMES', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_JAMES', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_JAMES', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_JAMES', 	'TRAIT_JFD_SCOTLAND');
--==========================================================================================================================			
--==========================================================================================================================	
--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 						Description, 							Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_FREDERICK', 	'TXT_KEY_LEADER_JFD_FREDERICK_DESC', 	'TXT_KEY_LEADER_JFD_FREDERICK_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_FREDERICK', 	'Frederick_Scene.xml',	9, 						8, 						6, 							7, 			8, 				6, 				4, 						7, 				8, 			5, 			5, 				4, 			3, 			'JFD_PRUSSIA_ATLAS', 	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_FREDERICK', 	'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_JFD_FREDERICK', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_FREDERICK', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_FREDERICK', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_FREDERICK', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_FREDERICK', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_FREDERICK', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_FREDERICK', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_FREDERICK', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_FREDERICK', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_JFD_FREDERICK', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_JFD_FREDERICK', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_FREDERICK', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_MILITARY_TRAINING', 		9),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_RECON', 					6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_MOBILE', 					7),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_AIR', 						5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_WONDER', 					6),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_FREDERICK', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_FREDERICK', 	'TRAIT_JFD_PRUSSIA');
--==========================================================================================================================			
--==========================================================================================================================	
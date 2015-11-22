--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_STALIN', 	'TXT_KEY_LEADER_JFD_STALIN', 	'TXT_KEY_LEADER_JFD_STALIN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_STALIN', 	'Stalin_Scene.xml', 7, 						3, 						9, 							9, 			4, 				3, 				6, 						4, 				3, 			1, 			2, 				4, 			9, 			'JFD_USSR_STALIN_ATLAS', 	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_STALIN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================	
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_STALIN', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_STALIN', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_STALIN', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_STALIN', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_JFD_STALIN', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_JFD_STALIN', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_STALIN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_STALIN', 	'FLAVOR_AIR', 						5),
			('LEADER_JFD_STALIN', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_STALIN', 	'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_STALIN', 	'FLAVOR_TILE_IMPROVEMENT', 			9),
			('LEADER_JFD_STALIN', 	'FLAVOR_INFRASTRUCTURE', 			9),
			('LEADER_JFD_STALIN', 	'FLAVOR_PRODUCTION', 				9),
			('LEADER_JFD_STALIN', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_STALIN', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_JFD_STALIN', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_STALIN', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_STALIN', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_STALIN', 	'FLAVOR_WONDER', 					6),
			('LEADER_JFD_STALIN', 	'FLAVOR_RELIGION', 					0),
			('LEADER_JFD_STALIN', 	'FLAVOR_DIPLOMACY', 				4),
			('LEADER_JFD_STALIN', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_STALIN', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_STALIN', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_STALIN', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_STALIN', 	'FLAVOR_ESPIONAGE', 				9),
			('LEADER_JFD_STALIN', 	'FLAVOR_AIRLIFT', 					1),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_STALIN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_STALIN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_STALIN', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_STALIN', 	'TRAIT_JFD_USSR_STALIN');
--==========================================================================================================================			
--==========================================================================================================================	
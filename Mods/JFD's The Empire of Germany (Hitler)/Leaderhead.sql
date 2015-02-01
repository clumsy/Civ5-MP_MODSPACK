--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_HITLER', 	'TXT_KEY_LEADER_JFD_HITLER', 	'TXT_KEY_LEADER_JFD_HITLER_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HITLER', 	'Hitler_Scene.xml', 	9, 						5, 						7, 							9, 			2, 				5, 				9, 						2, 				4, 			6, 			1, 				6, 			7, 			'JFD_NAZI_GERMANY_ATLAS',	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_WAR', 			9),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_HOSTILE', 		9),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_HITLER', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
			('LEADER_JFD_HITLER', 	'MINOR_CIV_APPROACH_BULLY', 		9);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_HITLER', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_JFD_HITLER', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_HITLER', 	'FLAVOR_CITY_DEFENSE', 				3),
			('LEADER_JFD_HITLER', 	'FLAVOR_MILITARY_TRAINING', 		9),
			('LEADER_JFD_HITLER', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_HITLER', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_HITLER', 	'FLAVOR_MOBILE', 					7),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL', 					5),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_JFD_HITLER', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_JFD_HITLER', 	'FLAVOR_AIR', 						6),
			('LEADER_JFD_HITLER', 	'FLAVOR_EXPANSION', 				9),
			('LEADER_JFD_HITLER', 	'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_HITLER', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_HITLER', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_HITLER', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_HITLER', 	'FLAVOR_GOLD', 						4),
			('LEADER_JFD_HITLER', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_JFD_HITLER', 	'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_HITLER', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_HITLER', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_HITLER', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_HITLER', 	'FLAVOR_RELIGION', 					0),
			('LEADER_JFD_HITLER', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_JFD_HITLER', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_HITLER', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_HITLER', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_HITLER', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_HITLER', 	'FLAVOR_ESPIONAGE', 				8),
			('LEADER_JFD_HITLER', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_HITLER', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_HITLER', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_HITLER', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_HITLER', 	'TRAIT_JFD_GERMANY');
--==========================================================================================================================			
--==========================================================================================================================	
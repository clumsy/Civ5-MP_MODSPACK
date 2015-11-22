--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_LENIN', 	'TXT_KEY_LEADER_JFD_LENIN', 	'TXT_KEY_LEADER_JFD_LENIN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_LENIN', 	'Lenin_Scene.xml',	4, 						3, 						6, 							7, 			5, 				8, 				7, 						2, 				2, 			6, 			2, 				3, 			2, 			'JFD_USSR_LENIN_ATLAS', 1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LENIN', 	'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_JFD_LENIN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_LENIN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_LENIN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_LENIN', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_LENIN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_LENIN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================		
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LENIN', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_JFD_LENIN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_LENIN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_LENIN', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JFD_LENIN', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_LENIN', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_JFD_LENIN', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_JFD_LENIN', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_LENIN', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_LENIN', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_LENIN', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_LENIN', 	'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_LENIN', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_LENIN', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_LENIN', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_LENIN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_LENIN', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_LENIN', 	'FLAVOR_EXPANSION', 				4),
			('LEADER_JFD_LENIN', 	'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_LENIN', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_JFD_LENIN', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_JFD_LENIN', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_JFD_LENIN', 	'FLAVOR_GOLD', 						3),
			('LEADER_JFD_LENIN', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_LENIN', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_LENIN', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_LENIN', 	'FLAVOR_GREAT_PEOPLE', 				2),
			('LEADER_JFD_LENIN', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_LENIN', 	'FLAVOR_RELIGION', 					0),
			('LEADER_JFD_LENIN', 	'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_LENIN', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_LENIN', 	'FLAVOR_WATER_CONNECTION', 			3),
			('LEADER_JFD_LENIN', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_LENIN', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_LENIN', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_JFD_LENIN', 	'FLAVOR_AIRLIFT', 					1),
			('LEADER_JFD_LENIN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_LENIN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_LENIN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_LENIN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_LENIN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_LENIN', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_LENIN', 	'TRAIT_JFD_USSR_LENIN');
--==========================================================================================================================				
--==========================================================================================================================		
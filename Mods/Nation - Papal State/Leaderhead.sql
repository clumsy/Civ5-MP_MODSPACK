--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 				Description, 				Civilopedia, 						CivilopediaTag, 						ArtDefineTag, 		VictoryCompetitiveness,	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_PIUS', 'TXT_KEY_LEADER_JFD_PIUS', 	'TXT_KEY_LEADER_JFD_PIUS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_PIUS', 'Pius_Scene.xml',	9, 						8, 						8, 							8, 			8, 				9, 				7, 						4, 				7, 			4, 			8, 				8, 			1, 			'JFD_PAPAL_STATES_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 		MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_GUARDED', 		3),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_PIUS', 'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 		MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_PIUS', 'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 		FlavorType, 						Flavor)
VALUES		('LEADER_JFD_PIUS', 'FLAVOR_OFFENSE', 					2),
			('LEADER_JFD_PIUS', 'FLAVOR_DEFENSE', 					5),
			('LEADER_JFD_PIUS', 'FLAVOR_CITY_DEFENSE', 				8),
			('LEADER_JFD_PIUS', 'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_JFD_PIUS', 'FLAVOR_RECON', 					3),
			('LEADER_JFD_PIUS', 'FLAVOR_RANGED', 					2),
			('LEADER_JFD_PIUS', 'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_PIUS', 'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	10),
			('LEADER_JFD_PIUS', 'FLAVOR_AIR', 						3),
			('LEADER_JFD_PIUS', 'FLAVOR_EXPANSION', 				2),
			('LEADER_JFD_PIUS', 'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_PIUS', 'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_JFD_PIUS', 'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_JFD_PIUS', 'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_PIUS', 'FLAVOR_GOLD', 						7),
			('LEADER_JFD_PIUS', 'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_PIUS', 'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_PIUS', 'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_PIUS', 'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_PIUS', 'FLAVOR_WONDER', 					8),
			('LEADER_JFD_PIUS', 'FLAVOR_RELIGION', 					10),
			('LEADER_JFD_PIUS', 'FLAVOR_DIPLOMACY', 				9),
			('LEADER_JFD_PIUS', 'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_PIUS', 'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_PIUS', 'FLAVOR_NUKE', 						1),
			('LEADER_JFD_PIUS', 'FLAVOR_USE_NUKE', 					1),
			('LEADER_JFD_PIUS', 'FLAVOR_ESPIONAGE', 				7),
			('LEADER_JFD_PIUS', 'FLAVOR_AIRLIFT', 					1),
			('LEADER_JFD_PIUS', 'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_PIUS', 'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_PIUS', 'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_PIUS', 'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_PIUS', 'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_PIUS', 'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================				
INSERT INTO Leader_Traits 
			(LeaderType, 		TraitType)
VALUES		('LEADER_JFD_PIUS', 'TRAIT_JFD_PAPAL_STATES');
--==========================================================================================================================		
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_JFD_VISCONTI', 	'TXT_KEY_LEADER_JFD_VISCONTI', 		'TXT_KEY_LEADER_JFD_VISCONTI_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VISCONTI', 	'Visconti_Scene.xml',	6, 						4, 						8, 							8, 			6, 				6, 				6, 						4, 				3, 			7, 			3, 				4, 			6, 			'JFD_MILAN_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_VISCONTI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
--==========================================================================================================================	
-- Leader_MinorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_JFD_VISCONTI', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_VISCONTI', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_RANGED', 					6),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_AIR', 						2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_EXPANSION', 				4),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_GROWTH', 					4),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_INFRASTRUCTURE', 			3),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_GOLD', 						9),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_WONDER', 					5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_RELIGION', 					3),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_DIPLOMACY', 				9),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_ESPIONAGE', 				3),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_VISCONTI', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_VISCONTI', 	'TRAIT_JFD_MILAN');
--==========================================================================================================================				
--==========================================================================================================================		
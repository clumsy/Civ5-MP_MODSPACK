--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 						Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_ALFRED', 	'TXT_KEY_LEADER_JFD_ALFRED', 		'TXT_KEY_LEADER_JFD_ALFRED_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ALFRED', 	'Alfred_Scene.xml',	4, 						4, 						4, 							6, 			5, 				6, 				4, 						4, 				5, 			3, 			5, 				4, 			3, 			'JFD_ANGLO_SAXONS_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ALFRED', 	'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_JFD_ALFRED', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_ALFRED', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_ALFRED', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_ALFRED', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_ALFRED', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_ALFRED', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ALFRED', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_ALFRED', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_ALFRED', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_ALFRED', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_ALFRED', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_ALFRED', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_ALFRED', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_RECON', 					3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_ALFRED', 	'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_AIR', 						2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_TILE_IMPROVEMENT', 			3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_ALFRED', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_ALFRED', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_ALFRED', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_ALFRED', 	'FLAVOR_CULTURE', 					7),
			('LEADER_JFD_ALFRED', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_JFD_ALFRED', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_WONDER', 					5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_ALFRED', 	'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_ESPIONAGE', 				3),
			('LEADER_JFD_ALFRED', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_ALFRED', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_ALFRED', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_ALFRED', 	'TRAIT_JFD_ANGLO_SAXONS');
--==========================================================================================================================				
--==========================================================================================================================		
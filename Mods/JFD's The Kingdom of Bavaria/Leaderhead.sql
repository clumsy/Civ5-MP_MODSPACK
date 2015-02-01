--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 						Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_LUDWIG', 	'TXT_KEY_LEADER_JFD_LUDWIG', 		'TXT_KEY_LEADER_JFD_LUDWIG_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_LUDWIG', 	'Ludwig_Scene.xml',	4, 						10, 					4, 							6, 			5, 				2, 				2, 						3, 				3, 			4, 			4, 				4, 			3, 			'JFD_BAVARIA_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_GUARDED', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_LUDWIG', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_LUDWIG', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_LUDWIG', 	'FLAVOR_OFFENSE', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_CITY_DEFENSE', 				9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_RECON', 					3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_MOBILE', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL_GROWTH', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_AIR', 						2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_EXPANSION', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_INFRASTRUCTURE', 			9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_PRODUCTION', 				9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_CULTURE', 					9),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_HAPPINESS', 				3),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_WONDER', 					10),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_DIPLOMACY', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_ESPIONAGE', 				2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_LUDWIG', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_LUDWIG', 	'TRAIT_JFD_BAVARIA');
--==========================================================================================================================				
--==========================================================================================================================		
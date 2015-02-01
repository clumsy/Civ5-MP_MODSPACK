--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_GEDIMINAS', 	'TXT_KEY_LEADER_JFD_GEDIMINAS', 	'TXT_KEY_LEADER_JFD_GEDIMINAS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_GEDIMINAS', 	'Gediminas_Scene.xml',	5, 						3, 						3, 							8, 			2, 				3, 				4, 						2, 				2, 			1, 			2, 				1, 			1, 			'JFD_LITHUANIA_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_GEDIMINAS', 	'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_JFD_GEDIMINAS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
			('LEADER_JFD_GEDIMINAS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_GEDIMINAS', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_GEDIMINAS', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_GEDIMINAS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_GEDIMINAS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_GEDIMINAS', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_GEDIMINAS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_GEDIMINAS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_GEDIMINAS', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
			('LEADER_JFD_GEDIMINAS', 	'MINOR_CIV_APPROACH_BULLY', 		8);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_GEDIMINAS', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_MILITARY_TRAINING', 		9),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_RECON', 					6),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_GOLD', 						5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_RELIGION', 					5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_GEDIMINAS', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_GEDIMINAS', 	'TRAIT_JFD_LITHUANIA');
--==========================================================================================================================				
--==========================================================================================================================		
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_STEPHEN', 	'TXT_KEY_LEADER_JFD_STEPHEN', 	'TXT_KEY_LEADER_JFD_STEPHEN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_STEPHEN', 	'Stephen_Scene.xml', 	4, 						5, 						5, 							6, 			5, 				8, 				5, 						5, 				8, 			4, 			7, 				4, 			4, 			'JFD_HUNGARY_ATLAS',	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_STEPHEN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JFD_STEPHEN', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_STEPHEN', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_CITY_DEFENSE', 				9),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_RECON', 					6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_GROWTH', 					7),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_GOLD', 						5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_RELIGION', 					8),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_STEPHEN', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_STEPHEN', 	'TRAIT_JFD_HUNGARY');
--==========================================================================================================================				
--==========================================================================================================================		
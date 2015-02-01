--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_ARMINIUS', 	'TXT_KEY_LEADER_JFD_ARMINIUS', 		'TXT_KEY_LEADER_JFD_ARMINIUS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ARMINIUS', 	'Arminius_Scene.xml',	4, 						4, 						4, 							6, 			5, 				0, 				2, 						2, 				5, 			3, 			5, 				3, 			3, 			'JFD_GERMANS_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ARMINIUS', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_ARMINIUS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		9),
			('LEADER_JFD_ARMINIUS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
			('LEADER_JFD_ARMINIUS', 	'MAJOR_CIV_APPROACH_GUARDED', 		9),
			('LEADER_JFD_ARMINIUS', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
			('LEADER_JFD_ARMINIUS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		1),
			('LEADER_JFD_ARMINIUS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ARMINIUS', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
			('LEADER_JFD_ARMINIUS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_ARMINIUS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_ARMINIUS', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_JFD_ARMINIUS', 	'MINOR_CIV_APPROACH_BULLY', 		9);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_ARMINIUS', 	'FLAVOR_OFFENSE', 					9),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_DEFENSE', 					2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_CITY_DEFENSE', 				2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_RECON', 					6),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_NAVAL', 					1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_NAVAL_RECON', 				1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_NAVAL_GROWTH', 				1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_AIR', 						1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_GROWTH', 					4),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_GOLD', 						8),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_SCIENCE', 					3),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_CULTURE', 					2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_HAPPINESS', 				2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_GREAT_PEOPLE', 				2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_WONDER', 					2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_RELIGION', 					1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_DIPLOMACY', 				1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_SPACESHIP', 				1),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_ESPIONAGE', 				3),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_ARMINIUS', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_ARMINIUS', 	'TRAIT_JFD_GERMANS');
--==========================================================================================================================				
--==========================================================================================================================		
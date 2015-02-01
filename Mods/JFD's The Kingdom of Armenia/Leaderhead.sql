--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_TIRIDATES', 	'TXT_KEY_LEADER_JFD_TIRIDATES', 	'TXT_KEY_LEADER_JFD_TIRIDATES_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_TIRIDATES', 	'Tiridates_Scene.xml',	6, 						3, 						3, 							6, 			6, 				5, 				6, 						5, 				8, 			3, 			6, 				4, 			5, 			'JFD_ARMENIA_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_TIRIDATES', 	'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_JFD_TIRIDATES', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_JFD_TIRIDATES', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_JFD_TIRIDATES', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_JFD_TIRIDATES', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_TIRIDATES', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_TIRIDATES', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_TIRIDATES', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_JFD_TIRIDATES', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_JFD_TIRIDATES', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_TIRIDATES', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_JFD_TIRIDATES', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_TIRIDATES', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_MOBILE', 					8),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_GOLD', 						6),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_WONDER', 					5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_RELIGION', 					6),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_TIRIDATES', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_TIRIDATES', 	'TRAIT_JFD_ARMENIA');
--==========================================================================================================================				
--==========================================================================================================================		
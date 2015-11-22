--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_DUFOUR', 	'TXT_KEY_LEADER_JFD_DUFOUR', 	'TXT_KEY_LEADER_JFD_DUFOUR_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_DUFOUR', 	'Dufour_Scene.xml', 2, 						3, 						2, 							5, 			8, 				0, 				0, 						0, 				6, 			4, 			4, 				1, 			1, 			'JFD_SWITZERLAND_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_DUFOUR', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		10);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_IGNORE', 		9),
			('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_FRIENDLY', 		0),
			('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	0),
			('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_CONQUEST', 		0),
			('LEADER_JFD_DUFOUR', 	'MINOR_CIV_APPROACH_BULLY', 		0);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_DUFOUR', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_MILITARY_TRAINING', 		7),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_RECON', 					7),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_MOBILE', 					4),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_GOLD', 						9),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_NUKE', 						1),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_USE_NUKE', 					1),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_ESPIONAGE', 				9),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_AIRLIFT', 					1),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_DUFOUR', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_DUFOUR', 	'TRAIT_JFD_SWITZERLAND');
--==========================================================================================================================				
--==========================================================================================================================		
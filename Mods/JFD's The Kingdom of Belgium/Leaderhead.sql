--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_ALBERT', 		'TXT_KEY_LEADER_JFD_ALBERT', 		'TXT_KEY_LEADER_JFD_ALBERT_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ALBERT', 		'Albert_Scene.xml',	2, 						2, 						2, 							2, 			8, 				8, 				8, 						9, 				8, 			8, 			6, 				7, 			2, 			'JFD_BELGIUM_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_WAR', 			0),
			('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_HOSTILE', 		1),
			('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
			('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_JFD_ALBERT', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_JFD_ALBERT', 		'MINOR_CIV_APPROACH_CONQUEST', 		1);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_ALBERT', 		'FLAVOR_OFFENSE', 					1),
			('LEADER_JFD_ALBERT', 		'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_ALBERT', 		'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_ALBERT', 		'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_JFD_ALBERT', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_RANGED', 					3),
			('LEADER_JFD_ALBERT', 		'FLAVOR_MOBILE', 					2),
			('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_JFD_ALBERT', 		'FLAVOR_AIR', 						3),
			('LEADER_JFD_ALBERT', 		'FLAVOR_EXPANSION', 				4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_GROWTH', 					3),
			('LEADER_JFD_ALBERT', 		'FLAVOR_TILE_IMPROVEMENT', 			9),
			('LEADER_JFD_ALBERT', 		'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_ALBERT', 		'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_GOLD', 						8),
			('LEADER_JFD_ALBERT', 		'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_ALBERT', 		'FLAVOR_HAPPINESS', 				9),
			('LEADER_JFD_ALBERT', 		'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_ALBERT', 		'FLAVOR_WONDER', 					2),
			('LEADER_JFD_ALBERT', 		'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_ALBERT', 		'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_ALBERT', 		'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_ALBERT', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_ALBERT', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_ALBERT', 		'FLAVOR_ESPIONAGE', 				3),
			('LEADER_JFD_ALBERT', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_ALBERT', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_ALBERT', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_ALBERT', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_ALBERT', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_ALBERT', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_ALBERT', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_ALBERT', 		'TRAIT_JFD_BELGIUM');
--==========================================================================================================================				
--==========================================================================================================================		
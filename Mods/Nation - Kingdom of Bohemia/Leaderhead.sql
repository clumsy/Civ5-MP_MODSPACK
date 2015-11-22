--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_VACLAV', 	'TXT_KEY_LEADER_JFD_VACLAV', 	'TXT_KEY_LEADER_JFD_VACLAV_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VACLAV', 	'Vaclav_Scene.xml', 4, 						5, 						9, 							8, 			5, 				6, 				6, 						5, 				5, 			5, 			4, 				4, 			3, 			'JFD_BOHEMIA_ATLAS',	1);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
			('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_JFD_VACLAV', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_VACLAV', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_VACLAV', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_JFD_VACLAV', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_JFD_VACLAV', 	'FLAVOR_CITY_DEFENSE', 				9),
			('LEADER_JFD_VACLAV', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_VACLAV', 	'FLAVOR_RANGED', 					7),
			('LEADER_JFD_VACLAV', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_EXPANSION', 				5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_VACLAV', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_JFD_VACLAV', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_VACLAV', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_VACLAV', 	'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_VACLAV', 	'FLAVOR_CULTURE', 					5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_GREAT_PEOPLE', 				3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_VACLAV', 	'FLAVOR_DIPLOMACY', 				9),
			('LEADER_JFD_VACLAV', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_VACLAV', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_JFD_VACLAV', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_VACLAV', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_JFD_VACLAV', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
			('LEADER_JFD_VACLAV', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_VACLAV', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_VACLAV', 	'TRAIT_JFD_BOHEMIA');
--==========================================================================================================================			
--==========================================================================================================================	
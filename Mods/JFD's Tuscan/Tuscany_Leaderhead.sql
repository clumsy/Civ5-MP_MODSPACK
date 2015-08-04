--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_LORENZO', 			'TXT_KEY_LEADER_LORENZO_DESC', 		'TXT_KEY_LEADER_LORENZO_PEDIA', 		'TXT_KEY_LEADER_LORENZO', 						'Tuscany_Leaderhead.xml',	5, 						8, 						5, 							5, 			8, 				6, 				6, 						8, 				7, 			5, 			4, 				4, 			4, 			'TUSCANY_ATLAS', 		2);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_LORENZO', 		'MAJOR_CIV_APPROACH_WAR', 			3),
			('LEADER_LORENZO', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_LORENZO', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_LORENZO', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_LORENZO', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_LORENZO', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_LORENZO', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_LORENZO', 		'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_LORENZO', 		'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_LORENZO', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_LORENZO', 		'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_LORENZO', 		'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_LORENZO', 		'FLAVOR_OFFENSE', 					3),
			('LEADER_LORENZO', 		'FLAVOR_DEFENSE', 					6),
			('LEADER_LORENZO', 		'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_LORENZO', 		'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_LORENZO', 		'FLAVOR_RECON', 					5),
			('LEADER_LORENZO', 		'FLAVOR_RANGED', 					5),
			('LEADER_LORENZO', 		'FLAVOR_MOBILE', 					6),
			('LEADER_LORENZO', 		'FLAVOR_NAVAL', 					5),
			('LEADER_LORENZO', 		'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_LORENZO', 		'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_LORENZO', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_LORENZO', 		'FLAVOR_AIR', 						5),
			('LEADER_LORENZO', 		'FLAVOR_EXPANSION', 				5),
			('LEADER_LORENZO', 		'FLAVOR_GROWTH', 					7),
			('LEADER_LORENZO', 		'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_LORENZO', 		'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_LORENZO', 		'FLAVOR_PRODUCTION', 				5),
			('LEADER_LORENZO', 		'FLAVOR_GOLD', 						5),
			('LEADER_LORENZO', 		'FLAVOR_SCIENCE', 					6),
			('LEADER_LORENZO', 		'FLAVOR_CULTURE', 					9),
			('LEADER_LORENZO', 		'FLAVOR_HAPPINESS', 				6),
			('LEADER_LORENZO', 		'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_LORENZO', 		'FLAVOR_WONDER', 					8),
			('LEADER_LORENZO', 		'FLAVOR_RELIGION', 					4),
			('LEADER_LORENZO', 		'FLAVOR_DIPLOMACY', 				7),
			('LEADER_LORENZO', 		'FLAVOR_SPACESHIP', 				3),
			('LEADER_LORENZO', 		'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_LORENZO', 		'FLAVOR_NUKE', 						2),
			('LEADER_LORENZO', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_LORENZO', 		'FLAVOR_ESPIONAGE', 				6),
			('LEADER_LORENZO', 		'FLAVOR_AIRLIFT', 					5),
			('LEADER_LORENZO', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_LORENZO', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_LORENZO', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_LORENZO', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_LORENZO', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_LORENZO', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_LORENZO', 			'TRAIT_CRADLE_OF_THE_RENAISSANCE');
--==========================================================================================================================				
--==========================================================================================================================		
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_VICTORIA', 	'TXT_KEY_LEADER_JFD_VICTORIA', 'TXT_KEY_LEADER_JFD_VICTORIA_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VICTORIA', 	'Victoria_Scene.xml',	8, 						3, 						4, 							7, 			7, 				8, 				5, 						5, 				4, 			6, 			4, 				2, 			1, 			'JFD_GREAT_BRITAIN_ATLAS', 1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
			('LEADER_JFD_VICTORIA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================		
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_JFD_VICTORIA', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
UPDATE Leader_Flavors
SET Flavor = 8
WHERE LeaderType = 'LEADER_ELIZABETH' AND FlavorType IN ('FLAVOR_HAPPINESS');

INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_VICTORIA', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_RECON', 					8),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_RANGED', 					6),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_MOBILE', 					6),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL', 					9),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL_RECON', 				8),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL_GROWTH', 				8),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_EXPANSION', 				10),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_PRODUCTION', 				8),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_GOLD', 						9),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_CULTURE', 					4),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_HAPPINESS', 				2),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_GREAT_PEOPLE', 				3),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_WONDER', 					3),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_VICTORIA', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_VICTORIA', 	'TRAIT_JFD_GREAT_BRITAIN');
--==========================================================================================================================				
--==========================================================================================================================		
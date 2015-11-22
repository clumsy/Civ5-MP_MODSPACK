--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_JFD_CHARLES_V', 	'TXT_KEY_LEADER_JFD_CHARLES_V', 	'TXT_KEY_LEADER_JFD_CHARLES_V_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CHARLES_V', 	'CharlesV_Scene.xml',	9, 						5, 						10, 						7, 			8, 				7, 				6, 						7, 				8, 			5, 			6, 				6, 			3, 			'JFD_HOLY_ROME_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHARLES_V', 	'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_JFD_CHARLES_V', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_JFD_CHARLES_V', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_JFD_CHARLES_V', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_JFD_CHARLES_V', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_JFD_CHARLES_V', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_CHARLES_V', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHARLES_V', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_CHARLES_V', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_CHARLES_V', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_JFD_CHARLES_V', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_JFD_CHARLES_V', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================	
UPDATE Leader_Flavors
SET Flavor = 7
WHERE LeaderType = 'LEADER_ENRICO_DANDOLO' AND FlavorType = 'FLAVOR_EXPANSION';
				
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_CHARLES_V', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_RANGED', 					4),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_NAVAL', 					4),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_AIR', 						5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_GOLD', 						7),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_CULTURE', 					7),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_HAPPINESS', 				5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_WONDER', 					5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_RELIGION', 					7),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_DIPLOMACY', 				10),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_CHARLES_V', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_CHARLES_V', 	'TRAIT_JFD_HOLY_ROME');
--==========================================================================================================================				
--==========================================================================================================================		
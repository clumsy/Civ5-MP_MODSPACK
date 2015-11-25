--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 							Civilopedia, 								CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_EADNI', 			'TXT_KEY_MC_LEADER_EADNI_DESC', 		'TXT_KEY_MC_LEADER_EADNI_DESC', 			'TXT_KEY_MC_LEADER_EADNI', 						'Sami_Leaderhead.xml',	2, 						2, 						2, 							2, 			8, 				6, 				6, 						8, 				8, 			4, 			4, 				7, 			2, 			'SAMI_ATLAS', 			1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_EADNI', 			'MAJOR_CIV_APPROACH_WAR', 			1),
			('LEADER_EADNI', 			'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_EADNI', 			'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_EADNI', 			'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_EADNI', 			'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_EADNI', 			'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_EADNI', 			'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_EADNI', 			'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_EADNI', 			'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_EADNI', 			'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_EADNI', 			'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_EADNI', 			'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_EADNI', 			'FLAVOR_OFFENSE', 					4),
			('LEADER_EADNI', 			'FLAVOR_DEFENSE', 					7),
			('LEADER_EADNI', 			'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_EADNI', 			'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_EADNI', 			'FLAVOR_RECON', 					5),
			('LEADER_EADNI', 			'FLAVOR_RANGED', 					6),
			('LEADER_EADNI', 			'FLAVOR_MOBILE', 					2),
			('LEADER_EADNI', 			'FLAVOR_NAVAL', 					4),
			('LEADER_EADNI', 			'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_EADNI', 			'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_EADNI', 			'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_EADNI', 			'FLAVOR_AIR', 						3),
			('LEADER_EADNI', 			'FLAVOR_EXPANSION', 				6),
			('LEADER_EADNI', 			'FLAVOR_GROWTH', 					6),
			('LEADER_EADNI', 			'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_EADNI', 			'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_EADNI', 			'FLAVOR_PRODUCTION', 				6),
			('LEADER_EADNI', 			'FLAVOR_GOLD', 						6),
			('LEADER_EADNI', 			'FLAVOR_SCIENCE', 					4),
			('LEADER_EADNI', 			'FLAVOR_CULTURE', 					8),
			('LEADER_EADNI', 			'FLAVOR_HAPPINESS', 				9),
			('LEADER_EADNI', 			'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_EADNI', 			'FLAVOR_WONDER', 					4),
			('LEADER_EADNI', 			'FLAVOR_RELIGION', 					8),
			('LEADER_EADNI', 			'FLAVOR_DIPLOMACY', 				3),
			('LEADER_EADNI', 			'FLAVOR_SPACESHIP', 				2),
			('LEADER_EADNI', 			'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_EADNI', 			'FLAVOR_NUKE', 						2),
			('LEADER_EADNI', 			'FLAVOR_USE_NUKE', 					2),
			('LEADER_EADNI', 			'FLAVOR_ESPIONAGE', 				3),
			('LEADER_EADNI', 			'FLAVOR_AIRLIFT', 					2),
			('LEADER_EADNI', 			'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_EADNI', 			'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_EADNI', 			'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_EADNI', 			'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_EADNI', 			'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_EADNI', 			'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_EADNI', 			'TRAIT_SIIDA_CULTURE');
--==========================================================================================================================				
--==========================================================================================================================		
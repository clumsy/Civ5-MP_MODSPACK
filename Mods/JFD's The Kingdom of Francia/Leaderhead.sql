--==========================================================================================================================
-- Leaders
--==========================================================================================================================		
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 								CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_CHARLEMAGNE', 	'TXT_KEY_LEADER_JFD_CHARLEMAGNE', 	'TXT_KEY_LEADER_JFD_CHARLEMAGNE_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CHARLEMAGNE', 	'Charlemagne_Scene.xml',	5, 						4, 						4, 							5, 			5, 				8, 				5, 						8, 				9, 			4, 			8, 				2, 			1, 			'JFD_THE_FRANKS_ATLAS', 	0);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHARLEMAGNE', 	'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_CHARLEMAGNE', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_CHARLEMAGNE', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
			('LEADER_JFD_CHARLEMAGNE', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_CHARLEMAGNE', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_JFD_CHARLEMAGNE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_CHARLEMAGNE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--==========================================================================================================================
-- Leader_MajorCivApproachBiases
--==========================================================================================================================					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_CHARLEMAGNE', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_JFD_CHARLEMAGNE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_CHARLEMAGNE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_JFD_CHARLEMAGNE', 	'MINOR_CIV_APPROACH_CONQUEST', 		1),
			('LEADER_JFD_CHARLEMAGNE', 	'MINOR_CIV_APPROACH_BULLY', 		1);
--==========================================================================================================================
-- Leader_Flavors
--==========================================================================================================================					
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_OFFENSE', 					2),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_RECON', 					4),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_RANGED', 					2),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_MOBILE', 					5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_NAVAL', 					3),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_AIR', 						4),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_GROWTH', 					6),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_GOLD', 						4),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_SCIENCE', 					8),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_WONDER', 					5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_RELIGION', 					8),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_NUKE', 						3),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_CHARLEMAGNE', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================
-- Leader_Traits
--==========================================================================================================================					
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_CHARLEMAGNE', 	'TRAIT_JFD_THE_FRANKS');
--==========================================================================================================================			
--==========================================================================================================================	
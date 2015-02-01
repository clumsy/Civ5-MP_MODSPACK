--==========================================================================================================================	
-- Resources
--==========================================================================================================================	
INSERT INTO Resources
			(Type, 							TechCityTrade, 				Description,									Civilopedia, 							Help, 									ResourceClassType, 		CivilizationType, 				AITradeModifier, 	AIObjective, 	ConstAppearance,	RandApp1, 	RandApp2, 	Player,		ResourceUsage, 	'Unique', 		IconString, 			PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_JFD_MANPOWER', 		'TECH_BRONZE_WORKING', 		'TXT_KEY_CIVIL_WAR_SCENARIO_RESOURCE_MANPOWER',	'TXT_KEY_JFD_RESOURCE_MANPOWER_TEXT', 	'TXT_KEY_JFD_RESOURCE_MANPOWER_HELP', 	'RESOURCECLASS_RUSH', 	'CIVILIZATION_JFD_SWITZERLAND', 100, 				1, 				100, 				10, 		10, 		75, 		1, 				6, 				'[ICON_RES_MANPOWER]', 	0, 				'CIVIL_WAR_RESOURCE_ATLAS_EXP2');
--==========================================================================================================================	
-- Resource_Flavors
--==========================================================================================================================	
INSERT INTO Resource_Flavors
			(ResourceType, 						FlavorType, 					Flavor)
VALUES		('RESOURCE_JFD_MANPOWER', 			'FLAVOR_OFFENSE', 				10),
			('RESOURCE_JFD_MANPOWER', 			'FLAVOR_MILITARY_TRAINING', 	50);
--==========================================================================================================================	
--==========================================================================================================================	

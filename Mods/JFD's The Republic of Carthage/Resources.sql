--==========================================================================================================================
-- Resources
--==========================================================================================================================
INSERT OR REPLACE INTO Resources 
			(Type,						Description,						Civilopedia, 								TechCityTrade, 	PolicyReveal, 				ResourceClassType, 		Happiness,  CivilizationType,			AITradeModifier, 	AIObjective,	'Unique', 	IconString, 				ArtDefineTag,						PortraitIndex, 	IconAtlas)
VALUES		('RESOURCE_JFD_SHELLFISH',	'TXT_KEY_RESOURCE_JFD_SHELLFISH',	'TXT_KEY_CIV5_RESOURCE_JFD_SHELLFISH_TEXT',	'TECH_SAILING',	'POLICY_JFD_DIDO_CARTHAGE',	'RESOURCECLASS_LUXURY',	4,			'CIVILIZATION_CARTHAGE',	20,					0, 				2, 			'[ICON_RES_JFD_SHELLFISH]',	'ART_DEF_RESOURCE_JFD_SHELLFISH',	2, 				'JFD_CARTHAGE_DIDO_ATLAS');
--==========================================================================================================================
-- Resource_YieldChanges
--==========================================================================================================================
INSERT OR REPLACE INTO Resource_YieldChanges 	
			(ResourceType, 					YieldType, 			Yield)
VALUES		('RESOURCE_JFD_SHELLFISH',		'YIELD_GOLD',		2);
--==========================================================================================================================
-- Resource_Flavors
--==========================================================================================================================
INSERT OR REPLACE INTO Resource_Flavors 	
			(ResourceType, 					FlavorType, 		Flavor)
VALUES		('RESOURCE_JFD_SHELLFISH', 		'FLAVOR_HAPPINESS', 10);
--==========================================================================================================================
-- Resource_TerrainBooleans
--==========================================================================================================================
INSERT OR REPLACE INTO Resource_TerrainBooleans 	
			(ResourceType, 					TerrainType)
VALUES		('RESOURCE_JFD_SHELLFISH', 		'TERRAIN_COAST');
--==========================================================================================================================
--==========================================================================================================================		
		
			
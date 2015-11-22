--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,								SpecificCivRequired,	CivilizationType,			GoldMaintenance,	NoTwoAdjacent,	HillsMakesValid,	Description,						Civilopedia,									ArtDefineTag,					BuildableOnResources,	DestroyedWhenPillaged,	Permanent,	PillageGold,	DefenseModifier,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_JFD_SCHLOSS',			1,						'CIVILIZATION_JFD_BAVARIA',	0,					1,				1,					'TXT_KEY_IMPROVEMENT_JFD_SCHLOSS',	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_SCHLOSS_TEXT',	'ART_DEF_IMPROVEMENT_SCHLOSS', 	0,						0,						1,			50,				0,					0,				'JFD_SCHLOSS_ATLAS'),
			('IMPROVEMENT_JFD_SCHLOSS_GOLD',	0,						null,						0,					1,				1,					'TXT_KEY_IMPROVEMENT_JFD_SCHLOSS',	'TXT_KEY_CIV5_IMPROVEMENTS_JFD_SCHLOSS_TEXT',	'ART_DEF_IMPROVEMENT_SCHLOSS', 	0,						0,						1,			50,				50,					0,				'JFD_SCHLOSS_ATLAS');
--==========================================================================================================================
-- Improvement_ResourceTypes
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,				ResourceType)
SELECT		('IMPROVEMENT_JFD_SCHLOSS'), 	ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_MINE';
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,				TerrainType)
VALUES		('IMPROVEMENT_JFD_SCHLOSS',		'TERRAIN_HILL');
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_Yields
			(ImprovementType,					YieldType,			Yield)
VALUES		('IMPROVEMENT_JFD_SCHLOSS_GOLD',	'YIELD_GOLD',		2),
			('IMPROVEMENT_JFD_SCHLOSS_GOLD',	'YIELD_CULTURE',	1),
			('IMPROVEMENT_JFD_SCHLOSS',			'YIELD_CULTURE',	1);
--==========================================================================================================================
-- Improvement_AdjacentMountainYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_AdjacentMountainYieldChanges
			(ImprovementType,					YieldType,			Yield)
VALUES		('IMPROVEMENT_JFD_SCHLOSS',			'YIELD_CULTURE',	1),	
			('IMPROVEMENT_JFD_SCHLOSS_GOLD',	'YIELD_CULTURE',	1);
--==========================================================================================================================
--==========================================================================================================================
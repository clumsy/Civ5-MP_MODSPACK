--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,								NoTwoAdjacent,	Water,	NearbyEnemyDamage,	DefenseModifier,	CreatedByGreatPerson,	AllowsWalkWater,	InAdjacentFriendly,	CultureBombRadius,	Description,							Civilopedia,								ArtDefineTag,					BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_JFD_SEA_FORTRESS',	1,				1,		30,					100,				1,						1,					1,					1,					'TXT_KEY_IMPROVEMENT_JFD_SEA_FORTRESS',	'TXT_KEY_CIV5_IMPROVEMENTS_CITADEL_TEXT',	'ART_DEF_IMPROVEMENT_CITADEL', 	0,						35,				'TERRAIN_ATLAS');
--==========================================================================================================================
-- Improvement_ResourceTypes
--==========================================================================================================================
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,					TerrainType)
VALUES		('IMPROVEMENT_JFD_SEA_FORTRESS',	'TERRAIN_COAST'),
			('IMPROVEMENT_JFD_SEA_FORTRESS',	'TERRAIN_OCEAN');
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,											SpecificCivRequired,	CivilizationType,			RequiresImprovement,	GoldMaintenance,	NoTwoAdjacent,	Description,											Civilopedia,												ArtDefineTag,									RequiresFeature,	CultureBombRadius,	BarbarianCamp,	InAdjacentFriendly, DestroyedWhenPillaged,	Permanent,	PillageGold,	BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_JFD_ENCAMPMENT',					1,						'CIVILIZATION_JFD_GERMANS',	0,						0,					1,				'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT',					'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_PEDIA',					'ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT', 			1,					0,					1,				0,					0,						0,			150,			0,						0,				'JFD_GERMAN_TRIBES_ATLAS'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',	1,						'CIVILIZATION_JFD_GERMANS',	1,						0,					1,				'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',		'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER_PEDIA',	'ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 	0,					0,					0,				0,					0,						1,			0,				0,						1,				'JFD_GERMAN_TRIBES_ATLAS'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	1,						'CIVILIZATION_JFD_GERMANS',	1,						0,					1,				'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE_PEDIA',	'ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 	0,					0,					0,				0,					0,						1,			0,				0,						1,				'JFD_GERMAN_TRIBES_ATLAS'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',	1,						'CIVILIZATION_JFD_GERMANS',	1,						0,					1,				'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',		'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON_PEDIA',	'ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 	0,					0,					0,				0,					0,						1,			0,				0,						1,				'JFD_GERMAN_TRIBES_ATLAS'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED',			1,						'CIVILIZATION_JFD_GERMANS',	1,						0,					1,				'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED',			'TXT_KEY_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_PEDIA',		'ART_DEF_IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED', 	0,					0,					0,				0,					0,						1,			0,				0,						1,				'JFD_GERMAN_TRIBES_ATLAS');
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,							TerrainType)
VALUES		('IMPROVEMENT_JFD_ENCAMPMENT',				'TERRAIN_GRASS'),
			('IMPROVEMENT_JFD_ENCAMPMENT',				'TERRAIN_PLAINS'),
			('IMPROVEMENT_JFD_ENCAMPMENT',				'TERRAIN_TUNDRA');
--==========================================================================================================================
-- Improvement_ValidFeatures
--==========================================================================================================================
INSERT INTO Improvement_ValidFeatures
			(ImprovementType,								FeatureType)
VALUES		('IMPROVEMENT_JFD_ENCAMPMENT',					'FEATURE_JUNGLE'),
			('IMPROVEMENT_JFD_ENCAMPMENT',					'FEATURE_FOREST');
--==========================================================================================================================
-- Improvement_ResourceTypes
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,								ResourceType)
VALUES		('IMPROVEMENT_JFD_ENCAMPMENT',					'RESOURCE_DEER'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',	'RESOURCE_DEER'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	'RESOURCE_HORSE'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',	'RESOURCE_IRON');

INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED'),	Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';
--==========================================================================================================================
-- Improvement_ValidImprovements
--==========================================================================================================================
INSERT INTO Improvement_ValidImprovements
			(ImprovementType,								PrereqImprovement)
VALUES		('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',	'IMPROVEMENT_JFD_ENCAMPMENT'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	'IMPROVEMENT_JFD_ENCAMPMENT'),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',	'IMPROVEMENT_JFD_ENCAMPMENT');
--==========================================================================================================================
-- Improvement_Yields
--==========================================================================================================================
INSERT INTO Improvement_Yields
			(ImprovementType,								YieldType,				Yield)
VALUES		('IMPROVEMENT_JFD_ENCAMPMENT',					'YIELD_GOLD',			1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',	'YIELD_FOOD',			1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',	'YIELD_PRODUCTION',		-1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	'YIELD_GOLD',			1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',	'YIELD_PRODUCTION',		-1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',	'YIELD_GOLD',			2),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED',			'YIELD_PRODUCTION',		-1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED',			'YIELD_GOLD',			2);
--==========================================================================================================================
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,								TechType,			YieldType,		Yield)
VALUES		('IMPROVEMENT_JFD_ENCAMPMENT',					'TECH_ECONOMICS',	'YIELD_GOLD',	1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',	'TECH_ECONOMICS',	'YIELD_GOLD',	1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	'TECH_ECONOMICS',	'YIELD_GOLD',	1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',	'TECH_ECONOMICS',	'YIELD_GOLD',	1),
			('IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED',			'TECH_ECONOMICS',	'YIELD_GOLD',	1);
--==========================================================================================================================
--==========================================================================================================================
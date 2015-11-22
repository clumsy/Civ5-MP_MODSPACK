--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,							SpecificCivRequired,	CivilizationType,				RequiresFeature,	OutsideBorders, Description,							Civilopedia,											ArtDefineTag,						BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_JFD_SIEGE_UNIT',	1,						'CIVILIZATION_JFD_THE_FRANKS',	1,					1,				'TXT_KEY_IMPROVEMENT_JFD_SIEGE_UNIT',	'TXT_KEY_CIVILOPEDIA_UNITS_MEDIEVAL_TREBUCHET_TEXT',	'ART_DEF_IMPROVEMENT_LUMBERMILL', 	0,						3,				'JFD_SIEGE_UNIT_ATLAS');
--==========================================================================================================================
-- Improvement_ValidFeatures
--==========================================================================================================================
INSERT INTO Improvement_ValidFeatures
			(ImprovementType,				FeatureType)
VALUES		('IMPROVEMENT_JFD_SIEGE_UNIT',	'FEATURE_FOREST'),
			('IMPROVEMENT_JFD_SIEGE_UNIT',	'FEATURE_JUNGLE');
--==========================================================================================================================
--==========================================================================================================================
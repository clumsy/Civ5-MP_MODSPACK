--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,									OutsideBorders, Description,									Civilopedia,										ArtDefineTag,	PortraitIndex,	IconAtlas)
SELECT		('IMPROVEMENT_JFD_HOLY_ROMAN_CITY'),	1,				('TXT_KEY_IMPROVEMENT_JFD_HOLY_ROMAN_CITY'),	('TXT_KEY_IMPROVEMENT_JFD_HOLY_ROMAN_CITY_PEDIA'),	ArtDefineTag, 	PortraitIndex,	IconAtlas
FROM Improvements WHERE Type = 'IMPROVEMENT_CITY_RUINS';
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,						TerrainType)
SELECT		('IMPROVEMENT_JFD_HOLY_ROMAN_CITY'), 	TerrainType
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_FORT';
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_ValidFeatures
			(ImprovementType,						FeatureType)
SELECT		('IMPROVEMENT_JFD_HOLY_ROMAN_CITY'), 	FeatureType
FROM Improvement_ValidFeatures WHERE ImprovementType = 'IMPROVEMENT_GOODY_HUT';
--==========================================================================================================================
--==========================================================================================================================
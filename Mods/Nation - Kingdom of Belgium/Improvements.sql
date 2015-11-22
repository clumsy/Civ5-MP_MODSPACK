--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,									OutsideBorders, SpecificCivRequired,	CivilizationType,			Description,	Civilopedia,	ArtDefineTag,	PillageGold,	PortraitIndex,	IconAtlas)
SELECT		('IMPROVEMENT_JFD_BELGIAN_PLANTATION'),	1,				1,						'CIVILIZATION_JFD_BELGIUM',	Description,	Civilopedia,	ArtDefineTag, 	PillageGold,	PortraitIndex,	IconAtlas
FROM Improvements WHERE Type = 'IMPROVEMENT_PLANTATION';
--==========================================================================================================================
-- Improvement_ResourceTypes
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_JFD_BELGIAN_PLANTATION'), 	ResourceType
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--==========================================================================================================================
-- Improvement_ResourceType_Yields
--==========================================================================================================================
INSERT INTO Improvement_ResourceType_Yields
			(ImprovementType,							ResourceType, YieldType, Yield)
SELECT		('IMPROVEMENT_JFD_BELGIAN_PLANTATION'), 	ResourceType, YieldType, Yield
FROM Improvement_ResourceType_Yields WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--==========================================================================================================================
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_TechYieldChanges
			(ImprovementType,							TechType, YieldType, Yield)
SELECT		('IMPROVEMENT_JFD_BELGIAN_PLANTATION'), 	TechType, YieldType, Yield
FROM Improvement_TechYieldChanges WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';
--==========================================================================================================================
-- Belief_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Belief_ImprovementYieldChanges
			(BeliefType,	ImprovementType,						YieldType, Yield)
SELECT		BeliefType,		'IMPROVEMENT_JFD_BELGIAN_PLANTATION',	YieldType, Yield
FROM Belief_ImprovementYieldChanges WHERE ImprovementType = 'IMPROVEMENT_PLANTATION';	
--==========================================================================================================================
--==========================================================================================================================
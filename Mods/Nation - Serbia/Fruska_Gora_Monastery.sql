INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_FRUSKA_GORA_MONASTERY', 'Improvement', 'European';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.75,  'ART_DEF_IMPROVEMENT_FRUSKA_GORA_MONASTERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'sistineTI_HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed',       0.75,  'ART_DEF_IMPROVEMENT_FRUSKA_GORA_MONASTERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'sistineTI_B.fxsxml',    1 UNION ALL
SELECT 'Any', 'Pillaged',          0.75,  'ART_DEF_IMPROVEMENT_FRUSKA_GORA_MONASTERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'WTI_PL.fxsxml', 1;
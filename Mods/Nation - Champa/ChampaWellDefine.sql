INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_CHAMPA_WELL', 'Improvement', 'CHAMPA_WELL';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.21,  'ART_DEF_IMPROVEMENT_CHAMPA_WELL', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'champawell_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.21,  'ART_DEF_IMPROVEMENT_CHAMPA_WELL', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'champawell.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.21,  'ART_DEF_IMPROVEMENT_CHAMPA_WELL', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'champawell_pl.fxsxml', 1;
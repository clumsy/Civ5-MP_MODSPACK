
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_IBERIAN_CASTRO', 'Improvement', 'IBERIAN_CASTRO';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.0018,  'ART_DEF_IMPROVEMENT_IBERIAN_CASTRO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'castro_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.0018,  'ART_DEF_IMPROVEMENT_IBERIAN_CASTRO', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'castro_01.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.0018,  'ART_DEF_IMPROVEMENT_IBERIAN_CASTRO', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'castro_02.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.0018,  'ART_DEF_IMPROVEMENT_IBERIAN_CASTRO', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'castro_03.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.0018,  'ART_DEF_IMPROVEMENT_IBERIAN_CASTRO', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'castro_pl.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_IBERIAN_CASTRO', 'Improvement', 'sv_castro.dds';
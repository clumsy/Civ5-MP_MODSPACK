INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_BUCCANEER_DISTILLERY', 'Improvement', 'BUCCANEER_DISTILLERY';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.2,  'ART_DEF_IMPROVEMENT_BUCCANEER_DISTILLERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'distillery_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 1.8,  'ART_DEF_IMPROVEMENT_BUCCANEER_DISTILLERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'distillery.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.2,  'ART_DEF_IMPROVEMENT_BUCCANEER_DISTILLERY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'distillery_pl.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_BUCCANEER_DISTILLERY', 'Improvement', 'sv_distillery.dds';
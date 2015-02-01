
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_SCHLOSS', 'Improvement', 'SCHLOSS';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.20,  'ART_DEF_IMPROVEMENT_SCHLOSS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'schloss_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.20,  'ART_DEF_IMPROVEMENT_SCHLOSS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'schloss.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.20,  'ART_DEF_IMPROVEMENT_SCHLOSS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'schloss_pl.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_SCHLOSS', 'Improvement', 'sv_schloss.dds';
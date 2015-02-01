
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'Improvement', 'SEAFORTRESS';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 1.3,  'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Feitoria_HB.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.5,  'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Anc_Citadel.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 1.3,  'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Feitoria_PIL.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_JFD_SEA_FORTRESS', 'Improvement', 'sv_Citadel.dds';
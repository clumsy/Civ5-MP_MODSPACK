
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_INUUIT_INUKSHUK', 'Improvement', 'INUUIT_INUKSHUK';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.22,  'ART_DEF_IMPROVEMENT_INUUIT_INUKSHUK', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'inukshuk_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.22,  'ART_DEF_IMPROVEMENT_INUUIT_INUKSHUK', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'inukshuk01.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.22,  'ART_DEF_IMPROVEMENT_INUUIT_INUKSHUK', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'inukshuk02.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.22,  'ART_DEF_IMPROVEMENT_INUUIT_INUKSHUK', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'inukshuk03.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.22,  'ART_DEF_IMPROVEMENT_INUUIT_INUKSHUK', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'inukshuk_pl.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_INUUIT_INUKSHUK', 'Improvement', 'sv_inukshuk.dds';
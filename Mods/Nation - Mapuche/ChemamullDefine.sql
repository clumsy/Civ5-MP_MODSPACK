INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_CHEMAMULL', 'Improvement', 'Chemamull';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.35,  'ART_DEF_IMPROVEMENT_CHEMAMULL', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'chemamull_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.35,  'ART_DEF_IMPROVEMENT_CHEMAMULL', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'chemamull.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.35,  'ART_DEF_IMPROVEMENT_CHEMAMULL', 'RANDOM', 'ART_DEF_RESOURCE_ALL', 'chemamull_pl.fxsxml', 1 UNION ALL
SELECT 'Any', 'UnderConstruction', 0.35,  'ART_DEF_IMPROVEMENT_CHEMAMULL', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'chemamull_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.35,  'ART_DEF_IMPROVEMENT_CHEMAMULL', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'chemamull.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.35,  'ART_DEF_IMPROVEMENT_CHEMAMULL', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'chemamull_pl.fxsxml', 1;


INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_CHEMAMULL', 'Improvement', 'sv_chemamull.dds';
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_RESOURCE_MIGRATORY_GROUNDS', 'Resource', 'RESOURCE_MIGRATORY_GROUNDS';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'Any', 0.80,  'ART_DEF_IMPROVEMENT_NONE', 'RANDOM', 'ART_DEF_RESOURCE_MIGRATORY_GROUNDS', null, 1;

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_RESOURCE_MIGRATORY_GROUNDS', 'Resource', 'sv_migratory.dds';
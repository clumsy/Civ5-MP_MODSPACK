INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'Any', 0.959999978542328,  'ART_DEF_IMPROVEMENT_NONE', 'SNAPSHOT', 'ART_DEF_RESOURCE_COCA', 'plantation_mid_cocoa_hb.fxsxml', 1 UNION ALL
SELECT 'Ancient', 'UnderConstruction', 0.959999978542328,  'ART_DEF_IMPROVEMENT_COCA_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'cocoa.fxsxml', 1 UNION ALL
SELECT 'Ancient', 'Constructed', 0.959999978542328,  'ART_DEF_IMPROVEMENT_COCA_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'plantation_mid_cocoa.fxsxml', 1 UNION ALL
SELECT 'Ancient', 'Pillaged', 0.959999978542328,  'ART_DEF_IMPROVEMENT_COCA_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'plantation_mid_cocoa_pil.fxsxml', 1 UNION ALL
SELECT 'Industrial', 'UnderConstruction', 0.959999978542328,  'ART_DEF_IMPROVEMENT_COCA_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'plantation_ind_cocoa_hb.fxsxml', 1 UNION ALL
SELECT 'Industrial', 'Constructed', 0.959999978542328,  'ART_DEF_IMPROVEMENT_COCA_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'plantation_ind_cocoa.fxsxml', 1 UNION ALL
SELECT 'Industrial', 'Pillaged', 0.959999978542328,  'ART_DEF_IMPROVEMENT_COCA_PLANTATION', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'plantation_ind_cocoa_pil.fxsxml', 1;

INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	SELECT	('ART_DEF_RESOURCE_COCA'), ('Resource'), ('sv_coca.dds');
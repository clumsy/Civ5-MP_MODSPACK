INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'Constructed', 0.07,  'ART_DEF_IMPROVEMENT_FISHING_BOATS', 'ANIMATED', 'ART_DEF_RESOURCE_SEALS', 'seals.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.07,  'ART_DEF_IMPROVEMENT_FISHING_BOATS', 'ANIMATED', 'ART_DEF_RESOURCE_SEALS', 'seals_pl.fxsxml', 1;
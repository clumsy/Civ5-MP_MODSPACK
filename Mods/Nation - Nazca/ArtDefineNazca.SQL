INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_MC_GEOGLYPHS', 'Improvement', 'GEOGLYPHS';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 0.80,  'ART_DEF_IMPROVEMENT_MC_GEOGLYPHS', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'nazca_hb.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.80,  'ART_DEF_IMPROVEMENT_MC_GEOGLYPHS', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'nazca01.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.80,  'ART_DEF_IMPROVEMENT_MC_GEOGLYPHS', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'nazca02.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed', 0.80,  'ART_DEF_IMPROVEMENT_MC_GEOGLYPHS', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'nazca03.fxsxml', 1 UNION ALL
SELECT 'Any', 'Pillaged', 0.80,  'ART_DEF_IMPROVEMENT_MC_GEOGLYPHS', 'RANDOM', 'ART_DEF_RESOURCE_NONE', 'nazca_pl.fxsxml', 1;

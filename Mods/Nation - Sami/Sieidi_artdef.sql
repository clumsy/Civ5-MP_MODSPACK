--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_SIEIDI', 'Improvement', 'SIEIDI';
--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO ArtDefine_Landmarks
		(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
VALUES 	('Any', 'UnderConstruction', 1,  'ART_DEF_IMPROVEMENT_SIEIDI', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Sieidi_B.fxsxml', 1),
		('Any', 'Constructed', 1,  'ART_DEF_IMPROVEMENT_SIEIDI', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Sieidi_B.fxsxml', 1),
		('Any', 'Pillaged', 1,  'ART_DEF_IMPROVEMENT_SIEIDI', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'Sieidi_PL.fxsxml', 1);
--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
SELECT 'ART_DEF_IMPROVEMENT_SIEIDI', 'Improvement', 'sv_sieidi.dds';
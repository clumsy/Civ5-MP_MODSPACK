-- Insert SQL Rules Here 
--INSERT INTO ArtDefine_StrategicView (StrategicViewType,				TileType,			Asset) Values
									--('ART_DEF_RESOURCE_GOAT',		'Resource',			'SV_Goat.dds');

INSERT INTO ArtDefine_LandmarkTypes	(Type,										LandmarkType,			FriendlyName) VALUES
									('ART_DEF_RESOURCE_GOAT',				'Resource',				'Goat');

INSERT INTO ArtDefine_Landmarks (Era,				State,						Scale,	ImprovementType,							LayoutHandler,			ResourceType,							Model,												TerrainContour) VALUES									
								('Any',				'Any',						1,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_GOAT',				'Art/Goat/Resource_Goat.fxsxml',				1);
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (1, 'ArtDefines_Animals.sql');
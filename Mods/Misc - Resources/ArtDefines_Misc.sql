-- Insert SQL Rules Here 
INSERT INTO ArtDefine_StrategicView (StrategicViewType,				TileType,			Asset) Values
									--('ART_DEF_RESOURCE_KELP',		'Resource',			'Art/Kelp/SV_Kelp.dds'),
									--('ART_DEF_RESOURCE_REEF',		'Resource',			'Art/Reef/SV_Reef.dds'),
									('ART_DEF_RESOURCE_CLAY',		'Resource',			'Art/Clay/SV_Clay.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type,										LandmarkType,	FriendlyName) VALUES
									('ART_DEF_RESOURCE_KELP',					'Resource',		'Kelp'),
									('ART_DEF_RESOURCE_REEF',					'Resource',		'Reef'),
									('ART_DEF_RESOURCE_CLAY',					'Resource',		'Clay');

INSERT INTO ArtDefine_Landmarks (Era,				State,						Scale,	ImprovementType,							LayoutHandler,			ResourceType,								Model,															TerrainContour) VALUES	

								('Any',				'Any',						1,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_KELP',					'Art/Kelp/Kelp.fxsxml',											1),
								('Any',				'Any',						1,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_REEF',					'Art/Reef/Sea_Stones.fxsxml',									1),
								('Any',				'Any',						1,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_CLAY',					'Art/Clay/Clay.fxsxml',											1),
								('Any',				'UnderConstruction',		1,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_CLAY',					'Art/Clay/HB_Med_Clay_Mine.fxsxml',								1),
								('Any',				'Constructed',				1,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_CLAY',					'Art/Clay/Med_Mine_Clay.fxsxml',								1),
								('Any',				'Pillaged',					1,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_CLAY',					'Art/Clay/PL_Med_Clay_Mine.fxsxml',								1);
	-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (5, 'ArtDefines_Misc.sql');		
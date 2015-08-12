-- Insert SQL Rules Here 
INSERT INTO ArtDefine_StrategicView (StrategicViewType,				TileType,			Asset) Values
									('ART_DEF_RESOURCE_SOYBEAN',	'Resource',			'Art/Soybean/SV_Soybean.dds'),
									('ART_DEF_RESOURCE_HOPS',		'Resource',			'Art/Hops/SV_Hops.dds'),
									('ART_DEF_RESOURCE_OATS',		'Resource',			'Art/Oats/SV_Oats.dds'),
									('ART_DEF_RESOURCE_CORN',		'Resource',			'Art/Corn/SV_Corn.dds'),
									('ART_DEF_RESOURCE_BARLEY',		'Resource',			'Art/Barley/SV_Barley.dds');

INSERT INTO ArtDefine_LandmarkTypes	(Type,										LandmarkType,			FriendlyName) VALUES
									('ART_DEF_RESOURCE_SOYBEAN',				'Resource',				'Soybean'),
									('ART_DEF_RESOURCE_HOPS',					'Resource',				'Hops'),
									('ART_DEF_RESOURCE_OATS',					'Resource',				'Oats'),
									('ART_DEF_RESOURCE_CORN',					'Resource',				'Corn'),
									('ART_DEF_RESOURCE_BARLEY',					'Resource',				'Barley');

INSERT INTO ArtDefine_Landmarks (Era,				State,						Scale,		ImprovementType,							LayoutHandler,			ResourceType,							Model,												TerrainContour) VALUES	
								
								('Any',				'Any',						0.825,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SOYBEAN',				'Art/Soybean/Resource_Soybean.fxsxml',				1),
								('Industrial',		'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_SOYBEAN',				'Art/Soybean/Plantation_IND_Soybean.fxsxml',		1),
								('Industrial',		'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_SOYBEAN',				'Art/Soybean/HB_Plantation_IND_Soybean.fxsxml',		1),
								('Industrial',		'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_SOYBEAN',				'Art/Soybean/PL_Plantation_IND_Soybean.fxsxml',		1),
								('Ancient',			'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_SOYBEAN',				'Art/Soybean/Plantation_MID_Soybean.fxsxml',		1),
								('Ancient',			'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_SOYBEAN',				'Art/Soybean/HB_Plantation_MID_Soybean.fxsxml',		1),
								('Ancient',			'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_SOYBEAN',				'Art/Soybean/PL_Plantation_MID_Soybean.fxsxml',		1),
								
								('Any',				'Any',						0.825,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_HOPS',				'Art/Hops/Resource_Hops.fxsxml',					1),
								('Industrial',		'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_HOPS',				'Art/Hops/Plantation_IND_Hops.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_HOPS',				'Art/Hops/HB_Plantation_IND_Hops.fxsxml',			1),
								('Industrial',		'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_HOPS',				'Art/Hops/PL_Plantation_IND_Hops.fxsxml',			1),
								('Ancient',			'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_HOPS',				'Art/Hops/Plantation_MID_Hops.fxsxml',				1),
								('Ancient',			'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_HOPS',				'Art/Hops/HB_Plantation_MID_Hops.fxsxml',			1),
								('Ancient',			'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_HOPS',				'Art/Hops/PL_Plantation_MID_Hops.fxsxml',			1),
																
								('Any',				'Any',						0.825,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_OATS',				'Art/Oats/Resource_Oats.fxsxml',					1),
								('Industrial',		'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_OATS',				'Art/Oats/Plantation_IND_Oats.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_OATS',				'Art/Oats/HB_Plantation_IND_Oats.fxsxml',			1),
								('Industrial',		'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_OATS',				'Art/Oats/PL_Plantation_IND_Oats.fxsxml',			1),
								('Ancient',			'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_OATS',				'Art/Oats/Plantation_MID_Oats.fxsxml',				1),
								('Ancient',			'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_OATS',				'Art/Oats/HB_Plantation_MID_Oats.fxsxml',			1),
								('Ancient',			'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_OATS',				'Art/Oats/PL_Plantation_MID_Oats.fxsxml',			1),
																
								('Any',				'Any',						0.825,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_CORN',				'Art/Corn/Resource_Corn.fxsxml',					1),
								('Industrial',		'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_CORN',				'Art/Corn/Plantation_IND_Corn.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_CORN',				'Art/Corn/HB_Plantation_IND_Corn.fxsxml',			1),
								('Industrial',		'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_CORN',				'Art/Corn/PL_Plantation_IND_Corn.fxsxml',			1),
								('Ancient',			'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_CORN',				'Art/Corn/Plantation_MID_Corn.fxsxml',				1),
								('Ancient',			'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_CORN',				'Art/Corn/HB_Plantation_MID_Corn.fxsxml',			1),
								('Ancient',			'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_CORN',				'Art/Corn/PL_Plantation_MID_Corn.fxsxml',			1),
																
								('Any',				'Any',						0.825,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_BARLEY',				'Art/Barley/Resource_Barley.fxsxml',				1),
								('Industrial',		'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_BARLEY',				'Art/Barley/Plantation_IND_Barley.fxsxml',			1),
								('Industrial',		'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_BARLEY',				'Art/Barley/HB_Plantation_IND_Barley.fxsxml',		1),
								('Industrial',		'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_BARLEY',				'Art/Barley/PL_Plantation_IND_Barley.fxsxml',		1),
								('Ancient',			'Constructed',				0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_BARLEY',				'Art/Barley/Plantation_MID_Barley.fxsxml',			1),
								('Ancient',			'UnderConstruction',		0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_BARLEY',				'Art/Barley/HB_Plantation_MID_Barley.fxsxml',		1),
								('Ancient',			'Pillaged',					0.825,		'ART_DEF_IMPROVEMENT_FARM',					'SNAPSHOT',				'ART_DEF_RESOURCE_BARLEY',				'Art/Barley/PL_Plantation_MID_Barley.fxsxml',		1);
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (2, 'ArtDefines_Cereals.sql');								
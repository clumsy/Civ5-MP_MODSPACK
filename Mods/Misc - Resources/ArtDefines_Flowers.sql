-- Insert SQL Rules Here 
INSERT INTO ArtDefine_StrategicView (StrategicViewType,				TileType,			Asset) Values
									('ART_DEF_RESOURCE_LAVENDER',	'Resource',			'Art/Lavender/SV_Lanvender.dds'),
									('ART_DEF_RESOURCE_SUNFLOWER',	'Resource',			'Art/Sunflower/SV_Sunflower.dds'),
									('ART_DEF_RESOURCE_POPPY',		'Resource',			'Art/Poppy/SV_Poppy.dds'),
									('ART_DEF_RESOURCE_FLAX',		'Resource',			'Art/Flax/SV_Flax.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type,										LandmarkType,			FriendlyName) VALUES
									('ART_DEF_RESOURCE_LAVENDER',				'Resource',				'Lavender'),
									('ART_DEF_RESOURCE_SUNFLOWER',				'Resource',				'Sunfolower'),
									('ART_DEF_RESOURCE_POPPY',					'Resource',				'Poppy'),
									('ART_DEF_RESOURCE_FLAX',					'Resource',				'Flax');

INSERT INTO ArtDefine_Landmarks (Era,				State,						Scale,	ImprovementType,							LayoutHandler,			ResourceType,							Model,													TerrainContour) VALUES	

								('Any',				'Any',						0.875,	'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LAVENDER',			'Art/Lavender/Resource_Lavender.fxsxml',				1),
								('Industrial',		'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_LAVENDER',			'Art/Lavender/Plantation_IND_Lavender.fxsxml',			1),
								('Industrial',		'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_LAVENDER',			'Art/Lavender/HB_Plantation_IND_Lavender.fxsxml',		1),
								('Industrial',		'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_LAVENDER',			'Art/Lavender/PL_Plantation_IND_Lavender.fxsxml',		1),
								('Ancient',			'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_LAVENDER',			'Art/Lavender/Plantation_MID_Lavender.fxsxml',			1),
								('Ancient',			'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_LAVENDER',			'Art/Lavender/HB_Plantation_MID_Lavender.fxsxml',		1),
								('Ancient',			'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_LAVENDER',			'Art/Lavender/PL_Plantation_MID_Lavender.fxsxml',		1),
								
								('Any',				'Any',						0.875,	'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SUNFLOWER',			'Art/Sunflower/Resource_Sunflower.fxsxml',				1),
								('Industrial',		'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_SUNFLOWER',			'Art/Sunflower/Plantation_IND_Sunflower.fxsxml',		1),
								('Industrial',		'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_SUNFLOWER',			'Art/Sunflower/HB_Plantation_IND_Sunflower.fxsxml',		1),
								('Industrial',		'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_SUNFLOWER',			'Art/Sunflower/PL_Plantation_IND_Sunflower.fxsxml',		1),
								('Ancient',			'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_SUNFLOWER',			'Art/Sunflower/Plantation_MID_Sunflower.fxsxml',		1),
								('Ancient',			'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_SUNFLOWER',			'Art/Sunflower/HB_Plantation_MID_Sunflower.fxsxml',		1),
								('Ancient',			'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_SUNFLOWER',			'Art/Sunflower/PL_Plantation_MID_Sunflower.fxsxml',		1),
								
								('Any',				'Any',						0.875,	'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_POPPY',				'Art/Poppy/Resource_Poppy.fxsxml',						1),
								('Industrial',		'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POPPY',				'Art/Poppy/Plantation_IND_Poppy.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POPPY',				'Art/Poppy/HB_Plantation_IND_Poppy.fxsxml',				1),
								('Industrial',		'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POPPY',				'Art/Poppy/PL_Plantation_IND_Poppy.fxsxml',				1),
								('Ancient',			'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POPPY',				'Art/Poppy/Plantation_MID_Poppy.fxsxml',				1),
								('Ancient',			'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POPPY',				'Art/Poppy/HB_Plantation_MID_Poppy.fxsxml',				1),
								('Ancient',			'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POPPY',				'Art/Poppy/PL_Plantation_MID_Poppy.fxsxml',				1),
								
								('Any',				'Any',						0.875,	'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_FLAX',				'Art/Flax/Resource_Flax.fxsxml',						1),
								('Industrial',		'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_FLAX',				'Art/Flax/Plantation_IND_Flax.fxsxml',					1),
								('Industrial',		'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_FLAX',				'Art/Flax/HB_Plantation_IND_Flax.fxsxml',				1),
								('Industrial',		'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_FLAX',				'Art/Flax/PL_Plantation_IND_Flax.fxsxml',				1),
								('Ancient',			'Constructed',				0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_FLAX',				'Art/Flax/Plantation_MID_Flax.fxsxml',					1),
								('Ancient',			'UnderConstruction',		0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_FLAX',				'Art/Flax/HB_Plantation_MID_Flax.fxsxml',				1),
								('Ancient',			'Pillaged',					0.875,	'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_FLAX',				'Art/Flax/PL_Plantation_MID_Flax.fxsxml',				1);
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (3, 'ArtDefines_Flowers.sql');		
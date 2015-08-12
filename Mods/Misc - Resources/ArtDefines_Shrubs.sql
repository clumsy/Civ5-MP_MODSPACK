-- Insert SQL Rules Here 
INSERT INTO ArtDefine_StrategicView (StrategicViewType,				TileType,			Asset) Values
									('ART_DEF_RESOURCE_POTATOE',	'Resource',			'Art/Potatoe/SV_Potatoe.dds'),
									('ART_DEF_RESOURCE_PEANUT',		'Resource',			'Art/Peanut/SV_Peanut.dds'),
									('ART_DEF_RESOURCE_PINEAPPLE',	'Resource',			'Art/Pineapple/SV_Pineapple.dds'),
									('ART_DEF_RESOURCE_ALOEVERA',	'Resource',			'Art/Aloe Vera/SV_Aloevera.dds'),
									('ART_DEF_RESOURCE_COFFEE',		'Resource',			'Art/Coffee/SV_CoffeeBean.dds'),
									('ART_DEF_RESOURCE_TOBACCO',	'Resource',			'Art/Tobacco/SV_Tobacco.dds'),
									('ART_DEF_RESOURCE_TEA',		'Resource',			'Art/Tea/SV_Tea.dds'),
									('ART_DEF_RESOURCE_BLUEBERRY',	'Resource',			'Art/Blueberry/SV_Blueberry.dds'),
									('ART_DEF_RESOURCE_REDBERRIES',	'Resource',			'Art/Red Berries/SV_Berries.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type,										LandmarkType,	FriendlyName) VALUES	

									('ART_DEF_RESOURCE_POTATOE',				'Resource',		'Potato'),	
									('ART_DEF_RESOURCE_PEANUT',					'Resource',		'Peanut'),	
									('ART_DEF_RESOURCE_PINEAPPLE',				'Resource',		'Pineapple'),	
									('ART_DEF_RESOURCE_ALOEVERA',				'Resource',		'Aloe Vera'),	
									('ART_DEF_RESOURCE_COFFEE',					'Resource',		'Coffee'),
									('ART_DEF_RESOURCE_TOBACCO',				'Resource',		'Tobacco'),
									('ART_DEF_RESOURCE_TEA',					'Resource',		'Tea'),
									('ART_DEF_RESOURCE_BLUEBERRY',				'Resource',		'Blueberry'),
									('ART_DEF_RESOURCE_REDBERRIES',				'Resource',		'Wild Berries');


INSERT INTO ArtDefine_Landmarks (Era,				State,						Scale,		ImprovementType,							LayoutHandler,			ResourceType,							Model,															TerrainContour) VALUES	

								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_POTATOE',				'Art/Potatoe/Resource_Potatoe.fxsxml',							1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POTATOE',				'Art/Potatoe/Plantation_IND_Potatoe.fxsxml',					1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POTATOE',				'Art/Potatoe/HB_Plantation_IND_Potatoe.fxsxml',					1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POTATOE',				'Art/Potatoe/PL_Plantation_IND_Potatoe.fxsxml',					1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POTATOE',				'Art/Potatoe/Plantation_MID_Potatoe.fxsxml',					1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POTATOE',				'Art/Potatoe/HB_Plantation_MID_Potatoe.fxsxml',					1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_POTATOE',				'Art/Potatoe/PL_Plantation_MID_Potatoe.fxsxml',					1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PEANUT',				'Art/Peanut/Resource_Peanut.fxsxml',							1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PEANUT',				'Art/Peanut/Plantation_IND_Peanut.fxsxml',						1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PEANUT',				'Art/Peanut/HB_Plantation_IND_Peanut.fxsxml',					1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PEANUT',				'Art/Peanut/PL_Plantation_IND_Peanut.fxsxml',					1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PEANUT',				'Art/Peanut/Plantation_MID_Peanut.fxsxml',						1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PEANUT',				'Art/Peanut/HB_Plantation_MID_Peanut.fxsxml',					1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PEANUT',				'Art/Peanut/PL_Plantation_MID_Peanut.fxsxml',					1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PINEAPPLE',			'Art/Pineapple/Resource_Pineapple.fxsxml',						1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PINEAPPLE',			'Art/Pineapple/Plantation_IND_Pineapple.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PINEAPPLE',			'Art/Pineapple/HB_Plantation_IND_Pineapple.fxsxml',				1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PINEAPPLE',			'Art/Pineapple/PL_Plantation_IND_Pineapple.fxsxml',				1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PINEAPPLE',			'Art/Pineapple/Plantation_MID_Pineapple.fxsxml',				1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PINEAPPLE',			'Art/Pineapple/HB_Plantation_MID_Pineapple.fxsxml',				1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_PINEAPPLE',			'Art/Pineapple/PL_Plantation_MID_Pineapple.fxsxml',				1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',			'Art/Aloe Vera/Resource_Aloevera.fxsxml',						1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',			'Art/Aloe Vera/Plantation_IND_Aloevera.fxsxml',					1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',			'Art/Aloe Vera/HB_Plantation_IND_Aloevera.fxsxml',				1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',			'Art/Aloe Vera/PL_Plantation_IND_Aloevera.fxsxml',				1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',			'Art/Aloe Vera/Plantation_MID_Aloevera.fxsxml',					1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',			'Art/Aloe Vera/HB_Plantation_MID_Aloevera.fxsxml',				1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_ALOEVERA',			'Art/Aloe Vera/PL_Plantation_MID_Aloevera.fxsxml',				1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_COFFEE',				'Art/Coffee/Resource_Coffee.fxsxml',							1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_COFFEE',				'Art/Coffee/Plantation_IND_Coffee.fxsxml',						1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_COFFEE',				'Art/Coffee/HB_Plantation_IND_Coffee.fxsxml',					1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_COFFEE',				'Art/Coffee/PL_Plantation_IND_Coffee.fxsxml',					1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_COFFEE',				'Art/Coffee/Plantation_MID_Coffee.fxsxml',						1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_COFFEE',				'Art/Coffee/HB_Plantation_MID_Coffee.fxsxml',					1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_COFFEE',				'Art/Coffee/PL_Plantation_MID_Coffee.fxsxml',					1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TOBACCO',				'Art/Tobacco/Resource_Tobacco.fxsxml',							1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TOBACCO',				'Art/Tobacco/Plantation_IND_Tobacco.fxsxml',					1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TOBACCO',				'Art/Tobacco/HB_Plantation_IND_Tobacco.fxsxml',					1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TOBACCO',				'Art/Tobacco/PL_Plantation_IND_Tobacco.fxsxml',					1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TOBACCO',				'Art/Tobacco/Plantation_MID_Tobacco.fxsxml',					1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TOBACCO',				'Art/Tobacco/HB_Plantation_MID_Tobacco.fxsxml',					1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TOBACCO',				'Art/Tobacco/PL_Plantation_MID_Tobacco.fxsxml',					1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TEA',					'Art/Tea/Resource_Tea.fxsxml',									1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TEA',					'Art/Tea/Plantation_IND_Tea.fxsxml',							1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TEA',					'Art/Tea/HB_Plantation_IND_Tea.fxsxml',							1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TEA',					'Art/Tea/PL_Plantation_IND_Tea.fxsxml',							1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TEA',					'Art/Tea/Plantation_MID_Tea.fxsxml',							1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TEA',					'Art/Tea/HB_Plantation_MID_Tea.fxsxml',							1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_TEA',					'Art/Tea/PL_Plantation_MID_Tea.fxsxml',							1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_BLUEBERRY',			'Art/Blueberry/Resource_Blueberry.fxsxml',						1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_BLUEBERRY',			'Art/Blueberry/Plantation_IND_Blueberry.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_BLUEBERRY',			'Art/Blueberry/HB_Plantation_IND_Blueberry.fxsxml',				1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_BLUEBERRY',			'Art/Blueberry/PL_Plantation_IND_Blueberry.fxsxml',				1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_BLUEBERRY',			'Art/Blueberry/Plantation_MID_Blueberry.fxsxml',				1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_BLUEBERRY',			'Art/Blueberry/HB_Plantation_MID_Blueberry.fxsxml',				1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_BLUEBERRY',			'Art/Blueberry/PL_Plantation_MID_Blueberry.fxsxml',				1),
								
								('Any',				'Any',						0.85,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_REDBERRIES',			'Art/Red Berries/Resource_Berries.fxsxml',						1),
								('Industrial',		'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_REDBERRIES',			'Art/Red Berries/Plantation_IND_Berries.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_REDBERRIES',			'Art/Red Berries/HB_Plantation_IND_Berries.fxsxml',				1),
								('Industrial',		'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_REDBERRIES',			'Art/Red Berries/PL_Plantation_IND_Berries.fxsxml',				1),
								('Ancient',			'Constructed',				0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_REDBERRIES',			'Art/Red Berries/Plantation_MID_Berries.fxsxml',				1),
								('Ancient',			'UnderConstruction',		0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_REDBERRIES',			'Art/Red Berries/HB_Plantation_MID_Berries.fxsxml',				1),
								('Ancient',			'Pillaged',					0.85,		'ART_DEF_IMPROVEMENT_PLANTATION',			'SNAPSHOT',				'ART_DEF_RESOURCE_REDBERRIES',			'Art/Red Berries/PL_Plantation_MID_Berries.fxsxml',				1);
	-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (7, 'ArtDefines_Shrubs.sql');		
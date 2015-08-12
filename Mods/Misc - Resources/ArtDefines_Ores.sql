-- Insert SQL Rules Here 
INSERT INTO ArtDefine_StrategicView (StrategicViewType,				TileType,			Asset) Values
									('ART_DEF_RESOURCE_LEAD',		'Resource',			'Art/Lead/SV_Lead.dds'),
									('ART_DEF_RESOURCE_PLATINUM',	'Resource',			'Art/Platinum/SV_Platinum.dds'),
									('ART_DEF_RESOURCE_NICKEL',		'Resource',			'Art/Nickel/SV_Nickel.dds'),
									('ART_DEF_RESOURCE_TITANIUM',	'Resource',			'Art/Titanium/SV_Titanium.dds'),
									('ART_DEF_RESOURCE_TIN',		'Resource',			'Art/Tin/SV_Tin.dds'),
									('ART_DEF_RESOURCE_MANGANESE',	'Resource',			'Art/Manganese/SV_Manganese.dds');

INSERT INTO ArtDefine_LandmarkTypes (Type,										LandmarkType,	FriendlyName) VALUES
									('ART_DEF_RESOURCE_LEAD',					'Resource',		'Lead'),
									('ART_DEF_RESOURCE_PLATINUM',				'Resource',		'Platinum'),
									('ART_DEF_RESOURCE_NICKEL',					'Resource',		'Nickel'),
									('ART_DEF_RESOURCE_TITANIUM',				'Resource',		'Titanium'),
									('ART_DEF_RESOURCE_TIN',					'Resource',		'Tin'),
									('ART_DEF_RESOURCE_MANGANESE',				'Resource',		'Manganese');

INSERT INTO ArtDefine_Landmarks (Era,				State,						Scale,		ImprovementType,							LayoutHandler,			ResourceType,								Model,															TerrainContour) VALUES									
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LEAD',					'Art/Lead/Lead.fxsxml',											1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LEAD',					'Art/Lead/MED_Mine_Lead.fxsxml',								1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LEAD',					'Art/Lead/HB_MED_Mine_Lead.fxsxml',								1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LEAD',					'Art/Lead/PL_MED_Mine_Lead.fxsxml',								1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LEAD',					'Art/Lead/IND_Mine_Lead.fxsxml',								1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LEAD',					'Art/Lead/HB_IND_Mine_Lead.fxsxml',								1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_LEAD',					'Art/Lead/PL_IND_Mine_Lead.fxsxml',								1),
								
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_NICKEL',					'Art/Nickel/Nickel.fxsxml',										1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_NICKEL',					'Art/Nickel/MED_Mine_Nickel.fxsxml',							1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_NICKEL',					'Art/Nickel/HB_MED_Mine_Nickel.fxsxml',							1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_NICKEL',					'Art/Nickel/PL_MED_Mine_Nickel.fxsxml',							1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_NICKEL',					'Art/Nickel/IND_Mine_Nickel.fxsxml',							1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_NICKEL',					'Art/Nickel/HB_IND_Mine_Nickel.fxsxml',							1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_NICKEL',					'Art/Nickel/PL_IND_Mine_Nickel.fxsxml',							1),
								
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PLATINUM',				'Art/Platinum/Platinum.fxsxml',									1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PLATINUM',				'Art/Platinum/MED_Mine_Platinum.fxsxml',						1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PLATINUM',				'Art/Platinum/HB_MED_Mine_Platinum.fxsxml',						1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PLATINUM',				'Art/Platinum/PL_MED_Mine_Platinum.fxsxml',						1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PLATINUM',				'Art/Platinum/IND_Mine_Platinum.fxsxml',						1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PLATINUM',				'Art/Platinum/HB_IND_Mine_Platinum.fxsxml',						1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_PLATINUM',				'Art/Platinum/PL_IND_Mine_Platinum.fxsxml',						1),

								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM',				'Art/Titanium/HB_MED_Mine_Titanium.fxsxml',						1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM',				'Art/Titanium/MED_Mine_Titanium.fxsxml',						1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM',				'Art/Titanium/PL_MED_Mine_Titanium.fxsxml',						1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM',				'Art/Titanium/HB_IND_Mine_Titanium.fxsxml',						1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM',				'Art/Titanium/IND_Mine_Titanium.fxsxml',						1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM',				'Art/Titanium/PL_IND_Mine_Titanium.fxsxml',						1),
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM',				'Art/Titanium/Titanium.fxsxml',									1),
								
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Art/Titanium/HB_MED_Mine_Titanium_Heavy.fxsxml',				1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Art/Titanium/MED_Mine_Titanium_Heavy.fxsxml',					1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Art/Titanium/PL_MED_Mine_Titanium_Heavy.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Art/Titanium/HB_IND_Mine_Titanium_Heavy.fxsxml',				1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Art/Titanium/IND_Mine_Titanium_Heavy.fxsxml',					1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Art/Titanium/PL_IND_Mine_Titanium_Heavy.fxsxml',				1),
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY',			'Art/Titanium/Titanium_Heavy.fxsxml',							1),
								
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Art/Titanium/HB_MED_Mine_Titanium_Heavy.fxsxml',				1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Art/Titanium/MED_Mine_Titanium_Heavy.fxsxml',					1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Art/Titanium/PL_MED_Mine_Titanium_Heavy.fxsxml',				1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Art/Titanium/HB_IND_Mine_Titanium_Heavy.fxsxml',				1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Art/Titanium/IND_Mine_Titanium_Heavy.fxsxml',					1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Art/Titanium/PL_IND_Mine_Titanium_Heavy.fxsxml',				1),
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_HEAVY_MARSH',	'Art/Titanium/Titanium_Heavy_marsh.fxsxml',						1),
								
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Art/Titanium/HB_MED_Mine_Titanium.fxsxml',						1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Art/Titanium/MED_Mine_Titanium.fxsxml',						1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Art/Titanium/PL_MED_Mine_Titanium.fxsxml',						1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Art/Titanium/HB_IND_Mine_Titanium.fxsxml',						1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Art/Titanium/IND_Mine_Titanium.fxsxml',						1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Art/Titanium/PL_IND_Mine_Titanium.fxsxml',						1),
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TITANIUM_MARSH',			'Art/Titanium/Titanium_marsh.fxsxml',							1),
	
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TIN',						'Art/Tin/Tin.fxsxml',											1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TIN',						'Art/Tin/HB_MED_Tin_Mine.fxsxml',								1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TIN',						'Art/Tin/MED_Mine_Tin.fxsxml',									1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TIN',						'Art/Tin/PL_MED_Mine_Tin.fxsxml',								1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TIN',						'Art/Tin/HB_IND_Tin_Mine.fxsxml',								1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TIN',						'Art/Tin/IND_Mine_Tin.fxsxml',									1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_TIN',						'Art/Tin/PL_MED_Mine_Tin.fxsxml',								1),

								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_MANGANESE',				'Art/Manganese/Manganese.fxsxml',								1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_MANGANESE',				'Art/Manganese/HB_MED_Mine_Manganese.fxsxml',					1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_MANGANESE',				'Art/Manganese/MED_Mine_Manganese.fxsxml',						1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_MANGANESE',				'Art/Manganese/PL_MED_Mine_Manganese.fxsxml',					1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_MANGANESE',				'Art/Manganese/HB_IND_Mine_Manganese.fxsxml',					1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_MANGANESE',				'Art/Manganese/IND_Mine_Manganese.fxsxml',						1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_MANGANESE',				'Art/Manganese/PL_IND_Mine_Manganese.fxsxml',					1);
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (6, 'ArtDefines_Ores.sql');		
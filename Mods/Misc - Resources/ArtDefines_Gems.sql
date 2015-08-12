-- Insert SQL Rules Here 
INSERT INTO ArtDefine_StrategicView (StrategicViewType,				TileType,			Asset) Values
									('ART_DEF_RESOURCE_AMBER',		'Resource',			'Art/Amber/SV_Amber.dds'),
									('ART_DEF_RESOURCE_EMERALD',	'Resource',			'Art/Emerald/SV_Emerald.dds'),
									('ART_DEF_RESOURCE_SAPPHIRE',	'Resource',			'Art/Sapphire/SV_Sapphire.dds'),
									('ART_DEF_RESOURCE_RUBY',		'Resource',			'Art/Ruby/SV_Ruby.dds');

INSERT INTO ArtDefine_Landmarks (Era,				State,						Scale,		ImprovementType,							LayoutHandler,			ResourceType,							Model,															TerrainContour) VALUES	
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_EMERALD',				'Art/Emerald/Emerald.fxsxml',									1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_EMERALD',				'Art/Emerald/MED_Mine_Emerald.fxsxml',							1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_EMERALD',				'Art/Emerald/HB_MED_Mine_Emerald.fxsxml',						1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_EMERALD',				'Art/Emerald/PL_MED_Mine_Emerald.fxsxml',						1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_EMERALD',				'Art/Emerald/IND_Mine_Emerald.fxsxml',							1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_EMERALD',				'Art/Emerald/HB_IND_Mine_Emerald.fxsxml',						1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_EMERALD',				'Art/Emerald/PL_IND_Mine_Emerald.fxsxml',						1),
								
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_RUBY',				'Art/Ruby/Ruby.fxsxml',											1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_RUBY',				'Art/Ruby/MED_Mine_Ruby.fxsxml',								1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_RUBY',				'Art/Ruby/HB_MED_Mine_Ruby.fxsxml',								1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_RUBY',				'Art/Ruby/PL_MED_Mine_Ruby.fxsxml',								1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_RUBY',				'Art/Ruby/IND_Mine_Ruby.fxsxml',								1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_RUBY',				'Art/Ruby/HB_IND_Mine_Ruby.fxsxml',								1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_RUBY',				'Art/Ruby/PL_IND_Mine_Ruby.fxsxml',								1),
								
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SAPPHIRE',			'Art/Sapphire/Sapphire.fxsxml',									1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SAPPHIRE',			'Art/Sapphire/MED_Mine_Sapphire.fxsxml',						1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SAPPHIRE',			'Art/Sapphire/HB_MED_Mine_Sapphire.fxsxml',						1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SAPPHIRE',			'Art/Sapphire/PL_MED_Mine_Sapphire.fxsxml',						1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SAPPHIRE',			'Art/Sapphire/IND_Mine_Sapphire.fxsxml',						1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SAPPHIRE',			'Art/Sapphire/HB_IND_Mine_Sapphire.fxsxml',						1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_SAPPHIRE',			'Art/Sapphire/PL_IND_Mine_Sapphire.fxsxml',						1),
								
								('Any',				'Any',						0.925,		'ART_DEF_IMPROVEMENT_NONE',					'SNAPSHOT',				'ART_DEF_RESOURCE_AMBER',				'Art/Amber/Amber.fxsxml',										1),
								('Ancient',			'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_AMBER',				'Art/Amber/HB_MED_Amber_Mine.fxsxml',							1),
								('Ancient',			'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_AMBER',				'Art/Amber/MED_Mine_Amber.fxsxml',								1),
								('Ancient',			'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_AMBER',				'Art/Amber/PL_MED_Mine_Amber.fxsxml',							1),
								('Industrial',		'UnderConstruction',		0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_AMBER',				'Art/Amber/HB_IND_Amber_Mine.fxsxml',							1),
								('Industrial',		'Constructed',				0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_AMBER',				'Art/Amber/IND_Mine_Amber.fxsxml',								1),
								('Industrial',		'Pillaged',					0.925,		'ART_DEF_IMPROVEMENT_MINE',					'SNAPSHOT',				'ART_DEF_RESOURCE_AMBER',				'Art/Amber/PL_MED_Mine_Amber.fxsxml',							1);

INSERT INTO ArtDefine_LandmarkTypes (Type,										LandmarkType,	FriendlyName) VALUES
									('ART_DEF_RESOURCE_AMBER',					'Resource',		'Amber'),
									('ART_DEF_RESOURCE_EMERALD',				'Resource',		'Emerald'),
									('ART_DEF_RESOURCE_SAPPHIRE',				'Resource',		'Sapphire'),
									('ART_DEF_RESOURCE_RUBY',					'Resource',		'Ruby');
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (4, 'ArtDefines_Gems.sql');		
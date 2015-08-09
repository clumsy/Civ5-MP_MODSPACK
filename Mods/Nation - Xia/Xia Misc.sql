INSERT OR REPLACE INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_TOURISMHANDLER_1', 			'BUILDING_TOURISMHANDLER_1', 			'1 [ICON_TOURISM] Tourism'		),
			('BUILDINGCLASS_TOURISMHANDLER_2', 			'BUILDING_TOURISMHANDLER_2', 			'2 [ICON_TOURISM] Tourism'		),
			('BUILDINGCLASS_TOURISMHANDLER_4', 			'BUILDING_TOURISMHANDLER_4', 			'4 [ICON_TOURISM] Tourism'		),
			('BUILDINGCLASS_TOURISMHANDLER_8', 			'BUILDING_TOURISMHANDLER_8', 			'8 [ICON_TOURISM] Tourism'		),
			('BUILDINGCLASS_TOURISMHANDLER_16', 		'BUILDING_TOURISMHANDLER_16', 			'16 [ICON_TOURISM] Tourism'		),
			('BUILDINGCLASS_TOURISMHANDLER_32', 		'BUILDING_TOURISMHANDLER_32', 			'32 [ICON_TOURISM] Tourism'		),
			('BUILDINGCLASS_TOURISMHANDLER_64', 		'BUILDING_TOURISMHANDLER_64', 			'64 [ICON_TOURISM] Tourism'		),
			('BUILDINGCLASS_TOURISMHANDLER_128', 		'BUILDING_TOURISMHANDLER_128', 			'128 [ICON_TOURISM] Tourism'	),
			('BUILDINGCLASS_TOURISMHANDLER_256', 		'BUILDING_TOURISMHANDLER_256', 			'256 [ICON_TOURISM] Tourism'	),
			('BUILDINGCLASS_TOURISMHANDLER_512', 		'BUILDING_TOURISMHANDLER_512', 			'512 [ICON_TOURISM] Tourism'	),
			('BUILDINGCLASS_TOURISMHANDLER_1024', 		'BUILDING_TOURISMHANDLER_1024', 		'1024 [ICON_TOURISM] Tourism'	),
			('BUILDINGCLASS_TOURISMHANDLER_2048', 		'BUILDING_TOURISMHANDLER_2048', 		'2048 [ICON_TOURISM] Tourism'	),
			('BUILDINGCLASS_TOURISMHANDLER_4096', 		'BUILDING_TOURISMHANDLER_4096', 		'4096 [ICON_TOURISM] Tourism'	),
			('BUILDINGCLASS_TOURISMHANDLER_8192', 		'BUILDING_TOURISMHANDLER_8192', 		'8192 [ICON_TOURISM] Tourism'	);

--INSERT INTO BuildingClasses	
--			(Type, 						 		 	DefaultBuilding, 					Description)
--VALUES		('BUILDINGCLASS_XIA_TEMP_ART', 			'BUILDING_XIA_TEMP_ART', 			'TXT_KEY_BUILDING_XIA_ART_HOLDER_DESC');

INSERT OR REPLACE INTO Buildings 	
			(Type, 						 					BuildingClass, 							Description,					TechEnhancedTourism,		GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture,	NukeImmune,		IconAtlas,		 PortraitIndex)
VALUES		('BUILDING_TOURISMHANDLER_1', 	 				'BUILDINGCLASS_TOURISMHANDLER_1', 		'1 [ICON_TOURISM] Tourism',		1,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_2', 	 				'BUILDINGCLASS_TOURISMHANDLER_2', 		'2 [ICON_TOURISM] Tourism',		2,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_4', 	 				'BUILDINGCLASS_TOURISMHANDLER_4', 		'4 [ICON_TOURISM] Tourism',		4,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_8', 	 				'BUILDINGCLASS_TOURISMHANDLER_8', 		'8 [ICON_TOURISM] Tourism',		8,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_16', 	 				'BUILDINGCLASS_TOURISMHANDLER_16', 		'16 [ICON_TOURISM] Tourism',	16,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_32', 	 				'BUILDINGCLASS_TOURISMHANDLER_32', 		'32 [ICON_TOURISM] Tourism',	32,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_64', 	 				'BUILDINGCLASS_TOURISMHANDLER_64', 		'64 [ICON_TOURISM] Tourism',	64,							-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_128',  				'BUILDINGCLASS_TOURISMHANDLER_128', 	'128 [ICON_TOURISM] Tourism',	128,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_256',  				'BUILDINGCLASS_TOURISMHANDLER_256', 	'256 [ICON_TOURISM] Tourism',	256,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_512',  				'BUILDINGCLASS_TOURISMHANDLER_512', 	'512 [ICON_TOURISM] Tourism',	512,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_1024', 				'BUILDINGCLASS_TOURISMHANDLER_1024',	'1024 [ICON_TOURISM] Tourism',	1024,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_2048', 				'BUILDINGCLASS_TOURISMHANDLER_2048',	'2048 [ICON_TOURISM] Tourism',	2048,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_4096', 				'BUILDINGCLASS_TOURISMHANDLER_4096',	'4096 [ICON_TOURISM] Tourism',	4096,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21),
			('BUILDING_TOURISMHANDLER_8192', 				'BUILDINGCLASS_TOURISMHANDLER_8192',	'8192 [ICON_TOURISM] Tourism',	8192,						-1, 			-1,   -1, 		 null,			1,				1,				'BW_ATLAS_1',				21);

--INSERT INTO Buildings 	
--			(Type, 						 	BuildingClass, 						Description,								GreatWorkSlotType,					GreatWorkCount,	   Cost,   FaithCost,   PrereqTech, 	NeverCapture,	NukeImmune,		IconAtlas,		 PortraitIndex)
--VALUES		('BUILDING_XIA_TEMP_ART', 	 	'BUILDINGCLASS_XIA_TEMP_ART', 		'TXT_KEY_BUILDING_XIA_ART_HOLDER_DESC',		'GREAT_WORK_SLOT_ART_ARTIFACT',		1, 					-1,    -1, 		    null,			1,				1,				'BW_ATLAS_1',				21);

INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 				LoadType)
VALUES		('SND_SOUND_XIA_SHANG_SACRIFICE', 		'ShangBianzhong',		'DynamicResident');		

INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_SOUND_XIA_SHANG_SACRIFICE', 			'SND_SOUND_XIA_SHANG_SACRIFICE', 		'GAME_SFX', 	95, 		95, 		0, 			0);
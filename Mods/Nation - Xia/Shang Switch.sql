--To load the mod as the Shang Dynasty: Delete the open-comment characters ( /* ) below.
--To re-set the mod to load as the Xia Dynasty: Re-add the open-comment characters before the INSERT statement below or delete this file.





/*





INSERT INTO BuildingClasses	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_XIA_SHANG_SWITCH', 			'BUILDING_XIA_SHANG_SWITCH', 			'TXT_KEY_BUILDING_XIA_SHANG_SWITCH_DESC');

INSERT INTO Buildings 	
			(Type, 						 		BuildingClass, 							Description,									GreatWorkCount,		Cost,   FaithCost,   PrereqTech, 	NeverCapture,	NukeImmune,		IconAtlas,		 PortraitIndex)
VALUES		('BUILDING_XIA_SHANG_SWITCH', 	 	'BUILDINGCLASS_XIA_SHANG_SWITCH', 		'TXT_KEY_BUILDING_XIA_SHANG_SWITCH_DESC',		-1, 				-1,    -1, 		    null,			1,				1,				'BW_ATLAS_1',				21);
























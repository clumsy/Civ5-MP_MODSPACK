--=======================================================================================================================
-- BuildingClasses
--=======================================================================================================================
INSERT OR REPLACE INTO BuildingClasses
			(Type, 										DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_JFD_BISMARCK_DELEGATE', 	'BUILDING_JFD_BISMARCK_DELEGATE', 		'TXT_KEY_BUILDING_JFD_BISMARCK_DELEGATE_DESC');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT OR REPLACE INTO Buildings		
			(Type, 										BuildingClass, 			  					ExtraLeagueVotes,	Cost, 	FaithCost,	GreatWorkCount,	GoldMaintenance,	PrereqTech, Help,												Description, 									NeverCapture)
VALUES		('BUILDING_JFD_BISMARCK_DELEGATE', 			'BUILDINGCLASS_JFD_BISMARCK_DELEGATE', 		1,					-1, 	-1,			-1,				0, 					null, 		'TXT_KEY_BUILDING_JFD_BISMARCK_DELEGATE_HELP',		'TXT_KEY_BUILDING_JFD_BISMARCK_DELEGATE', 		1);
--==========================================================================================================================	
--==========================================================================================================================	
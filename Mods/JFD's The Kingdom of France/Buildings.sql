--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								BuildingClass, PrereqTech,	Cost, FaithCost, GreatWorkCount, NoOccupiedUnhappiness, MinAreaSize, NeverCapture, 	Description, 								Help, 	Strategy,	ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_DUMMY_COURTHOUSE'),	BuildingClass, null,		-1,	 -1,		 -1,			 NoOccupiedUnhappiness, MinAreaSize, 1, 			('TXT_KEY_BUILDING_JFD_DUMMY_COURTHOUSE'),	Help, 	Strategy,	ArtDefineTag, PortraitIndex, 	IconAtlas
FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE';		
--==========================================================================================================================	
--==========================================================================================================================	
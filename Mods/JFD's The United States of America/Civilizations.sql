--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
--To enable the alternative map showing clearer distinction between the United States and the Confederate States, change "LincolnAmericaMap512.dds" below to "LincolnAmericaMap512Alt.dds".
INSERT INTO Civilizations 	
			(Type, 										Description,							ShortDescription, 							Adjective, 								Civilopedia, CivilopediaTag, 	DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 								PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		('TXT_KEY_JFD_AMERICA_LINCOLN_DESC'),	('TXT_KEY_JFD_AMERICA_LINCOLN_SHORT_DESC'), ('TXT_KEY_JFD_AMERICA_LINCOLN_ADJ'), 	Civilopedia, CivilopediaTag, 	('PLAYERCOLOR_JFD_AMERICA_LINCOLN'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('CIVIL_WAR_CIV_SYMBOLS_COLOR_ATLAS'), 	0, 				('CIVIL_WAR_CIV_SYMBOLS_WHITE_ATLAS'), 	('America'), 	('LincolnAmericaMap512.dds'),	('TXT_KEY_CIV5_DOM_JFD_LINCOLN_TEXT'), 	('Lincoln_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_AMERICA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_AMERICA' )
	THEN '_AMERICA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_AMERICA_LINCOLN';

--Set Playable and AIPlayable to 0 to disable Washington.
UPDATE Civilizations
SET Playable = 1,
	AIPlayable = 1
Where Type = 'CIVILIZATION_AMERICA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_WASHINGTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_NEW_YORK'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_PHILADELPHIA'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_ALBANY'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_BALTIMORE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_BOSTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_CINCINNATI'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_ST_LOUIS'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_CHICHAGO'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_LOUISVILLE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_BUFFALO'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_PITTSBURGH'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_DETROIT'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_MILWAUKEE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_CLEVELAND'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_LOWELL'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_NEW_HAVEN'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_NEWARK'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_PROVIDENCE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_ALLEGHENY'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_SYRACUSE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_HARRISBURG'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_WILMINGTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_MANCHESTER'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_DAYTON'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_INDIANAPOLIS'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_COLUMBUS'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_WORCESTER'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_UTICA'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 	'TXT_KEY_JFD_AMERICA_LINCOLN_GETTYSBURG');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 							BuildingClassType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 							TechType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 							LeaderheadType)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'LEADER_JFD_LINCOLN');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 							UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'UNITCLASS_IRONCLAD', 		'UNIT_JFD_MONITOR_MELEE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'UNITCLASS_CANNON', 		'UNIT_JFD_PARROTT_RIFLE'),
			('CIVILIZATION_JFD_AMERICA_LINCOLN', 		'UNITCLASS_JFD_MONITOR', 	'UNIT_JFD_MONITOR_RANGED');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 							ReligionType)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 							StartAlongOcean)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 							SpyName)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'), 		SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_AMERICA');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


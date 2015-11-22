--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 								Description,	ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag,	DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 				DawnOfManImage)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'), 	Description,	ShortDescription,	Adjective,	Civilopedia, CivilopediaTag,	('PLAYERCOLOR_JFD_JAPAN_TOJO'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_JAPAN_TOJO_ATLAS'), 	0, 				('JFD_JAPAN_TOJO_ALPHA_ATLAS'), ('Japan'), 		('JapanTojoMap512.dds'),	('TXT_KEY_CIV_JFD_TOJO_DAWN'), 	('DOM_Tojo.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_JAPAN');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_JAPAN' )
	THEN '_JAPAN'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_JAPAN_TOJO';
--------------------------------	
-- Support to disable Nobunaga
--------------------------------	
--Set both values from 1 to 0
UPDATE Civilizations
SET Playable = 1, AIPlayable = 1
WHERE Type = 'CIVILIZATION_JAPAN';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO',		'TXT_KEY_CITY_NAME_TOKYO');

INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO', 	'LEADER_JFD_TOJO');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_JAPANESE_ZERO';	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO', 	'UNITCLASS_FIGHTER', 	'UNIT_JAPANESE_ZERO'),
			('CIVILIZATION_JFD_JAPAN_TOJO', 	'UNITCLASS_BATTLESHIP', 'UNIT_JFD_YAMATO');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JAPAN', 				'BUILDINGCLASS_ARMORY', 'BUILDING_JFD_DOJO');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--==========================================================================================================================	
-- Civilization_Start_Region_Avoid
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_JFD_JAPAN_TOJO', 	1);
--==========================================================================================================================		
--==========================================================================================================================						
			
			


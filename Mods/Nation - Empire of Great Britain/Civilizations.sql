--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
INSERT INTO Civilizations
			(Type, 								Description, 							ShortDescription, 								Adjective, 										Civilopedia, CivilopediaTag, DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas,			SoundtrackTag, 	MapImage, 						DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'), ('TXT_KEY_CIV_JFD_GREAT_BRITAIN_DESC'), ('TXT_KEY_CIV_JFD_GREAT_BRITAIN_SHORT_DESC'),	('TXT_KEY_CIV_JFD_GREAT_BRITAIN_ADJECTIVE'),	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_ENGLAND'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('CIV_COLOR_ATLAS'), 	6, 				('CIV_ALPHA_ATLAS'),	('England'), 	('GreatBritainMap512.dds'), 	('TXT_KEY_CIV_JFD_VICTORIA_DAWN'), 	('Victoria_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND')
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_GREAT_BRITAIN';
--------------------------------	
-- England
--------------------------------	
DELETE FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_ENGLAND';
INSERT OR REPLACE INTO Civilizations
			(Type, 								Description, ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas,						SoundtrackTag, 	MapImage, 	DawnOfManQuote, DawnOfManImage, DawnOfManAudio)
SELECT		('CIVILIZATION_JFD_ENGLAND'),		Description, ShortDescription,	Adjective,	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_ENGLAND'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_GREAT_BRITAIN_ATLAS'), 	0, 				('JFD_GREAT_BRITAIN_ALPHA_ATLAS'),	('England'), 	MapImage, 	DawnOfManQuote, DawnOfManImage, DawnOfManAudio
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');

UPDATE Civilizations
SET	Playable = 0,	AIPlayable = 0
WHERE Type = 'CIVILIZATION_ENGLAND';
--------------------------------	
-- Support to disable Elizabeth (ignore the above)
--------------------------------	
--Set both values from 1 to 0
UPDATE Civilizations
SET	Playable = 1,	AIPlayable = 1
WHERE Type = 'CIVILIZATION_JFD_ENGLAND';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_LONDON'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_BIRMINGHAM'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_LEEDS'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_MANCHESTER'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_EDINBURGH'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_DUBLIN'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_CARDIFF'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_BELFAST'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_GLASGOW'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_LIVERPOOL'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_NEWCASTLE'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_OXFORD'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_BRISTOL'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_ABERDEEN'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_SHEFFIELD'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_SOUTHAMPTON'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_PORTSMOUTH'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_LEICESTER'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_COVENTRY'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_BRIGHTON'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_SWANSEA'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_DUNDEE'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_CANTERBURG'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_CAMBRIDGE'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_PLYMOUTH'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_YORK'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_DERBY'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_NORWICH'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_EXETER'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_BATH'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_INVERNESS'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_NEWPORT'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 'TXT_KEY_CITY_NAME_JFD_VICTORIA_LONDONDERRY');

INSERT OR REPLACE INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_01'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_02'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_03'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_04'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_05'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_06'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_07'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_08'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_09'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_10'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_11'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_12'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_13'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_14'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_15'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_16'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_17'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_18'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_19'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_20'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_21'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_22'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_23'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_24'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_25'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_26'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_27'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_28'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_29'),
			('CIVILIZATION_JFD_ENGLAND', 	'TXT_KEY_CITY_NAME_JFD_ENGLAND_30');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================	
INSERT OR REPLACE INTO Civilization_FreeBuildingClasses
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'), BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');

INSERT OR REPLACE INTO Civilization_FreeBuildingClasses
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_ENGLAND'), BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT OR REPLACE INTO Civilization_FreeTechs
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'), TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');

INSERT OR REPLACE INTO Civilization_FreeTechs
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_ENGLAND'),		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT OR REPLACE INTO Civilization_FreeUnits
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'), UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');

INSERT OR REPLACE INTO Civilization_FreeUnits
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_ENGLAND'),		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================	
INSERT OR REPLACE INTO Civilization_Religions
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_GREAT_BRITAIN',	'RELIGION_PROTESTANTISM'),
			('CIVILIZATION_JFD_ENGLAND',		'RELIGION_PROTESTANTISM');
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ANGLICANISM' )
		THEN 'RELIGION_CHRISTIAN_ANGLICANISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType IN ('CIVILIZATION_JFD_GREAT_BRITAIN', 'CIVILIZATION_JFD_ENGLAND');

CREATE TRIGGER ReligionGreatBritain
AFTER INSERT ON Religions WHEN 'RELIGION_CHRISTIAN_ANGLICANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ANGLICANISM' )
		THEN 'RELIGION_CHRISTIAN_ANGLICANISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType IN ('CIVILIZATION_JFD_GREAT_BRITAIN', 'CIVILIZATION_JFD_ENGLAND');
END;
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================	
INSERT OR REPLACE INTO Civilization_Leaders
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_GREAT_BRITAIN',	'LEADER_JFD_VICTORIA'),
			('CIVILIZATION_JFD_ENGLAND',		'LEADER_ELIZABETH');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
INSERT OR REPLACE INTO Civilization_UnitClassOverrides
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_ENGLAND', 		'UNITCLASS_GALLEASS', 		'UNIT_JFD_GRAND_CARRACK'),
			('CIVILIZATION_JFD_ENGLAND', 		'UNITCLASS_CROSSBOWMAN', 	'UNIT_ENGLISH_LONGBOWMAN'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'UNITCLASS_FRIGATE', 		'UNIT_ENGLISH_SHIPOFTHELINE'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'UNITCLASS_RIFLEMAN', 		'UNIT_JFD_REDCOAT');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT OR REPLACE INTO Civilization_SpyNames
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_0'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_1'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_2'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_3'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_4'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_5'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_6'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_7'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_8'),
			('CIVILIZATION_JFD_GREAT_BRITAIN', 	'TXT_KEY_SPY_NAME_JFD_GREAT_BRITAIN_9');

INSERT OR REPLACE INTO Civilization_SpyNames
			(CivilizationType, 					SpyName)
SELECT		('CIVILIZATION_JFD_ENGLAND'),		SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT OR REPLACE INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
SELECT		('CIVILIZATION_JFD_GREAT_BRITAIN'), StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');

INSERT OR REPLACE INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
SELECT		('CIVILIZATION_JFD_ENGLAND'),		StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
--==========================================================================================================================	

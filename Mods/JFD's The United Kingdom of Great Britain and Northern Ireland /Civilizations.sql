--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
INSERT INTO Civilizations
			(Type, 									Description, 								ShortDescription, 								Adjective, 										Civilopedia, CivilopediaTag, DefaultPlayerColor, 				 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	('TXT_KEY_CIV_JFD_UNITED_KINGDOM_DESC'), 	('TXT_KEY_CIV_JFD_UNITED_KINGDOM_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_UNITED_KINGDOM_ADJECTIVE'),	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_UNITED_KINGDOM'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_UNITED_KINGDOM_ATLAS'), 	0, 				('JFD_UNITED_KINGDOM_ALPHA_ATLAS'), ('England'), 	('UnitedKingdomMap512.dds'), 	('TXT_KEY_CIV_JFD_CHURCHILL_DAWN'), 	('Churchill_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND')
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_UNITED_KINGDOM';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_LONDON'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BIRMINGHAM'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LEEDS'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_MANCHESTER'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_EDINBURGH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_CARDIFF'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BELFAST'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_GLASGOW'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LIVERPOOL'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_NEWCASTLE'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_OXFORD'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BRISTOL'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_ABERDEEN'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_SHEFFIELD'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_SOUTHAMPTON'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_PORTSMOUTH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LEICESTER'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_COVENTRY'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BRIGHTON'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_SWANSEA'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_DUNDEE'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_CANTERBURG'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_CAMBRIDGE'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_PLYMOUTH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_YORK'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_DERBY'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_NORWICH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_EXETER'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_BATH'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_INVERNESS'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_NEWPORT'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 'TXT_KEY_CITY_NAME_JFD_CHURCHILL_LONDONDERRY');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================	
INSERT INTO Civilization_FreeBuildingClasses
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM',	'RELIGION_PROTESTANTISM');
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_CHRISTIAN_ANGLICANISM' )
	THEN 'RELIGION_CHRISTIAN_ANGLICANISM'
	ELSE 'RELIGION_PROTESTANTISM' END
) WHERE CivilizationType = 'CIVILIZATION_JFD_UNITED_KINGDOM';

CREATE TRIGGER ReligionUnitedKingdom
AFTER INSERT ON Religions WHEN 'RELIGION_CHRISTIAN_ANGLICANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_CHRISTIAN_ANGLICANISM'
	WHERE CivilizationType = 'CIVILIZATION_JFD_UNITED_KINGDOM';
END;
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================	
INSERT INTO Civilization_Leaders
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM',		'LEADER_JFD_CHURCHILL');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType, 						UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM', 	'UNITCLASS_BATTLESHIP', 	'UNIT_JFD_DREADNOUGHT'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'UNITCLASS_FIGHTER', 		'UNIT_JFD_SPITFIRE');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_0'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_1'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_2'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_3'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_4'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_5'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_6'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_7'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_8'),
			('CIVILIZATION_JFD_UNITED_KINGDOM', 	'TXT_KEY_SPY_NAME_JFD_UNITED_KINGDOM_9');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 							StartAlongOcean)
SELECT		('CIVILIZATION_JFD_UNITED_KINGDOM'), 		StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
--==========================================================================================================================	

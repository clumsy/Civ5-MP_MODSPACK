--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
INSERT INTO Civilizations 	
			(Type, 										Description,							ShortDescription, 								Adjective, 								Civilopedia, CivilopediaTag, 	DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 							PortraitIndex, 	AlphaIconAtlas,							SoundtrackTag, 	MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL'), 	('TXT_KEY_JFD_CARTHAGE_HANNIBAL_DESC'),	('TXT_KEY_JFD_CARTHAGE_HANNIBAL_SHORT_DESC'),	('TXT_KEY_JFD_CARTHAGE_HANNIBAL_ADJ'), 	Civilopedia, CivilopediaTag, 	('PLAYERCOLOR_JFD_CARTHAGE_HANNIBAL'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_CARTHAGE_HANNIBAL_ATLAS'),	0,				('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS'),	('Carthage'), 	('CarthageHannibalMap512.dds'),	('TXT_KEY_CIV5_DOM_JFD_HANNIBAL_TEXT'), ('Hannibal_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_CARTHAGE');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_CARTHAGE' )
	THEN '_CARTHAGE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_CARTHAGE_HANNIBAL';
--------------------------------	
-- Dido
--------------------------------
--Set Playable and AIPlayable to 0 to disable Dido.
UPDATE Civilizations
SET Playable = 1,
	AIPlayable = 1
Where Type = 'CIVILIZATION_CARTHAGE';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_JFD_QART_HADASHT'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_UTIQUE'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_HIPPOREGIUS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_GADES'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_SAGUNTUM'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_CARTHAGONOVA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_PANORMUS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_LILYBAEUM'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_HADRUMETUM'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_ZAMAREGIA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_KARALIS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_MALACA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_LEPTISMAGNA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_HIPPODIARRHYTUS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_MOTYA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_SOLKI'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_THARROS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_LEPTISPARVA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_SOLUNTUM'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_LIXUS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_OEA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_THEVESTE'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_IBOSSIM'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_THAPSUS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_ALERIA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_TINGIS'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_ABYLA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_SABRATHE'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_RUSADIR'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_BAECULA'),
			('CIVILIZATION_CARTHAGE', 		'TXT_KEY_CITY_NAME_SALDAE');

INSERT INTO Civilization_CityNames 
			(CivilizationType, 							CityName)
VALUES		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 		'TXT_KEY_CITY_NAME_CARTHAGE');

INSERT INTO Civilization_CityNames 
			(CivilizationType, 							CityName)
SELECT		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL'), 	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_CARTHAGE');
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_JFD_CARTHAGE_HANNIBAL' AND CityName = 'TXT_KEY_CITY_NAME_JFD_QART_HADASHT';
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 							BuildingClassType)
SELECT		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_CARTHAGE');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 							TechType)
SELECT		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_CARTHAGE');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_CARTHAGE');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 							LeaderheadType)
VALUES		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 		'LEADER_JFD_HANNIBAL');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
INSERT OR REPLACE INTO Civilization_UnitClassOverrides 
			(CivilizationType, 							UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 		'UNITCLASS_HORSEMAN', 		'UNIT_CARTHAGINIAN_FOREST_ELEPHANT'),
			('CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 		'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_SHOPHET'),
			('CIVILIZATION_CARTHAGE', 					'UNITCLASS_TRIREME', 		'UNIT_CARTHAGINIAN_QUINQUEREME');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_CARTHAGE', 					'BUILDINGCLASS_HARBOR', 	'BUILDING_JFD_COTHON');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions
			(CivilizationType, 						ReligionType)
VALUES		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	'RELIGION_ISLAM');
--------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_CANAANISM' )
	THEN 'RELIGION_CANAANISM'
	ELSE 'RELIGION_ISLAM' END
) WHERE CivilizationType = 'CIVILIZATION_JFD_CARTHAGE_HANNIBAL';

CREATE TRIGGER ReligionHannibal
AFTER INSERT ON Religions WHEN 'RELIGION_CANAANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_CANAANISM'
	WHERE CivilizationType = 'CIVILIZATION_JFD_CARTHAGE_HANNIBAL';
END;
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 							StartAlongOcean)
SELECT		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL'), 	StartAlongOcean
FROM Civilization_Start_Along_Ocean WHERE (CivilizationType = 'CIVILIZATION_CARTHAGE');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 							SpyName)
SELECT		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL'), 	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_CARTHAGE');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


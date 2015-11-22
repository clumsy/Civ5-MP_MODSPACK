--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 									Civilopedia, 						CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					AlphaIconAtlas, 			PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_SCOTLAND'), 	('TXT_KEY_CIV_JFD_SCOTLAND_DESC'), 	('TXT_KEY_CIV_JFD_SCOTLAND_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_SCOTLAND_ADJECTIVE'), 	('TXT_KEY_CIV5_SCOTLAND_TEXT_1'),	('TXT_KEY_CIV5_SCOTLAND'), 		('PLAYERCOLOR_JFD_SCOTLAND'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_SCOTLAND_ATLAS'),   ('JFD_SCOTLAND_ALPHA_ATLAS'), 0, 				('England'), 	('ScotlandMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_JAMES_TEXT'), 	('James_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND' )
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_SCOTLAND';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_01'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_02'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_03'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_04'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_05'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_06'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_07'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_08'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_09'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_10'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_11'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_12'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_13'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_14'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_15'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_16'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_17'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_18'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_19'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_20'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_21'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_22'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_23'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_24'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_25'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_26'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_27'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_28'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_29'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_30'),	
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_31'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_32'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_CITY_NAME_JFD_SCOTLAND_33');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_SCOTLAND'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_SCOTLAND'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_SCOTLAND'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_SCOTLAND', 	'LEADER_JFD_JAMES');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_SCOTLAND', 	'BUILDINGCLASS_UNIVERSITY', 'BUILDING_JFD_COLLEGE');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_SCOTLAND', 	'UNITCLASS_RIFLEMAN', 		'UNIT_JFD_HIGHLANDER');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_SCOTLAND',	'RELIGION_PROTESTANT');
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM' )
		THEN 'RELIGION_PROTESTANT_CALVINISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType IN ('CIVILIZATION_JFD_SCOTLAND');

CREATE TRIGGER ReligionScotland
AFTER INSERT ON Religions WHEN 'RELIGION_CHRISTIAN_ANGLICANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM' )
		THEN 'RELIGION_PROTESTANT_CALVINISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType IN ('CIVILIZATION_JFD_SCOTLAND');
END;
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_0'),	
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_1'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_2'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_3'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_4'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_5'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_6'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_7'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_8'),
			('CIVILIZATION_JFD_SCOTLAND', 	'TXT_KEY_SPY_NAME_JFD_SCOTLAND_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_SCOTLAND', 	'REGION_HILLS');
--==========================================================================================================================	
--==========================================================================================================================					
	

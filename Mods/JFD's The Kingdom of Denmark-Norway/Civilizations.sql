--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 		
			(Type, 									Description,								ShortDescription, 								Adjective, 										Civilopedia,								CivilopediaTag,							DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	('TXT_KEY_CIV_JFD_DENMARK_NORWAY_DESC'), 	('TXT_KEY_CIV_JFD_DENMARK_NORWAY_SHORT_DESC'), ('TXT_KEY_CIV_JFD_DENMARK_NORWAY_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_DENMARK_NORWAY_TEXT_1'), ('TXT_KEY_CIV5_JFD_DENMARK_NORWAY'), 	('PLAYERCOLOR_JFD_DENMARK_NORWAY'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_DENMARK_NORWAY_ATLAS'), 	0, 				('JFD_DENMARK_NORWAY_ALPHA_ATLAS'), ('Sweden'), 	('DenmarkNorwayMap512.dds'),	('TXT_KEY_CIV5_DAWN_DENMARK_NORWAY_TEXT'),	('DOM_Christian.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_DENMARK' )
	THEN '_DENMARK'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_DENMARK_NORWAY';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_01'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_02'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_03'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_04'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_05'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_06'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_07'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_08'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_09'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_10'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_11'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_12'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_13'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_14'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_15'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_16'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_17'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_18'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_19'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_20'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_21'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_22'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_23'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_24'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_25'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_CITY_NAME_JFD_DENMARK_NORWAY_26');	
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'LEADER_JFD_CHRISTIAN');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_DENMARK';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 'UNITCLASS_GREAT_ADMIRAL', 		'UNIT_JFD_KONTREADMIRAL'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 'UNITCLASS_RIFLEMAN', 			'UNIT_DANISH_SKI_INFANTRY'),
			('CIVILIZATION_DENMARK', 			'UNITCLASS_LONGSWORDSMAN', 		'UNIT_DANISH_BERSERKER'),
			('CIVILIZATION_DENMARK', 			'UNITCLASS_TRIREME', 			'UNIT_JFD_LONGBOAT'),
			('CIVILIZATION_DENMARK', 			'UNITCLASS_GALLEASS', 			'UNIT_JFD_LONGBOAT_UPGRADE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_SWEDEN');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_0'),	
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_1'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_2'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_3'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_4'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_5'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_6'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_7'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_8'),
			('CIVILIZATION_JFD_DENMARK_NORWAY', 	'TXT_KEY_SPY_NAME_JFD_DENMARK_NORWAY_9');
--==========================================================================================================================
-- Civilization_Start_Along_Ocean
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 						StartAlongOcean)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	1);
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 						RegionType)
VALUES		('CIVILIZATION_JFD_DENMARK_NORWAY', 	'REGION_TUNDRA');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


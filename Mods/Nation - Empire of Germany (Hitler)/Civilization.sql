--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 								Description, 						ShortDescription, 							Adjective,							Civilopedia, CivilopediaTag, DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex, 	AlphaIconAtlas,						SoundtrackTag, 	MapImage,								DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	('TXT_KEY_JFD_NAZI_GERMANY_DESC'), 	('TXT_KEY_JFD_NAZI_GERMANY_SHORT_DESC'),	('TXT_KEY_JFD_NAZI_GERMANY_ADJ'), 	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_NAZI_GERMANY'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_NAZI_GERMANY_ATLAS'),	0, 				('JFD_NAZI_GERMANY_ALPHA_ATLAS'),	('Germany'), 	('MapNaziGermany512_Uncensored.dds'), 	('TXT_KEY_CIV5_DAWN_JFD_HITLER_TEXT'), 	('DOM_Hitler.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_NAZI_GERMANY';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_NAZI_GERMANY', 	'LEADER_JFD_HITLER');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_GERMANY' AND UnitType = 'UNIT_GERMAN_PANZER';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_GERMANY', 			'UNITCLASS_RIFLEMAN', 		'UNIT_JFD_JAEGER'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'UNITCLASS_INFANTRY', 		'UNIT_JFD_WEHRMACHT'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'UNITCLASS_TANK', 			'UNIT_GERMAN_PANZER'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_SS');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	RegionType
FROM Civilization_Start_Region_Priority WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_0'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_1'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_2'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_3'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_4'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_5'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_6'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_7'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_8'),
			('CIVILIZATION_JFD_NAZI_GERMANY', 	'TXT_KEY_SPY_NAME_JFD_NAZI_9');			
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
SELECT		('CIVILIZATION_JFD_NAZI_GERMANY'), 	SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_GERMANY');	
--==========================================================================================================================	
--==========================================================================================================================					
	

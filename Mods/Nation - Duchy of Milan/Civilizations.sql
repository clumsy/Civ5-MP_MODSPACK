--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 		
			(Type, 							Description,						ShortDescription, 						Adjective, 								Civilopedia,						CivilopediaTag,					DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_JFD_MILAN'), 	('TXT_KEY_CIV_JFD_MILAN_DESC'), 	('TXT_KEY_CIV_JFD_MILAN_SHORT_DESC'),	('TXT_KEY_CIV_JFD_MILAN_ADJECTIVE'),	('TXT_KEY_CIV5_JFD_MILAN_TEXT_1'), 	('TXT_KEY_CIV5_JFD_MILAN'), 	 ('PLAYERCOLOR_JFD_MILAN'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_MILAN_ATLAS'), 	0, 				('JFD_MILAN_ALPHA_ATLAS'), 	('Rome'), 		('MapMilan512.dds'),	('TXT_KEY_CIV5_DAWN_MILAN_TEXT'),	('DOM_Visconti.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ROME');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ROME' )
	THEN '_ROME'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_MILAN';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			CityName)
VALUES		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_01'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_02'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_03'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_04'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_05'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_06'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_07'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_08'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_09'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_10'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_11'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_12'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_13'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_14'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_15'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_16'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_17'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_18'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_19'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_20'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_21'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_CITY_NAME_JFD_MILAN_22');			
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_MILAN'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_MILAN'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_MILAN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_JFD_MILAN', 	'LEADER_JFD_VISCONTI');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JFD_MILAN', 	'BUILDINGCLASS_BANK',	'BUILDING_JFD_PALAZZO');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_MILAN', 	'UNITCLASS_GATLINGGUN',	'UNIT_JFD_RIBAULT');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_JFD_MILAN', 	'RELIGION_CHRISTIANITY');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_0'),	
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_1'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_2'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_3'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_4'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_5'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_6'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_7'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_8'),
			('CIVILIZATION_JFD_MILAN', 	'TXT_KEY_SPY_NAME_JFD_MILAN_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


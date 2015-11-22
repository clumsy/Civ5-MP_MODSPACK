--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 		
			(Type, 								Description,							ShortDescription, 								Adjective, 										Civilopedia,								CivilopediaTag,						DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_ANGLO_SAXONS'), 	('TXT_KEY_CIV_JFD_ANGLO_SAXONS_DESC'), 	('TXT_KEY_CIV_JFD_ANGLO_SAXONS_SHORT_DESC'),	('TXT_KEY_CIV_JFD_ANGLO_SAXONS_ADJECTIVE'),		('TXT_KEY_CIV5_JFD_ANGLO_SAXONS_TEXT_1'), 	('TXT_KEY_CIV5_JFD_ANGLO_SAXONS'), 	 ('PLAYERCOLOR_JFD_ANGLO_SAXONS'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_ANGLO_SAXONS_ATLAS'), 	0, 				('JFD_ANGLO_SAXONS_ALPHA_ATLAS'), 	('England'), 	('AngloSaxonMap512.dds'),	('TXT_KEY_CIV5_DAWN_ANGLO_SAXONS_TEXT'), ('DOM_Alfred.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND' )
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_ANGLO_SAXONS';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_01'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_02'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_03'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_04'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_05'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_06'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_07'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_08'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_09'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_10'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_11'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_12'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_13'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_14'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_15'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_16'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_17'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_18'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_19'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_20'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_21'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_22'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_23'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_24'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_25'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_26'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_27'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_SAXONS_28');			
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_ANGLO_SAXONS'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_ANGLO_SAXONS'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_ANGLO_SAXONS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_ANGLO_SAXONS', 	'LEADER_JFD_ALFRED');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_ANGLO_SAXONS', 	'BUILDINGCLASS_CONSTABLE',	'BUILDING_JFD_SHIRE_COURT');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_ANGLO_SAXONS', 	'UNITCLASS_LONGSWORDSMAN',	'UNIT_JFD_HUSCARL');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_ANGLO_SAXONS', 	'RELIGION_CHRISTIANITY');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_0'),	
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_1'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_2'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_3'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_4'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_5'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_6'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_7'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_8'),
			('CIVILIZATION_JFD_ANGLO_SAXONS', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_SAXONS_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 		
			(Type, 							Description,						ShortDescription, 						Adjective, 								Civilopedia,							CivilopediaTag,					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	('TXT_KEY_CIV_JFD_BAVARIA_DESC'), 	('TXT_KEY_CIV_JFD_BAVARIA_SHORT_DESC'), ('TXT_KEY_CIV_JFD_BAVARIA_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_BAVARIA_TEXT_1'), 	('TXT_KEY_CIV5_JFD_BAVARIA'), 	 ('PLAYERCOLOR_JFD_BAVARIA'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_BAVARIA_ATLAS'), 	0, 				('JFD_BAVARIA_ALPHA_ATLAS'), 	('Germany'), 	('BavariaMap512.dds'),	('TXT_KEY_CIV5_DAWN_BAVARIA_TEXT'), ('DOM_Ludwig.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_BAVARIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_01'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_02'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_03'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_04'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_05'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_06'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_07'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_08'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_09'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_10'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_11'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_12'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_13'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_14'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_15'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_16'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_17'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_18'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_19'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_20'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_21'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_22'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_23'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_24'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_25'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_26'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_27'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_28'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_29'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_CITY_NAME_JFD_BAVARIA_30');			
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_BAVARIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'LEADER_JFD_LUDWIG');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 		UnitType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'UNITCLASS_LANCER',	'UNIT_JFD_HARTSCHIER');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'RELIGION_CHRISTIANITY');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_0'),	
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_1'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_2'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_3'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_4'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_5'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_6'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_7'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_8'),
			('CIVILIZATION_JFD_BAVARIA', 	'TXT_KEY_SPY_NAME_JFD_BAVARIA_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_BAVARIA', 	'REGION_HILLS');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


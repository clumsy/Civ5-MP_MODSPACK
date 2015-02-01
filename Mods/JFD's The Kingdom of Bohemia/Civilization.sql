--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					AlphaIconAtlas, 				PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_BOHEMIA'), 	('TXT_KEY_CIV_JFD_BOHEMIA_DESC'), 	('TXT_KEY_CIV_JFD_BOHEMIA_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_BOHEMIA_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_BOHEMIA_TEXT_1'),	('TXT_KEY_CIV5_JFD_BOHEMIA'), 	('PLAYERCOLOR_JFD_BOHEMIA'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_BOHEMIA_ATLAS'),		('JFD_BOHEMIA_ALPHA_ATLAS'),	0, 				('Germany'), 	('MapBohemia512.dds'), ('TXT_KEY_CIV5_DOM_JFD_VACLAV_TEXT'), 	('DOM_Vaclav.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_AUSTRIA' )
	THEN '_AUSTRIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_BOHEMIA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_01'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_02'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_03'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_04'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_05'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_06'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_07'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_08'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_09'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_10'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_11'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_12'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_13'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_14'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_15'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_16'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_17'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_18'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_19'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_20'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_21'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_22'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_23'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_24'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_25'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_26'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_27'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_28'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_29'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_CITY_NAME_JFD_BOHEMIA_30');	
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_BOHEMIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_BOHEMIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_BOHEMIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_BOHEMIA', 	'LEADER_JFD_VACLAV');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_BOHEMIA', 	'BUILDINGCLASS_CASTLE', 	'BUILDING_JFD_HRAD');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_BOHEMIA', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_TABOR');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		('CIVILIZATION_JFD_BOHEMIA'),	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_0'),	
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_1'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_2'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_3'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_4'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_5'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_6'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_7'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_8'),
			('CIVILIZATION_JFD_BOHEMIA', 	'TXT_KEY_SPY_NAME_JFD_BOHEMIA_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Avoid
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_BOHEMIA', 	'REGION_TUNDRA'),
			('CIVILIZATION_JFD_BOHEMIA', 	'REGION_JUNGLE');
--==========================================================================================================================	
--==========================================================================================================================					
	

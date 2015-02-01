--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 						CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				AlphaIconAtlas, 				PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_ICELAND'), 	('TXT_KEY_CIV_JFD_ICELAND_DESC'), 	('TXT_KEY_CIV_JFD_ICELAND_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_ICELAND_ADJECTIVE'), 	('TXT_KEY_CIV5_ICELAND_TEXT_1'),	('TXT_KEY_CIV5_ICELAND'), 		('PLAYERCOLOR_JFD_ICELAND'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_ICELAND_ATLAS'),  ('JFD_ICELAND_ALPHA_ATLAS'),	0, 				('Germany'), 	('IcelandMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_INGOLFR_TEXT'), 	('Ingolfr_DoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_ICELAND';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_01'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_02'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_03'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_04'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_05'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_06'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_07'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_08'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_09'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_10'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_11'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_12'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_13'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_14'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_15'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_16'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_17'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_18'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_19'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_20'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_21'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_22'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_23'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_24'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_25'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_26'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_27'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_28'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_29'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_30');	
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_ICELAND'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_ICELAND'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_ICELAND'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_ICELAND', 	'LEADER_JFD_INGOLFR');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_ICELAND', 	'UNITCLASS_WRITER', 		'UNIT_JFD_SKALD');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_JFD_ICELAND', 	'BUILDINGCLASS_AMPHITHEATER', 	'BUILDING_JFD_THINGSTEAD');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_ICELAND',	'RELIGION_CHRISTIANITY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_0'),	
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_1'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_2'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_3'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_4'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_5'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_6'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_7'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_8'),
			('CIVILIZATION_JFD_ICELAND', 	'TXT_KEY_SPY_NAME_JFD_ICELAND_9');
--==========================================================================================================================
-- Civilization_Start_Along_Ocean
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 				StartAlongOcean)
VALUES		('CIVILIZATION_JFD_ICELAND', 	1);
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_ICELAND', 	'REGION_TUNDRA');
--==========================================================================================================================	
--==========================================================================================================================					
	

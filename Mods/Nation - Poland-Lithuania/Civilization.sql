--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 							AlphaIconAtlas, 						PortraitIndex,	SoundtrackTag, 	MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'), 	('TXT_KEY_CIV_JFD_POLAND_LITHUANIA_DESC'), 	('TXT_KEY_CIV_JFD_POLAND_LITHUANIA_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_POLAND_LITHUANIA_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_POLAND_LITHUANIA_TEXT_1'),	('TXT_KEY_CIV5_JFD_POLAND_LITHUANIA'), 	('PLAYERCOLOR_JFD_POLAND_LITHUANIA'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_POLAND_LITHUANIA_ATLAS'),		('JFD_POLAND_LITHUANIA_ALPHA_ATLAS'),	0, 				('Germany'), 	('PolandLithuaniaMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_SIGISMUND_TEXT'), 	('Sigismund_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Poland
--------------------------------	
UPDATE Civilizations
SET MapImage = 'PolandMap512.dds', DawnOfManImage = 'Casimir_DOM.dds'
WHERE Type = 'CIVILIZATION_POLAND';
--------------------------------	
-- Support to disable Casimir
--------------------------------	
--Set both values from 1 to 0
UPDATE Civilizations
SET	Playable = 1,	AIPlayable = 1
WHERE Type = 'CIVILIZATION_POLAND';
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_POLAND' )
	THEN '_POLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_POLAND_LITHUANIA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================	
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_POLAND';
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_01'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_02'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_03'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_04'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_05'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_06'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_07'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_08'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_09'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_10'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_11'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_12'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_13'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_14'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_15'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_16'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_17'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_18'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_19'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_20'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_21'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_22'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_23'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_24'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_25'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_26'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_27'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_28'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_29'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_POLAND_LITHUANIA_30'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_01'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_02'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_03'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_04'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_05'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_06'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_07'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_08'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_09'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_10'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_11'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_12'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_13'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_14'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_15'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_16'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_17'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_18'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_19'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_20'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_21'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_22'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_23'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_24'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_25'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_CITY_NAME_JFD_POLAND_26');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'LEADER_JFD_SIGISMUND');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'BUILDINGCLASS_BANK', 		'BUILDING_JFD_ESTATE');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_POLAND';	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'UNITCLASS_LANCER', 		'UNIT_POLISH_WINGED_HUSSAR'),
			('CIVILIZATION_POLAND', 				'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_VOIVODE');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA',	'RELIGION_CHRISTIANITY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
DELETE FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_POLAND';
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_0'),	
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_1'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_2'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_3'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_4'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_5'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_6'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_7'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_8'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_POLAND_LITHUANIA_9'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_0'),	
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_1'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_2'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_3'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_4'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_5'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_6'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_7'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_8'),
			('CIVILIZATION_POLAND', 				'TXT_KEY_SPY_NAME_JFD_POLAND_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Avoid
			(CivilizationType, 						RegionType)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'REGION_TUNDRA'),
			('CIVILIZATION_JFD_POLAND_LITHUANIA', 	'REGION_JUNGLE');
--==========================================================================================================================	
--==========================================================================================================================					
	

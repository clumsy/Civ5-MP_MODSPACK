		
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 						Adjective, 								Civilopedia, 						CivilopediaTag, 			DefaultPlayerColor, 		  ArtDefineTag,				ArtStyleType, ArtStyleSuffix,	ArtStylePrefix,	IconAtlas, 				AlphaIconAtlas, 				PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_JFD_MUSCOVY'), 	('TXT_KEY_CIV_JFD_MUSCOVY_DESC'), 	('TXT_KEY_CIV_JFD_MUSCOVY_SHORT_DESC'), ('TXT_KEY_CIV_JFD_MUSCOVY_ADJECTIVE'), 	('TXT_KEY_CIV5_MUSCOVY_TEXT_1'),	('TXT_KEY_CIV5_MUSCOVY'), 	('PLAYERCOLOR_JFD_MUSCOVY'), ('ART_DEF_JFD_MUSCOVY'),	ArtStyleType, ArtStyleSuffix,	ArtStylePrefix,	('JFD_MUSCOVY_ATLAS'),	('JFD_MUSCOVY_ALPHA_ATLAS'), 	0, 				('Russia'), 	('MuscovyMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_IVAN_TEXT'),	('DOM_IvanIV.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_01'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_02'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_03'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_04'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_05'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_06'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_07'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_08'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_09'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_10'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_11'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_12'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_13'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_14'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_15'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_16'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_17'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_18'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_19'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_20'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_21'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_22'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_23'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_24'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_25'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_26'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_27'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_28'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_29'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_CITY_NAME_JFD_MUSCOVY_30');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_MUSCOVY', 	'LEADER_JFD_IVAN');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_MUSCOVY', 	'UNITCLASS_MUSKETMAN',		'UNIT_JFD_STRELTSY');
--------------------------------
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_MUSCOVY', 	'BUILDINGCLASS_TEMPLE',		'BUILDING_JFD_SOBOR');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_MUSCOVY', 	'RELIGION_ORTHODOXY');		
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_0'),	
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_1'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_2'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_3'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_4'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_5'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_6'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_7'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_8'),
			('CIVILIZATION_JFD_MUSCOVY', 	'TXT_KEY_SPY_NAME_JFD_MUSCOVY_9');
--==========================================================================================================================
--==========================================================================================================================
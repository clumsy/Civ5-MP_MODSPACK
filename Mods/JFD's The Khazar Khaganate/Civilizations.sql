--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	('TXT_KEY_CIV_JFD_KHAZARIA_DESC'), 	('TXT_KEY_CIV_JFD_KHAZARIA_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_KHAZARIA_ADJECTIVE'), ('TXT_KEY_CIV5_JFD_KHAZARIA_TEXT_1'), 	('TXT_KEY_CIV5_JFD_KHAZARIA'), 	('PLAYERCOLOR_JFD_KHAZARIA'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_KHAZARIA_ATLAS'), 0, 				('JFD_KHAZARIA_ALPHA_ATLAS'), 	('Persia'), 	('KhazariaMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_BULAN_TEXT'), 	('Bulan_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_PERSIA');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_MONGOL' )
	THEN '_MONGOL'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_KHAZARIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_ATIL'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SARKEL'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_BALANJAR'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SAMANDAR'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_TMUTARAKAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_DERBENT'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_ASTARKHAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KIEV'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SARYCHIN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SARATAU'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KHARKA'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_ALBAT'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KHORYSDAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KHURSA'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SIMBIR'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_GUZLIEV'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SUDAK'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KERCH'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SAMIRAN'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_SAMBALUT'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_CITY_NAME_JFD_KAZARSKI');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_KHAZARIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'LEADER_JFD_BULAN');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_KHAGAN_BEK');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 		'BUILDINGCLASS_TEMPLE', 'BUILDING_JFD_SHUL');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 		'RELIGION_JUDAISM');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_0'),	
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_1'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_2'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_3'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_4'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_5'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_6'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_7'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_8'),
			('CIVILIZATION_JFD_KHAZARIA', 	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


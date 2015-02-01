--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, 			ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_ARMENIA'), 	('TXT_KEY_CIV_JFD_ARMENIA_DESC'), 	('TXT_KEY_CIV_JFD_ARMENIA_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_ARMENIA_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_ARMENIA_TEXT_1'), 	('TXT_KEY_CIV5_JFD_ARMENIA'), 	('PLAYERCOLOR_JFD_ARMENIA'), 	ArtDefineTag, ('ARTSTYLE_MIDDLE_EAST'), ArtStyleSuffix, ArtStylePrefix, ('JFD_ARMENIA_ATLAS'), 	0, 				('JFD_ARMENIA_ALPHA_ATLAS'), 	('Persia'), 	('ArmeniaMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_TIRIDATES_TEXT'), 	('Tiridates_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_PERSIA' )
	THEN '_PERSIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_ARMENIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_YEREVAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GYUMRI'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_ARTASHAT'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_TIGRANOCERTA'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_YERVANTASHAT'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GAVAR'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_ARMAVIR'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_ARARAT'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_ETCHMIADZIN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_ANI'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_GHAPAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_DVIN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_KARS'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_BITLIS'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_SHABIN_KARAHISSAR'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_ERZURUM'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_NAXCIVAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_SHUSHA'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_STEPANAKERT'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_DILIJAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_KARAKILLISE'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_LORRI'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_KIROVAKAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_SEPASTIA'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_SASSOUN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_APARAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_ICHEVAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_HRAZDAN'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_VANADZOR'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_CITY_NAME_JFD_VARDENIS');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_ARMENIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_ARMENIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_ARMENIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_ARMENIA', 	'LEADER_JFD_TIRIDATES');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_ARMENIA', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_MAMIKONIAN');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JFD_ARMENIA', 		'BUILDINGCLASS_TEMPLE', 'BUILDING_JFD_ARMENIAN_MONASTERY');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================		
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_ARMENIA', 	'REGION_HILLS');			
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_0'),	
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_1'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_2'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_3'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_4'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_5'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_6'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_7'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_8'),
			('CIVILIZATION_JFD_ARMENIA', 	'TXT_KEY_SPY_NAME_JFD_ARMENIA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


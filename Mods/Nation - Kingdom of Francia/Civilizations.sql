--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_THE_FRANKS'), 	('TXT_KEY_CIV_JFD_THE_FRANKS_DESC'), 	('TXT_KEY_CIV_JFD_THE_FRANKS_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_THE_FRANKS_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_THE_FRANKS_TEXT_1'), 	('TXT_KEY_CIV5_JFD_THE_FRANKS'), 	('PLAYERCOLOR_JFD_THE_FRANKS'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_THE_FRANKS_ATLAS'), 	1, 				('JFD_THE_FRANKS_ALPHA_ATLAS'), 	('France'), 	('TheFranksMap512.dds'), 	('TXT_KEY_CIV5_DOM_CHARLEMAGNE_TEXT'), 	('DOM_Charlemagne.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_FRANCE');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE' )
	THEN '_FRANCE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_THE_FRANKS';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_AACHEN'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_TREVES'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_SOISSONS'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_STRASBOURG'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_METTIS'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_REGENSBURG'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_CLAUDIA'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_CHALONS'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_POITIERS'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_HIELDEBERG'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_WORMS'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_VERDUN'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_MAYENCE'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_SPEYER'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_VIENNE'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_ARLES'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_FRANKFORT'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_AIX'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_TOURNAI'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_TONGRAS'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_CAMBRAI'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_PASSAU'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_MUNSTER'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_BASILEA'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_COLMAR'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_VOUILLE'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_THEROUANNE'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_BETUWE'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_CITY_NAME_JFD_VANNES');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_THE_FRANKS'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_THE_FRANKS'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_THE_FRANKS'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_THE_FRANKS', 	'LEADER_JFD_CHARLEMAGNE');	
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_THE_FRANKS', 	'UNITCLASS_SWORDSMAN',		'UNIT_JFD_FRANCISCA'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'UNITCLASS_GREAT_GENERAL',	'UNIT_JFD_PALADIN');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		('CIVILIZATION_JFD_THE_FRANKS'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_FRANCE');	
--==========================================================================================================================
-- Civilization_Start_Region_Priority 
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_JFD_THE_FRANKS', 	'REGION_FOREST');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_0'),	
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_1'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_2'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_3'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_4'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_5'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_6'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_7'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_8'),
			('CIVILIZATION_JFD_THE_FRANKS', 	'TXT_KEY_SPY_NAME_JFD_THE_FRANKS_9');
--==========================================================================================================================	
--==========================================================================================================================					
			
			


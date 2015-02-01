--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
INSERT INTO Civilizations
			(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia, CivilopediaTag, DefaultPlayerColor, 			 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_USSR_LENIN'), 	('TXT_KEY_CIV_JFD_USSR_LENIN_DESC'), 	('TXT_KEY_CIV_JFD_USSR_LENIN_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_USSR_LENIN_ADJECTIVE'),	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_USSR_LENIN'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_USSR_LENIN_ATLAS'), 	0, 				('JFD_USSR_LENIN_ALPHA_ATLAS'), ('Russia'), 	('LeninUSSRMap512.dds'), 	('TXT_KEY_CIV_JFD_LENIN_USSR_DAWN'), 	('Lenin_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA')
	THEN '_RUSSIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_USSR_LENIN';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_MOSCOW'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_PETROGRAD'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_KHARKOV'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_MINSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_KIEV'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_SIMBIRSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_SIMFEROPOL'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_ODESSA'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_BAKU'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_OMSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_UFA'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_YEKATERINBURG'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_KALUGA'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_SMOLENSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_ROSTOV_ON_DON'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_KRASNODAR'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_VLADIVOSTOK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_NOVOSIBIRSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_KRASNOYARSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_CHELYABINSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_YEREVAN'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_SAMARA'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_TSARITSYN'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_YUZOVKA'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_IVANOVO'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_ALMA_ATA'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_FRUNZE'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_KHABAROVSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_AKMOLINSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_SEMIPALATINSK'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_ASHGABAT'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_DUSHANBE'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_NIKOLAYEVSK_ON_AMUR'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_ELEKTROSTAL'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_DETSKOE_SELO'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_LENINO'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_LENINABAD'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_CITY_NAME_JFD_LENIN_ARZAMAS-16');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================	
INSERT INTO Civilization_FreeBuildingClasses
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_USSR_LENIN'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_USSR_LENIN'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_USSR_LENIN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================	
INSERT INTO Civilization_Leaders
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_USSR_LENIN', 	'LEADER_JFD_LENIN');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType, 					UnitClassType, 						UnitType)
VALUES		('CIVILIZATION_JFD_USSR_LENIN', 	'UNITCLASS_GREAT_WAR_INFANTRY', 	'UNIT_JFD_LENIN_LEVY');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_USSR_LENIN', 	'BUILDINGCLASS_CONSTABLE', 	'BUILDING_JFD_LENIN_COMMISSARIAT');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_0'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_1'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_2'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_3'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_4'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_5'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_6'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_7'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_8'),
			('CIVILIZATION_JFD_USSR_LENIN', 	'TXT_KEY_SPY_NAME_JFD_LENIN_SOVIET_9');
--==========================================================================================================================	
-- Civilization_Start_Region_Avoid
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Avoid
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_JFD_USSR_LENIN', 	'REGION_DESERT');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_JFD_USSR_LENIN', 	'REGION_PLAINS');
--==========================================================================================================================	
--==========================================================================================================================	

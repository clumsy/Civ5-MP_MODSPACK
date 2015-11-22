--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations
			(Type, 								Description, 							ShortDescription, 								Adjective, 										Civilopedia, 	CivilopediaTag, 	DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 				DawnOfManImage)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 	('TXT_KEY_CIV_JFD_USSR_STALIN_DESC'), 	('TXT_KEY_CIV_JFD_USSR_STALIN_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_USSR_STALIN_ADJECTIVE'),		Civilopedia, 	CivilopediaTag, 	('PLAYERCOLOR_JFD_USSR_STALIN'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_USSR_STALIN_ATLAS'), 	0, 				('JFD_USSR_STALIN_ALPHA_ATLAS'), 	('Russia'), 	('USSRStalinMap512.dds'), 	('TXT_KEY_CIV_JFD_USSR_DAWN'), 	('DOM_Stalin.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
	THEN '_RUSSIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_USSR_STALIN';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================
INSERT INTO Civilization_CityNames
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_MOSCOW'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_LENINGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KIEV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_MINSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KHARKOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_STALINGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_SVERDLOVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_GORKY'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KRASNODAR'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_VLADIVOSTOK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_NOVOSIBIRSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KRASNOYARSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KUYBYSHEV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_BAKU'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TBILISI'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ALMA_ATA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TASHKENT'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_OMSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_UFA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_CHELYABINSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_SEVASTOPOL'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_MOLOTOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KALININGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_RIGA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TALLIN'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KAZAN'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ODESSA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KIROV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ULYANOVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_DNEPROPETROVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_STALINO'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KHABAROVSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TOLYATTI'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_BARNAUL'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_USTINOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ORDZONIKIDZE'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ASHGABAT'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_STALINABAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_NOVOKUZNETSK'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_TSELINOGRAD'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_KARAGANDA'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_FRUNZE'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_SHCHERBAKOV'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_CITY_NAME_JFD_STALIN_ARZAMAS_16');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================
INSERT INTO Civilization_FreeBuildingClasses
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================
INSERT INTO Civilization_FreeTechs
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================
INSERT INTO Civilization_FreeUnits
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_USSR_STALIN'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================
INSERT INTO Civilization_Leaders
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'LEADER_JFD_STALIN');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType, 					UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'UNITCLASS_TANK', 				'UNIT_JFD_IS2');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================
INSERT INTO Civilization_BuildingClassOverrides
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'BUILDINGCLASS_CONSTABLE', 	'BUILDING_JFD_STALIN_COMMISSARIAT');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================
INSERT INTO Civilization_SpyNames
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_0'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_1'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_2'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_3'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_4'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_5'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_6'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_7'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_8'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_9'),
			('CIVILIZATION_JFD_USSR_STALIN', 	'TXT_KEY_SPY_NAME_JFD_SOVIET_10');
--==========================================================================================================================
-- Civilization_Start_Region_Avoid
--==========================================================================================================================
INSERT INTO Civilization_Start_Region_Avoid
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'REGION_DESERT');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================
INSERT INTO Civilization_Start_Region_Priority
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_JFD_USSR_STALIN', 	'REGION_PLAINS');
--==========================================================================================================================
--==========================================================================================================================

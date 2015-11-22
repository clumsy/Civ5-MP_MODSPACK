--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 										Description, ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 						PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 		Description, ShortDescription, 	Adjective, 	Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_NICHOLAS_RUSSIA'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_RUSSIA_NICHOLAS_ATLAS'), 	0, 				('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS'), 	('Russia'), 	('NicholasRussiaMap512.dds'),	('TXT_KEY_CIV5_DAWN_NICHOLAS_RUSSIA_TEXT'), ('Nicholas_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
	THEN '_RUSSIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_NICHOLAS_RUSSIA';
--------------------------------	
-- Support to disable Catherine
--------------------------------	
--Set both values from 1 to 0
UPDATE Civilizations
SET Playable = 1, AIPlayable = 1
Where Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ST_PETERSBURG'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TSARSKOYE_SELO'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_MOSCOW'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KIEV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NOVGOROD'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_VLADIMIR'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ROSTOV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SMOLENSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YAROSLAVL'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ODESSA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_WARSAW'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_HELSINGFORS'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_MINSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YEKATERINBURG'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KAZAN'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SARATOV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NIZHNIY_NOVGOROD'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TIFLIS'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_RIGA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KHARKOV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SEVASTOPOL'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TSARITSYN'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NOVOROSSIYSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YEKATERINOSLAV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ARKHANGELSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_VLADIVOSTOK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_PETROPAVLOVSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_IRKUTSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_OMSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TASHKENT'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KHABAROVSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ASTRAKHAN'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SAMARKAND'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YEKATERINODAR'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_NIKOLAEV'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ALEKSANDROVSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TULA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_ORENBURG'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_SAMARA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_VORONEZH'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_YAKUTSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_KYAKHTA'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_BELOTSARSK'),
			('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 	'TXT_KEY_CITY_NAME_JFD_NICHOLAS_TSARGRAD');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 							BuildingClassType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 							TechType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 							LeaderheadType)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 		'LEADER_JFD_NICHOLAS');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 							UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 		'UNITCLASS_GREAT_WAR_INFANTRY', 'UNIT_JFD_OPOLCHENIYE');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_NICHOLAS_RUSSIA', 		'BUILDINGCLASS_CONSTABLE', 	'BUILDING_JFD_GUBERNIYA');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 							ReligionType)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 		ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 							SpyName)
SELECT		('CIVILIZATION_JFD_NICHOLAS_RUSSIA'), 		SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


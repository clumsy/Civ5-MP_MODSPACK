--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 										Description,							ShortDescription, 							Adjective, 							Civilopedia, CivilopediaTag, 	DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'), 		('TXT_KEY_JFD_PETRINE_RUSSIA_DESC'),	('TXT_KEY_JFD_PETRINE_RUSSIA_SHORT_DESC'), 	('TXT_KEY_JFD_PETRINE_RUSSIA_ADJ'), Civilopedia, CivilopediaTag, 	('PLAYERCOLOR_JFD_PETRINE_RUSSIA'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_RUSSIA_ATLAS'), 	0, 				('JFD_RUSSIA_ALPHA_ATLAS'), 	('Russia'), 	('PetrineRussiaMap512.dds'),	('TXT_KEY_CIV5_DOM_JFD_PETER_TEXT'), 	('Peter_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
	THEN '_RUSSIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_PETRINE_RUSSIA';
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
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_STPETERSBURG'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_MOSCOW'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_KIEV'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_NOVGOROD'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_VLADIMIR'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_ROSTOV'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_SMOLENSK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_YAROSLAVL'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_TAGANROG'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_KRONSTADT'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_AZOV'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_POLTAVA'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_VORONEZH'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_ARKHANGELSK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_NOTEBURG'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_TVER'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_KAZAN'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_TULA'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_MUROM'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_OHOTSK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_IRKUSTK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_KRASNOYARSK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_YAKUTSK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_OBDORSK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_KOSTROMA'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_TOMSK'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_NARVA'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_REVEL'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_ASTRAKHAN'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_VOLOGDA'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_DERBENT'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_SARATOV'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_UFA'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_SAMARA'),
			('CIVILIZATION_JFD_PETRINE_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_TAMBOV');
--------------------------------	
-- Catherine
--------------------------------	
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			CityName)
VALUES		('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_STPETERSBURG'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_MOSCOW'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_KIEV'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_NOVGOROD'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_VLADIMIR'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_ROSTOV'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_SMOLENSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_YAROSLAVL'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_YEKATERINBURG'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_AZOV'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_STAVROPOL'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_KHERSON'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_YEKATERINOSLAV'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_SEVASTOPOL'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_SIMFEROPOL'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_ORENBURG'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_URALSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_MINSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_ODESSA'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_TAGANROG'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_KAZAN'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_YEKATERINODAR'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_SAMARA'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_CHELYABINSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_KURGAN'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_TYUMEN'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_OMSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_SEMIPALATINSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_TOMSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_KRASNOYARSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_IRKUSTK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_OHOTSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_PETROPAVLOVKIY_OSTROG'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_TOBOLSK'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_ASTRAKHAN'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_SHLISSELBURG'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_PETER_REVEL'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_VILNO'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_RIGA'),
			('CIVILIZATION_RUSSIA', 	'TXT_KEY_CITY_NAME_CATHERINE_CONSTANTINOPLE');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 							BuildingClassType)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 							TechType)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 							LeaderheadType)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA', 		'LEADER_JFD_PETER');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 							UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA', 		'UNITCLASS_MUSKETMAN', 		'UNIT_JFD_STRELTSY');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA', 		'BUILDINGCLASS_BARRACKS', 	'BUILDING_KREPOST'),
			('CIVILIZATION_RUSSIA', 					'BUILDINGCLASS_GARDEN', 	'BUILDING_JFD_BANYA');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 							ReligionType)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'), 		ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 							SpyName)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'), 		SpyName
FROM Civilization_SpyNames WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


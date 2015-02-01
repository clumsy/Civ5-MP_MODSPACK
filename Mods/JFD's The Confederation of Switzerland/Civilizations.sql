--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 								Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'), 	('TXT_KEY_CIV_JFD_SWITZERLAND_DESC'), 	('TXT_KEY_CIV_JFD_SWITZERLAND_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_SWITZERLAND_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_SWITZERLAND_TEXT_1'), 	('TXT_KEY_CIV5_JFD_SWITZERLAND'), 	('PLAYERCOLOR_JFD_SWITZERLAND'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_SWITZERLAND_ATLAS'), 	0, 				('JFD_SWITZERLAND_ALPHA_ATLAS'), 	('France'), 	('SwitzerlandMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_DUFOUR_TEXT'), 	('Dufour_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_FRANCE');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE')
	THEN '_FRANCE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_SWITZERLAND';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_BERN'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_ZURICH'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_GENEVA'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_BASEL'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_LUCERNE'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_ST_GALLEN'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_LAUSANNE'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_WINTERTHUR'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_LUGANO'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_BIENNE'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_THUN'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SCHAFFHAUSEN'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_LA_CHAUX_DE_FONDS'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_FRIBOURG'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_CHUR'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_NEUHATEL'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_VERNIER'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_USTER'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_SION'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_EMMEN'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_PORTEIN'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_CORIPPO'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_MULEGNS'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_BISTER'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_MARTISBERG'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_GOUMOENS_LE_JUX'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_LARGARIO'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_CLUGIN'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_CITY_NAME_JFD_CAUCO');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_SWITZERLAND', 	'LEADER_JFD_DUFOUR');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_SWITZERLAND', 	'UNITCLASS_JFD_MEDIC', 	'UNIT_JFD_COMBAT_MEDIC');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JFD_SWITZERLAND', 	'BUILDINGCLASS_ARMORY', 'BUILDING_JFD_KASERNE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_SWITZERLAND',	'RELIGION_CHRISTIANITY');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		--Switzerland
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_0'),	
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_1'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_2'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_3'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_4'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_5'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_6'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_7'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_8'),
			('CIVILIZATION_JFD_SWITZERLAND', 	'TXT_KEY_SPY_NAME_JFD_SWITZERLAND_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


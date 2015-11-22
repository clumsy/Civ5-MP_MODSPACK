--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 								Description, 						ShortDescription, 							Adjective, 									Civilopedia, 						CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					AlphaIconAtlas, 				PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_HOLY_ROME'), 	('TXT_KEY_CIV_JFD_HOLY_ROME_DESC'), ('TXT_KEY_CIV_JFD_HOLY_ROME_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_HOLY_ROME_ADJECTIVE'), 	('TXT_KEY_CIV5_HOLY_ROME_TEXT_1'),	('TXT_KEY_CIV5_HOLY_ROME'), 	('PLAYERCOLOR_JFD_HOLY_ROME'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_HOLY_ROME_ATLAS'),	('JFD_HOLY_ROME_ALPHA_ATLAS'),	0, 				('Germany'), 	('HolyRomeMap512.dds'), ('TXT_KEY_CIV5_DOM_JFD_CHARLES_V_TEXT'), 	('CharlesV_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_HOLY_ROME';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_CITY_NAME_JFD_HRE_CITY_1');	
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_HOLY_ROME'), BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_HOLY_ROME'), TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_HOLY_ROME'), UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_HOLY_ROME', 	'LEADER_JFD_CHARLES_V');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_HOLY_ROME', 	'UNITCLASS_PIKEMAN',		'UNIT_JFD_DOPPELSOLDNER'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'UNITCLASS_MERCHANT', 		'UNIT_JFD_AMBASSADOR');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_HOLY_ROME', 	'BUILDINGCLASS_COURTHOUSE',	'BUILDING_JFD_RATHAUS');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_HOLY_ROME',		'RELIGION_CHRISTIANITY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_0'),	
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_1'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_2'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_3'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_4'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_5'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_6'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_7'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_8'),
			('CIVILIZATION_JFD_HOLY_ROME', 	'TXT_KEY_SPY_NAME_JFD_HOLY_ROME_9');	
--==========================================================================================================================	
--==========================================================================================================================					
	

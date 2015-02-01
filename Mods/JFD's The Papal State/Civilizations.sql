--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 								Description,						ShortDescription, 							Adjective, 							Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	('TXT_KEY_JFD_PAPAL_STATES_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_SHORT_DESC'),	('TXT_KEY_JFD_PAPAL_STATES_ADJ'),	('TXT_KEY_CIV5_JFD_PAPAL_STATES_TEXT_1'), 	('TXT_KEY_CIV5_JFD_PAPAL_STATES'), 	('PLAYERCOLOR_JFD_PAPAL_STATES'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_PAPAL_STATES_ATLAS'), 0, 				('JFD_PAPAL_STATES_ALPHA_ATLAS'), 	('JFD_Papal'), 	('PapalStatesMap512.dds'),	('TXT_KEY_CIV5_DOM_JFD_PIUS_TEXT'), 	('Pius_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ROME');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ROME' )
	THEN '_ROME'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ROMA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_BENEVENTO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_PONTECORVO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ASCOLI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_AVIGNON'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RAVENNA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_BOLOGNA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_FERRARA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_CIVITAVECCHIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_PERUGIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ASSISI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ORVIETO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_SINIGAGLIA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_ANCONA'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_GUBBIO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_CAMERINO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_FERMO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RIMINI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_URBINO'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_RIETI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_TODI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_VELLETRI'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_CITY_NAME_JFD_VITERBO');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ROME');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'LEADER_JFD_PIUS');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'UNITCLASS_LANDSKNECHT',	'UNIT_JFD_SWISS_GUARD');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_TEMPLE', 'BUILDING_JFD_CHAPEL_WRITING'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'BUILDINGCLASS_PALACE', 'BUILDING_JFD_APOSTOLIC_PALACE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'RELIGION_CHRISTIANITY');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_0'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_1'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_2'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_3'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_4'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_5'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_6'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_7'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_8'),
			('CIVILIZATION_JFD_PAPAL_STATES', 	'TXT_KEY_SPY_NAME_JFD_PAPAL_STATES_9');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES', 	'REGION_HILLS');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


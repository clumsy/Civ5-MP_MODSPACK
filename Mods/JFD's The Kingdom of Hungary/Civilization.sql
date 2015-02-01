--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManAudio,						DawnOfManImage)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	('TXT_KEY_CIV_JFD_HUNGARY_DESC'), 	('TXT_KEY_CIV_JFD_HUNGARY_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_HUNGARY_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_HUNGARY_TEXT_1'),	('TXT_KEY_CIV5_JFD_HUNGARY'), 	('PLAYERCOLOR_JFD_HUNGARY'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_HUNGARY_ATLAS'),	0, 				('JFD_HUNGARY_ALPHA_ATLAS'),	('Poland'), 	('HungaryMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_STEPHEN_TEXT'), 	('AS2D_DOM_SPEECH_JFD_STEPHENL'),	('Stephen_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_AUSTRIA');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_AUSTRIA' )
	THEN '_AUSTRIA'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_HUNGARY';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
DELETE FROM Civilization_CityNames WHERE CityName = 'TXT_KEY_CITY_NAME_BUDAPEST';
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_BUDAPEST'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_EZTERGOM'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_DEBRECEN'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZEGED'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_MISKOLC'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_PECS'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_GYOR'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_NYIREHYHAZA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_KECSKEMET'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZEKESFEHERVAR'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZOMBATHELY'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZOLNOK'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_TATABANYA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_KAPOSVAR'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_ERD'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_VESZPREM'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_BEKESCSABA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SOPRON'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_EGER'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_NAGYKANIZSA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_DUNAUJVAROS'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_HODMEZOVSARHELY'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_DUNAKESZI'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_CEGLED'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_BAJA'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SALGOTARJAN'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZIGETSZENTMIKLOS'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_VAC'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_GODOLLO'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_OZD'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_CITY_NAME_JFD_SZEKSZARD');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_AUSTRIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_AUSTRIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_HUNGARY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_AUSTRIA');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'LEADER_JFD_STEPHEN');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'UNITCLASS_CAVALRY', 	'UNIT_JFD_HUSSAR');
--------------------------------	
-- Austria
--------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_AUSTRIA', 		'UNITCLASS_CAVALRY', 	'UNIT_AUSTRIAN_HUSSAR');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'BUILDINGCLASS_CASTLE', 	'BUILDING_JFD_VEGVAR');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'RELIGION_CHRISTIANITY');					
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_0'),	
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_1'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_2'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_3'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_4'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_5'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_6'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_7'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_8'),
			('CIVILIZATION_JFD_HUNGARY', 	'TXT_KEY_SPY_NAME_JFD_HUNGARY_9');
--==========================================================================================================================		
--==========================================================================================================================						
	

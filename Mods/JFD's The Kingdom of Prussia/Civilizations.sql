--==========================================================================================================================
-- Civilizations
--==========================================================================================================================			
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_PRUSSIA'), 	('TXT_KEY_CIV_JFD_PRUSSIA_DESC'), 	('TXT_KEY_CIV_JFD_PRUSSIA_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_PRUSSIA_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_PRUSSIA_TEXT_1'), 	('TXT_KEY_CIV5_JFD_PRUSSIA'), 	('PLAYERCOLOR_JFD_PRUSSIA'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_PRUSSIA_ATLAS'), 	0, 				('JFD_PRUSSIA_ALPHA_ATLAS'), 	('Germany'), 	('PrussiaMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_FREDERICK_TEXT'), 	('Frederick_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GERMANY');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_PRUSSIA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_KONIGSBERG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_BERLIN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_POTSDAM'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_MAGDEBURG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_FRANKFURT'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_DANZIG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_STETTIN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_ELBING'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_ALLENSTEIN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_MARIENBURG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_THORN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_POSEN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_BRESLAU'),	
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_MARIENWERDER'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_KOLBERG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_KUSTRIN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_ESSEN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_KULM'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_KOBLENZ'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_MEMEL'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_HEILSBERG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_BRIEG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_GRAUDENZ'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_LUCKAU'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_TILSIT'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_BRAUNSBERG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_LANDSBERG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_COTTBUS'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_HANNOVER'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_CHARLOTTENBURG'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_CLEVES'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_SIGMARINGEN'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_CITY_NAME_JFD_PREUSSISCH_EYLAU');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_PRUSSIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_PRUSSIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_PRUSSIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_PRUSSIA', 	'LEADER_JFD_FREDERICK');	
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_JFD_PRUSSIA', 	'UNITCLASS_CAVALRY', 	'UNIT_JFD_DEATHS_HEAD'),
			('CIVILIZATION_JFD_PRUSSIA', 	'UNITCLASS_RIFLEMAN', 	'UNIT_JFD_LANDWEHR');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 					BuildingType)
VALUES		('CIVILIZATION_JFD_PRUSSIA', 	'BUILDINGCLASS_BARRACKS', 			'BUILDING_JFD_PRUSSIAN_BARRACKS'),
			('CIVILIZATION_JFD_PRUSSIA', 	'BUILDINGCLASS_ARMORY', 			'BUILDING_JFD_PRUSSIAN_ARMORY'),
			('CIVILIZATION_JFD_PRUSSIA', 	'BUILDINGCLASS_MILITARY_ACADEMY', 	'BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		('CIVILIZATION_JFD_PRUSSIA'), 	ReligionType			
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_GERMANY');		
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM' )
		THEN 'RELIGION_PROTESTANT_CALVINISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_JFD_PRUSSIA';

CREATE TRIGGER ReligionPrussia
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_CALVINISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM' )
		THEN 'RELIGION_PROTESTANT_CALVINISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_JFD_PRUSSIA';
END;		
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_0'),	
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_1'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_2'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_3'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_4'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_5'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_6'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_7'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_8'),
			('CIVILIZATION_JFD_PRUSSIA', 	'TXT_KEY_SPY_NAME_JFD_PRUSSIA_9');
--==========================================================================================================================	
--==========================================================================================================================					
			
			


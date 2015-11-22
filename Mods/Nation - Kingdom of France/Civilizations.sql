--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 										Description, 									ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 							DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 						DawnOfManQuote, 					DawnOfManImage,			DawnOfManAudio)
SELECT		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE'), 	('TXT_KEY_CIV_JFD_NAPOLEONIC_FRANCE_DESC'), 	('TXT_KEY_CIV_JFD_NAPOLEONIC_FRANCE_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_NAPOLEONIC_FRANCE_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_NAPOLEONIC_FRANCE_TEXT_1'), 	('TXT_KEY_CIV5_JFD_NAPOLEONIC_FRANCE'), 	('PLAYERCOLOR_JFD_NAPOLEONIC_FRANCE'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_FRANCE_ATLAS'), 	0, 				('JFD_FRANCE_ALPHA_ATLAS'), 	('France'), 	('NapoleonicFranceMap512.dds'),	('TXT_KEY_CIV5_DAWN_FRANCE_TEXT'), 	('Napoleon_DOM.dds'),	('AS2D_DOM_SPEECH_FRANCE')
FROM Civilizations WHERE (Type = 'CIVILIZATION_FRANCE');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE' )
	THEN '_FRANCE'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_NAPOLEONIC_FRANCE';

UPDATE Civilizations
SET DawnOfManImage = 'Louis_DOM.dds',
	MapImage = 'BourbonFranceMap512.dds',
	DawnOfManQuote = 'TXT_KEY_CIV5_DOM_JFD_LOUIS_XIV_TEXT',
	DawnOfManAudio = null
WHERE Type = 'CIVILIZATION_FRANCE';

--Set Playable and AIPlayable to 0 to disable Napoleon.
UPDATE Civilizations
SET Playable = 1,
	AIPlayable = 1
Where Type = 'CIVILIZATION_JFD_NAPOLEONIC_FRANCE';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_FRANCE';
INSERT INTO Civilization_CityNames 
			(CivilizationType, 						CityName)
VALUES		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_PARIS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_ORLEANS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_LYONS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_RHEIMS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_TOURS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_MARSEILLES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_CHARTRES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_AVIGNON'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_ROUEN'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_GRENOBLE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_DJION'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_AMIENS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_CHERBOURG'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_POITIERS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_TOULOUSE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_BAYONNE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_STRASBOURG'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_BREST'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_BORDEAUX'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_RENNES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_NICE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_NANTES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_REIMS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_LE_MANS'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_MONTPELLIER'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_LIMOGES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_NANCY'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_LILLE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_CAEN'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_TOULON'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_NIMES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_LOURDES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_LE_HAVRE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_CARCASSONNE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_CANNES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_AIX_EN_PROVINCE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_LA_ROCHELLE'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_BOURGES'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_CITY_NAME_CALAIS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_PARIS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_JFD_VERSAILLES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_ORLEANS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_LYONS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_RHEIMS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_TOURS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_MARSEILLES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_CHARTRES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_AVIGNON'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_ROUEN'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_GRENOBLE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_DJION'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_AMIENS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_CHERBOURG'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_POITIERS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_TOULOUSE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_BAYONNE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_STRASBOURG'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_BREST'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_BORDEAUX'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_RENNES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_NICE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_NANTES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_REIMS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_LE_MANS'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_MONTPELLIER'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_LIMOGES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_NANCY'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_LILLE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_CAEN'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_TOULON'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_NIMES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_LOURDES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_LE_HAVRE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_CARCASSONNE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_CANNES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_AIX_EN_PROVINCE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_LA_ROCHELLE'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_BOURGES'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_CITY_NAME_CALAIS');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 							BuildingClassType)
SELECT		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 							TechType)
SELECT		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================	
DELETE FROM	Civilization_Leaders WHERE CivilizationType = 'CIVILIZATION_FRANCE';	
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'LEADER_NAPOLEON'),
			('CIVILIZATION_FRANCE',					'LEADER_JFD_LOUIS_XIV');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'UNITCLASS_LANCER', 		'UNIT_JFD_IMPERIAL_GUARD'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'UNITCLASS_CAVALRY', 		'UNIT_JFD_CHEVAU_LEGER'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_NAPOLEONIC_MARSHAL');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 							ReligionType)
SELECT		('CIVILIZATION_JFD_NAPOLEONIC_FRANCE'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_FRANCE');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
DELETE FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_FRANCE';	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_0'),	
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_1'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_2'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_3'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_4'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_5'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_6'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_7'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_8'),
			('CIVILIZATION_FRANCE', 				'TXT_KEY_SPY_NAME_JFD_LOUIS_FRANCE_9'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_0'),	
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_1'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_2'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_3'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_4'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_5'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_6'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_7'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_8'),
			('CIVILIZATION_JFD_NAPOLEONIC_FRANCE', 	'TXT_KEY_SPY_NAME_JFD_NAPOLEONIC_FRANCE_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


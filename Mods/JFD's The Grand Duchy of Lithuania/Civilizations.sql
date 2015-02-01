--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 							Description, 						ShortDescription, 							Adjective, 									Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 					DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_JFD_LITHUANIA'), ('TXT_KEY_CIV_JFD_LITHUANIA_DESC'), ('TXT_KEY_CIV_JFD_LITHUANIA_SHORT_DESC'), 	('TXT_KEY_CIV_JFD_LITHUANIA_ADJECTIVE'),	('TXT_KEY_CIV5_JFD_LITHUANIA_TEXT_1'), 	('TXT_KEY_CIV5_JFD_LITHUANIA'), ('PLAYERCOLOR_JFD_LITHUANIA'), 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_LITHUANIA_ATLAS'), 	0, 				('JFD_LITHUANIA_ALPHA_ATLAS'), 	('Poland'), 	('LithuaniaMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_GEDIMINAS_TEXT'), 	('Gediminas_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_POLAND');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_POLAND' )
	THEN '_POLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_LITHUANIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_VILNIUS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_KAUNAS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_GARDINAS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_TRAKAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_SIAULIAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_KLAIPEDA'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_KERNAVE'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_PALANGA'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_RASEINIAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_SVNCIONYS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_SEINAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_LYDA'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_VARNIAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_TELSIAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_UPYTE'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_ANYKSCIAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_RKISKIS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_NESVYZIUS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_BIRZAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_KREVAS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_PANEVEZYS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_UTENA'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_SVIERIAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_JURBARKAS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_UKMERGE'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_MERKINE'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_AKMENE'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_SMURGAINYS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_ZIETELA'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_KEDAINAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_TAURAGE'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_ALYTUS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_RADVILISKIS'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_MAZEIKIAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_DRUSKININKAI'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_CITY_NAME_JFD_PANEMUNE');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_JFD_LITHUANIA'), BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_POLAND');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_JFD_LITHUANIA'), TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_POLAND');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_LITHUANIA'), UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_POLAND');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_JFD_LITHUANIA', 	'LEADER_JFD_GEDIMINAS');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_LITHUANIA', 	'UNITCLASS_SWORDSMAN', 		'UNIT_JFD_SAMOGITIAN_WARRIOR');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_JFD_LITHUANIA', 	'BUILDINGCLASS_SHRINE', 'BUILDING_JFD_SACRED_GROVE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
SELECT		('CIVILIZATION_JFD_LITHUANIA'), ReligionType	
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_POLAND');	

UPDATE Civilization_Religions 
SET ReligionType = ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ROMUVA' )
		THEN 'RELIGION_ROMUVA'
		ELSE 'RELIGION_CHRISTIANITY' END) 
WHERE CivilizationType = 'CIVILIZATION_JFD_LITHUANIA';
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================		
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_JFD_LITHUANIA', 	'REGION_FOREST');			
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_0'),	
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_1'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_2'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_3'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_4'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_5'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_6'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_7'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_8'),
			('CIVILIZATION_JFD_LITHUANIA', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


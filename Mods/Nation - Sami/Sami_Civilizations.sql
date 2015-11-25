--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 							Description,					ShortDescription, 					Adjective, 							CivilopediaTag, 					DefaultPlayerColor, 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 				SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManAudio,					DawnOfManImage)
SELECT		('CIVILIZATION_SAMI'), 			('TXT_KEY_MC_SAMI_DESC'),		('TXT_KEY_MC_SAMI_SHORT_DESC'),		('TXT_KEY_MC_SAMI_ADJECTIVE'),		('TXT_KEY_MC_CIVLOPEDIA_SAMI'), 	('PLAYERCOLOR_SAMI'), 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('SAMI_ATLAS'), 		0, 				('SAMI_ALPHA_ATLAS'), 			('France'), 	('SAMI_Map.dds'),		('TXT_KEY_MC_DAWN_OF_MAN_SAMI_TEXT'),	('AS2D_DOM_SPEECH_SAMI'), 		('SAMI_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_DENMARK' )
	THEN '_DENMARK'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_SAMI';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_SAMI',	 		'TXT_KEY_MC_CITY_NAME_SAMI_KÁRÁSJOHKA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_GUOVDAGEAIDNU'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_AANAAR'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_DIVTASVUODNA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_LEAVDNJA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_ROMSA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_ÁRVIESJÁVRRIE'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_UNJÁRGA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_LUVLIELUSPIE'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_SNÅASE'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_JÅHKÅMÅHKKE'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_GÁIVUOTNA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_AARBORTE'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_EANODAT'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_ARJEPLUOVVE'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_JIELLEVÁRRI'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_OHCEJOHKA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_GIRON'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_SUOSSJÁVRI'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_SUOVVAGUOIKA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_VALJOK'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_JIEPMALUOKTA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_ALTA'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_SOADEGILLI'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_ROVANIEMI'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_VUOLLERIM'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_CITY_NAME_SAMI_MUONÁ');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SAMI'), 				BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SAMI'), 				TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SAMI'), 				UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SAMI', 				'LEADER_EADNI');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_SAMI', 				'UNITCLASS_SCOUT', 			'UNIT_SAMI_BOAZOVAZZI');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SAMI', 				'BUILDINGCLASS_TEMPLE', 	'BUILDING_SAMI_SIEIDI');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		('CIVILIZATION_SAMI'), 				ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_0'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_1'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_2'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_3'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_4'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_5'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_6'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_7'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_8'),
			('CIVILIZATION_SAMI', 			'TXT_KEY_MC_SPY_NAME_SAMI_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================
INSERT INTO Civilization_Start_Region_Priority
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SAMI', 				'REGION_TUNDRA');
--==========================================================================================================================
--==========================================================================================================================			
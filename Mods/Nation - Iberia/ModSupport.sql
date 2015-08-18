--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,			 TraitOne,               TraitTwo)
VALUES      ('LEADER_TCM_INDIBILIS',	 'POLICY_CREATIVE_X',	 'POLICY_PROTECTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Indibilis [ICON_CULTURE][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_TCM_INDIBILIS' END) 
WHERE Type = 'LEADER_TCM_INDIBILIS';

CREATE TRIGGER CivIVTraitsIndibilis
AFTER INSERT ON Leaders WHEN 'LEADER_TCM_INDIBILIS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Indibilis [ICON_CULTURE][ICON_STRENGTH]'
		ELSE 'TXT_KEY_LEADER_TCM_INDIBILIS' END) 
	WHERE Type = 'LEADER_TCM_INDIBILIS';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SPAIN' )
	THEN '_SPAIN'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_TCM_THE_IBERIANS';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type, 									X, Y, AltX, AltY)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	12,		58,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type, 									X, Y, AltX, AltY)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	57,		54,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type, 									X, Y, AltX, AltY)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	33,		24,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type, 									X, Y, AltX, AltY)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	40,		39,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type, 									X, Y, AltX, AltY)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	24,		30,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroGiantStartPosition (Europe Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type, 									X, Y, AltX, AltY)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	29,		34,		null,	null);
--==========================================================================================================================
-- Civilizations_MediterraneanStartPosition (Mediterranean)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type, 									X, Y, AltX, AltY)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',		21,		42,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1,           Yield1, Req2,            Req3)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	'RESOURCE_IRON', 4,     'RESOURCE_GOLD', 'RESOURCE_SILVER');
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1,           Yield1, Req2,            Req3)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	'RESOURCE_IRON', 4,     'RESOURCE_GOLD', 'RESOURCE_SILVER');
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1,           Yield1, Req2,            Req3)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	'RESOURCE_IRON', 4,     'RESOURCE_GOLD', 'RESOURCE_SILVER');
--==========================================================================================================================
-- Civilizations_CordiformRequestedResource (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
			(Type, 								Req1,           Yield1, Req2,            Req3)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	'RESOURCE_IRON', 4,     'RESOURCE_GOLD', 'RESOURCE_SILVER');
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1,           Yield1, Req2,            Req3)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	'RESOURCE_IRON', 4,     'RESOURCE_GOLD', 'RESOURCE_SILVER');
--==========================================================================================================================
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 								Req1,           Yield1, Req2,            Req3)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	'RESOURCE_IRON', 4,     'RESOURCE_GOLD', 'RESOURCE_SILVER');
--==========================================================================================================================
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
			(Type, 								Req1,           Yield1, Req2,            Req3)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',	'RESOURCE_IRON', 4,     'RESOURCE_GOLD', 'RESOURCE_SILVER');
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,	CultureEra)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',		'MEDITERRANEAN',		'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,						CultureType,		SplashScreenTag,			SoundtrackTag)
VALUES		('CIVILIZATION_TCM_THE_IBERIANS',		'JFD_Eastern',		'JFD_Mediterranean',		'JFD_Mediterranean');
------------------------------
-- Civilizations
------------------------------
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Mediterranean' )
	THEN 'JFD_Mediterranean'
	ELSE 'Spain' END)
WHERE Type = 'CIVILIZATION_TCM_THE_IBERIANS';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 					ColonyName,								LinguisticType)
VALUES		('LEADER_TCM_INDIBILIS', 			null,									'JFD_Latinate');
------------------------------		
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_SPAIN',		'CIVILIZATION_TCM_THE_IBERIANS'),
			('CIVILIZATION_ROME',		'CIVILIZATION_TCM_THE_IBERIANS'),
			('CIVILIZATION_CARTHAGE',	'CIVILIZATION_TCM_THE_IBERIANS');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors	
			(LeaderType,				FlavorType,							Flavor)
VALUES		('LEADER_TCM_INDIBILIS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	1);
--------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_DRUIDISM' )
	THEN 'RELIGION_DRUIDISM'
	ELSE 'RELIGION_CHRISTIANITY' END
) WHERE CivilizationType = 'CIVILIZATION_TCM_THE_IBERIANS';

CREATE TRIGGER ReligionIberians
AFTER INSERT ON Religions WHEN 'RELIGION_DRUIDISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_DRUIDISM'
	WHERE CivilizationType = 'CIVILIZATION_TCM_THE_IBERIANS';
END;


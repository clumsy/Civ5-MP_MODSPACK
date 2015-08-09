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
        (LeaderType,                TraitOne,               TraitTwo)
VALUES  ('LEADER_EPAMINONDAS',      'POLICY_CHARISMATIC_X', 'POLICY_DIPLOMATIC_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
    THEN 'Epaminondas [ICON_HAPPINESS_1][ICON_INFLUENCE]'
    ELSE 'TXT_KEY_LEADER_EPAMINONDAS' END) 
WHERE Type = 'LEADER_EPAMINONDAS';
 
CREATE TRIGGER CivIVTraitsThebes
AFTER INSERT ON Leaders WHEN 'LEADER_EPAMINONDAS' = NEW.Type
BEGIN
    UPDATE Leaders 
    SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
        THEN 'Epaminondas [ICON_HAPPINESS_1][ICON_INFLUENCE]'
        ELSE 'TXT_KEY_LEADER_EPAMINONDAS' END) 
    WHERE Type = 'LEADER_EPAMINONDAS';
END;        
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_EURO' )
    THEN '_GREECE'
    ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_THEBES';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
        (Type,                  X,  Y)
VALUES  ('CIVILIZATION_THEBES', 29, 54);
------------------------------------------------------------    
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
        (Type,                  X,  Y)
VALUES  ('CIVILIZATION_THEBES', 67, 21);
------------------------------------------------------------    
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
        (Type,                  X,  Y)
VALUES  ('CIVILIZATION_THEBES', 43, 22);
------------------------------------------------------------    
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
        (Type,                  X,  Y)
VALUES  ('CIVILIZATION_THEBES', 59, 32);
------------------------------------------------------------    
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
        (Type,                  X,  Y)
VALUES  ('CIVILIZATION_THEBES', 93, 21);
------------------------------------------------------------    
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
        (Type,                  X,  Y)
VALUES  ('CIVILIZATION_THEBES', 48, 2);
------------------------------------------------------------    
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
        (Type,                  X,  Y)
VALUES  ('CIVILIZATION_THEBES', 64, 30);
------------------------------------------------------------    
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_THEBES'),    Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_GREECE');
------------------------------------------------------------    
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_THEBES'),    Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_GREECE');
------------------------------------------------------------    
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_THEBES'),    Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_GREECE');
------------------------------------------------------------    
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_THEBES'),    Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE (Type = 'CIVILIZATION_GREECE');
------------------------------------------------------------    
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_THEBES'),    Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE (Type = 'CIVILIZATION_GREECE');
------------------------------------------------------------    
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
        (Type,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_THEBES'),    Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE (Type = 'CIVILIZATION_GREECE');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------  
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,               CultureType,        CultureEra)
VALUES  ('CIVILIZATION_THEBES', 'MEDITERRANEAN',    'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    CultureType                                 text                                        default null,
    SplashScreenTag                             text                                        default null,
    SoundtrackTag                               text                                        default null);
 
INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
        (CivilizationType,      CultureType,            SplashScreenTag,        SoundtrackTag)
VALUES  ('CIVILIZATION_THEBES', 'JFD_Mediterranean',    'JFD_Mediterranean',    'JFD_MediterraneanClassical');
------------------------------  
-- Civilizations
------------------------------  
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_MediterraneanClassical' )
    THEN 'JFD_MediterraneanClassical'
    ELSE 'Greece' END) 
WHERE Type = 'CIVILIZATION_THEBES';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
 
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
        (CivilizationType,      ColonyName,                         LinguisticType)
VALUES  ('CIVILIZATION_THEBES', null,                               'JFD_Hellenic'),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_01',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_02',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_03',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_04',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_05',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_06',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_07',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_08',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_09',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_10',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_11',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_12',    null),
        ('CIVILIZATION_THEBES', 'TXT_KEY_COLONY_NAME_GREECE_13',    null);
------------------------------  
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    RevolutionaryCivilizationType               text    REFERENCES Civilizations(Type)      default null);
     
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
        (CivilizationType,                      RevolutionaryCivilizationType)
VALUES  ('CIVILIZATION_GREECE',                 'CIVILIZATION_THEBES'),
        ('CIVILIZATION_THEBES',                 'CIVILIZATION_GREECE');
--==========================================================================================================================    
-- JFD's Piety & Prestige
--==========================================================================================================================            
-- Flavors
------------------------------  
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
        (LeaderType,            FlavorType,                          Flavor)
VALUES  ('LEADER_EPAMINONDAS',  'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',  5);
--==========================================================================================================================    
-- Tomatekh's Historical Religions
--==========================================================================================================================            
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_HELLENISM' )
    THEN 'RELIGION_HELLENISM'
    ELSE 'RELIGION_ORTHODOXY' END) 
WHERE Type = 'CIVILIZATION_THEBES';
 
CREATE TRIGGER ReligionThebes
AFTER INSERT ON Religions WHEN 'RELIGION_HELLENISM' = NEW.Type
BEGIN
    UPDATE Civilizations 
    SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_HELLENISM' )
        THEN 'RELIGION_HELLENISM'
        ELSE 'RELIGION_ORTHODOXY' END) 
    WHERE Type = 'CIVILIZATION_THEBES';
END;    
--==========================================================================================================================
--==========================================================================================================================
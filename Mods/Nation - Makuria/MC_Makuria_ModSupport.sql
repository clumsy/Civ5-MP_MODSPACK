--YnAEMP
--Earth Giant
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAKURIA',    31, 41);
  
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_MAKURIA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
   
--Earth Huge
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAKURIA',    70, 42);
  
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_MAKURIA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
    
--Earth Standard
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAKURIA',    44, 17);
   
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_MAKURIA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
  
--Earth Greatest
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAKURIA',    59, 30);
  
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_MAKURIA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
  
--Europe Large
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAKURIA',     58, 3);
  
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_MAKURIA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
  
--Africa Large
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAKURIA',    42, 58);
  
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_MAKURIA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfricaLargeRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
  
--Nile Valley 
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NileValleyStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_MC_MAKURIA',    49, 10);
  
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NileValleyRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_MC_MAKURIA'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NileValleyRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
  
--Historical Religions
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_MC_MAKURIA';
  
INSERT INTO Civilization_Religions 
                (CivilizationType,  ReligionType)
SELECT      Type,           ('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_MC_MAKURIA'; 
  
UPDATE Civilization_Religions SET ReligionType = 
    ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX' )
        THEN 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX'
        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ORTHODOXY' )
        THEN 'RELIGION_ORTHODOXY'
        ELSE 'RELIGION_CHRISTIANITY' END ) END
    ) WHERE CivilizationType = 'CIVILIZATION_MC_MAKURIA';
  
CREATE TRIGGER ReligionMakuriaSupportOne
AFTER INSERT ON Religions WHEN 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX' = NEW.Type
BEGIN
    UPDATE Civilization_Religions 
    SET ReligionType = 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX'
    WHERE CivilizationType IN ('CIVILIZATION_MC_MAKURIA');
END;
  
CREATE TRIGGER ReligionMakuriaSupportTwo
AFTER INSERT ON Religions WHEN 'RELIGION_ORTHODOXY' = NEW.Type
BEGIN
    UPDATE Civilization_Religions SET ReligionType = 
        ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX' )
            THEN 'RELIGION_CHRISTIAN_ORIENTAL_ORTHODOX'
            ELSE 'RELIGION_ORTHODOXY' END
        ) WHERE CivilizationType = 'CIVILIZATION_MC_MAKURIA';
END;
  
--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
    ( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_EGYPT")
        THEN "_EGYPT"
        ELSE "_AFRI" END
    ) WHERE Type = "CIVILIZATION_MC_MAKURIA";
  
--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
            (CivType,                       CultureType,        CultureEra)
VALUES      ('CIVILIZATION_MC_MAKURIA',       'AFRICAN',             'ANY'),
            ('CIVILIZATION_MC_MAKURIA',       'ARABIAN',          'MODERN');
  
--JFD
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                        text                                        default null,
    Value                                       integer                                     default 1);
  
--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
   
INSERT INTO Leader_Flavors
            (LeaderType,                                       FlavorType,    Flavor)
VALUES      ('LEADER_MC_MERKURIOS',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         6);
  
--Prestige
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);
  
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);
  
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 
  
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);
  
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT  ('CIVILIZATION_MC_MAKURIA'), LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
  
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_MC_MAKURIA'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
  
INSERT INTO Civilization_JFD_Titles
        (CivilizationType,          DefaultTitle,   UniqueTitle)
SELECT  ('CIVILIZATION_MC_MAKURIA'), DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
  
INSERT INTO Civilization_JFD_Politics
        (CivilizationType,          PoliticsType, UniqueName)
SELECT  ('CIVILIZATION_MC_MAKURIA'), PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA';
  
--Cultural Diversity
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(Type)          default null,
    CultureType                                 text                                            default null,
    ArtDefineTag                                text                                            default null,
    SplashScreenTag                             text                                            default null,
    SoundtrackTag                               text                                            default null,
    UnitDialogueTag                             text                                            default null);
  
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,                  ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  ('CIVILIZATION_MC_MAKURIA'),    ArtDefineTag, ('JFD_Semitic'), SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_EGYPT';
  
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_MesopotamicEgyptian'
WHERE Type = 'CIVILIZATION_MC_MAKURIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_MesopotamicEgyptian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
  
--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
       
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,                                           TraitOne,                    TraitTwo)
VALUES      ('LEADER_MC_MERKURIOS',                   'POLICY_MERCANTILE_X',        'POLICY_SPIRITUAL_X');
  
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
    THEN 'Merkurios[ICON_GOLD][ICON_PEACE]'
    ELSE 'TXT_KEY_LEADER_MC_MERKURIOS_DESC' END) 
WHERE Type = 'LEADER_MC_MERKURIOS';
  
CREATE TRIGGER CivIVTraitsMakuria
AFTER INSERT ON Leaders WHEN 'LEADER_MC_MERKURIOS' = NEW.Type
BEGIN
    UPDATE Leaders 
    SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
        THEN 'Merkurios[ICON_GOLD][ICON_PEACE]'
        ELSE 'TXT_KEY_LEADER_MC_MERKURIOS_DESC' END) 
    WHERE Type = 'LEADER_MC_MERKURIOS';
END;
  
--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
  
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
            (CivilizationType,                      ColonyName,                                 LinguisticType)
VALUES      ('CIVILIZATION_MC_MAKURIA',                   null,                                  'JFD_Semitic');
  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    RevolutionaryCivilizationType               text    REFERENCES Civilizations(Type)      default null);
      
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
            (CivilizationType,                      RevolutionaryCivilizationType)
VALUES      ('CIVILIZATION_MC_MAKURIA',                   'CIVILIZATION_ETHIOPIA');
  
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
            (CivilizationType,                  RevolutionaryCivilizationType)
SELECT      ('CIVILIZATION_MC_MAKURIA'),        ('CIVILIZATION_MC_LITE_NUBIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_LITE_NUBIA');
  
--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');
  
INSERT INTO Leader_Flavors
        (LeaderType,                                     FlavorType,                 Flavor)
VALUES  ('LEADER_MC_MERKURIOS',              'FLAVOR_JFD_MERCENARY',                      5);
 ------------------------------
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Makuria_Decisions.lua');
------------------------------  
-- BuildingClasses
------------------------------  
INSERT INTO BuildingClasses     
        (Type,                              DefaultBuilding,            Description)
VALUES  ('BUILDINGCLASS_MC_MAKURIA_BAQT',   'BUILDING_MC_MAKURIA_BAQT', 'TXT_KEY_BUILDING_DECISIONS_MC_MAKURIA_BAQT_DESC');
------------------------------  
-- Buildings
------------------------------  
INSERT INTO Buildings
        (Type,                          Cost,   FaithCost,  GreatWorkCount, NumTradeRouteBonus, BuildingClass,                      Description,                                        Help,                                               NukeImmune, NeverCapture)
VALUES  ('BUILDING_MC_MAKURIA_BAQT',    -1,     -1,         -1,             1,                  'BUILDINGCLASS_MC_MAKURIA_BAQT',    'TXT_KEY_BUILDING_DECISIONS_MC_MAKURIA_BAQT_DESC',  'TXT_KEY_BUILDING_DECISIONS_MC_MAKURIA_BAQT_HELP',  1,          1);
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
        (Type,                              CombatPercent,  Description,                                            Help,                                                       Sound,              CannotBeChosen, PortraitIndex,  IconAtlas,          PediaType,          PediaEntry)
VALUES  ('PROMOTION_MC_MAKURIA_BOWMANSHIP', 15,             'TXT_KEY_PROMOTION_DECISIONS_MC_MAKURIA_BOWMANSHIP',    'TXT_KEY_PROMOTION_DECISIONS_MC_MAKURIA_BOWMANSHIP_HELP',   'AS2D_IF_LEVELUP',  1,              59,             'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_MC_MAKURIA_BOWMANSHIP');
 
INSERT INTO UnitPromotions_UnitCombats
        (PromotionType,                     UnitCombatType)
VALUES  ('PROMOTION_MC_MAKURIA_BOWMANSHIP', 'UNITCOMBAT_ARCHER');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
        (Type,                                      Description)
VALUES  ('POLICY_DECISIONS_MC_MAKURIA_BOWMANSHIP',  'TXT_KEY_DECISIONS_MC_MAKURIA_BAQT');
 
INSERT INTO Policy_FreePromotions
        (PolicyType,                                PromotionType)
VALUES  ('POLICY_DECISIONS_MC_MAKURIA_BOWMANSHIP',  'PROMOTION_MC_MAKURIA_BOWMANSHIP');
------------------------------
--Cultural Development
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
    CivilizationType        text  REFERENCES Civilizations(Type)    default null,
    CultureType             text                                    default null,
    Description             text                                    default null);
  
INSERT INTO Events_CulturalDevelopments 
            (Description,                                        CivilizationType,                      CultureType)
VALUES      ('TXT_KEY_EVENT_CULDEV_MAKURIA_01',         'CIVILIZATION_MC_MAKURIA',                             null);
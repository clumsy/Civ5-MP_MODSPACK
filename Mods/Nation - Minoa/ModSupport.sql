--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
      
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_MC_MINOS',     'POLICY_SEAFARING_X',       'POLICY_INVENTIVE_X');
 
--I have no idea what I'm doing, please help.
 
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GREECE' )
    THEN '_GREECE'
    ELSE '_MED' END)
WHERE Type = 'CIVILIZATION_MC_MINOA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
            (CivType,                       CultureType,        CultureEra)
VALUES      ('CIVILIZATION_MC_MINOA',       'MEDITERRANEAN',    'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
            (CivilizationType,          CultureType,                SplashScreenTag,            SoundtrackTag)
VALUES      ('CIVILIZATION_MC_MINOA',   'JFD_Mediterranean',        'JFD_Mediterranean',        'JFD_MediterraneanClassical');
 
UPDATE Civilizations
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_MediterraneanClassical' )
    THEN 'JFD_MediterraneanClassical'
    ELSE 'Greece' END)
WHERE Type = 'CIVILIZATION_MC_MINOA';
--==========================================================================================================================   
-- JFD's Piety & Prestige
--==========================================================================================================================           
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,            FlavorType,                             Flavor)
VALUES      ('LEADER_MC_MINOS',     'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',     3);
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Minoa_Decisions.lua');
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
/*
JFD_Germanic, JFD_Latinate, JFD_Tai_Khmer, JFD_Austronesian, JFD_Arabic, JFD_Slavic, JFD_Mesopotamian, JFD_Mesoamerican, JFD_Oriental,
JFD_Finno_Ugric, JFD_Semitic, JFD_Hellenic, JFD_Bantu, JFD_Songhay, JFD_Indo_Iranian, JFD_Altaic, JFD_Celtic, JFD_NorthAmerican, JFD_Quechumaran
*/
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
            (CivilizationType,                    ColonyName,                               LinguisticType)
VALUES      ('CIVILIZATION_MC_MINOA',             null,                                     'JFD_Hellenic'),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_01',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_02',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_03',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_04',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_05',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_06',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_07',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_08',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_09',        null),
            ('CIVILIZATION_MC_MINOA',             'TXT_KEY_COLONY_NAME_MC_MINOA_10',        null);
 
--PROMOTION_JFD_SNOW_IMMUNITY, PROMOTION_JFD_DESERT_IMMUNITY, PROMOTION_JFD_DISEASE_IMMUNITY, PROMOTION_JFD_JUNGLE_IMMUNITY, PROMOTION_JFD_SCUVRY_IMMUNITY, PROMOTION_JFD_IMMUNITY (immunity to all attrition)
INSERT INTO Unit_FreePromotions
            (UnitType,                 PromotionType)
SELECT      ('UNIT_MC_MINOAN_GALEA'),  ('PROMOTION_JFD_SCURVY_IMMUNITY')
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SCURVY_IMMUNITY');
--==========================================================================================================================
--==========================================================================================================================
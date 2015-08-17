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
VALUES      ('LEADER_MC_AL_HASSAN',	 'POLICY_CHARISMATIC_X',	'POLICY_SEAFARING_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Ali ibn al-Hassan [ICON_GREAT_EXPLORER][ICON_HAPPINESS_1]'
	ELSE 'TXT_KEY_LEADER_MC_AL_HASSAN_DESC' END) 
WHERE Type = 'LEADER_MC_AL_HASSAN';

CREATE TRIGGER CivIVTraitsALHASSANKilwa
AFTER INSERT ON Leaders WHEN 'LEADER_MC_AL_HASSAN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Ali ibn al-Hassan [ICON_GREAT_EXPLORER][ICON_HAPPINESS_1]'
		ELSE 'TXT_KEY_LEADER_MC_AL_HASSAN_DESC' END) 
	WHERE Type = 'LEADER_MC_AL_HASSAN';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ARABIA' )
	THEN '_ARABIA'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_MC_KILWA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_MC_MC_KILWA',	'ARABIAN',		'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,			CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_MC_KILWA',	'JFD_Islamic',		'JFD_Islamic',		'JFD_Islamic');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Arabic' )
	THEN 'JFD_Arabic'
	ELSE 'Arabia' END) 
WHERE Type = 'CIVILIZATION_MC_KILWA';
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');

INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_MC_AL_HASSAN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4);
--==========================================================================================================================
--==========================================================================================================================
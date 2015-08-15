--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_SONGHAI")
		THEN "_SONGHAI"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_MALI_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_MALI_MOD',	      'AFRICAN',		 'ANY');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									     FlavorType,    Flavor)
VALUES      ('LEADER_MANSA_MUSA_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         2);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_MALI_MOD',	      'JFD_WestAfrican',    'JFD_WestAfrican',   'JFD_WestAfrican');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									  TraitOne,					  TraitTwo)
VALUES      ('LEADER_MANSA_MUSA_MOD',	          'POLICY_FINANCIAL_X',		'POLICY_SPIRITUAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Mansa Musa[ICON_TRADE][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_MANSA_MUSA_MOD_DESC' END) 
WHERE Type = 'LEADER_MANSA_MUSA_MOD';

CREATE TRIGGER CivIVTraitsTomatekhMali
AFTER INSERT ON Leaders WHEN 'LEADER_MANSA_MUSA_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Mansa Musa[ICON_TRADE][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_MANSA_MUSA_MOD_DESC' END) 
	WHERE Type = 'LEADER_MANSA_MUSA_MOD';
END;	

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_MALI_MOD', 			    null,								     'JFD_Songhay');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_MALI_MOD',	    'CIVILIZATION_SONGHAI');
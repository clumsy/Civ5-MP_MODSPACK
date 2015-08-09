--Decisions
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TomatekhXiaDecisions.lua');

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_CHINA")
		THEN "_CHINA"
		ELSE "_ASIA" END
	) WHERE Type = "CIVILIZATION_ERLITOU_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,									  CultureType,	CultureEra)
VALUES		('CIVILIZATION_ERLITOU_MOD',		         'EAST_ASIAN',		 'ANY');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									      FlavorType,    Flavor)
VALUES      ('LEADER_XIA_YU_MOD',         'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         4);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                             CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_ERLITOU_MOD',                'JFD_Oriental',	      'JFD_Oriental',      'JFD_Oriental');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				TraitOne,					TraitTwo)
VALUES      ('LEADER_XIA_YU_MOD',	    'POLICY_IMPERIALISTIC_X',	'POLICY_INDUSTRIOUS_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Yu[ICON_CITY_STATE][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_XIA_YU_MOD_DESC' END) 
WHERE Type = 'LEADER_XIA_YU_MOD';

CREATE TRIGGER CivIVTraitsXia
AFTER INSERT ON Leaders WHEN 'LEADER_XIA_YU_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Yu[ICON_CITY_STATE][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_XIA_YU_MOD_DESC' END) 
	WHERE Type = 'LEADER_XIA_YU_MOD';
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
VALUES		('CIVILIZATION_ERLITOU_MOD', 			null,									'JFD_Oriental');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_ERLITOU_MOD',			'CIVILIZATION_CHINA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_ERLITOU_MOD'),		('CIVILIZATION_QIN_LS_MOD')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_QIN_LS_MOD');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_ERLITOU_MOD'),		('CIVILIZATION_JFD_HAN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_HAN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_ERLITOU_MOD'),		('CIVILIZATION_TCM_SONG')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_TCM_SONG');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_ERLITOU_MOD'),		('CIVILIZATION_LITE_YUAN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_LITE_YUAN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_ERLITOU_MOD'),		('CIVILIZATION_JFD_MING')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_MING');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_ERLITOU_MOD'),		('CIVILIZATION_JFD_QING')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_QING');
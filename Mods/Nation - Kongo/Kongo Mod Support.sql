--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_ETHIOPIA")
		THEN "_ETHIOPIA"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_KONGO_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_KONGO_MOD',	      'AFRICAN',		 'ANY');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									 FlavorType,    Flavor)
VALUES      ('LEADER_NZINGA_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         4);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_KONGO_MOD',	            'JFD_Bantu',          'JFD_Bantu',         'JFD_Bantu');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									  TraitOne,					  TraitTwo)
VALUES      ('LEADER_NZINGA_MOD',	          'POLICY_MERCANTILE_X',		'POLICY_DIPLOMATIC_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Nzinga[ICON_GOLD][ICON_INFLUENCE]'
	ELSE 'TXT_KEY_KONGO_NZINGA_MOD_DESC' END) 
WHERE Type = 'LEADER_NZINGA_MOD';

CREATE TRIGGER CivIVTraitsTomatekhKongo
AFTER INSERT ON Leaders WHEN 'LEADER_NZINGA_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Nzinga[ICON_GOLD][ICON_INFLUENCE]'
		ELSE 'TXT_KEY_KONGO_NZINGA_MOD_DESC' END) 
	WHERE Type = 'LEADER_NZINGA_MOD';
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
VALUES		('CIVILIZATION_KONGO_MOD', 			null,										'JFD_Bantu');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_KONGO_MOD',		'CIVILIZATION_ZULU');

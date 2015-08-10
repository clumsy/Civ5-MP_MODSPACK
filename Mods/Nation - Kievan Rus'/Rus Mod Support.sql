--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_RUSSIA")
		THEN "_RUSSIA"
		ELSE "_EURO" END
	) WHERE Type = "CIVILIZATION_KIEVAN_RUS_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						   CultureType,		CultureEra)
VALUES		('CIVILIZATION_KIEVAN_RUS_MOD',	      'SLAVIC',			'ANY');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,												  FlavorType,    Flavor)
VALUES      ('LEADER_KIEVAN_RUS_YAROSLAV_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         6);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                       CultureType,     SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_KIEVAN_RUS_MOD',        'JFD_Eastern',	    'JFD_Eastern',	     'JFD_Eastern');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									  TraitOne,					  TraitTwo)
VALUES      ('LEADER_KIEVAN_RUS_YAROSLAV_MOD',	          'POLICY_MERCANTILE_X',		'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Yaroslav[ICON_GOLD][ICON_GREAT_PEOPLE]'
	ELSE 'TXT_KEY_LEADER_YAROSLAV_MOD_DESC' END) 
WHERE Type = 'LEADER_KIEVAN_RUS_YAROSLAV_MOD';

CREATE TRIGGER CivIVTraitsTomatekhKievanRus
AFTER INSERT ON Leaders WHEN 'LEADER_KIEVAN_RUS_YAROSLAV_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Yaroslav[ICON_GOLD][ICON_GREAT_PEOPLE]'
		ELSE 'TXT_KEY_LEADER_YAROSLAV_MOD_DESC' END) 
	WHERE Type = 'LEADER_KIEVAN_RUS_YAROSLAV_MOD';
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
VALUES		('CIVILIZATION_KIEVAN_RUS_MOD', 			null,								'JFD_Slavic');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_KIEVAN_RUS_MOD',			'CIVILIZATION_RUSSIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_KIEVAN_RUS_MOD'),	('CIVILIZATION_JFD_MUSCOVY')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_MUSCOVY');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_KIEVAN_RUS_MOD'),	('CIVILIZATION_JFD_NOVGOROD')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NOVGOROD');
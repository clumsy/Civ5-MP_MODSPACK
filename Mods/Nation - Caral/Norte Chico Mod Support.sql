--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INCA")
		THEN "_INCA"
		ELSE "_AMER" END
	) WHERE Type = "CIVILIZATION_NORTE_CHICO_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,									  CultureType,	CultureEra)
VALUES		('CIVILIZATION_NORTE_CHICO_MOD',		'FIRST_AMERICANS',		 'ANY'),
			('CIVILIZATION_NORTE_CHICO_MOD',  'MOD_TP_SOUTH_AMERICAN',	  'MODERN');

--Nazca
UPDATE Features SET Description =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD"
		ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

UPDATE Features SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD_TEXT"
		ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_TEXT" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

CREATE TRIGGER CaralNazcaAquifer
AFTER INSERT ON Civilizations WHEN 'CIVILIZATION_NAZCA' = NEW.Type
BEGIN

	UPDATE Features SET Description =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD"
			ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

	UPDATE Features SET Civilopedia =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_MOD_TEXT"
			ELSE "TXT_KEY_FEATURE_CARAL_MOD_FOSSIL_WATER_TEXT" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

END;

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									      FlavorType,    Flavor)
VALUES      ('LEADER_NORTE_CHICO_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         6);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_NORTE_CHICO_MOD',	   'JFD_Andean',	     'JFD_Andean',        'JFD_Andean');

--Decisions
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TomatekhNorteChicoDecisions.lua');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				TraitOne,					TraitTwo)
VALUES      ('LEADER_NORTE_CHICO_MOD',	'POLICY_SEAFARING_X',		'POLICY_INDUSTRIOUS_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Qhapaq[ICON_GREAT_EXPLORER][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_NORTE_CHICO_MOD_DESC' END) 
WHERE Type = 'LEADER_NORTE_CHICO_MOD';

CREATE TRIGGER CivIVTraitsCaral
AFTER INSERT ON Leaders WHEN 'LEADER_NORTE_CHICO_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Qhapaq[ICON_GREAT_EXPLORER][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_NORTE_CHICO_MOD_DESC' END) 
	WHERE Type = 'LEADER_NORTE_CHICO_MOD';
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
VALUES		('CIVILIZATION_NORTE_CHICO_MOD', 			null,								'JFD_Quechumaran');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,							RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_NORTE_CHICO_MOD',			'CIVILIZATION_INCA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_NORTE_CHICO_MOD'),		('CIVILIZATION_QULLANA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_QULLANA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_NORTE_CHICO_MOD'),		('CIVILIZATION_NAZCA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_NAZCA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_NORTE_CHICO_MOD'),		('CIVILIZATION_MC_NAZCA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_NAZCA');
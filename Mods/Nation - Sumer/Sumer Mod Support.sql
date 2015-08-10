--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_BABYLON")
		THEN "_BABYLON"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_AKKADIAN_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						    CultureType,	CultureEra)
VALUES		('CIVILIZATION_AKKADIAN_MOD',	      'ARABIAN',		 'ANY');

--Piety & Prestige
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									             FlavorType,    Flavor)
VALUES      ('LEADER_AKKADIAN_MOD_GILGAMESH',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         6);

UPDATE Buildings SET PrereqTech = 
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_ASSYRIA' )
		THEN 'TECH_CALENDAR'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Technologies WHERE Type = 'TECH_JFD_PRIESTHOOD' )
		THEN 'TECH_JFD_PRIESTHOOD'
		ELSE 'TECH_PHILOSOPHY' END ) END
	) WHERE Type = 'BUILDING_AKKADIAN_MOD_ZIGGURAT';

CREATE TRIGGER SumerPriesthoodZigs
AFTER INSERT ON Technologies WHEN 'TECH_JFD_PRIESTHOOD' = NEW.Type
BEGIN
	UPDATE Buildings SET PrereqTech = 
		( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_ASSYRIA' )
			THEN 'TECH_CALENDAR'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Technologies WHERE Type = 'TECH_JFD_PRIESTHOOD' )
			THEN 'TECH_JFD_PRIESTHOOD'
			ELSE 'TECH_PHILOSOPHY' END ) END
		) WHERE Type = 'BUILDING_AKKADIAN_MOD_ZIGGURAT';
END;

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                       CultureType,     SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_AKKADIAN_MOD',      'JFD_Mesopotamic',	'JFD_Mesopotamic',	 'JFD_Mesopotamic');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Mesopotamic' )
	THEN 'JFD_Mesopotamic'
	ELSE 'Babylon' END) 
WHERE Type = 'CIVILIZATION_AKKADIAN_MOD';

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									      TraitOne,					TraitTwo)
VALUES      ('LEADER_AKKADIAN_MOD_GILGAMESH',	  'POLICY_INVENTIVE_X',	   'POLICY_EXPANSIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Eannatum[ICON_RESEARCH][ICON_FOOD]'
	ELSE 'TXT_KEY_AKKADIAN_MOD_GILGAMESH_DESC' END) 
WHERE Type = 'LEADER_AKKADIAN_MOD_GILGAMESH';

CREATE TRIGGER CivIVTraitsTomatekhSumer
AFTER INSERT ON Leaders WHEN 'LEADER_AKKADIAN_MOD_GILGAMESH' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Eannatum[ICON_RESEARCH][ICON_FOOD]'
		ELSE 'TXT_KEY_AKKADIAN_MOD_GILGAMESH_DESC' END) 
	WHERE Type = 'LEADER_AKKADIAN_MOD_GILGAMESH';
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
VALUES		('CIVILIZATION_AKKADIAN_MOD', 			null,									'JFD_Mesopotamian');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_AKKADIAN_MOD',		'CIVILIZATION_BABYLON'),
			('CIVILIZATION_AKKADIAN_MOD',		'CIVILIZATION_ASSYRIA');
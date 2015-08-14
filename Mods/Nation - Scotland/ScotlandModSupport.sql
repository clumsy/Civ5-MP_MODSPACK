--=================================================
--Ethnic Units and RED
--=================================================
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_CELTS")
		THEN "_CELTS"
		ELSE "_EURO" END
	) WHERE Type = "CIVILIZATION_MC_SCOTLAND";

--=================================================
--Map Labels
--=================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_MC_SCOTLAND',	'EUROPEAN',		'ANY');

--=================================================
--Piety
--=================================================
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,				  FlavorType,								  Flavor)
VALUES      ('LEADER_MC_ROBERT_BRUS',	  'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         7);

--=================================================
--Cultural Diversity
--=================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_MC_SCOTLAND',	      'JFD_Northern',    'JFD_Northern',		 'JFD_Northern');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Northern' )
	THEN 'JFD_Northern'
	ELSE 'England' END) 
WHERE Type = 'CIVILIZATION_MC_SCOTLAND';

--=================================================
--Civ IV Traits
--=================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,								   TraitOne,					TraitTwo)
VALUES      ('LEADER_MC_ROBERT_BRUS',	          'POLICY_CHARISMATIC_X',		'POLICY_PROTECTIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Robert I Brus[ICON_HAPPINESS_1][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_MC_ROBERT_BRUS_DESC' END) 
WHERE Type = 'LEADER_MC_ROBERT_BRUS';

CREATE TRIGGER CivIVTraitsMCScotland
AFTER INSERT ON Leaders WHEN 'LEADER_MC_ROBERT_BRUS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Robert I Brus[ICON_HAPPINESS_1][ICON_STRENGTH]'
		ELSE 'TXT_KEY_LEADER_MC_ROBERT_BRUS_DESC' END) 
	WHERE Type = 'LEADER_MC_ROBERT_BRUS';
END;

--=================================================
-- Events & Decisions
--=================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Scotland_Decisions.lua');


--=================================================
--ExCE
--=================================================
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_MC_SCOTLAND', 			null,									'JFD_Celtic'),
			('CIVILIZATION_MC_SCOTLAND', 			'TXT_KEY_COLONY_NAME_MC_SCOTLAND_01',	null),
			('CIVILIZATION_MC_SCOTLAND', 			'TXT_KEY_COLONY_NAME_MC_SCOTLAND_02',	null),
			('CIVILIZATION_MC_SCOTLAND', 			'TXT_KEY_COLONY_NAME_MC_SCOTLAND_03',	null),
			('CIVILIZATION_MC_SCOTLAND', 			'TXT_KEY_COLONY_NAME_MC_SCOTLAND_04',	null),
			('CIVILIZATION_MC_SCOTLAND', 			'TXT_KEY_COLONY_NAME_MC_SCOTLAND_05',	null),
			('CIVILIZATION_MC_SCOTLAND', 			'TXT_KEY_COLONY_NAME_MC_SCOTLAND_06',	null);

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_MC_SCOTLAND',		'CIVILIZATION_ENGLAND');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					     RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_MC_SCOTLAND'),				 ('CIVILIZATION_JFD_SCOTLAND')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_SCOTLAND');

--=================================================
-- YnAEMP
--=================================================
------------------------------------------------------------
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			9,		77);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_YagemStartPosition
SET	X = 12, Y = 71
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			55,		66);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_YahemStartPosition
SET	X = 56, Y = 63
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			33,		36);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_CordiformStartPosition
SET	X = 34, Y = 33
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			38,		58);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_GreatestEarthStartPosition
SET	X = 40, Y = 54
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			39,		88);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_EuroGiantStartPosition
SET	X = 43, Y = 75
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			22,		56);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_EuroLargeStartPosition
SET	X = 21, Y = 47
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			79,		36);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_NorthAtlanticStartPosition
SET	X = 83, Y = 32
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			44,		39);
------------------------------------------------------------	
-- Civilizations_BritishIslesStartPosition (British Isles)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_BritishIslesStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			32,		51);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_BritishIslesStartPosition
SET	X = 49, Y = 26
WHERE Type = 'CIVILIZATION_CELTS';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_SCOTLAND',			14,		31);
--------------------------------	
-- The Celts
--------------------------------	
UPDATE Civilizations_NorthWestEuropeStartPosition
SET	X = 19, Y = 20
WHERE Type = 'CIVILIZATION_CELTS';
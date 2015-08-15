--=================================================
--Ethnic Units and RED
--=================================================
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INCA")
		THEN "_INCA"
		ELSE "_AMER" END
	) WHERE Type = "CIVILIZATION_MC_NAZCA";

--=================================================
--Map Labels
--=================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_MC_NAZCA',	'AMERICAN',		'ANY');

--=================================================
--Piety
--=================================================
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,				  FlavorType,								  Flavor)
VALUES      ('LEADER_MC_ROBERT_BRUS',	  'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         8);

--=================================================
--Cultural Diversity
--=================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_MC_NAZCA',				'JFD_Andean',	  'JFD_Andean',			 'JFD_Andean');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Andean' )
	THEN 'JFD_Andean'
	ELSE 'Inca' END) 
WHERE Type = 'CIVILIZATION_MC_NAZCA';

--=================================================
--Civ IV Traits
--=================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,					TraitOne,					TraitTwo)
VALUES      ('LEADER_MC_CAHUACHI',	        'POLICY_INVENTIVE_X',		'POLICY_SPIRITUAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Cahuachi[ICON_RESEARCH][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_MC_CAHUACHI_DESC' END) 
WHERE Type = 'LEADER_MC_CAHUACHI';

CREATE TRIGGER CivIVTraitsMCNazca
AFTER INSERT ON Leaders WHEN 'LEADER_MC_CAHUACHI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Cahuachi[ICON_RESEARCH][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_MC_CAHUACHI_DESC' END) 
	WHERE Type = 'LEADER_MC_CAHUACHI';
END;

--=================================================
-- Events & Decisions
--=================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Nazca_Decisions.lua');


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
VALUES		('CIVILIZATION_MC_NAZCA', 			null,									'JFD_Quechumaran');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_MC_NAZCA',		'CIVILIZATION_INCA');


--=================================================
-- YnAEMP
--=================================================
------------------------------------------------------------
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_NAZCA',				154,	22);

------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_NAZCA',				32,		23);

------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_NAZCA',				12,		13);

------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_NAZCA',				24,		13);

------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_MC_NAZCA',				49,		22);

--Gods and Kings
UPDATE Units SET UnitArtInfo =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_CARTHAGE" )
		THEN "ART_DEF_UNIT_GOTHS_SWORDSMAN_MOD"
		ELSE "ART_DEF_UNIT_GOTHS_SWORDSMAN_MOD_ALT" END
    ) WHERE Type = "UNIT_VISIGOTHS_MOD_GADRAUHT";

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_DENMARK")
		THEN "_DENMARK"
		ELSE "_EURO" END
	) WHERE Type = "CIVILIZATION_VISIGOTHS_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						     CultureType,	CultureEra)
VALUES		('CIVILIZATION_VISIGOTHS_MOD',	      'GERMANIC',		 'ANY');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									           FlavorType,    Flavor)
VALUES      ('LEADER_VISIGOTHS_MOD_ALARIC',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         4);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_VISIGOTHS_MOD',	     'JFD_Northern',	   'JFD_Northern',      'JFD_Northern');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									      TraitOne,					 TraitTwo)
VALUES      ('LEADER_VISIGOTHS_MOD_ALARIC',			 'POLICY_AGGRESSIVE_X',	   'POLICY_CHARISMATIC_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Alaric[ICON_WAR][ICON_HAPPINESS_1]'
	ELSE 'TXT_KEY_VISIGOTHS_MOD_ALARIC_DESC' END) 
WHERE Type = 'LEADER_VISIGOTHS_MOD_ALARIC';

CREATE TRIGGER CivIVTraitsTomatekhGoths
AFTER INSERT ON Leaders WHEN 'LEADER_VISIGOTHS_MOD_ALARIC' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Alaric[ICON_WAR][ICON_HAPPINESS_1]'
		ELSE 'TXT_KEY_VISIGOTHS_MOD_ALARIC_DESC' END) 
	WHERE Type = 'LEADER_VISIGOTHS_MOD_ALARIC';
END;

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 							ColonyName,							LinguisticType)
VALUES		('CIVILIZATION_VISIGOTHS_MOD', 				null,								'JFD_Germanic');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_VISIGOTHS_MOD',		'CIVILIZATION_GERMANY');
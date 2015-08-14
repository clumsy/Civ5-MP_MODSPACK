--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_SHOSHONE")
		THEN "_SHOSHONE"
		ELSE "_AMER" END
	) WHERE Type = "CIVILIZATION_SIOUX_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							  CultureType,	CultureEra)
VALUES		('CIVILIZATION_SIOUX_MOD',		'FIRST_AMERICANS',		 'ANY'),
			('CIVILIZATION_SIOUX_MOD',		     'US_WESTERN',	  'MODERN');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,												 FlavorType,    Flavor)
VALUES      ('LEADER_SIOUX_SITTING_BULL_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         0);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,         SplashScreenTag,          SoundtrackTag)
VALUES      ('CIVILIZATION_SIOUX_MOD',	   'JFD_TribalAmerican',	'JFD_TribalAmerican',   'JFD_TribalAmerican');

--Bison
UPDATE Resources SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_SIOUX_MOD" )
		THEN "TXT_KEY_RESOURCE_SIOUX_BISON_MOD_TEXT"
		ELSE "TXT_KEY_RESOURCE_SIOUX_BISON_MOD_TEXT" END
    ) WHERE Type = "RESOURCE_BISON";

UPDATE Resources SET Help =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_SIOUX_MOD" )
		THEN "TXT_KEY_RESOURCE_STANDARD_BISON_MOD_HELP"
		ELSE "TXT_KEY_RESOURCE_STANDARD_BISON_MOD_HELP" END
    ) WHERE Type = "RESOURCE_BISON";

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									  TraitOne,					TraitTwo)
VALUES      ('LEADER_SIOUX_SITTING_BULL_MOD',	'POLICY_CHARISMATIC_X',		'POLICY_EXPANSIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Sitting Bull[ICON_HAPPINESS_1][ICON_FOOD]'
	ELSE 'TXT_KEY_SIOUX_SITTING_BULL_MOD_DESC' END) 
WHERE Type = 'LEADER_SIOUX_SITTING_BULL_MOD';

CREATE TRIGGER CivIVTraitsSioux
AFTER INSERT ON Leaders WHEN 'LEADER_SIOUX_SITTING_BULL_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Sitting Bull[ICON_HAPPINESS_1][ICON_FOOD]'
		ELSE 'TXT_KEY_SIOUX_SITTING_BULL_MOD_DESC' END) 
	WHERE Type = 'LEADER_SIOUX_SITTING_BULL_MOD';
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
VALUES		('CIVILIZATION_SIOUX_MOD', 			null,									'JFD_NorthAmerican');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_SIOUX_MOD',			'CIVILIZATION_AMERICA');
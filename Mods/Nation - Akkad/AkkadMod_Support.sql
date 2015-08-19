--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_BABYLON")
		THEN "_BABYLON"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_LITE_AKKAD";

--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SISKURMES' )
		THEN 'RELIGION_SISKURMES'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHALDEANISM' )
		THEN 'RELIGION_CHALDEANISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ISLAM_SHIA' )
		THEN 'RELIGION_ISLAM_SHIA'
		ELSE 'RELIGION_ISLAM' END ) END ) END
	) WHERE CivilizationType = 'CIVILIZATION_LITE_AKKAD';

CREATE TRIGGER ReligionAkkadSupportSiskur
AFTER INSERT ON Religions WHEN 'RELIGION_SISKURMES' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_SISKURMES'
	WHERE CivilizationType IN ('CIVILIZATION_LITE_AKKAD');
END;

CREATE TRIGGER ReligionAkkadSupportChaldaenism
AFTER INSERT ON Religions WHEN 'RELIGION_CHALDEANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SISKURMES' )
			THEN 'RELIGION_SISKURMES'
			ELSE 'RELIGION_CHALDEANISM' END 
		) WHERE CivilizationType = 'CIVILIZATION_LITE_AKKAD';
END;

CREATE TRIGGER ReligionAkkadSupportShia
AFTER INSERT ON Religions WHEN 'RELIGION_ISLAM_SHIA' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SISKURMES' )
			THEN 'RELIGION_SISKURMES'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHALDEANISM' )
			THEN 'RELIGION_CHALDEANISM'
			ELSE 'RELIGION_ISLAM_SHIA' END ) END
		) WHERE CivilizationType = 'CIVILIZATION_LITE_AKKAD';
END;

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						    CultureType,	CultureEra)
VALUES		('CIVILIZATION_LITE_AKKAD',	      'ARABIAN',		 'ANY');

--Piety & Prestige
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									             FlavorType,    Flavor)
VALUES      ('LEADER_LITE_SARGON',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         2);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                       CultureType,     SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_LITE_AKKAD',      'JFD_Mesopotamic',	'JFD_Mesopotamic',	 'JFD_Mesopotamic');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
    
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									      TraitOne,					TraitTwo)
VALUES      ('LEADER_LITE_SARGON',	  'POLICY_AGGRESSIVE_X',	   'POLICY_IMPERIALISTIC_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Sargon[ICON_WAR][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_SARGON_DESC' END) 
WHERE Type = 'LEADER_LITE_SARGON';

CREATE TRIGGER CivIVTraitsLITEAkkad
AFTER INSERT ON Leaders WHEN 'LEADER_LITE_SARGON' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Sargon[ICON_WAR][ICON_CITY_STATE]'
		ELSE 'TXT_KEY_LEADER_SARGON_DESC' END) 
	WHERE Type = 'LEADER_LITE_SARGON';
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
VALUES		('CIVILIZATION_LITE_AKKAD', 			null,									'JFD_Mesopotamian');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_LITE_AKKAD',		'CIVILIZATION_BABYLON'),
			('CIVILIZATION_LITE_AKKAD',		'CIVILIZATION_ASSYRIA');
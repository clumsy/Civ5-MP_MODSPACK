----------------------------------------------------------------------------------------------------------------
--
----------------------------------------------------------------------------------------------------------------

--YnAEMP
--Earth Giant
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',    30, 49);
 
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
  
--Earth Huge
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',    69, 47);
 
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
   
--Earth Standard
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',    43, 19);
  
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
 
--Earth Greatest
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',    57, 36);
 
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
 
--Europe Large
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',     56, 15);
 
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
 
--Africa Large
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',    39, 67);
 
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfricaLargeRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
 
--Nile Valley 
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NileValleyStartPosition
        (Type,                          X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',    15, 71);
 
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NileValleyRequestedResource
        (Type,                          Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NileValleyRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
 
--Mediterranean
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
        (Type,                              X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',  80, 12);
 
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
        (Type,                              Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
 
--Mesopotamia   
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
        (Type,                              X,  Y)
VALUES  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',  24, 11);
 
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaRequestedResource
        (Type,                              Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MesopotamiaRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';

----------------------------------------------------------------------------------------------------------------
--
----------------------------------------------------------------------------------------------------------------

--JFD
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                        text                                        default null,
    Value                                       integer                                     default 1);
 
--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
  
INSERT INTO Leader_Flavors
            (LeaderType,                                                  FlavorType,    Flavor)
VALUES      ('LEADER_LITE_TARCISIO_CLEOPATRA',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         3);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'),	ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_EGYPT';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_MesopotamicEgyptian'
WHERE Type = 'CIVILIZATION_LITE_TARCISIO_PTOLEMIES'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mediterranean')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_EGYPT")
		THEN "_EGYPT"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_LITE_TARCISIO_PTOLEMIES";

--Historical Religions
DELETE FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_LITE_TARCISIO_PTOLEMIES';

INSERT INTO Civilization_Religions 
		        (CivilizationType,	ReligionType)
SELECT		Type,			('RELIGION_ISLAM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LITE_TARCISIO_PTOLEMIES'; 

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PESEDJET' )
		THEN 'RELIGION_PESEDJET'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_HELLENISM' )
		THEN 'RELIGION_HELLENISM'
		ELSE 'RELIGION_ISLAM' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_LITE_TARCISIO_PTOLEMIES';

CREATE TRIGGER ReligionCleoSupportOne
AFTER INSERT ON Religions WHEN 'RELIGION_PESEDJET' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_PESEDJET'
	WHERE CivilizationType IN ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES');
END;

CREATE TRIGGER ReligionCleoSupportTwo
AFTER INSERT ON Religions WHEN 'RELIGION_HELLENISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PESEDJET' )
			THEN 'RELIGION_PESEDJET'
			ELSE 'RELIGION_HELLENISM' END 
		) WHERE CivilizationType = 'CIVILIZATION_LITE_TARCISIO_PTOLEMIES';
END;

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									                    TraitOne,					 TraitTwo)
VALUES      ('LEADER_LITE_TARCISIO_CLEOPATRA',	                  'POLICY_CHARISMATIC_X',		'POLICY_DIPLOMATIC_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Cleopatra[ICON_HAPPINESS_1][ICON_INFLUENCE]'
	ELSE 'TXT_KEY_LEADER_LITE_TARCISIO_CLEOPATRA_DESC' END) 
WHERE Type = 'LEADER_LITE_TARCISIO_CLEOPATRA';

CREATE TRIGGER CivIVTraitsCleopatra
AFTER INSERT ON Leaders WHEN 'LEADER_LITE_TARCISIO_CLEOPATRA' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Cleopatra[ICON_HAPPINESS_1][ICON_INFLUENCE]'
		ELSE 'TXT_KEY_LEADER_LITE_TARCISIO_CLEOPATRA_DESC' END) 
	WHERE Type = 'LEADER_LITE_TARCISIO_CLEOPATRA';
END;

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						            ColonyName,								    LinguisticType)
VALUES		('CIVILIZATION_LITE_TARCISIO_PTOLEMIES', 		          null,							    'JFD_Mesopotamian'),
			('CIVILIZATION_LITE_TARCISIO_PTOLEMIES', 		          null,									'JFD_Hellenic');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						             RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',		              'CIVILIZATION_EGYPT');

----------------------------------------------------------------------------------------------------------------
--
----------------------------------------------------------------------------------------------------------------

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						                CultureType,	    CultureEra)
VALUES		('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',		  'AFRICAN',	         'ANY'),
			('CIVILIZATION_LITE_TARCISIO_PTOLEMIES',		  'ARABIAN',		  'MODERN');

--Sovereignty
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);

CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);

INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT INTO Civilization_JFD_Titles
        (CivilizationType,          DefaultTitle,   UniqueTitle)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT INTO Civilization_JFD_Politics
        (CivilizationType,          PoliticsType, UniqueName)
SELECT  ('CIVILIZATION_LITE_TARCISIO_PTOLEMIES'), PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_EGYPT';

INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');

INSERT INTO Leader_Flavors
        (LeaderType,							                         FlavorType,                         Flavor)
VALUES  ('LEADER_LITE_TARCISIO_CLEOPATRA',			 'FLAVOR_JFD_REFORM_GOVERNMENT',                              7),
        ('LEADER_LITE_TARCISIO_CLEOPATRA',			    'FLAVOR_JFD_REFORM_CULTURE',                              4),
        ('LEADER_LITE_TARCISIO_CLEOPATRA',             'FLAVOR_JFD_REFORM_ECONOMIC',                              5),
        ('LEADER_LITE_TARCISIO_CLEOPATRA',              'FLAVOR_JFD_REFORM_FOREIGN',                              7),
        ('LEADER_LITE_TARCISIO_CLEOPATRA',             'FLAVOR_JFD_REFORM_INDUSTRY',                              4),
        ('LEADER_LITE_TARCISIO_CLEOPATRA',             'FLAVOR_JFD_REFORM_RELIGION',                              4);

--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,									            FlavorType,                 Flavor)
VALUES  ('LEADER_LITE_TARCISIO_CLEOPATRA',              'FLAVOR_JFD_MERCENARY',                      5);

--Cultural Development
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								                          CivilizationType,						CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_PTOLEMIES_01',			'CIVILIZATION_LITE_TARCISIO_PTOLEMIES',					           null);

----------------------------------------------------------------------------------------------------------------
--
----------------------------------------------------------------------------------------------------------------

--Support Text
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_EVENT_CULDEV_PTOLEMIES_01',
		''
	),
	(
		'TXT_KEY_PMMM_LEADER_MG_NAME_LITE_TARCISIO_CLEOPATRA',
		'Selene'
	),
	(
		'TXT_KEY_GENERIC_LITE_TARCISIO_PTOLEMIES_INFLUENTIAL_ON_AI_1',
		'Our people are now worshipping Cats and using Kohl. I worry the rest of world will also succumb to the influence of your culture.'
	);
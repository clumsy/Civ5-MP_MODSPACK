--Decisions
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TomatekhHarappaDecisions.lua');

--Events
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('TomatekhHarappaEvents.lua');

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INDIA")
		THEN "_INDIA"
		ELSE "_ASIA" END
	) WHERE Type = "CIVILIZATION_HARAPPA_MOD";

--Nazca
UPDATE Features SET Description =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER_MOD"
		ELSE "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

UPDATE Features SET Civilopedia =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
		THEN "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER_MOD_TEXT"
		ELSE "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER_TEXT" END
    ) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

CREATE TRIGGER HarappaNazcaAquifer
AFTER INSERT ON Civilizations WHEN 'CIVILIZATION_NAZCA' = NEW.Type
BEGIN

	UPDATE Features SET Description =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER_MOD"
			ELSE "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

	UPDATE Features SET Civilopedia =
		( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_NAZCA" )
			THEN "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER_MOD_TEXT"
			ELSE "TXT_KEY_FEATURE_HARAPPA_MOD_FOSSIL_WATER_TEXT" END
		) WHERE Type = "FEATURE_ANCIENT_LIBYAN_MOD_FOSSIL_WATER";

END;

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						   CultureType,		CultureEra)
VALUES		('CIVILIZATION_HARAPPA_MOD',	      'INDIAN',			 'ANY');

--Piety & Prestige
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									  FlavorType,    Flavor)
VALUES      ('LEADER_HARAPPA_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         0);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                  CultureType,    SplashScreenTag,   SoundtrackTag)
VALUES      ('CIVILIZATION_HARAPPA_MOD',      'JFD_Bharata',      'JFD_Bharata',   'JFD_Bharata');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Bharata' )
	THEN 'JFD_Bharata'
	ELSE 'India' END) 
WHERE Type = 'CIVILIZATION_HARAPPA_MOD';

--Indus Export & More Luxuries: JFD
INSERT INTO Improvement_ResourceTypes
            (ImprovementType,                 ResourceType)
SELECT        ('IMPROVEMENT_INDUS_EXPORT'),    Type
FROM Resources WHERE ResourceClassType = "RESOURCECLASS_LUXURY";        
         
CREATE TRIGGER IndusResources
AFTER INSERT ON Resources
WHEN EXISTS (SELECT Type FROM Resources WHERE Type='RESOURCE_'||NEW.Type AND ResourceClassType = "RESOURCECLASS_LUXURY")
BEGIN
    INSERT INTO Improvement_ResourceTypes
                (ImprovementType,                 ResourceType)
    VALUES        ('IMPROVEMENT_INDUS_EXPORT',     'RESOURCE_'||NEW.Type);
END;

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,								   TraitOne,					TraitTwo)
VALUES      ('LEADER_HARAPPA_MOD',	          'POLICY_MERCANTILE_X',		'POLICY_EXPANSIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Went-Antu[ICON_GOLD][ICON_FOOD]'
	ELSE 'TXT_KEY_HARAPPA_MOD_ANTU_DESC' END) 
WHERE Type = 'LEADER_HARAPPA_MOD';

CREATE TRIGGER CivIVTraitsIndus
AFTER INSERT ON Leaders WHEN 'LEADER_HARAPPA_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Went-Antu[ICON_GOLD][ICON_FOOD]'
		ELSE 'TXT_KEY_HARAPPA_MOD_ANTU_DESC' END) 
	WHERE Type = 'LEADER_HARAPPA_MOD';
END;

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,										LinguisticType)
VALUES		('CIVILIZATION_HARAPPA_MOD', 			null,											'JFD_Indo_Iranian'),
			('CIVILIZATION_HARAPPA_MOD',			'TXT_KEY_CITY_NAME_HARAPPA_MOD_SHORTUGAI',		null);

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_HARAPPA_MOD',			 'CIVILIZATION_INDIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_HARAPPA_MOD'),		('CIVILIZATION_CHOLA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_CHOLA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_HARAPPA_MOD'),		('CIVILIZATION_MC_CHOLA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_CHOLA');
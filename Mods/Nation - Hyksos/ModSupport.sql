--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);

INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,			TraitOne,					TraitTwo)
VALUES      ('LEADER_TCM_APOPHIS',	'POLICY_AGGRESSIVE_X',		'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Apophis [ICON_WAR][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_TCM_APOPHIS' END) 
WHERE Type = 'LEADER_TCM_APOPHIS';

CREATE TRIGGER CivIVTraitsTCMHyksos
AFTER INSERT ON Leaders WHEN 'LEADER_TCM_APOPHIS' = NEW.Type
BEGIN
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Apophis [ICON_WAR][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_TCM_APOPHIS' END) 
	WHERE Type = 'LEADER_TCM_APOPHIS';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_EGYPT' )
	THEN '_EGYPT'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_TCM_HYKSOS';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	31,		48,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	71,		47,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	45,		19,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	59,		36,		null,	null);
--==========================================================================================================================
-- Civilizations_AfricaLargeStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	42,		66,		null,	null);
--==========================================================================================================================
-- Civilizations_MediterraneanStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	86,		12,		null,	null);
--==========================================================================================================================
-- Civilizations_MesopotamiaStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	28,		11,		null,	null);
--==========================================================================================================================
-- Civilizations_NileValleyStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NileValleyStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NileValleyStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_HYKSOS',	32,		68,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_HYKSOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_HYKSOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_HYKSOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_EGYPT';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,					CultureType,		CultureEra)
VALUES		('CIVILIZATION_TCM_HYKSOS',	'MIDEASTERN ',		'ANY');
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcmHyksosDecisions.lua');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('tcmHyksosEvents.lua');
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 			ColonyName,		LinguisticType)
VALUES		('CIVILIZATION_TCM_HYKSOS',	null,			'JFD_Mesopotamian');
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_TCM_HYKSOS',	'CIVILIZATION_EGYPT'),
			('CIVILIZATION_EGYPT',		'CIVILIZATION_TCM_HYKSOS');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
------------------------------					
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_TCM_APOPHIS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		9);
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_PESEDJET')
	THEN 'RELIGION_PESEDJET'
	ELSE 'RELIGION_JUDAISM' END
) WHERE CivilizationType = 'CIVILIZATION_TCM_HYKSOS';

CREATE TRIGGER ReligionHyksos
AFTER INSERT ON Religions WHEN 'RELIGION_PESEDJET' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_PESEDJET'
	WHERE CivilizationType = 'CIVILIZATION_TCM_HYKSOS';
END;
--==========================================================================================================================
--==========================================================================================================================
			INSERT INTO Policies 
			(Type, 								Description)
VALUES		('POLICY_TCM_HYKSOS_DECISION', 		'TXT_KEY_DECISIONS_TCM_HYKSOSFORTIFYFRONTIER');

			INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 					BuildingClassType,			ProductionModifier)
VALUES		('POLICY_TCM_HYKSOS_DECISION', 	'BUILDINGCLASS_BARRACKS',	25),
			('POLICY_TCM_HYKSOS_DECISION', 	'BUILDINGCLASS_WALLS',		25);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			 ArtDefineTag, CultureType,		SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	('CIVILIZATION_TCM_HYKSOS'), ArtDefineTag, ('JFD_Semitic'),  SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_EGYPT';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_MesopotamicEgyptian'
WHERE Type = 'CIVILIZATION_TCM_HYKSOS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_MesopotamicEgyptian');
--==========================================================================================================================    
-- JFD's and Pouakai's MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-10 may be set. This value determines the likelihood that a leader will take out Mercenary Contracts (provided they have the funds).
--A value of 10 means this civilization will always take a Contract if available. A value of 0 means this civilization will never take out a contract.
INSERT INTO Leader_Flavors
        (LeaderType,               FlavorType,                Flavor)
VALUES  ('LEADER_TCM_APOPHIS',    'FLAVOR_JFD_MERCENARY',     4);

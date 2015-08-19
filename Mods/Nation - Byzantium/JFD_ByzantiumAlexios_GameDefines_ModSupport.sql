--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
       (LeaderType,				TraitOne,				TraitTwo)
VALUES ('LEADER_JFD_ALEXIOS',	'POLICY_PROTECTIVE_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X')
	THEN 'Alexios I Komnenos [ICON_STRENGTH][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_ALEXIOS' END) 
WHERE Type = 'LEADER_JFD_ALEXIOS';
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_BYZANTIUM')
	THEN '_BYZANTIUM'
	ELSE ArtStyleSuffix END) 
WHERE Type = 'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS';
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_MediterraneanStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_MesopotamiaStartPosition (Mesopotamia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
			(Type,									X,	Y)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	X,	Y
FROM Civilizations_MesopotamiaStartPosition WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE (Type = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------	
-- Civilizations_MesopotamiaRequestedResource (Mesopotamia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MesopotamiaRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MesopotamiaRequestedResource WHERE (Type = 'CIVILIZATION_BYZANTIUM');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,		CultureEra)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'MEDITERRANEAN',	'ANY');
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	ArtDefineTag								text											default	null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						CultureType,			SplashScreenTag,		SoundtrackTag)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'JFD_Mediterranean',	'JFD_Mediterranean',	'JFD_Eastern');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Eastern')
	THEN 'JFD_Eastern'
	ELSE 'Byzantium' END) 
WHERE Type = 'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS';
--==========================================================================================================================
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 						ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	null,									'JFD_Hellenic'),
		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',	'TXT_KEY_COLONY_NAME_JFD_BYZANTIUM_01', null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 						text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 			text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,							RevolutionaryCivilizationType)
VALUES	('CIVILIZATION_BYZANTIUM',					'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS'),
		('CIVILIZATION_JFD_BYZANTIUM_ALEXIOS',		'CIVILIZATION_BYZANTIUM');
--==========================================================================================================================	
-- JFD PIETY & PRESTIGE
--==========================================================================================================================	
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
------------------------------			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_JFD_ALEXIOS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ByzantiumAlexios_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,													Description,														HappinessPerGarrisonedUnit)
VALUES	('POLICY_DECISIONS_JFD_REFORM_THEMATIC_SYSTEM',			'TXT_KEY_DECISIONS_JFD_BYZANTIUM_ALEXIOS_REFORM_THEMATIC_SYSTEM',	2);
------------------------------
-- Policy_BuildingClassTourismModifiers
------------------------------
INSERT INTO Policy_BuildingClassTourismModifiers
		(PolicyType, 												BuildingClassType,			TourismModifier)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL', 	'BUILDINGCLASS_PALACE',		15);
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 												BuildingClassType,			YieldType,			YieldChange)
VALUES	('POLICY_DECISIONS_JFD_BYZANTIUM_RENOVATE_THE_CAPITAL', 	'BUILDINGCLASS_GARDEN',		'YIELD_CULTURE',	2);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_ByzantiumAlexios_Events.lua');
--==========================================================================================================================
-- WHOWARD's DLL
--==========================================================================================================================
-- CustomModOptions
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name, Value);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GOLDEN_AGE', 1);
--==========================================================================================================================
--==========================================================================================================================
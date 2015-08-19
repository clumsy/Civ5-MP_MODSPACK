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
VALUES  ('LEADER_JFD_WILLIAM_I',	'POLICY_AGGRESSIVE_X',	'POLICY_PROTECTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X')
	THEN 'William I [ICON_WAR][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_JFD_WILLIAM_I' END) 
WHERE Type = 'LEADER_JFD_WILLIAM_I';
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND')
	THEN '_ENGLAND'
	ELSE ArtStyleSuffix END) 
WHERE Type = 'CIVILIZATION_JFD_NORMANDY';
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		14,		66);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		58,		60);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		40,		49);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Cordiform)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		34,		30);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		40,		43);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		26,		43);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		84,		27);
------------------------------------------------------------	
-- Civilizations_BritishIslesStartPosition (British Isles)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_BritishIslesStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		45,		0);
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (NorthWest Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_JFD_NORMANDY',		19,		10);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_CordiformRequestedResource (Earth Cordiform)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Euro Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Euro Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_BritishIslesRequestedResource (British Isles)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_BritishIslesRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_BritishIslesRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_BritishIslesRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations__NorthWestEuropeRequestedResource (NorthWest Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 								Req1, Yield1, Req2,	Yield2, Req3, Yield3, Req4, Yield4)
SELECT	('CIVILIZATION_JFD_NORMANDY'),		Req1, Yield1, Req2,	Yield2,	Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
VALUES	('CIVILIZATION_JFD_NORMANDY',	'FRENCH',		'ANY');
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
		(CivilizationType,				CultureType,	SplashScreenTag, SoundtrackTag)
VALUES	('CIVILIZATION_JFD_NORMANDY',	'JFD_Western',  'JFD_Western',	 'JFD_Western');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Western')
	THEN 'JFD_Western'
	ELSE 'England' END) 
WHERE Type = 'CIVILIZATION_JFD_NORMANDY';
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
		(CivilizationType, 						LinguisticType)
VALUES	('CIVILIZATION_JFD_NORMANDY',			'JFD_Latinate');
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,						RevolutionaryCivilizationType)
VALUES	('CIVILIZATION_ENGLAND',				'CIVILIZATION_JFD_NORMANDY'),
		('CIVILIZATION_FRANCE',					'CIVILIZATION_JFD_NORMANDY'),
		('CIVILIZATION_JFD_NORMANDY',			'CIVILIZATION_ENGLAND'),
		('CIVILIZATION_JFD_NORMANDY',			'CIVILIZATION_FRANCE');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
		(CivilizationType,						RevolutionaryCivilizationType)
SELECT	('CIVILIZATION_JFD_NORMANDY'),			('CIVILIZATION_JFD_ANGLO_SAXONS')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_ANGLO_SAXONS');
--==========================================================================================================================	
-- JFD PIETY & PRESTIGE
--==========================================================================================================================			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_JFD_WILLIAM_I',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Normandy_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type,														Description) 
VALUES	('POLICY_DECISIONS_JFD_NORMANDY_COMPILE_DOOMSDAY_BOOK',		'TXT_KEY_DECISIONS_JFD_NORMANDY_COMPILE_DOOMSDAY_BOOK');
------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers
		(PolicyType, 												BuildingClassType,			 YieldType,		 YieldMod)
VALUES	('POLICY_DECISIONS_JFD_NORMANDY_COMPILE_DOOMSDAY_BOOK', 	'BUILDINGCLASS_COURTHOUSE',	 'YIELD_GOLD',	 15);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Normandy_Events.lua');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 					DefaultBuilding, 									Description, 								MaxPlayerInstances)
VALUES	('BUILDINGCLASS_EVENTS_JFD_BAYEUX_TAPESTRY', 	'BUILDING_EVENTS_JFD_BAYEUX_TAPESTRY', 'TXT_KEY_EVENTS_JFD_BAYEUX_TAPESTRY',	1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
		(Type, 									BuildingClass, 			  						Cost, 	FaithCost,	Help,										Description, 							Civilopedia,								IconAtlas,						PortraitIndex,	NukeImmune, ConquestProb)
VALUES	('BUILDING_EVENTS_JFD_BAYEUX_TAPESTRY',	'BUILDINGCLASS_EVENTS_JFD_BAYEUX_TAPESTRY', 	-1, 	-1,			'TXT_KEY_EVENTS_JFD_BAYEUX_TAPESTRY_HELP',	'TXT_KEY_EVENTS_JFD_BAYEUX_TAPESTRY', 	'TXT_KEY_EVENTS_JFD_BAYEUX_TAPESTRY_PEDIA',	'JFD_NORMANDY_EVENTS_ATLAS',	0,				1,			66);
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,							YieldType,				Yield)
VALUES	('BUILDING_EVENTS_JFD_BAYEUX_TAPESTRY', 'YIELD_CULTURE',		2);
------------------------------
-- Building_UnitCombatFreeExperiences
------------------------------
INSERT INTO Building_UnitCombatFreeExperiences
		(BuildingType,							UnitCombatType,			Experience)
VALUES	('BUILDING_EVENTS_JFD_BAYEUX_TAPESTRY', 'UNITCOMBAT_MELEE',		10),
		('BUILDING_EVENTS_JFD_BAYEUX_TAPESTRY', 'UNITCOMBAT_ARCHER',	10),
		('BUILDING_EVENTS_JFD_BAYEUX_TAPESTRY', 'UNITCOMBAT_MOUNTED',	10);
--==========================================================================================================================
--==========================================================================================================================
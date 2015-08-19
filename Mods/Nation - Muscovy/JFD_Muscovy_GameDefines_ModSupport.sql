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
            (LeaderType,         TraitOne,					TraitTwo)
VALUES      ('LEADER_JFD_IVAN',	 'POLICY_AGGRESSIVE_X',		'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Ivan IV [ICON_WAR][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_IVAN' END) 
WHERE Type = 'LEADER_JFD_IVAN';

CREATE TRIGGER CivIVTraitsIvanIV
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_IVAN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Ivan IV [ICON_WAR][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_JFD_IVAN' END) 
	WHERE Type = 'LEADER_JFD_IVAN';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_RUSSIA' )
	THEN '_RUSSIA'
	ELSE '_MED' END) 
WHERE Type = 'CIVILIZATION_JFD_MUSCOVY';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,								X,		Y)
VALUES		('CIVILIZATION_JFD_MUSCOVY',		34,		76);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,								X,		Y)
VALUES		('CIVILIZATION_JFD_MUSCOVY',		70,		66);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,								X,		Y)
VALUES		('CIVILIZATION_JFD_MUSCOVY',		43,		38);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,								X,		Y)
VALUES		('CIVILIZATION_JFD_MUSCOVY',		60,		60);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,									X,		Y)
VALUES	('CIVILIZATION_JFD_MUSCOVY',			122,	84);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,								X,		Y)
VALUES		('CIVILIZATION_JFD_MUSCOVY',		52,		61);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,								X,		Y)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		X,		Y
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
			(Type,								X,		Y)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		X,		Y
FROM Civilizations_AmericasStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,								X,		Y)
VALUES		('CIVILIZATION_JFD_MUSCOVY',		56,		27);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AmericasRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AmericasRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_MUSCOVY',	'SLAVIC',		'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,				CultureType,	SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_JFD_MUSCOVY',	'JFD_Eastern',	'JFD_Eastern',		'JFD_Eastern');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Eastern' )
	THEN 'JFD_Eastern'
	ELSE 'Russia' END) 
WHERE Type = 'CIVILIZATION_JFD_MUSCOVY';
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
			(CivilizationType, 				ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_JFD_MUSCOVY',	null,									'JFD_Slavic'),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_01',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_02',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_03',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_04',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_05',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_06',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_07',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_08',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_09',	null),
			('CIVILIZATION_JFD_MUSCOVY',	'TXT_KEY_COLONY_NAME_JFD_MUSCOVY_10',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_RUSSIA',				'CIVILIZATION_JFD_MUSCOVY'),
			('CIVILIZATION_JFD_MUSCOVY',		'CIVILIZATION_RUSSIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		('CIVILIZATION_JFD_PETRINE_RUSSIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_PETRINE_RUSSIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		('CIVILIZATION_JFD_USSR_LENIN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_USSR_LENIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		('CIVILIZATION_JFD_MUSCOVY')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_MUSCOVY');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		('CIVILIZATION_JFD_USSR_STALIN')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_USSR_STALIN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		('CIVILIZATION_JFD_NOVGOROD')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NOVGOROD');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_MUSCOVY'),		('CIVILIZATION_JFD_PUTIN_RUSSIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_PUTIN_RUSSIA');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
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
VALUES		('LEADER_JFD_IVAN',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		9);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Muscovy_Decisions.lua');
------------------------------
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 	
			(Type, 						 		 	DefaultBuilding, 					Description, 						MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_JFD_SMOLNY_INSTITUTE', 	'BUILDING_JFD_SMOLNY_INSTITUTE', 	'TXT_KEY_JFD_SMOLNY_INSTITUTE',		-1,					1),
			('BUILDINGCLASS_JFD_ST_BASILS', 		'BUILDING_JFD_ST_BASILS', 			'TXT_KEY_JFD_ST_BASILS',   			1,					-1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
			(Type, 								BuildingClass, 			  				Happiness, 	Cost, 	FaithCost,	ReligiousPressureModifier,	SpecialistType,			SpecialistCount,	FreeBuilding,				Description, 						Help,							Civilopedia,									Quote, 							IconAtlas,		HurryCostModifier, 	MinAreaSize, 	ConquestProb, 	NukeImmune, DisplayPosition, 	PortraitIndex,	WonderSplashImage, 				NeverCapture)
VALUES		('BUILDING_JFD_SMOLNY_INSTITUTE', 	'BUILDINGCLASS_JFD_SMOLNY_INSTITUTE', 	0,			-1, 	-1,			0,							'SPECIALIST_SCIENTIST',	2,					null,						'TXT_KEY_JFD_SMOLNY_INSTITUTE', 	null,							'TXT_KEY_JFD_SMOLNY_INSTITUTE_CIVILOPEDIA',		null,							'BW_ATLAS_1',	-1,					-1,				0,				1,			1,					14,				null,							1),
			('BUILDING_JFD_ST_BASILS', 			'BUILDINGCLASS_JFD_ST_BASILS', 			2,			-1, 	-1,			100,						null,					0,					'BUILDINGCLASS_CATHEDRAL',	'TXT_KEY_JFD_ST_BASILS', 			'TXT_KEY_JFD_ST_BASILS_HELP',	'TXT_KEY_JFD_ST_BASILS_CIVILOPEDIA',			'TXT_KEY_JFD_ST_BASILS_QUOTE',	'BW_ATLAS_2',	-1,					-1,				100,			1,			1,					13,				'WonderConceptKremlin.dds',		0);
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, 			Yield)
VALUES		('BUILDING_JFD_ST_BASILS', 	'YIELD_FAITH',		3),
			('BUILDING_JFD_ST_BASILS', 	'YIELD_CULTURE', 	1);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_Muscovy_Events.lua');
--==========================================================================================================================
--==========================================================================================================================
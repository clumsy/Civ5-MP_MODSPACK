--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcmSongDecisions.lua');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('tcmSongEvents.lua');
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
VALUES      ('LEADER_TCM_TAIZU',	'POLICY_EXPANSIVE_X',		'POLICY_INVENTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'TAIZU [ICON_FOOD][ICON_SCIENCE]'
	ELSE 'TXT_KEY_LEADER_TCM_TAIZU' END) 
WHERE Type = 'LEADER_TCM_TAIZU';

CREATE TRIGGER CivIVTraitsTCMSong
AFTER INSERT ON Leaders WHEN 'LEADER_TCM_TAIZU' = NEW.Type
BEGIN
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'TAIZU [ICON_FOOD][ICON_SCIENCE]'
		ELSE 'TXT_KEY_LEADER_TCM_TAIZU' END) 
	WHERE Type = 'LEADER_TCM_TAIZU';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_CHINA' )
	THEN '_CHINA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_TCM_SONG';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	81,		59,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	104,	50,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	61,		39,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	85,		31,		null,	null);
--==========================================================================================================================
-- Civilizations_AsiaStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	66,		50,		null,	null);
--==========================================================================================================================
-- Civilizations_NorthEastAsiaStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	6,		30,		null,	null);
--==========================================================================================================================
-- Civilizations_PacificStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	31,		56,		null,	null);
--==========================================================================================================================
-- Civilizations_EastAsiaStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EastAsiaStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_SONG',	40,		59,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_SONG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_SONG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_SONG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_SONG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilizations_EastAsiaRequestedResource
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_SONG'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EastAsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,					CultureType,	CultureEra)
VALUES		('CIVILIZATION_TCM_SONG',	'ASIAN',		'ANY');
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
			(CivilizationType,			CultureType,	SplashScreenTag, SoundtrackTag)
VALUES		('CIVILIZATION_TCM_SONG',	'JFD_Oriental', 'JFD_Oriental',	 'JFD_Oriental');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Oriental')
	THEN 'JFD_Oriental'
	ELSE 'CHINA' END) 
WHERE Type = 'CIVILIZATION_TCM_SONG';
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
VALUES		('CIVILIZATION_TCM_SONG',	null,			'JFD_Oriental');
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_CHINA',		'CIVILIZATION_TCM_SONG'),
			('CIVILIZATION_TCM_SONG',	'CIVILIZATION_CHINA');
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
VALUES		('LEADER_TCM_TAIZU',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4);
--==========================================================================================================================
--==========================================================================================================================
			INSERT INTO Policies 
			(Type, 								Description)
VALUES		('POLICY_TCM_SONG_DECISION', 		'TXT_KEY_DECISIONS_TCM_BANKNOTES'),
			('POLICY_TCM_SONG_NAVAL_DECISION', 	'TXT_KEY_DECISIONS_TCM_STANDINGNAVY');

			INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 						BuildingClassType,			YieldType,			YieldChange)
VALUES		('POLICY_TCM_SONG_DECISION',		'BUILDINGCLASS_MARKET',		'YIELD_GOLD',		2),
			('POLICY_TCM_SONG_DECISION',		'BUILDINGCLASS_BANK',		'YIELD_GOLD',		2),
			('POLICY_TCM_SONG_DECISION',		'BUILDINGCLASS_WORKSHOP',   'YIELD_GOLD',		2),
			('POLICY_TCM_SONG_NAVAL_DECISION',  'BUILDINGCLASS_HARBOR',		'YIELD_PRODUCTION',	2);

			INSERT INTO Policy_UnitCombatProductionModifiers 
VALUES		(PolicyType,						 UnitCombatType,			ProductionModifier)
			('POLICY_TCM_SONG_NAVAL_DECISION',	'UNITCOMBAT_NAVALRANGED',	10),
			('POLICY_TCM_SONG_NAVAL_DECISION',	'UNITCOMBAT_NAVALMELEE',	10);

			INSERT INTO Policy_UnitCombatFreeExperiences
VALUES		(PolicyType,						UnitCombatType,				FreeExperience)
			('POLICY_TCM_SONG_NAVAL_DECISION',	'UNITCOMBAT_NAVALRANGED',	15),
			('POLICY_TCM_SONG_NAVAL_DECISION',	'UNITCOMBAT_NAVALMELEE',	15);
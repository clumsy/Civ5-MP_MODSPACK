--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('ge_WilhelmIIDecisions.lua');
--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('ge_WilhelmIIEvents.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies
                (Type,               Description,                          IncludesOneShotFreeUnits)
VALUES          ('POLICY_GE_FLEET',  'TXT_KEY_DECISIONS_GE_GERMANY_FLEET', 1),
		        ('POLICY_GE_KWS',	 'TXT_KEY_DECISIONS_GE_GERMANY_KWS',   null);

INSERT INTO Policy_FreeUnitClasses
                (PolicyType,           UnitClassType,    	 		 Count)
VALUES          ('POLICY_GE_FLEET',   'UNITCLASS_GREAT_ADMIRAL',     1);

INSERT INTO Policy_UnitCombatProductionModifiers
                (PolicyType,           UnitCombatType,    	 	 ProductionModifier)
VALUES          ('POLICY_GE_FLEET',   'UNITCOMBAT_NAVALMELEE',   33),
				('POLICY_GE_FLEET',   'UNITCOMBAT_NAVALRANGED',  33),
				('POLICY_GE_FLEET',   'UNITCOMBAT_SUBMARINE',    33),
				('POLICY_GE_FLEET',   'UNITCOMBAT_CARRIER',    	 33);
				
INSERT INTO Policy_BuildingClassProductionModifiers
                (PolicyType,           BuildingClassType,    	 ProductionModifier)
VALUES          ('POLICY_GE_FLEET',   'BUILDINGCLASS_HARBOR',    50),
				('POLICY_GE_FLEET',   'BUILDINGCLASS_SEAPORT',   50);
				
INSERT INTO Policy_BuildingClassYieldChanges
                (PolicyType,          BuildingClassType,				  YieldType,   			 YieldChange)
VALUES          ('POLICY_GE_FLEET',   'BUILDINGCLASS_HARBOR',			  'YIELD_PRODUCTION',    1),
				('POLICY_GE_FLEET',   'BUILDINGCLASS_SEAPORT',			  'YIELD_PRODUCTION',    1),
				('POLICY_GE_KWS',	  'BUILDINGCLASS_NATIONAL_COLLEGE',	  'YIELD_SCIENCE',		 2),
				('POLICY_GE_KWS',	  'BUILDINGCLASS_UNIVERSITY',		  'YIELD_SCIENCE',		 1);
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
            (LeaderType,			 TraitOne,               TraitTwo)
VALUES      ('LEADER_GE_WILHELMII',	 'POLICY_AGGRESSIVE_X',	 'POLICY_EXPANSIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Wilhelm II [ICON_WAR][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_GE_WILHELMII' END) 
WHERE Type = 'LEADER_GE_WILHELMII';

CREATE TRIGGER CivIVTraitsParthia
AFTER INSERT ON Leaders WHEN 'LEADER_GE_WILHELMII' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Wilhelm II [ICON_WAR][ICON_CITY_STATE]'
		ELSE 'TXT_KEY_LEADER_GE_WILHELMII' END) 
	WHERE Type = 'LEADER_GE_WILHELMII';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY' )
	THEN '_GERMANY'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_GREATEREUROPE_GERMANY';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,									CultureType,	CultureEra)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',		'GERMANIC ',		'ANY');
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
			(CivilizationType,							CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',		'JFD_Central',		'JFD_Central',		'JFD_Central');
------------------------------
-- Civilizations
------------------------------
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Central' )
	THEN 'JFD_Central'
	ELSE 'Germany' END) 
WHERE Type = 'CIVILIZATION_GREATEREUROPE_GERMANY';
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
			(CivilizationType, 						LinguisticType)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',	'JFD_Germanic');
------------------------------		
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY','CIVILIZATION_GERMANY'),
			('CIVILIZATION_GERMANY',			  'CIVILIZATION_GREATEREUROPE_GERMANY');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_GREATEREUROPE_GERMANY'),	('CIVILIZATION_JFD_NAZI_GERMANY')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NAZI_GERMANY');
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
			(LeaderType,			FlavorType,							Flavor)
VALUES		('LEADER_GE_WILHELMII',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	6);
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
INSERT INTO Civilizations_YagemStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',						22,		69,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
INSERT INTO Civilizations_YahemStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',						64,		61,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
INSERT INTO Civilizations_CordiformStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',						39,		32,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',						37,		47,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',						51,		53,		null,	null);
--==========================================================================================================================
-- Civilizations_NorthAtlanticStartPosition 
--==========================================================================================================================
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',						92,		37,		null,	null);
--==========================================================================================================================
-- Civilizations_NorthWestEuropeStartPosition 
--==========================================================================================================================
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_GREATEREUROPE_GERMANY',						41,		19,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_GREATEREUROPE_GERMANY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_GREATEREUROPE_GERMANY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_GREATEREUROPE_GERMANY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_GREATEREUROPE_GERMANY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
--==========================================================================================================================

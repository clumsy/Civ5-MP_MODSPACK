--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcm_ParthiaDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,							Description) 
VALUES		('POLICY_TCM_IRANIAN_REVIVAL',	'TXT_KEY_LEADER_PARTHIA_MITHRIDATES');

INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType,					BuildingClassType,			ProductionModifier) 
VALUES		('POLICY_TCM_IRANIAN_REVIVAL',	'BUILDINGCLASS_COURTHOUSE',	33);

INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType,					BuildingClassType,			YieldType,	  YieldChange) 
VALUES		('POLICY_TCM_IRANIAN_REVIVAL',	'BUILDINGCLASS_COURTHOUSE',	'YIELD_GOLD', 1);
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
VALUES      ('LEADER_MITHRIDATES',	 'POLICY_AGGRESSIVE_X',	 'POLICY_EXPANSIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Mithridates I [ICON_WAR][ICON_FOOD]'
	ELSE 'TXT_KEY_LEADER_PARTHIA_MITHRIDATES' END) 
WHERE Type = 'LEADER_MITHRIDATES';

CREATE TRIGGER CivIVTraitsParthia
AFTER INSERT ON Leaders WHEN 'LEADER_MITHRIDATES' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Mithridates I [ICON_WAR][ICON_FOOD]'
		ELSE 'TXT_KEY_LEADER_PARTHIA_MITHRIDATES' END) 
	WHERE Type = 'LEADER_MITHRIDATES';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_PERSIA' )
	THEN '_PERSIA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_PARTHIA';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition 
--==========================================================================================================================
INSERT INTO Civilizations_YagemStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_PARTHIA',						51,		59,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition 
--==========================================================================================================================
INSERT INTO Civilizations_YahemStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_PARTHIA',						81,		52,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
INSERT INTO Civilizations_CordiformStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_PARTHIA',						54,		28,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_PARTHIA',						71,		46,		null,	null);
--==========================================================================================================================
-- Civilizations_AsiaStartPosition 
--==========================================================================================================================
INSERT INTO Civilizations_AsiaStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_PARTHIA',						6,		59,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_PARTHIA'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_PARTHIA'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_PARTHIA'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_PARTHIA',		'MIDEASTERN ',		'ANY');
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
			(CivilizationType,				CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_PARTHIA',		'JFD_Mesopotamic',		'JFD_Steppe',		'JFD_Steppe');
------------------------------
-- Civilizations
------------------------------
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Mesopotamic' )
	THEN 'JFD_Mesopotamic'
	ELSE 'Persia' END) 
WHERE Type = 'CIVILIZATION_PARTHIA';
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
			(CivilizationType, 			LinguisticType)
VALUES		('CIVILIZATION_PARTHIA',	'JFD_Indo_Iranian');
------------------------------		
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,		RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_PARTHIA','CIVILIZATION_PERSIA'),
			('CIVILIZATION_PERSIA',	'CIVILIZATION_PARTHIA');
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
VALUES		('LEADER_MITHRIDATES',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	0);


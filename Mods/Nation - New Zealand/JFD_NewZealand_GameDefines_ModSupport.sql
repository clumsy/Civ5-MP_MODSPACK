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
VALUES      ('LEADER_JFD_SEDDON',	'POLICY_CHARISMATIC_X',		'POLICY_INDUSTRIOUS_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Seddon [ICON_HAPPINESS_1][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_JFD_SEDDON' END) 
WHERE Type = 'LEADER_JFD_SEDDON';

CREATE TRIGGER CivIVTraitsSwedenNorway
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_SEDDON' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Seddon [ICON_HAPPINESS_1][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_JFD_SEDDON' END) 
	WHERE Type = 'LEADER_JFD_SEDDON';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND' )
	THEN '_ENGLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_NEW_ZEALAND';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',		113,	8);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',		1,		9);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',		2,		9);
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',		61,		5);
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',		61,		5);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (Pacific)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',		61,		5);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (South Pacific)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthPacificStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',		20,		11);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1,				Yield1, Req2,				Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'),		('RESOURCE_SHEEP'), 1,		('RESOURCE_FISH'),	1,		Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1,				Yield1, Req2,				Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'),		('RESOURCE_SHEEP'), 1,		('RESOURCE_FISH'),	1,		Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1,				Yield1, Req2,				Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'),		('RESOURCE_SHEEP'), 1,		('RESOURCE_FISH'),	1,		Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_PacificRequestedResource (Pacific)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource
			(Type, 									Req1,				Yield1, Req2,				Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'),		('RESOURCE_SHEEP'), 1,		('RESOURCE_FISH'),	1,		Req3, Yield3, Req4, Yield4
FROM Civilizations_PacificRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
------------------------------------------------------------	
-- Civilizations_SouthPacificRequestedResource (South Pacific)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_SouthPacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_SouthPacificRequestedResource
			(Type, 									Req1,				Yield1, Req2,				Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_NEW_ZEALAND'),		('RESOURCE_SHEEP'), 1,		('RESOURCE_FISH'),	1,		Req3, Yield3, Req4, Yield4
FROM Civilizations_SouthPacificRequestedResource WHERE (Type = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',	'GERMANIC',		'ANY');
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
			(CivilizationType,					CultureType,	SplashScreenTag, SoundtrackTag)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',	'JFD_Colonial', 'JFD_Colonial',	 'JFD_Colonial');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Colonial')
	THEN 'JFD_Colonial'
	ELSE 'England' END) 
WHERE Type = 'CIVILIZATION_JFD_NEW_ZEALAND';
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
			(CivilizationType, 					ColonyName,									LinguisticType)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',	null,										'JFD_Germanic'),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_01',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_02',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_03',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_04',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_05',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_06',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_07',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_08',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_09',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_10',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_11',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_12',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_13',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_14',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_15',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_16',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_17',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_18',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_19',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_20',	null),
			('CIVILIZATION_JFD_NEW_ZEALAND', 	'TXT_KEY_COLONY_NAME_JFD_NEW_ZEALAND_21',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_ENGLAND',				'CIVILIZATION_JFD_NEW_ZEALAND');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
-- Civilization_JFD_Governments
------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  	text 		REFERENCES Civilizations(Type) 				default null,
	CultureType	  		text 		 											default null,
	GovernmentType		text													default	null,
	GovernmentName		text													default	null,
	Weight				integer													default	0);

INSERT INTO Civilization_JFD_Governments
			(CivilizationType,					GovernmentType,					Weight)
VALUES		('CIVILIZATION_JFD_NEW_ZEALAND',	'GOVERNMENT_JFD_MONARCHY',		70);
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
VALUES		('LEADER_JFD_SEDDON',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_NewZealand_Decisions.lua');
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
			(Type, 													  DefaultBuilding, 										Description,												MaxPlayerInstances)
VALUES		('BUILDINGCLASS_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE',  'BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE', 	'TXT_KEY_BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE',	1),
			('BUILDINGCLASS_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD',	  'BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD', 		'TXT_KEY_BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD',		1);
------------------------------	
-- Buildings
------------------------------	
INSERT INTO Buildings		
			(Type, 													BuildingClass, 			  									Cost, 	FaithCost,	EnhancedYieldTech,	TechEnhancedTourism, Description, 													Help,															 IconAtlas,				 PortraitIndex, ConquestProb,	NeverCapture)
VALUES		('BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE', 	'BUILDINGCLASS_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE',		-1, 	-1,			'TECH_AGRICULTURE',	2,					 'TXT_KEY_BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE', 	'TXT_KEY_BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE_HELP',	 'EXPANSION_BW_ATLAS_2', 8,				100,			0),
			('BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD', 		'BUILDINGCLASS_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD',		-1, 	-1,			'TECH_AGRICULTURE',	2,					 'TXT_KEY_BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD', 		'TXT_KEY_BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD_HELP',	 'EXPANSION_BW_ATLAS_2', 8,				100,			0);
------------------------------
-- Building_YieldChanges
------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType,											YieldType,			Yield)
VALUES		('BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_CULTURE',		'YIELD_CULTURE',	2),
			('BUILDING_JFD_NEW_ZEALAND_WORLD_HERITAGE_GOLD',		'YIELD_GOLD',		3);
------------------------------	
-- UnitPromotions
------------------------------
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 						Description, 					Help, 								Sound, 				CityAttack,	CannotBeChosen,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_NZ_EMPIRE',	'TXT_KEY_PROMOTION_NZ_EMPIRE',	'TXT_KEY_PROMOTION_NZ_EMPIRE_HELP', 'AS2D_IF_LEVELUP', 	33,			1,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_NZ_EMPIRE');
------------------------------
-- UnitPromotions_UnitCombats
------------------------------
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 			UnitCombatType)
VALUES		('PROMOTION_JFD_NZ_EMPIRE', 'UNITCOMBAT_NAVALMELEE'),
			('PROMOTION_JFD_NZ_EMPIRE', 'UNITCOMBAT_NAVALRANGED');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
			(Type, 												Description,													HappinessPerGarrisonedUnit)
VALUES		('POLICY_DECISIONS_JFD_COMMEMORATE_ANZACS', 		'TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_COMMEMORATE_ANZACS',			1),
			('POLICY_DECISIONS_JFD_PROMULGATE_IMPERIAL_PLANS', 	'TXT_KEY_DECISIONS_JFD_NEW_ZEALAND_PROMULGATE_IMPERIAL_PLANS',	0);
------------------------------
-- Policies
------------------------------
INSERT INTO Policy_FreePromotions
			(PolicyType, 										PromotionType)
VALUES		('POLICY_DECISIONS_JFD_PROMULGATE_IMPERIAL_PLANS', 	'PROMOTION_JFD_NZ_EMPIRE');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_NewZealand_Events.lua');
--==========================================================================================================================
--==========================================================================================================================
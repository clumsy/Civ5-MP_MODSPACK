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
            (LeaderType,				 TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_MUSSOLINI',	 'POLICY_AGGRESSIVE_X',		'POLICY_EXPANSIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Mussolini [ICON_WAR][ICON_FOOD]'
	ELSE 'TXT_KEY_LEADER_JFD_MUSSOLINI' END) 
WHERE Type = 'LEADER_JFD_MUSSOLINI';

CREATE TRIGGER CivIVTraitsFacistItaly
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_MUSSOLINI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Mussolini [ICON_WAR][ICON_FOOD]]'
		ELSE 'TXT_KEY_LEADER_JFD_MUSSOLINI' END) 
	WHERE Type = 'LEADER_JFD_MUSSOLINI';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ROME' )
	THEN '_ROME'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_ITALY';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_NorthAtlanticStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_MediterraneanStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,						X,	Y)
SELECT		('CIVILIZATION_JFD_ITALY'),	X,	Y
FROM Civilizations_NorthWestEuropeStartPosition WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_AmericasRequestedResource (Americas)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ITALY'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,		CultureEra)
VALUES		('CIVILIZATION_JFD_ITALY',		'MEDITERRANEAN',	'ANY');
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
			(CivilizationType,				CultureType,		 SplashScreenTag,	 SoundtrackTag)
VALUES		('CIVILIZATION_JFD_ITALY',		'JFD_Totalitarian',	 'JFD_Totalitarian', 'JFD_Totalitarian');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Totalitarian' )
	THEN 'JFD_Totalitarian'
	ELSE 'Rome' END) 
WHERE Type = 'CIVILIZATION_JFD_ITALY';
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
			(CivilizationType, 			ColonyName,										LinguisticType)
VALUES		('CIVILIZATION_JFD_ITALY',	null,											'JFD_Latinate'),
			('CIVILIZATION_JFD_ITALY',	'TXT_KEY_COLONY_NAME_JFD_ITALY_MUSSOLINI_01',	null),
			('CIVILIZATION_JFD_ITALY',	'TXT_KEY_COLONY_NAME_JFD_ITALY_MUSSOLINI_02',	null),
			('CIVILIZATION_JFD_ITALY',	'TXT_KEY_COLONY_NAME_JFD_ITALY_MUSSOLINI_03',	null),
			('CIVILIZATION_JFD_ITALY',	'TXT_KEY_COLONY_NAME_JFD_ITALY_MUSSOLINI_04',	null),
			('CIVILIZATION_JFD_ITALY',	'TXT_KEY_COLONY_NAME_JFD_ITALY_MUSSOLINI_05',	null),
			('CIVILIZATION_JFD_ITALY',	'TXT_KEY_COLONY_NAME_JFD_ITALY_MUSSOLINI_06',	null),
			('CIVILIZATION_JFD_ITALY',	'TXT_KEY_COLONY_NAME_JFD_ITALY_MUSSOLINI_07',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_ROME',		'CIVILIZATION_JFD_ITALY'),
			('CIVILIZATION_JFD_ITALY',	'CIVILIZATION_ROME'),
			('CIVILIZATION_VENICE',		'CIVILIZATION_JFD_ITALY'),
			('CIVILIZATION_JFD_ITALY',	'CIVILIZATION_VENICE');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_ITALY'),	('CIVILIZATION_JFD_SARDINIA_PIEDMONT')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_SARDINIA_PIEDMONT');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_ITALY'),	('CIVILIZATION_JFD_NAPLES')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NAPLES');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_ITALY'),	('CIVILIZATION_JFD_PAPAL_STATES')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_ITALY'),	('CIVILIZATION_JFD_PAPAL_STATES_BORGIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_PAPAL_STATES_BORGIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_ITALY'),	('CIVILIZATION_JFD_GENOA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_GENOA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,			RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_ITALY'),	('CIVILIZATION_MC_TUSCANY')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_TUSCANY');
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
			(LeaderType,				FlavorType,								Flavor)
VALUES		('LEADER_JFD_MUSSOLINI',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ItalyMussolini_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
			(Type,							Description) 
VALUES		('POLICY_JFD_BLACKSHIRTS',		'TXT_KEY_DECISIONS_JFD_ITALY_BLACKSHIRTS'),
			('POLICY_JFD_BALILLA_A',		'TXT_KEY_DECISIONS_JFD_ITALY_BALILLA'),
			('POLICY_JFD_BALILLA_F',		'TXT_KEY_DECISIONS_JFD_ITALY_BALILLA'),
			('POLICY_JFD_BALILLA_O',		'TXT_KEY_DECISIONS_JFD_ITALY_BALILLA');
------------------------------	
-- Policy_BuildingClassTourismModifiers
------------------------------	
INSERT INTO Policy_BuildingClassTourismModifiers
			(PolicyType,					BuildingClassType,				TourismModifier)
VALUES		('POLICY_JFD_BALILLA_A',		'BUILDINGCLASS_PUBLIC_SCHOOL',	10),
			('POLICY_JFD_BALILLA_F',		'BUILDINGCLASS_PUBLIC_SCHOOL',	10),
			('POLICY_JFD_BALILLA_O',		'BUILDINGCLASS_PUBLIC_SCHOOL',	10);
------------------------------	
-- Policy_BuildingClassYieldChanges
------------------------------	
INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType,					BuildingClassType,				YieldType,			YieldChange)
VALUES		('POLICY_JFD_BALILLA_A',		'BUILDINGCLASS_PUBLIC_SCHOOL',	'YIELD_PRODUCTION', 1),
			('POLICY_JFD_BALILLA_F',		'BUILDINGCLASS_PUBLIC_SCHOOL',	'YIELD_GOLD',		1),
			('POLICY_JFD_BALILLA_O',		'BUILDINGCLASS_PUBLIC_SCHOOL',	'YIELD_FOOD',		1);
------------------------------	
-- UnitPromotions
------------------------------		
INSERT INTO UnitPromotions 
			(Type, 								PromotionPrereq,				Description, 								Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	GoldenAgeValueFromKills,	IconAtlas, 						PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_BLACKSHIRTS', 		null,							'TXT_KEY_PROMOTION_JFD_BLACKSHIRTS', 		'TXT_KEY_PROMOTION_JFD_BLACKSHIRTS_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			0,							'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BLACKSHIRTS'),
			('PROMOTION_JFD_BLACKSHIRT_GA', 	'PROMOTION_JFD_BLACKSHIRTS',	'TXT_KEY_PROMOTION_JFD_BLACKSHIRT_GA', 		'TXT_KEY_PROMOTION_JFD_BLACKSHIRT_GA_HELP',	'AS2D_IF_LEVELUP', 	0, 				2, 				100,						'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BLACKSHIRT_GA');
------------------------------	
-- UnitPromotions_UnitCombats
------------------------------
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType,						UnitCombatType)
VALUES		('PROMOTION_JFD_BLACKSHIRTS',		'UNITCOMBAT_GUN'),
			('PROMOTION_JFD_BLACKSHIRT_GA',		'UNITCOMBAT_GUN');
------------------------------
-- Policy_FreePromotionUnitCombats
------------------------------
INSERT INTO Policy_FreePromotions
			(PolicyType,						PromotionType)
VALUES		('POLICY_JFD_BLACKSHIRTS',			'PROMOTION_JFD_BLACKSHIRTS');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_ItalyMussolini_Events.lua');
------------------------------
-- GreatWorks
------------------------------
INSERT INTO GreatWorks
			(Type,								GreatWorkClassType,		ArtifactClassType,			Description)
VALUES		('GREAT_WORK_JFD_NEMI_SHIPS',		'GREAT_WORK_ARTIFACT',	'ARTIFACT_ANCIENT_RUIN',	'TXT_KEY_ARTIFACT_JFD_NEMI_SHIPS');
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings		
			(Type, 								BuildingClass, 			  					FreeGreatWork,					Cost, 	FaithCost,	GreatWorkSlotType,				GreatWorkCount,	GoldMaintenance, PlotCultureCostModifier,	Description, 							ConquestProb,	IconAtlas,		PortraitIndex)
VALUES		('BUILDING_JFD_NEMI_SHIPS', 		'BUILDINGCLASS_JFD_ITALIAN_PRODUCTION', 	'GREAT_WORK_JFD_NEMI_SHIPS',	-1, 	-1,			'GREAT_WORK_SLOT_ART_ARTIFACT',	1,				0, 				 -1,						'TXT_KEY_ARTIFACT_JFD_NEMI_SHIPS', 		100,			'UNIT_ATLAS_1',	24);
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass, Cost, Happiness,	FreshWater,	GreatPeopleRateModifier, FoodKept,	GoldMaintenance, PrereqTech,	Description, 						Civilopedia, 				 Help, 									Strategy,								 	ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_JFD_HAMMAM'),	BuildingClass, Cost, 1,			FreshWater,	GreatPeopleRateModifier, 10,		GoldMaintenance, PrereqTech,	('TXT_KEY_BUILDING_JFD_HAMMAM'),	('TXT_KEY_JFD_HAMMAM_TEXT'), ('TXT_KEY_BUILDING_JFD_HAMMAM_HELP'), 	('TXT_KEY_BUILDING_JFD_HAMMAM_STRATEGY'),	ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				('JFD_TURKS_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_GARDEN');	
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_JFD_HAMMAM',		'FLAVOR_GROWTH',	15),
		('BUILDING_JFD_HAMMAM',		'FLAVOR_GOLD',		10),
		('BUILDING_JFD_HAMMAM',		'FLAVOR_RELIGION',	10);

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	('BUILDING_JFD_HAMMAM'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_GARDEN');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leader_Flavors
--------------------------------			
UPDATE Leader_Flavors
SET Flavor = 7
WHERE (LeaderType = 'LEADER_SULEIMAN') AND (FlavorType IN ('FLAVOR_GOLD', 'FLAVOR_MILITARY_TRAINING'));

UPDATE Leader_Flavors
SET Flavor = 5
WHERE (LeaderType = 'LEADER_SULEIMAN') AND (FlavorType IN ('FLAVOR_NAVAL', 'FLAVOR_NAVAL_RECON'));
--------------------------------	
-- Leader_Traits
--------------------------------	
DELETE FROM Leader_Traits WHERE (LeaderType = 'LEADER_SULEIMAN');
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SULEIMAN', 			'TRAIT_JFD_OTTOMAN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 					ShortDescription)
VALUES	('TRAIT_JFD_OTTOMAN', 			'TXT_KEY_TRAIT_JFD_OTTOMAN', 	'TXT_KEY_TRAIT_JFD_OTTOMAN_SHORT');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,									Description,					InternalTradeRouteYieldModifier)
VALUES	('POLICY_JFD_OTTOMAN_INTERNAL_BONUS',	'TXT_KEY_TRAIT_JFD_OTTOMAN',	33);	
--==========================================================================================================================	
-- JFD DYNAMIC TOP PANEL
--==========================================================================================================================			
-- JFD_TopPanelIncludes
------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_OttomansDynamicTopPanelSupport.lua');
------------------------------		
-- JFD_TopPanelAdditions
------------------------------		
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default null,
	YieldType  				text 										default null,
	YieldSourceFunction 	text										default null,
	YieldSourceToolTip		text										default	null,
	MiscToolTipFunction		text										default	null);
	
INSERT INTO JFD_TopPanelAdditions
		(CivilizationType,			YieldType,			YieldSourcefunction,				YieldSourceToolTip)
VALUES	('CIVILIZATION_OTTOMAN',	'YIELD_SCIENCE',	'JFD_OttomanGetGoldFromPuppets',	'TXT_KEY_JFD_OTTOMAN_GOLD_FROM_PUPPETS'),
		('CIVILIZATION_OTTOMAN',	'YIELD_GOLD',		'JFD_OttomanGetGoldFromPuppets',	'TXT_KEY_JFD_OTTOMAN_GOLD_FROM_PUPPETS'),
		('CIVILIZATION_OTTOMAN',	'YIELD_FAITH',		'JFD_OttomanGetFaithFromPuppets',	'TXT_KEY_JFD_OTTOMAN_FAITH_FROM_PUPPETS');
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
-- Traits
------------------------------
UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_OTTOMAN_PIETY'
WHERE Type = 'TRAIT_JFD_OTTOMAN'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_PIETY_CIVILIZATION_CHANGES' AND Value = 1);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Ottomans_Decisions.lua');
------------------------------
-- Units
------------------------------
INSERT INTO Units 	
		(Type, 								Class, 				GoldenAgeTurns, Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 								ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES	('UNIT_JFD_OTTOMAN_CALLIGRAPHER', 	'UNITCLASS_ARTIST',	8,				-1,		2,		'DOMAIN_LAND',	'UNITAI_ARTIST',	'TXT_KEY_UNIT_JFD_OTTOMAN_CALLIGRAPHER',	0,				-1,					'ART_DEF_UNIT_GREAT_WRITER',	6,						'EXPANSION2_UNIT_FLAG_ATLAS',	6, 				'EXPANSION2_UNIT_ATLAS',	'GREAT_PERSON');
------------------------------
-- UnitGameplay2DScripts
------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT	('UNIT_JFD_OTTOMAN_CALLIGRAPHER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTIST');	
------------------------------
-- Unit_UniqueNames
------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 							UniqueName,												GreatWorkType)
VALUES	('UNIT_JFD_OTTOMAN_CALLIGRAPHER', 	'TXT_KEY_GREAT_PERSON_JFD_OTTOMAN_CALLIGRAPHER_DESC',	'GREAT_WORK_JFD_SULEIMAN_TUGHRA');
------------------------------	
-- GreatWorks
------------------------------	
INSERT INTO GreatWorks 
		(Type, 								GreatWorkClassType,	Description,								Audio,							Image)
VALUES	('GREAT_WORK_JFD_SULEIMAN_TUGHRA',	'GREAT_WORK_ART',	'TXT_KEY_GREAT_WORK_JFD_SULEIMAN_TUGHRA',	'AS2D_GREAT_ARTIST_ARTWORK',	'gw_suleiman_signature.dds');
--==========================================================================================================================
--==========================================================================================================================
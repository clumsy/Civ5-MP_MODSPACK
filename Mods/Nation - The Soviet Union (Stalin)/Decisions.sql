--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_USSRStalinDecisions.lua');
--==========================================================================================================================	
-- GreatWorks
--==========================================================================================================================	
INSERT INTO GreatWorks 
			(Type, 									GreatWorkClassType,		Description,							Audio,							Image)
VALUES		('GREAT_WORK_JFD_STALIN_PROPOGANDA_1', 	'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_SOVIET_PROPAGANDA',	'AS2D_GREAT_ARTIST_ARTWORK',	'StalinPropaganda1.dds'),
			('GREAT_WORK_JFD_STALIN_PROPOGANDA_2', 	'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_SOVIET_PROPAGANDA',	'AS2D_GREAT_ARTIST_ARTWORK',	'StalinPropaganda2.dds'),
			('GREAT_WORK_JFD_STALIN_PROPOGANDA_3', 	'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_SOVIET_PROPAGANDA',	'AS2D_GREAT_ARTIST_ARTWORK',	'StalinPropaganda3.dds');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 						BuildingClass, 							NeverCapture,	NukeImmune, GreatWorkCount, Cost, FaithCost, PrereqTech, Description, 												Help,															ExtraSpies,	PortraitIndex,	IconAtlas)
VALUES		('BUILDING_JFD_COMMISSARIAT_FOR_INTERNAL_AFFAIRS', 	'BUILDINGCLASS_JFD_STALIN_SATELLITES', 	1,				1,			-1,				-1,   -1, 		 null, 		 'TXT_KEY_BUILDING_JFD_COMMISSARIAT_FOR_INTERNAL_AFFAIRS', 	'TXT_KEY_BUILDING_JFD_COMMISSARIAT_FOR_INTERNAL_AFFAIRS_HELP',	1,			2,				'JFD_USSR_STALIN_ATLAS');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,															Description,															RiggingElectionModifier,	CommonFoeTourismModifier) 
VALUES		('POLICY_JFD_SOVIET_STALIN_CULT_OF_PERSONALITY',				'TXT_KEY_DECISIONS_JFD_USSR_STALIN_CULT_OF_PERSONALITY',				0,							25),
			('POLICY_JFD_SOVIET_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS',	'TXT_KEY_DECISIONS_JFD_USSR_STALIN_COMMISSARIAT_FOR_INTERNAL_AFFAIRS',	100,						0);
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, Type, 						PrereqTech, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, 										ShowInPedia, 	UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas, MoveRate)
SELECT		Class, 	('UNIT_JFD_STALIN_ARTIST'), PrereqTech, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, ('TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_1_DESC'),	0,				UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas, MoveRate
FROM Units WHERE (Type = 'UNIT_ARTIST');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_STALIN_ARTIST'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ARTIST');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_STALIN_ARTIST'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ARTIST');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_STALIN_ARTIST'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ARTIST');	
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 					UniqueName,											GreatWorkType)
VALUES		('UNIT_JFD_STALIN_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_1_DESC',	'GREAT_WORK_JFD_STALIN_PROPOGANDA_1'),
			('UNIT_JFD_STALIN_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_2_DESC',	'GREAT_WORK_JFD_STALIN_PROPOGANDA_2'),
			('UNIT_JFD_STALIN_ARTIST', 	'TXT_KEY_GREAT_PERSON_JFD_STALIN_ARTIST_3_DESC',	'GREAT_WORK_JFD_STALIN_PROPOGANDA_3');
--==========================================================================================================================
--==========================================================================================================================


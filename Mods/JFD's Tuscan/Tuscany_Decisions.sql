--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Tuscany_Decisions.lua');
--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses 	
			(Type, 						 		 	DefaultBuilding, 					Description, 								MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_TUSCANSANTAMARIA', 		'BUILDING_TUSCANSANTAMARIA', 		'TXT_KEY_BUILDING_TUSCANSANTAMARIA',    	1,					-1),
			('BUILDINGCLASS_DECISIONS_TUSCANBANK', 	'BUILDING_DECISIONS_TUSCANBANK', 	'TXT_KEY_DECISIONS_TUSCANBANK',    			-1,					-1);
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 							Description,							GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_DECISIONS_TUSCANBANK', 		'BUILDINGCLASS_DECISIONS_TUSCANBANK',	'TXT_KEY_DECISIONS_TUSCANBANK',			-1, 			-1,   -1, 		 null,			1);
--==========================================================================================================================	
-- Buildings: Regular
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 								Description,									Civilopedia,										Help,													Strategy,			Cost,	PrereqTech, 	ConquestProb,	IconAtlas, 			PortraitIndex)
VALUES		('BUILDING_TUSCANSANTAMARIA', 			'BUILDINGCLASS_TUSCANSANTAMARIA',			'TXT_KEY_BUILDING_TUSCANSANTAMARIA_DESC',		'TXT_KEY_BUILDING_TUSCANSANTAMARIA_PEDIA',			'TXT_KEY_BUILDING_TUSCANSANTAMARIA_HELP',				null,				-1,  	null,			100,			'TUSCANY_ATLAS',	5);

UPDATE Buildings
	SET Quote = 'TXT_KEY_WONDER_TUSCANSANTAMARIA_QUOTE', ThemingBonusHelp = 'TXT_KEY_TUSCANSANTAMARIA_THEMING_BONUS_HELP', NukeImmune = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 4, WonderSplashImage = 'TuscanSantaMaria_Splash.dds'
	WHERE Type = 'BUILDING_TUSCANSANTAMARIA';
--==========================================================================================================================	
-- Building_ThemingBonuses
--==========================================================================================================================		
INSERT INTO Building_ThemingBonuses 	
			(BuildingType, 							Description, 								Bonus,	RequiresOwner,	RequiresSamePlayer,	AIPriority)
VALUES		('BUILDING_TUSCANSANTAMARIA', 			'TXT_KEY_THEMING_BONUS_TUSCANSANTAMARIA', 	4,		1,				1,					1);
--==========================================================================================================================	
-- Building_YieldFromGreatWorksInCity
--==========================================================================================================================		
CREATE TABLE IF NOT EXISTS Building_YieldFromGreatWorksInCity (
  BuildingType text,
  YieldType text,
  Yield integer default 0
);

INSERT INTO Building_YieldFromGreatWorksInCity
			(BuildingType, 							YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_TUSCANBANK', 		'YIELD_GOLD', 			2),
			('BUILDING_TUSCANSANTAMARIA', 			'YIELD_CULTURE', 		2);
--==========================================================================================================================
--==========================================================================================================================
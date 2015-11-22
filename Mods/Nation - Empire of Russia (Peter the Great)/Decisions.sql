--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_RussiaPeterDecisions.lua');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 	DefaultBuilding, 							Description, 								MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_JFD_SMOLNY_INSTITUTE', 	'BUILDING_DECISIONS_JFD_SMOLNY_INSTITUTE', 	'TXT_KEY_DECISIONS_JFD_SMOLNY_INSTITUTE',   -1,					1);
--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings			
			(Type, 								BuildingClass, 			  				Cost, 	FaithCost,	GreatWorkCount,	PrereqTech, SpecialistType,			SpecialistCount,	Help,															Description, 											Civilopedia,									IconAtlas,		PortraitIndex,	NeverCapture)
VALUES		('BUILDING_JFD_BEARD_TAX', 			'BUILDINGCLASS_JFD_PETRINE_EXPANSION', 	-1, 	-1,			-1,				null, 		null,					0,					'TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_BEARD_TAX_ENACTED_DESC',	'TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS', 	null,											null,			0,				1),
			('BUILDING_JFD_SMOLNY_INSTITUTE', 	'BUILDINGCLASS_JFD_SMOLNY_INSTITUTE', 	-1, 	-1,			0,				null, 		'SPECIALIST_SCIENTIST',	2,					null,															'TXT_KEY_JFD_SMOLNY_INSTITUTE', 						'TXT_KEY_JFD_SMOLNY_INSTITUTE_CIVILOPEDIA',		'BW_ATLAS_1',	14,				1);
--==========================================================================================================================
-- Building_YieldChangesPerPop
--==========================================================================================================================
INSERT INTO Building_YieldChangesPerPop 
			(BuildingType,				YieldType,		Yield) 
VALUES		('BUILDING_JFD_BEARD_TAX',	'YIELD_GOLD',	20);
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,							Description,											GreatPeopleRateModifier) 
VALUES		('POLICY_JFD_TABLE_OF_RANKS',	'TXT_KEY_DECISIONS_JFD_RUSSIA_PETER_TABLE_OF_RANKS',	25);
--==========================================================================================================================
--==========================================================================================================================


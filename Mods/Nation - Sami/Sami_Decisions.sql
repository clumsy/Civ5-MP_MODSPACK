--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Sami_Decisions.lua');
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 		DefaultBuilding, 						Description)
VALUES		('BUILDINGCLASS_DECISIONS_SAMISAMEDIGGI', 	'BUILDING_DECISIONS_SAMISAMEDIGGI', 	'TXT_KEY_MC_DECISIONS_SAMISAMEDIGGI'),
			('BUILDINGCLASS_DECISIONS_SAMIFISHING', 	'BUILDING_DECISIONS_SAMIFISHING', 		'Encourage Fishing');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 								Description,							GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_DECISIONS_SAMISAMEDIGGI', 	'BUILDINGCLASS_DECISIONS_SAMISAMEDIGGI',	'TXT_KEY_MC_DECISIONS_SAMISAMEDIGGI',	-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_SAMIFISHING', 		'BUILDINGCLASS_DECISIONS_SAMIFISHING',		'TXT_KEY_MC_DECISIONS_SAMIFISHING',		-1, 			-1,   -1, 		 null,			0);

UPDATE Buildings
	SET TechEnhancedTourism = 2, EnhancedYieldTech = 'TECH_SCIENTIFIC_THEORY'
	WHERE Type = 'BUILDING_DECISIONS_SAMISAMEDIGGI';
	
UPDATE Buildings
	SET ConquestProb = 100
	WHERE Type = 'BUILDING_DECISIONS_SAMIFISHING';
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 
			(BuildingType, 								YieldType, 			Yield)
VALUES		('BUILDING_DECISIONS_SAMISAMEDIGGI', 		'YIELD_CULTURE', 	2);
--==========================================================================================================================	
-- Building_SeaResourceYieldChanges
--==========================================================================================================================	
INSERT OR REPLACE INTO Building_SeaResourceYieldChanges
			(BuildingType,						YieldType,			Yield)
VALUES		('BUILDING_DECISIONS_SAMIFISHING',	'YIELD_GOLD',		1),
			('BUILDING_DECISIONS_SAMIFISHING',	'YIELD_CULTURE',	1);
--==========================================================================================================================
--==========================================================================================================================
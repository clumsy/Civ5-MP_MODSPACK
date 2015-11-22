--==========================================================================================================================	
-- Belief_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Belief_BuildingClassYieldChanges	
			(BeliefType, BuildingClassType,					YieldType, YieldChange)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), YieldType, YieldChange
FROM Belief_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Belief_BuildingClassYieldChanges	
			(BeliefType, BuildingClassType,					YieldType, YieldChange)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	YieldType, YieldChange
FROM Belief_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--==========================================================================================================================	
-- Belief_BuildingClassHappiness
--==========================================================================================================================
INSERT INTO Belief_BuildingClassHappiness	
			(BeliefType, BuildingClassType,					Happiness)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), Happiness
FROM Belief_BuildingClassHappiness WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Belief_BuildingClassHappiness	
			(BeliefType, BuildingClassType,					Happiness)
SELECT		BeliefType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	Happiness
FROM Belief_BuildingClassHappiness WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--==========================================================================================================================	
--==========================================================================================================================	
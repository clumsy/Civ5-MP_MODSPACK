--==========================================================================================================================	
-- Policy_BuildingClassYieldModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldModifiers	
			(PolicyType, BuildingClassType,					YieldType, YieldMod)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Policy_BuildingClassYieldModifiers	
			(PolicyType, BuildingClassType,					YieldType, YieldMod)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	YieldType, YieldMod
FROM Policy_BuildingClassYieldModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--==========================================================================================================================	
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldChanges	
			(PolicyType, BuildingClassType,					YieldType, YieldChange)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Policy_BuildingClassYieldChanges	
			(PolicyType, BuildingClassType,					YieldType, YieldChange)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	YieldType, YieldChange
FROM Policy_BuildingClassYieldChanges WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--==========================================================================================================================	
-- Policy_BuildingClassProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassProductionModifiers	
			(PolicyType, BuildingClassType,					ProductionModifier)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_MUSIC'), ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';

INSERT INTO Policy_BuildingClassProductionModifiers	
			(PolicyType, BuildingClassType,					ProductionModifier)
SELECT		PolicyType, ('BUILDINGCLASS_JFD_CHAPEL_ART'),	ProductionModifier
FROM Policy_BuildingClassProductionModifiers WHERE BuildingClassType = 'BUILDINGCLASS_TEMPLE';
--==========================================================================================================================	
--==========================================================================================================================	
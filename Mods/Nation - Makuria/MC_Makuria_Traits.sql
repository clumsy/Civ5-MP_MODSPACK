--==========================================================================================================================    
-- Building_ResourceYieldChanges
--==========================================================================================================================
INSERT INTO Building_ResourceYieldChanges
            (BuildingType,						ResourceType,    YieldType,				Yield)
SELECT        'BUILDING_MC_BAQT_FAITH_DUMMY',	Type,            'YIELD_FAITH',			1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

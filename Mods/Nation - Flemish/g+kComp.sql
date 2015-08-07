-- cross-compatibility for G+K
-- provided it did not crash, it's g+k or bnw and we're good to go with everything!

-- unit
UPDATE Units
	SET FaithCost = 180, RequiresFaithPurchaseEnabled = 1, Combat = 18, 
	ObsoleteTech = 'TECH_METALLURGY', GoodyHutUpgradeUnitClass = 'UNITCLASS_LANCER'
	WHERE Type='UNIT_GOEDENDAG';

INSERT INTO Unit_ClassUpgrades(UnitType, UnitClassType)
	VALUES('UNIT_GOEDENDAG', 'UNITCLASS_LANCER');

INSERT INTO Unit_FreePromotions(UnitType, PromotionType) 
	VALUES('UNIT_GOEDENDAG', 'PROMOTION_MINOR_ANTI_MOUNTED');


-- buildings
UPDATE BUILDINGS
	SET Defense = 500
	WHERE Type = 'BUILDING_BELFORT';

INSERT INTO Building_YieldChanges(BuildingType, YieldType, Yield)
	VALUES('BUILDING_BELFORT', 'YIELD_CULTURE', 2);

INSERT INTO Building_YieldChanges(BuildingType, YieldType, Yield)
	VALUES('BUILDING_BEGIJNHOF', 'YIELD_FAITH', 1);

INSERT INTO Building_YieldChanges(BuildingType, YieldType, Yield)
	VALUES('BUILDING_FLEMISH_PALACE', 'YIELD_CULTURE', 1);
-- cross-compatibility for vanilla
-- provided it did not crash, it's vanilla and we're good to go with everything!

-- buildings
UPDATE Buildings
	SET Culture = 1
	WHERE TYPE = 'BUILDING_FLEMISH_PALACE';

UPDATE Buildings
	SET Culture = 2, Defense = 300
	WHERE TYPE = 'BUILDING_BELFORT';

INSERT INTO Building_YieldChanges(BuildingType, YieldType, Yield)
	VALUES('BUILDING_BEGIJNHOF', 'YIELD_FOOD', 1);

-- unit
UPDATE Units
	SET Combat = 11, ObsoleteTech = 'TECH_RIFLING', GoodyHutUpgradeUnitClass = 'UNITCLASS_RIFLEMAN'
	WHERE Type='UNIT_GOEDENDAG';

INSERT INTO Unit_ClassUpgrades(UnitType, UnitClassType)
	VALUES('UNIT_GOEDENDAG', 'UNITCLASS_RIFLEMAN');

INSERT INTO Unit_FreePromotions(UnitType, PromotionType) 
	VALUES('UNIT_GOEDENDAG', 'PROMOTION_ANTI_MOUNTED_II');
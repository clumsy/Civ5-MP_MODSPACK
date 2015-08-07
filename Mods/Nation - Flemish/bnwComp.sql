-- cross-compatibility for BNW
-- provided it did not crash, it's bnw and we're good to go with everything!

-- buildings
UPDATE BUILDINGS
	SET TradeRouteRecipientBonus = 2, 
		TradeRouteTargetBonus = 2,
		Help = 'TXT_KEY_BUILDING_BELFORT_BNW_HELP'
	WHERE Type = 'BUILDING_BELFORT';

DELETE FROM Building_YieldChanges
	WHERE BuildingType = 'BUILDING_BELFORT' AND YieldType = 'YIELD_GOLD';

UPDATE Building_YieldChanges
	SET Yield = 2
	WHERE BuildingType = 'BUILDING_BELFORT' AND YieldType = 'YIELD_CULTURE';


/*INSERT INTO Building_SpecialistYieldChanges(BuildingType, SpecialistType, YieldType, Yield)
	VALUES('BUILDING_FLEMISH_PALACE', 'SPECIALIST_WRITER', 'YIELD_GOLD', 3);

INSERT INTO Building_SpecialistYieldChanges(BuildingType, SpecialistType, YieldType, Yield)
	VALUES('BUILDING_FLEMISH_PALACE', 'SPECIALIST_ARTIST', 'YIELD_GOLD', 3);

INSERT INTO Building_SpecialistYieldChanges(BuildingType, SpecialistType, YieldType, Yield)
	VALUES('BUILDING_FLEMISH_PALACE', 'SPECIALIST_MUSICIAN', 'YIELD_GOLD', 3);*/


-- UA
UPDATE BUILDINGS
	SET SpecialistExtraCulture = 0,
		GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT',
		GreatWorkCount = 1
	WHERE Type = 'BUILDING_FLEMISH_PALACE';


UPDATE Traits
	SET Description = 'TXT_KEY_TRAIT_FL_HERITAGE_BNW'
	WHERE Type = 'TRAIT_FL_HERITAGE';


-- flavors
INSERT INTO Leader_Flavors(LeaderType, FlavorType, Flavor)
	VALUES('LEADER_ROBERT', 'FLAVOR_I_LAND_TRADE_ROUTE', 5);
INSERT INTO Leader_Flavors(LeaderType, FlavorType, Flavor)
	VALUES('LEADER_ROBERT', 'FLAVOR_I_SEA_TRADE_ROUTE', 5);
INSERT INTO Leader_Flavors(LeaderType, FlavorType, Flavor)
	VALUES('LEADER_ROBERT', 'FLAVOR_ARCHAEOLOGY', 5);
INSERT INTO Leader_Flavors(LeaderType, FlavorType, Flavor)
	VALUES('LEADER_ROBERT', 'FLAVOR_I_TRADE_ORIGIN', 5);
INSERT INTO Leader_Flavors(LeaderType, FlavorType, Flavor)
	VALUES('LEADER_ROBERT', 'FLAVOR_I_TRADE_DESTINATION', 5);
INSERT INTO Leader_Flavors(LeaderType, FlavorType, Flavor)
	VALUES('LEADER_ROBERT', 'FLAVOR_AIRLIFT', 5);
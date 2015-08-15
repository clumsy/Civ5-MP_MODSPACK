CREATE TABLE IF NOT EXISTS Building_ProvidesAccesstoFreshWater (
  BuildingType text
);

INSERT OR REPLACE INTO Features (TYPE, Description, Civilopedia, Movement, AddsFreshWater, PortraitIndex, IconAtlas)
VALUES ('FEATURE_AQUIFER', 'TXT_KEY_FEATURE_MC_AQUIFER', 'TXT_KEY_FEATURE_MC_AQUIFER_TEXT', 1, 1, 0, 'NEW_TERRAIN_ATLAS_DLC');
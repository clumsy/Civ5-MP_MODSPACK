-- Cart and Worker Together
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_HARAPPA_BULLOCK_CART', 1, 'LooseCivilian');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_HARAPPA_BULLOCK_CART', 'ART_DEF_UNIT_MEMBER_HARAPPA_WORKER', 5);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_HARAPPA_BULLOCK_CART', 'ART_DEF_UNIT_MEMBER_HARAPPA_CART', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_WORKER', 0.140000000596046, 'worker_buddhist.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_CART', 0.11, 'SupplyTrainV2.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_WORKER', 'Idle Death BombardDefend Run', 1);
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_CART', 'Idle Death BombardDefend Run', 1);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_HARAPPA_BULLOCK_CART', 'Unit', 'sv_harappa_mod.dds');

-- Cart Model Alone
--INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
--  VALUES ('ART_DEF_UNIT_HARAPPA_CART', 1);
--INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
--  VALUES ('ART_DEF_UNIT_HARAPPA_CART', 'ART_DEF_UNIT_MEMBER_HARAPPA_CART', 1);
--INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
--  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_CART', 0.119999997317791, 'SupplyTrainV2.fxsxml', 'CLOTH', 'FLESH');
--INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
--  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_CART', 'Idle Death BombardDefend Run', 1);
--INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
--  VALUES ('ART_DEF_UNIT_HARAPPA_CART', 'Unit', 'sv_harappa_mod.dds');

-- Worker Model Alone
--INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
--  VALUES ('ART_DEF_UNIT_HARAPPA_WORKER', 1, 'LooseCivilian');
--INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
--  VALUES ('ART_DEF_UNIT_HARAPPA_WORKER', 'ART_DEF_UNIT_MEMBER_HARAPPA_WORKER', 8);
--INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
--  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_WORKER', 0.140000000596046, 'worker_buddhist.fxsxml', 'CLOTH', 'FLESH');
--INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasRefaceAfterCombat)
--  VALUES ('ART_DEF_UNIT_MEMBER_HARAPPA_WORKER', 'Idle Death BombardDefend Run', 1);
--INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
--  VALUES ('ART_DEF_UNIT_HARAPPA_WORKER', 'Unit', 'sv_harappa_mod.dds');
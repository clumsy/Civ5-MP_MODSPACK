INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_RUS_DRUZHINA_MOD', 1, 'DefaultMelee');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_RUS_DRUZHINA_MOD', 'ART_DEF_UNIT_MEMBER_RUS_DRUZHINA_MOD', 12);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_RUS_DRUZHINA_MOD', 0.140000000596046, 'Druzhina.fxsxml', 'ARMOR', 'ARMOR');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_RUS_DRUZHINA_MOD', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_RUS_DRUZHINA_MOD', 0, 0, 'METAL', 'SWORD');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_RUS_DRUZHINA_MOD', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
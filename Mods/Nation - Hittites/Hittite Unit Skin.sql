INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD', 1, 'TwoBigGuns');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD', 'ART_DEF_UNIT_MEMBER_HITTITE_CHARIOT_MOD', 2);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_HITTITE_CHARIOT_MOD', 0.144999995827675, 'Hititte_War_Chariot.fxsxml', 'CLOTH', 'WOODSM');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_HITTITE_CHARIOT_MOD', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_HITTITE_CHARIOT_MOD', 0, 0, 'METAL', 'SWORD');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_HITTITE_CHARIOT_MOD', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_U_EGYPTIAN_WARCHARIOT_ALT', 1, 'ChariotElephant');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_U_EGYPTIAN_WARCHARIOT_ALT', 'ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT_ALT', 2);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT_ALT', 0.129999995231628, 'Assets/Units/U_Egyptian_WarChariot/U_Egyptian_WarChariot.fxsxml', 'CLOTH', 'WOODSM');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT_ALT', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT_ALT', 0, 0, 'ARROW', 'ARROW', 10.0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_U_EGYPTIAN_WARCHARIOT_ALT', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);

--INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
--  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD_ALT', 1, 'ChariotElephant');
--INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
--  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD_ALT', 'ART_DEF_UNIT_HITTITE_CHARIOT_MOD_MEMBER_ALT', 2);
--INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
--  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD_MEMBER_ALT', 0.129999995231628, 'Chariot_Babylon.fxsxml', 'CLOTH', 'WOODSM');
--INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
--  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD_MEMBER_ALT', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1, 1);
--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
--  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD_MEMBER_ALT', 0, 0, 'ARROW', 'ARROW', 10.0);
--INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
--  VALUES ('ART_DEF_UNIT_HITTITE_CHARIOT_MOD_MEMBER_ALT', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);


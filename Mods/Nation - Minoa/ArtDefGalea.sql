INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
    SELECT  ('ART_DEF_UNIT_MC_MINOAN_GALEA'), 3, Formation
    FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_TRIREME');
     
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES    ('ART_DEF_UNIT_MC_MINOAN_GALEA', 'ART_DEF_UNIT_MEMBER_MC_MINOAN_GALEA', "1");
     
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
    SELECT  ('ART_DEF_UNIT_MEMBER_MC_MINOAN_GALEA'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
    FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
    SELECT ('ART_DEF_UNIT_MEMBER_MC_MINOAN_GALEA'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
    FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
 
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
    SELECT  ('ART_DEF_UNIT_MEMBER_MC_MINOAN_GALEA'), Scale, ZOffset, Domain, ('minoan_galea.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
    FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_TRIREME');
 
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
    SELECT  ('ART_DEF_UNIT_MC_MINOAN_GALEA'), TileType, 'sv_galea.dds'
    FROM ArtDefine_StrategicView WHERE (StrategicViewType = 'ART_DEF_UNIT_TRIREME');
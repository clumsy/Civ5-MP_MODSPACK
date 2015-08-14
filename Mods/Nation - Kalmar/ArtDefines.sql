--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================           
INSERT INTO ArtDefine_UnitInfos
            (Type,                              DamageStates,   Formation)
SELECT      ('ART_DEF_UNIT_BALTIC_WARSHIP'),       DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE  (Type = 'ART_DEF_UNIT_GALLEASS');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitInfoMemberInfos  
            (UnitInfoType,                      UnitMemberInfoType,                     NumMembers)
SELECT      ('ART_DEF_UNIT_BALTIC_WARSHIP'),       ('ART_DEF_UNIT_MEMBER_BALTIC_WARSHIP'),    NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GALLEASS');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats
            (UnitMemberType,                        EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT      ('ART_DEF_UNIT_MEMBER_BALTIC_WARSHIP'),    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons  
            (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_BALTIC_WARSHIP'),    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================   
INSERT INTO ArtDefine_UnitMemberInfos  
            (Type,                                  Scale, ZOffset, Domain, Model,                  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT      ('ART_DEF_UNIT_MEMBER_BALTIC_WARSHIP'),    Scale, ZOffset, Domain, ('WarGalleonDanish.fxsxml'),   MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GALLEASS');
--==========================================================================================================================
--==========================================================================================================================
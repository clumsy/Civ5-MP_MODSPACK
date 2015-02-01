--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_JAEGER', 	'Unit', 	'sv_Jaeger.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitInfos 
			(Type,							DamageStates, Formation)
SELECT		('ART_DEF_UNIT_JFD_JAEGER'),	DamageStates, Formation
FROM "ArtDefine_UnitInfos" WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos 
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_JFD_JAEGER'),	('ART_DEF_UNIT_MEMBER_JFD_JAEGER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_JAEGER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_JAEGER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_JAEGER'),	Scale, ZOffset, Domain, ('jaeger.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================	
-- IconTextureAtlases
--==========================================================================================================================	
INSERT OR REPLACE INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_JAEGER_ATLAS', 						256, 		'JFD_Jaeger_256.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						128, 		'JFD_Jaeger_128.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						80, 		'JFD_Jaeger_80.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						45, 		'JFD_Jaeger_45.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						64, 		'JFD_Jaeger_64.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						32, 		'JFD_Jaeger_32.dds',					1, 				1),
			('UNITS_JFD_JAEGER_FLAG_ATLAS', 		32, 		'Unit_Jaeger_Flag_32.dds',				1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
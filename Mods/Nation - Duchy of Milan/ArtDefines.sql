--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 			TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_RIBAULT',	'Unit',		'sv_Ribault.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT OR REPLACE INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_RIBAULT'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GATLINGGUN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_RIBAULT'),	('ART_DEF_UNIT_MEMBER_JFD_RIBAULT'), 	3
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GATLINGGUN');
--==========================================================================================================================	
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_RIBAULT'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GATLINGGUN');
--==========================================================================================================================	
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_RIBAULT'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GATLINGGUN');
--==========================================================================================================================	
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================		
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_RIBAULT'),	Scale,	ZOffset, Domain, ('VolleyGun.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GATLINGGUN');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_MILAN_ATLAS', 				256, 		'JFD_MilanAtlas_256.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				128, 		'JFD_MilanAtlas_128.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				80, 		'JFD_MilanAtlas_80.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				64, 		'JFD_MilanAtlas_64.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				45, 		'JFD_MilanAtlas_45.dds',			2, 				2),
			('JFD_MILAN_ATLAS', 				32, 		'JFD_MilanAtlas_32.dds',			2, 				2),
			('JFD_MILAN_ALPHA_ATLAS', 			128, 		'JFD_MilanAlphaAtlas_128.dds',		1,				1),
			('JFD_MILAN_ALPHA_ATLAS', 			80, 		'JFD_MilanAlphaAtlas_80.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			64, 		'JFD_MilanAlphaAtlas_64.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			48, 		'JFD_MilanAlphaAtlas_48.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			45, 		'JFD_MilanAlphaAtlas_45.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			32, 		'JFD_MilanAlphaAtlas_32.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			24, 		'JFD_MilanAlphaAtlas_24.dds',		1, 				1),
			('JFD_MILAN_ALPHA_ATLAS', 			16, 		'JFD_MilanAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_RIBAULT_ATLAS', 	32, 		'JFD_RibaultUnitFlag_32.dds',		1, 				1);
--==========================================================================================================================
--==========================================================================================================================

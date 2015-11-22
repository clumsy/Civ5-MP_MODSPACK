--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_OPOLCHENIYE', 		'Unit', 	'sv_Opolcheniye.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_OPOLCHENIYE'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_OPOLCHENIYE'),		('ART_DEF_UNIT_MEMBER_JFD_OPOLCHENIYE'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_OPOLCHENIYE'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_OPOLCHENIYE'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_OPOLCHENIYE'),	Scale,	ZOffset, Domain, ('rusgw1.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_RUSSIA_NICHOLAS_ATLAS', 			256, 		'JFD_RussiaNicholasAtlas_256.dds',			2, 				2),
			('JFD_RUSSIA_NICHOLAS_ATLAS', 			128, 		'JFD_RussiaNicholasAtlas_128.dds',			2, 				2),
			('JFD_RUSSIA_NICHOLAS_ATLAS', 			80, 		'JFD_RussiaNicholasAtlas_80.dds',			2, 				2),
			('JFD_RUSSIA_NICHOLAS_ATLAS', 			64, 		'JFD_RussiaNicholasAtlas_64.dds',			2, 				2),
			('JFD_RUSSIA_NICHOLAS_ATLAS', 			45, 		'JFD_RussiaNicholasAtlas_45.dds',			2, 				2),
			('JFD_RUSSIA_NICHOLAS_ATLAS', 			32, 		'JFD_RussiaNicholasAtlas_32.dds',			2, 				2),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	128, 		'JFD_RussiaNicholasAlphaAtlas_128.dds',		1,				1),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	80, 		'JFD_RussiaNicholasAlphaAtlas_80.dds',		1, 				1),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	64, 		'JFD_RussiaNicholasAlphaAtlas_64.dds',		1, 				1),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	48, 		'JFD_RussiaNicholasAlphaAtlas_48.dds',		1, 				1),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	45, 		'JFD_RussiaNicholasAlphaAtlas_45.dds',		1, 				1),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	32, 		'JFD_RussiaNicholasAlphaAtlas_32.dds',		1, 				1),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	24, 		'JFD_RussiaNicholasAlphaAtlas_24.dds',		1, 				1),
			('JFD_RUSSIA_NICHOLAS_ALPHA_ATLAS', 	16, 		'JFD_RussiaNicholasAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_OPOLCHENIYE_ATLAS', 	32, 		'JFD_OpolcheniyeUnitFlag_32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================

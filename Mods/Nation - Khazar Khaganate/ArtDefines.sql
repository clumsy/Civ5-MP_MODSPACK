--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_KHAGAN_BEK', 	'Unit', 	'sv_KhaghanBek.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_KHAGAN_BEK'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_KHAGAN_BEK'), 	('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'), 	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_KHAGAN_BEK'),	Scale,	ZOffset, Domain, ('Knight_Turkey.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_KHAZARIA_ATLAS', 					256, 		'JFD_KhazariaAtlas_256.dds',			2, 				2),
			('JFD_KHAZARIA_ATLAS', 					128, 		'JFD_KhazariaAtlas_128.dds',			2, 				2),
			('JFD_KHAZARIA_ATLAS', 					80, 		'JFD_KhazariaAtlas_80.dds',				2, 				2),
			('JFD_KHAZARIA_ATLAS', 					64, 		'JFD_KhazariaAtlas_64.dds',				2, 				2),
			('JFD_KHAZARIA_ATLAS', 					45, 		'JFD_KhazariaAtlas_45.dds',				2, 				2),
			('JFD_KHAZARIA_ATLAS', 					32, 		'JFD_KhazariaAtlas_32.dds',				2, 				2),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			128, 		'JFD_KhazariaAlphaAtlas_128.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			80, 		'JFD_KhazariaAlphaAtlas_80.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			64, 		'JFD_KhazariaAlphaAtlas_64.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			48, 		'JFD_KhazariaAlphaAtlas_48.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			45, 		'JFD_KhazariaAlphaAtlas_45.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			32, 		'JFD_KhazariaAlphaAtlas_32.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			24, 		'JFD_KhazariaAlphaAtlas_24.dds',		1, 				1),
			('JFD_KHAZARIA_ALPHA_ATLAS', 			16, 		'JFD_KhazariaAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_KHAGAN_BEK_ATLAS', 		32, 		'Unit_KhaganBek_Flag_32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================

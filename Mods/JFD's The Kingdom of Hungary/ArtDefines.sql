--==========================================================================================================================	
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_HUSSAR', 			'Unit', 	'sv_Hungarian_Hussar.dds');
--==========================================================================================================================	
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfos 
			(Type,						 DamageStates, Formation)
SELECT		('ART_DEF_UNIT_JFD_HUSSAR'), DamageStates, Formation
FROM "ArtDefine_UnitInfos" WHERE (Type = 'ART_DEF_UNIT_CAVALRY');

INSERT INTO ArtDefine_UnitInfoMemberInfos 
			(UnitInfoType,				UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_JFD_HUSSAR'), ('ART_DEF_UNIT_MEMBER_JFD_HUSSAR'), NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CAVALRY');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HUSSAR'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HUSSAR'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HUSSAR'),	Scale, ZOffset, Domain, ('hunhu1.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CAVALRY');
--==========================================================================================================================	
-- IconTextureAtlases
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_HUNGARY_ATLAS', 					256, 		'JFD_HungaryAtlas_256.dds',				2, 				2),
			('JFD_HUNGARY_ATLAS', 					128, 		'JFD_HungaryAtlas_128.dds',				2, 				2),
			('JFD_HUNGARY_ATLAS', 					80, 		'JFD_HungaryAtlas_80.dds',				2, 				2),
			('JFD_HUNGARY_ATLAS', 					64, 		'JFD_HungaryAtlas_64.dds',				2, 				2),
			('JFD_HUNGARY_ATLAS', 					45, 		'JFD_HungaryAtlas_45.dds',				2, 				2),
			('JFD_HUNGARY_ATLAS', 					32, 		'JFD_HungaryAtlas_32.dds',				2, 				2),
			('JFD_HUNGARY_ALPHA_ATLAS', 			128, 		'JFD_HungaryAlphaAtlas_128.dds',		2, 				2),
			('JFD_HUNGARY_ALPHA_ATLAS', 			80, 		'JFD_HungaryAlphaAtlas_80.dds',			1, 				1),
			('JFD_HUNGARY_ALPHA_ATLAS', 			64, 		'JFD_HungaryAlphaAtlas_64.dds',			1, 				1),
			('JFD_HUNGARY_ALPHA_ATLAS', 			48, 		'JFD_HungaryAlphaAtlas_48.dds',			1, 				1),
			('JFD_HUNGARY_ALPHA_ATLAS', 			45, 		'JFD_HungaryAlphaAtlas_45.dds',			1, 				1),
			('JFD_HUNGARY_ALPHA_ATLAS', 			32, 		'JFD_HungaryAlphaAtlas_32.dds',			1, 				1),
			('JFD_HUNGARY_ALPHA_ATLAS', 			24, 		'JFD_HungaryAlphaAtlas_24.dds',			1, 				1),
			('JFD_HUNGARY_ALPHA_ATLAS', 			16, 		'JFD_HungaryAlphaAtlas_16.dds',			1, 				1),
			('UNITS_HUNGARIAN_HUSSAR_FLAG_ATLAS', 	32, 		'Unit_Hungarian_Hussar_Flag_32.dds',	1, 				1);		
--==========================================================================================================================	
--==========================================================================================================================	
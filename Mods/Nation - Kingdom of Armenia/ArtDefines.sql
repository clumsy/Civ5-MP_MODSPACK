--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_MAMIKONIAN', 	'Unit', 	'sv_Mamikonian.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_MAMIKONIAN'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_MAMIKONIAN'), 	('ART_DEF_UNIT_MEMBER_JFD_MAMIKONIAN'), 	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_MAMIKONIAN'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_MAMIKONIAN'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_MAMIKONIAN'),	Scale,	ZOffset, Domain, ('mamikonian.fxsxml'),		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_ARMENIA_PROMOTION_ATLAS', 		256, 		'JFD_ArmeniaPromotions256.dds',			1, 				1),
			('JFD_ARMENIA_PROMOTION_ATLAS', 		64, 		'JFD_ArmeniaPromotions64.dds',			1, 				1),
			('JFD_ARMENIA_PROMOTION_ATLAS', 		45, 		'JFD_ArmeniaPromotions45.dds',			1, 				1),
			('JFD_ARMENIA_PROMOTION_ATLAS', 		32, 		'JFD_ArmeniaPromotions32.dds',			1, 				1),
			('JFD_ARMENIA_ATLAS', 					256, 		'JFD_ArmeniaAtlas_256.dds',				8, 				2),
			('JFD_ARMENIA_ATLAS', 					128, 		'JFD_ArmeniaAtlas_128.dds',				8, 				2),
			('JFD_ARMENIA_ATLAS', 					80, 		'JFD_ArmeniaAtlas_80.dds',				8, 				2),
			('JFD_ARMENIA_ATLAS', 					64, 		'JFD_ArmeniaAtlas_64.dds',				8, 				2),
			('JFD_ARMENIA_ATLAS', 					45, 		'JFD_ArmeniaAtlas_45.dds',				8, 				2),
			('JFD_ARMENIA_ATLAS', 					32, 		'JFD_ArmeniaAtlas_32.dds',				8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			128, 		'JFD_ArmeniaAlphaAtlas_128.dds',		8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			80, 		'JFD_ArmeniaAlphaAtlas_80.dds',			8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			64, 		'JFD_ArmeniaAlphaAtlas_64.dds',			8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			48, 		'JFD_ArmeniaAlphaAtlas_48.dds',			8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			45, 		'JFD_ArmeniaAlphaAtlas_45.dds',			8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			32, 		'JFD_ArmeniaAlphaAtlas_32.dds',			8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			24, 		'JFD_ArmeniaAlphaAtlas_24.dds',			8, 				2),
			('JFD_ARMENIA_ALPHA_ATLAS', 			16, 		'JFD_ArmeniaAlphaAtlas_16.dds',			8, 				2),
			('JFD_UNIT_FLAG_MAMIKONIAN_ATLAS', 		32, 		'Unit_Mamikonian_Flag_32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================

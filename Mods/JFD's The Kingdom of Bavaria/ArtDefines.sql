--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_HARTSCHIER', 	'Unit', 	'sv_Hartschier.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_HARTSCHIER'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_HARTSCHIER'),	('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_HARTSCHIER'),	Scale,	ZOffset, Domain, ('hartschier.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_SCHLOSS_ATLAS', 				256, 		'SchlossIcon256.dds',				1, 				2),
			('JFD_SCHLOSS_ATLAS', 				64, 		'SchlossIcon64.dds',				1, 				2),
			('JFD_SCHLOSS_ATLAS', 				45, 		'SchlossIcon45.dds',				1, 				2),
			('JFD_BAVARIA_ATLAS', 				256, 		'JFD_BavariaAtlas_256.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				128, 		'JFD_BavariaAtlas_128.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				80, 		'JFD_BavariaAtlas_80.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				64, 		'JFD_BavariaAtlas_64.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				45, 		'JFD_BavariaAtlas_45.dds',			2, 				2),
			('JFD_BAVARIA_ATLAS', 				32, 		'JFD_BavariaAtlas_32.dds',			2, 				2),
			('JFD_BAVARIA_ALPHA_ATLAS', 		128, 		'JFD_BavariaAlphaAtlas_128.dds',	1,				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		80, 		'JFD_BavariaAlphaAtlas_80.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		64, 		'JFD_BavariaAlphaAtlas_64.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		48, 		'JFD_BavariaAlphaAtlas_48.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		45, 		'JFD_BavariaAlphaAtlas_45.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		32, 		'JFD_BavariaAlphaAtlas_32.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		24, 		'JFD_BavariaAlphaAtlas_24.dds',		1, 				1),
			('JFD_BAVARIA_ALPHA_ATLAS', 		16, 		'JFD_BavariaAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_HARTSCHIER_ATLAS', 	32, 		'JFD_HartschierUnitFlag_32.dds',	1, 				1);
--==========================================================================================================================
--==========================================================================================================================

--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_SAMOGITIAN', 	'Unit', 	'sv_Samogitian.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_SAMOGITIAN'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_SAMOGITIAN'), 	('ART_DEF_UNIT_MEMBER_JFD_SAMOGITIAN'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SAMOGITIAN'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SAMOGITIAN'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SAMOGITIAN'),	Scale,	ZOffset, Domain, ('Samogitian_Warrior.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_LITHUANIA_ATLAS', 				256, 		'JFD_LithuaniaAtlas_256.dds',				2, 				2),
			('JFD_LITHUANIA_ATLAS', 				128, 		'JFD_LithuaniaAtlas_128.dds',				2, 				2),
			('JFD_LITHUANIA_ATLAS', 				80, 		'JFD_LithuaniaAtlas_80.dds',				2, 				2),
			('JFD_LITHUANIA_ATLAS', 				64, 		'JFD_LithuaniaAtlas_64.dds',				2, 				2),
			('JFD_LITHUANIA_ATLAS', 				45, 		'JFD_LithuaniaAtlas_45.dds',				2, 				2),
			('JFD_LITHUANIA_ATLAS', 				32, 		'JFD_LithuaniaAtlas_32.dds',				2, 				2),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			128, 		'JFD_LithuaniaAlphaAtlas_128.dds',			1, 				1),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			80, 		'JFD_LithuaniaAlphaAtlas_80.dds',			1, 				1),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			64, 		'JFD_LithuaniaAlphaAtlas_64.dds',			1, 				1),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			48, 		'JFD_LithuaniaAlphaAtlas_48.dds',			1, 				1),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			45, 		'JFD_LithuaniaAlphaAtlas_45.dds',			1, 				1),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			32, 		'JFD_LithuaniaAlphaAtlas_32.dds',			1, 				1),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			24, 		'JFD_LithuaniaAlphaAtlas_24.dds',			1, 				1),
			('JFD_LITHUANIA_ALPHA_ATLAS', 			16, 		'JFD_LithuaniaAlphaAtlas_16.dds',			1, 				1),
			('JFD_UNIT_FLAG_SAMOGITIAN_ATLAS', 		32, 		'Unit_Samogitian_Flag_32.dds',				1, 				1);
--==========================================================================================================================
--==========================================================================================================================

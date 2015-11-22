--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_STRELTSY', 			'Unit', 	'sv_Streltsy.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_STRELTSY'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_OTTOMAN_JANISSARY');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_STRELTSY'),			('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_OTTOMAN_JANISSARY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),		Scale,	ZOffset, Domain, ('Streltsy_blue_cap.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_RUSSIA_ATLAS', 					256, 		'JFD_RussiaPeterAtlas_256.dds',			2, 				2),
			('JFD_RUSSIA_ATLAS', 					128, 		'JFD_RussiaPeterAtlas_128.dds',			2, 				2),
			('JFD_RUSSIA_ATLAS', 					80, 		'JFD_RussiaPeterAtlas_80.dds',			2, 				2),
			('JFD_RUSSIA_ATLAS', 					64, 		'JFD_RussiaPeterAtlas_64.dds',			2, 				2),
			('JFD_RUSSIA_ATLAS', 					45, 		'JFD_RussiaPeterAtlas_45.dds',			2, 				2),
			('JFD_RUSSIA_ATLAS', 					32, 		'JFD_RussiaPeterAtlas_32.dds',			2, 				2),
			('JFD_RUSSIA_ALPHA_ATLAS', 				128, 		'JFD_RussiaPeterAlphaAtlas_128.dds',	1, 				1),
			('JFD_RUSSIA_ALPHA_ATLAS', 				80, 		'JFD_RussiaPeterAlphaAtlas_80.dds',		1, 				1),
			('JFD_RUSSIA_ALPHA_ATLAS', 				64, 		'JFD_RussiaPeterAlphaAtlas_64.dds',		1, 				1),
			('JFD_RUSSIA_ALPHA_ATLAS', 				48, 		'JFD_RussiaPeterAlphaAtlas_48.dds',		1, 				1),
			('JFD_RUSSIA_ALPHA_ATLAS', 				45, 		'JFD_RussiaPeterAlphaAtlas_45.dds',		1, 				1),
			('JFD_RUSSIA_ALPHA_ATLAS', 				32, 		'JFD_RussiaPeterAlphaAtlas_32.dds',		1, 				1),
			('JFD_RUSSIA_ALPHA_ATLAS', 				24, 		'JFD_RussiaPeterAlphaAtlas_24.dds',		1, 				1),
			('JFD_RUSSIA_ALPHA_ATLAS', 				16, 		'JFD_RussiaPeterAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_STRELTSY_ATLAS', 		32, 		'JFD_StreltsyUnitFlag_32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================

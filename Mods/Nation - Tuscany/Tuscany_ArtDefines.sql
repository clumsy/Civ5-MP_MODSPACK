--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 							TileType,	Asset)
VALUES		('ART_DEF_UNIT_TUSCAN_CONDOTTIERE', 			'Unit', 	'sv_Condottiere.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 											DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_TUSCAN_CONDOTTIERE'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_KNIGHT');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,									UnitMemberInfoType,								NumMembers)
SELECT		('ART_DEF_UNIT_TUSCAN_CONDOTTIERE'),			('ART_DEF_UNIT_MEMBER_TUSCAN_CONDOTTIERE'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_KNIGHT');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_TUSCAN_CONDOTTIERE'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_TUSCAN_CONDOTTIERE'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 											Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_TUSCAN_CONDOTTIERE'),		Scale,	ZOffset, Domain, ('condottiere.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_KNIGHT');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('TUSCANY_ATLAS', 							256, 		'Tuscany_256.dds',						3, 				2),
			('TUSCANY_ATLAS', 							128, 		'Tuscany_128.dds',						3, 				2),
			('TUSCANY_ATLAS', 							80, 		'Tuscany_80.dds',						3, 				2),
			('TUSCANY_ATLAS', 							64, 		'Tuscany_64.dds',						3, 				2),
			('TUSCANY_ATLAS', 							45, 		'Tuscany_45.dds',						3, 				2),
			('TUSCANY_ATLAS', 							32, 		'Tuscany_32.dds',						3, 				2),
			('TUSCANY_ALPHA_ATLAS', 					128, 		'TuscanyAlpha_128.dds',					1, 				1),
			('TUSCANY_ALPHA_ATLAS', 					80, 		'TuscanyAlpha_80.dds',					1, 				1),
			('TUSCANY_ALPHA_ATLAS', 					64, 		'TuscanyAlpha_64.dds',					1, 				1),
			('TUSCANY_ALPHA_ATLAS', 					48, 		'TuscanyAlpha_48.dds',					1, 				1),
			('TUSCANY_ALPHA_ATLAS', 					45, 		'TuscanyAlpha_45.dds',					1, 				1),
			('TUSCANY_ALPHA_ATLAS', 					32, 		'TuscanyAlpha_32.dds',					1, 				1),
			('TUSCANY_ALPHA_ATLAS', 					24, 		'TuscanyAlpha_24.dds',					1, 				1),
			('TUSCANY_ALPHA_ATLAS', 					16, 		'TuscanyAlpha_16.dds',					1, 				1),
			('UNIT_FLAG_TUSCAN_CONDOTTIERE_ATLAS', 		32, 		'CondottiereFlag.dds',					1, 				1);
--==========================================================================================================================
--==========================================================================================================================
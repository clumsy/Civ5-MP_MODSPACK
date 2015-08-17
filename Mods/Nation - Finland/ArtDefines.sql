--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('HYPEREON_FINNS_ATLAS', 					256, 		'Hypereon_FinnsIconAtlas256.dds',				4, 				4),
			('HYPEREON_FINNS_ATLAS', 					128, 		'Hypereon_FinnsIconAtlas128.dds',				4, 				4),
			('HYPEREON_FINNS_ATLAS', 					80, 		'Hypereon_FinnsIconAtlas80.dds',				4, 				4),
			('HYPEREON_FINNS_ATLAS', 					64, 		'Hypereon_FinnsIconAtlas64.dds',				4, 				4),
			('HYPEREON_FINNS_ATLAS', 					45, 		'Hypereon_FinnsIconAtlas45.dds',				4, 				4),
			('HYPEREON_FINNS_ATLAS', 					32, 		'Hypereon_FinnsIconAtlas32.dds',				4, 				4),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		128, 		'FinnsAlphaAtlas_128.dds',	2, 				2),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		80, 		'FinnsAlphaAtlas_80.dds',		1, 				1),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		64, 		'FinnsAlphaAtlas_64.dds',		1, 				1),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		48, 		'FinnsAlphaAtlas_48.dds',		1, 				1),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		45, 		'FinnsAlphaAtlas_45.dds',		1, 				1),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		32, 		'FinnsAlphaAtlas_32.dds',		1, 				1),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		24, 		'FinnsAlphaAtlas_24.dds',		1, 				1),
			('HYPEREON_FINNS_ALPHA_ATLAS', 		16, 		'FinnsAlphaAtlas_16.dds',		1, 				1),
			('HYPEREON_UNIT_FLAG_RUNE_SINGER_ATLAS', 		32, 		'flag_RuneSinger_32.dds',				1, 				1),
			('HYPEREON_UNIT_FLAG_SISSI_ATLAS', 		32, 		'flag_Sissi_32.dds',				1, 				1);
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_FINNIC_RUNE_SINGER', 	'Unit', 	'sv_RuneSinger.dds'),
			('ART_DEF_UNIT_FINNISH_FOREST_PATROL', 	'Unit', 	'sv_Sissi.dds');

--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfos 
			(Type,								DamageStates, Formation)
SELECT		('ART_DEF_UNIT_FINNISH_SISSI'),		DamageStates, Formation
FROM "ArtDefine_UnitInfos" WHERE (Type = 'ART_DEF_UNIT_MARINE');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 						DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_FINNIC_RUNE_SINGER'), DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	(Type = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfoMemberInfos 
			(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_FINNISH_SISSI'), ('ART_DEF_UNIT_MEMBER_FINNISH_SISSI'), 8
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MARINE');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_FINNIC_RUNE_SINGER'), 		('ART_DEF_UNIT_MEMBER_FINNIC_RUNE_SINGER'),	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_FINNISH_SISSI'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_FINNISH_SISSI'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_FINNISH_SISSI'),	Scale, ZOffset, Domain, ('sissi.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PARATROOPER');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_FINNIC_RUNE_SINGER'),	Scale,	ZOffset, Domain, ('runesinger.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_EUROMALE45');




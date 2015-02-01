--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_CHASSEUR', 			'Unit', 	'sv_Chasseur.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_CHASSEUR'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_CHASSEUR'),			('ART_DEF_UNIT_MEMBER_JFD_CHASSEUR'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_CHASSEUR'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_CHASSEUR'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_CHASSEUR'),		Scale,	ZOffset, Domain, ('civ5_swerm1.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_BELGIUM_ATLAS', 					256, 		'JFD_BelgiumAtlas_256.dds',				3, 				2),
			('JFD_BELGIUM_ATLAS', 					128, 		'JFD_BelgiumAtlas_128.dds',				3, 				2),
			('JFD_BELGIUM_ATLAS', 					80, 		'JFD_BelgiumAtlas_80.dds',				3, 				2),
			('JFD_BELGIUM_ATLAS', 					64, 		'JFD_BelgiumAtlas_64.dds',				3, 				2),
			('JFD_BELGIUM_ATLAS', 					45, 		'JFD_BelgiumAtlas_45.dds',				3, 				2),
			('JFD_BELGIUM_ATLAS', 					32, 		'JFD_BelgiumAtlas_32.dds',				3, 				2),
			('JFD_BELGIUM_ALPHA_ATLAS', 			128, 		'JFD_BelgiumAlphaAtlas_128.dds',		1, 				1),
			('JFD_BELGIUM_ALPHA_ATLAS', 			80, 		'JFD_BelgiumAlphaAtlas_80.dds',			1, 				1),
			('JFD_BELGIUM_ALPHA_ATLAS', 			64, 		'JFD_BelgiumAlphaAtlas_64.dds',			1, 				1),
			('JFD_BELGIUM_ALPHA_ATLAS', 			48, 		'JFD_BelgiumAlphaAtlas_48.dds',			1, 				1),
			('JFD_BELGIUM_ALPHA_ATLAS', 			45, 		'JFD_BelgiumAlphaAtlas_45.dds',			1, 				1),
			('JFD_BELGIUM_ALPHA_ATLAS', 			32, 		'JFD_BelgiumAlphaAtlas_32.dds',			1, 				1),
			('JFD_BELGIUM_ALPHA_ATLAS', 			24, 		'JFD_BelgiumAlphaAtlas_24.dds',			1, 				1),
			('JFD_BELGIUM_ALPHA_ATLAS', 			16, 		'JFD_BelgiumAlphaAtlas_16.dds',			1, 				1),
			('JFD_UNIT_FLAG_CHASSEUR_ATLAS', 		32, 		'JFD_ChasseurUnitFlag_32.dds',			1, 				1);
--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures 
			(IconFontTexture, 								IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_JFD_PRALINE', 				'JFD_PralineFontIcons_22');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping 
			(IconName, 						IconFontTexture,							IconMapping)
VALUES		('ICON_RES_JFD_PRALINE', 		'ICON_FONT_TEXTURE_JFD_PRALINE',			1);
--==========================================================================================================================
--==========================================================================================================================

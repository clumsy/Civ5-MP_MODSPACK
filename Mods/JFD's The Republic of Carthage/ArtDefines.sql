--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_SHOPHET', 		'Unit', 	'sv_Shophet.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_SHOPHET'), 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_SHOPHET'), 		('ART_DEF_UNIT_MEMBER_JFD_SHOPHET'), 		1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SHOPHET'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SHOPHET'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SHOPHET'),	Scale,	ZOffset, Domain, ('Knight_Greece.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT OR REPLACE INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_CARTHAGE_HANNIBAL_ATLAS', 		256, 		'JFD_CarthageHannibalAtlas_256.dds',		2, 				2),
			('JFD_CARTHAGE_HANNIBAL_ATLAS', 		128, 		'JFD_CarthageHannibalAtlas_128.dds',		2, 				2),
			('JFD_CARTHAGE_HANNIBAL_ATLAS', 		80, 		'JFD_CarthageHannibalAtlas_80.dds',			2, 				2),
			('JFD_CARTHAGE_HANNIBAL_ATLAS', 		64, 		'JFD_CarthageHannibalAtlas_64.dds',			2, 				2),
			('JFD_CARTHAGE_HANNIBAL_ATLAS', 		45, 		'JFD_CarthageHannibalAtlas_45.dds',			2, 				2),
			('JFD_CARTHAGE_HANNIBAL_ATLAS', 		32, 		'JFD_CarthageHannibalAtlas_32.dds',			2,				2),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	128, 		'JFD_CarthageHannibalAlphaAtlas_128.dds',	1, 				1),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	80, 		'JFD_CarthageHannibalAlphaAtlas_80.dds',	1, 				1),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	64, 		'JFD_CarthageHannibalAlphaAtlas_64.dds',	1, 				1),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	48, 		'JFD_CarthageHannibalAlphaAtlas_48.dds',	1, 				1),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	45, 		'JFD_CarthageHannibalAlphaAtlas_45.dds',	1, 				1),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	32, 		'JFD_CarthageHannibalAlphaAtlas_32.dds',	1, 				1),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	24, 		'JFD_CarthageHannibalAlphaAtlas_24.dds',	1, 				1),
			('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	16, 		'JFD_CarthageHannibalAlphaAtlas_16.dds',	1, 				1),
			('JFD_CARTHAGE_DIDO_ATLAS', 			256, 		'JFD_CarthageDidoAtlas_256.dds',			2, 				2),
			('JFD_CARTHAGE_DIDO_ATLAS', 			128, 		'JFD_CarthageDidoAtlas_128.dds',			2, 				2),
			('JFD_CARTHAGE_DIDO_ATLAS', 			80, 		'JFD_CarthageDidoAtlas_80.dds',				2, 				2),
			('JFD_CARTHAGE_DIDO_ATLAS', 			64, 		'JFD_CarthageDidoAtlas_64.dds',				2, 				2),
			('JFD_CARTHAGE_DIDO_ATLAS', 			45, 		'JFD_CarthageDidoAtlas_45.dds',				2, 				2),
			('JFD_CARTHAGE_DIDO_ATLAS', 			32, 		'JFD_CarthageDidoAtlas_32.dds',				2,				2),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		128, 		'JFD_CarthageDidoAlphaAtlas_128.dds',		1, 				1),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		80, 		'JFD_CarthageDidoAlphaAtlas_80.dds',		1, 				1),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		64, 		'JFD_CarthageDidoAlphaAtlas_64.dds',		1, 				1),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		48, 		'JFD_CarthageDidoAlphaAtlas_48.dds',		1, 				1),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		45, 		'JFD_CarthageDidoAlphaAtlas_45.dds',		1, 				1),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		32, 		'JFD_CarthageDidoAlphaAtlas_32.dds',		1, 				1),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		24, 		'JFD_CarthageDidoAlphaAtlas_24.dds',		1, 				1),
			('JFD_CARTHAGE_DIDO_ALPHA_ATLAS', 		16, 		'JFD_CarthageDidoAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_SHOPHET_ATLAS', 		32, 		'JFD_ShophetUnitFlag_32.dds',				1, 				1);
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_LandmarkTypes 
			(Type,								LandmarkType,	FriendlyName) 
VALUES		('ART_DEF_RESOURCE_JFD_SHELLFISH',	'Resource',		'Shellfish');
--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_Landmarks 
			(Era,			State,					Scale,					ImprovementType,						LayoutHandler,	ResourceType,						Model,								TerrainContour, Tech)
VALUES		('Ancient',		'Any',					0.07000000029802322,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish.fxsxml',					1,				null),
			('Industrial',	'Any',					0.07000000029802322,	'ART_DEF_IMPROVEMENT_FISHING_BOATS',	'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish_industrial.fxsxml',		1,				null),
			('Ancient',		'Any',					0.07000000029802322,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish.fxsxml',					1,				null),
			('Industrial',	'Any',					0.07000000029802322,	'ART_DEF_IMPROVEMENT_NONE',				'ANIMATED',		'ART_DEF_RESOURCE_JFD_SHELLFISH',	'shellfish_industrial.fxsxml',		1,				null);
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType,						TileType,	Asset) 
VALUES		('ART_DEF_RESOURCE_JFD_SHELLFISH',		'Resource',	'sv_Shellfish.dds');
--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT OR REPLACE INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_JFD_SHELLFISH', 	'JFD_ShellFishFontIcons_22');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT OR REPLACE INTO IconFontMapping 
			(IconName, 								IconFontTexture,							IconMapping)
VALUES		('ICON_RES_JFD_SHELLFISH', 				'ICON_FONT_TEXTURE_JFD_SHELLFISH',			1);
--==========================================================================================================================
--==========================================================================================================================

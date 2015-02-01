--==========================================================================================================================	
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_SPITFIRE', 		'Unit', 	'sv_Spitfire.dds'),
			('ART_DEF_UNIT_JFD_DREADNOUGHT', 	'Unit', 	'sv_Dreadnought.dds');
--==========================================================================================================================	
-- ArtDefine_UnitInfos
--==========================================================================================================================		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_DREADNOUGHT'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_BATTLESHIP');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_SPITFIRE'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_FIGHTER');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_DREADNOUGHT'), 	('ART_DEF_UNIT_MEMBER_JFD_DREADNOUGHT'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_BATTLESHIP');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_SPITFIRE'),		('ART_DEF_UNIT_MEMBER_JFD_SPITFIRE'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_FIGHTER');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DREADNOUGHT'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SPITFIRE'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER');
	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DREADNOUGHT'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP');
	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SPITFIRE'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_FIGHTER');

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 									MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_DREADNOUGHT'),	Scale, ZOffset, Domain, ('Dreadnought_Generic.fxsxml'),			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP');

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 									MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_SPITFIRE'),		Scale, ZOffset, Domain, ('Supermarine_Spitfire_MK_V.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_FIGHTER');
--==========================================================================================================================	
-- IconTextureAtlases
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_UNITED_KINGDOM_ATLAS', 				256, 		'JFD_UnitedKingdom_256.dds',			2, 				2),
			('JFD_UNITED_KINGDOM_ATLAS', 				128, 		'JFD_UnitedKingdom_128.dds',			2, 				2),
			('JFD_UNITED_KINGDOM_ATLAS', 				80, 		'JFD_UnitedKingdom_80.dds',				2, 				2),
			('JFD_UNITED_KINGDOM_ATLAS', 				45, 		'JFD_UnitedKingdom_45.dds',				2, 				2),
			('JFD_UNITED_KINGDOM_ATLAS', 				64, 		'JFD_UnitedKingdom_64.dds',				2, 				2),
			('JFD_UNITED_KINGDOM_ATLAS', 				32, 		'JFD_UnitedKingdom_32.dds',				2, 				2),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			128, 		'JFD_UnitedKingdomAlphaAtlas_128.dds',	1, 				1),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			80, 		'JFD_UnitedKingdomAlphaAtlas_80.dds',	1, 				1),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			64, 		'JFD_UnitedKingdomAlphaAtlas_64.dds',	1, 				1),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			48, 		'JFD_UnitedKingdomAlphaAtlas_48.dds',	1, 				1),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			45, 		'JFD_UnitedKingdomAlphaAtlas_45.dds',	1, 				1),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			32, 		'JFD_UnitedKingdomAlphaAtlas_32.dds',	1, 				1),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			24, 		'JFD_UnitedKingdomAlphaAtlas_24.dds',	1, 				1),
			('JFD_UNITED_KINGDOM_ALPHA_ATLAS', 			16, 		'JFD_UnitedKingdomAlphaAtlas_16.dds',	1, 				1),
			('JFD_DREADNOUGHT_FLAG_ART_ATLAS', 			32, 		'UnitFlagDreadnoughtAtlas_32.dds',		1, 				1),
			('JFD_SPITFIRE_FLAG_ART_ATLAS', 			32, 		'UnitFlagSpitfireAtlas_32.dds',			1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	

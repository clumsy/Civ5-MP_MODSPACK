--==========================================================================================================================	
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_GRAND_CARRACK', 'Unit',		'sv_GrandCarrack.dds'),
			('ART_DEF_UNIT_JFD_REDCOAT',		'Unit',		'sv_redcoat.dds');
--==========================================================================================================================	
-- ArtDefine_UnitInfos
--==========================================================================================================================		
INSERT OR REPLACE INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_GRAND_CARRACK'), DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_PORTUGUESE_CARRACK');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_REDCOAT'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');
--==========================================================================================================================	
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_GRAND_CARRACK'), ('ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_PORTUGUESE_CARRACK');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_REDCOAT'), 		('ART_DEF_UNIT_MEMBER_JFD_REDCOAT'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');
--==========================================================================================================================	
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_REDCOAT'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================	
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================	
INSERT OR REPLACE INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_REDCOAT'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================	
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================		
INSERT OR REPLACE INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_GRAND_CARRACK'),	0.17,	ZOffset, Domain, ('u_british_carrack.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_PORTUGUESE_CARRACK');

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_REDCOAT'),		Scale, ZOffset, Domain, ('civ5_engrm1.fxsxml'),			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================	
-- IconTextureAtlases
--==========================================================================================================================	
INSERT OR REPLACE INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_GREAT_BRITAIN_ATLAS', 				256, 		'JFD_GreatBritainAtlas_256.dds',		2, 				2),
			('JFD_GREAT_BRITAIN_ATLAS', 				128, 		'JFD_GreatBritainAtlas_128.dds',		2, 				2),
			('JFD_GREAT_BRITAIN_ATLAS', 				80, 		'JFD_GreatBritainAtlas_80.dds',			2, 				2),
			('JFD_GREAT_BRITAIN_ATLAS', 				45, 		'JFD_GreatBritainAtlas_45.dds',			2, 				2),
			('JFD_GREAT_BRITAIN_ATLAS', 				64, 		'JFD_GreatBritainAtlas_64.dds',			2, 				2),
			('JFD_GREAT_BRITAIN_ATLAS', 				32, 		'JFD_GreatBritainAtlas_32.dds',			2, 				2),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			128, 		'JFD_GreatBritainAlphaAtlas_128.dds',	1, 				1),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			80, 		'JFD_GreatBritainAlphaAtlas_80.dds',	1, 				1),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			64, 		'JFD_GreatBritainAlphaAtlas_64.dds',	1, 				1),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			48, 		'JFD_GreatBritainAlphaAtlas_48.dds',	1, 				1),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			45, 		'JFD_GreatBritainAlphaAtlas_45.dds',	1, 				1),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			32, 		'JFD_GreatBritainAlphaAtlas_32.dds',	1, 				1),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			24, 		'JFD_GreatBritainAlphaAtlas_24.dds',	1, 				1),
			('JFD_GREAT_BRITAIN_ALPHA_ATLAS', 			16, 		'JFD_GreatBritainAlphaAtlas_16.dds',	1, 				1),
			('JFD_UNIT_FLAG_REDCOAT_ATLAS', 			32, 		'UnitFlagRedcoatAtlas_32.dds',			1, 				1),
			('JFD_GRAND_CARRACK_FLAG_ART_ATLAS', 		32, 		'UnitFlagGrandCarrackAtlas_32.dds',		1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	

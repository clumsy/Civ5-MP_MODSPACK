--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_COMBAT_MEDIC', 	'Unit', 	'sv_Medic.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_COMBAT_MEDIC'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');
	
INSERT INTO ArtDefine_UnitInfos 
			(Type, 											DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_COMBAT_MEDIC_POSTMODERN'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW2_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_COMBAT_MEDIC'), 	('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC'), 	2
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,									UnitMemberInfoType,									NumMembers)
SELECT		('ART_DEF_UNIT_JFD_COMBAT_MEDIC_POSTMODERN'), 	('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN'), 	2
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WW2_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC'),	Scale, ZOffset, Domain, ('civ5_frerm.fxsxml'),  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 													Scale, ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_COMBAT_MEDIC_POSTMODERN'),	Scale, ZOffset, Domain, ('ausgw1.fxsxml'),  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_AUSTRIA_ATLAS', 				256, 		'JFD_AustriaAtlas_256.dds',				1, 				1),
			('JFD_AUSTRIA_ATLAS', 				214, 		'JFD_AustriaAtlas_214.dds',				1, 				1),
			('JFD_AUSTRIA_ATLAS', 				128, 		'JFD_AustriaAtlas_128.dds',				1, 				1),
			('JFD_AUSTRIA_ATLAS', 				80, 		'JFD_AustriaAtlas_80.dds',				1, 				1),
			('JFD_AUSTRIA_ATLAS', 				64, 		'JFD_AustriaAtlas_64.dds',				1, 				1),
			('JFD_AUSTRIA_ATLAS', 				45, 		'JFD_AustriaAtlas_45.dds',				1, 				1),
			('JFD_AUSTRIA_ATLAS', 				32, 		'JFD_AustriaAtlas_32.dds',				1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		128, 		'JFD_AustriaAlphaAtlas_128.dds',		1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		80, 		'JFD_AustriaAlphaAtlas_80.dds',			1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		64, 		'JFD_AustriaAlphaAtlas_64.dds',			1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		48, 		'JFD_AustriaAlphaAtlas_48.dds',			1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		45, 		'JFD_AustriaAlphaAtlas_45.dds',			1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		32, 		'JFD_AustriaAlphaAtlas_32.dds',			1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		24, 		'JFD_AustriaAlphaAtlas_24.dds',			1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		22, 		'JFD_AustriaAlphaAtlas_22.dds',			1, 				1),
			('JFD_AUSTRIA_ALPHA_ATLAS', 		16, 		'JFD_AustriaAlphaAtlas_16.dds',			1, 				1),
			('JFD_SWITZERLAND_ATLAS', 			256, 		'JFD_SwitzerlandAtlas_256.dds',			2, 				2),
			('JFD_SWITZERLAND_ATLAS', 			214, 		'JFD_SwitzerlandAtlas_214.dds',			2, 				2),
			('JFD_SWITZERLAND_ATLAS', 			128, 		'JFD_SwitzerlandAtlas_128.dds',			2, 				2),
			('JFD_SWITZERLAND_ATLAS', 			80, 		'JFD_SwitzerlandAtlas_80.dds',			2, 				2),
			('JFD_SWITZERLAND_ATLAS', 			64, 		'JFD_SwitzerlandAtlas_64.dds',			2, 				2),
			('JFD_SWITZERLAND_ATLAS', 			45, 		'JFD_SwitzerlandAtlas_45.dds',			2, 				2),
			('JFD_SWITZERLAND_ATLAS', 			32, 		'JFD_SwitzerlandAtlas_32.dds',			2, 				2),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	128, 		'JFD_SwitzerlandAlphaAtlas_128.dds',	1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	80, 		'JFD_SwitzerlandAlphaAtlas_80.dds',		1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	64, 		'JFD_SwitzerlandAlphaAtlas_64.dds',		1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	48, 		'JFD_SwitzerlandAlphaAtlas_48.dds',		1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	45, 		'JFD_SwitzerlandAlphaAtlas_45.dds',		1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	32, 		'JFD_SwitzerlandAlphaAtlas_32.dds',		1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	24, 		'JFD_SwitzerlandAlphaAtlas_24.dds',		1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	22, 		'JFD_SwitzerlandAlphaAtlas_22.dds',		1, 				1),
			('JFD_SWITZERLAND_ALPHA_ATLAS', 	16, 		'JFD_SwitzerlandAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_MEDIC_ATLAS', 		32, 		'UnitFlagMedic_32.dds',					1, 				1);
--==========================================================================================================================
--==========================================================================================================================

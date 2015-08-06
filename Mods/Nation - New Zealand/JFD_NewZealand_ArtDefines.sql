--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_ANZAC',				'Unit', 	'sv_Anzac.dds'),
			('ART_DEF_UNIT_JFD_DEFENDER',			'Unit', 	'sv_Defender.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_ANZAC'),				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW1_INFANTRY');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_DEFENDER'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_IRONCLAD');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_ANZAC'),				('ART_DEF_UNIT_MEMBER_JFD_ANZAC'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WW1_INFANTRY');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_DEFENDER'),			('ART_DEF_UNIT_MEMBER_JFD_DEFENDER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_IRONCLAD');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_ANZAC'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DEFENDER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_IRONCLAD');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_ANZAC'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DEFENDER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_IRONCLAD');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 				 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_ANZAC'),		Scale,	ZOffset, Domain, ('brigw1.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');

INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DEFENDER'),	Scale,	ZOffset, Domain, ('SMS_Tegetthoff.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_IRONCLAD');
------------------------------
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_NEW_ZEALAND_ATLAS', 				256, 		'JFD_NewZealandAtlas_256.dds',				2, 				2),
			('JFD_NEW_ZEALAND_ATLAS', 				128, 		'JFD_NewZealandAtlas_128.dds',				2, 				2),
			('JFD_NEW_ZEALAND_ATLAS', 				80, 		'JFD_NewZealandAtlas_80.dds',				2, 				2),
			('JFD_NEW_ZEALAND_ATLAS', 				64, 		'JFD_NewZealandAtlas_64.dds',				2, 				2),
			('JFD_NEW_ZEALAND_ATLAS', 				45, 		'JFD_NewZealandAtlas_45.dds',				2, 				2),
			('JFD_NEW_ZEALAND_ATLAS', 				32, 		'JFD_NewZealandAtlas_32.dds',				2, 				2),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		128, 		'JFD_NewZealandAlphaAtlas_128.dds',			1,				1),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		80, 		'JFD_NewZealandAlphaAtlas_80.dds',			1, 				1),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		64, 		'JFD_NewZealandAlphaAtlas_64.dds',			1, 				1),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		48, 		'JFD_NewZealandAlphaAtlas_48.dds',			1, 				1),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		45, 		'JFD_NewZealandAlphaAtlas_45.dds',			1, 				1),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		32, 		'JFD_NewZealandAlphaAtlas_32.dds',			1, 				1),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		24, 		'JFD_NewZealandAlphaAtlas_24.dds',			1, 				1),
			('JFD_NEW_ZEALAND_ALPHA_ATLAS', 		16, 		'JFD_NewZealandAlphaAtlas_16.dds',			1, 				1),
			('JFD_ANZAC_FLAG_ART_ATLAS', 			32, 		'JFD_ANZACUnitFlag_32.dds',					1, 				1),
			('JFD_DEFENDER_FLAG_ART_ATLAS',			32, 		'JFD_DefenderUnitFlag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_NEW_ZEALAND_ICON', 			0.733,	0.733,	0.733,	1),
			('COLOR_PLAYER_JFD_NEW_ZEALAND_BACKGROUND',		0,		0.070,	0.149,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
			(Type, 									PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES		('PLAYERCOLOR_JFD_NEW_ZEALAND',			'COLOR_PLAYER_JFD_NEW_ZEALAND_ICON', 	'COLOR_PLAYER_JFD_NEW_ZEALAND_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_SEDDON_PEACE', 	'Seddon_Peace',		'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_SEDDON_WAR', 	'Seddon_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_SEDDON_PEACE', 	'SND_LEADER_MUSIC_JFD_SEDDON_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JFD_SEDDON_WAR', 	'SND_LEADER_MUSIC_JFD_SEDDON_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================	
--==========================================================================================================================	

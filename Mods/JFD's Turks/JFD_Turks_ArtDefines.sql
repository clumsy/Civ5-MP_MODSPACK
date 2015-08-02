--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_TURKS_ATLAS', 				256, 		'JFD_TurksMehmedAtlas_256.dds',			2, 				2),
		('JFD_TURKS_ATLAS', 				128, 		'JFD_TurksMehmedAtlas_128.dds',			2, 				2),
		('JFD_TURKS_ATLAS', 				80, 		'JFD_TurksMehmedAtlas_80.dds',			2, 				2),
		('JFD_TURKS_ATLAS', 				64, 		'JFD_TurksMehmedAtlas_64.dds',			2, 				2),
		('JFD_TURKS_ATLAS', 				45, 		'JFD_TurksMehmedAtlas_45.dds',			2, 				2),
		('JFD_TURKS_ATLAS', 				32, 		'JFD_TurksMehmedAtlas_32.dds',			2, 				2),
		('JFD_TURKS_ALPHA_ATLAS', 			128, 		'JFD_TurksMehmedAlphaAtlas_128.dds',	1,				1),
		('JFD_TURKS_ALPHA_ATLAS', 			80, 		'JFD_TurksMehmedAlphaAtlas_80.dds',		1, 				1),
		('JFD_TURKS_ALPHA_ATLAS', 			64, 		'JFD_TurksMehmedAlphaAtlas_64.dds',		1, 				1),
		('JFD_TURKS_ALPHA_ATLAS', 			48, 		'JFD_TurksMehmedAlphaAtlas_48.dds',		1, 				1),
		('JFD_TURKS_ALPHA_ATLAS', 			45, 		'JFD_TurksMehmedAlphaAtlas_45.dds',		1, 				1),
		('JFD_TURKS_ALPHA_ATLAS', 			32, 		'JFD_TurksMehmedAlphaAtlas_32.dds',		1, 				1),
		('JFD_TURKS_ALPHA_ATLAS', 			24, 		'JFD_TurksMehmedAlphaAtlas_24.dds',		1, 				1),
		('JFD_TURKS_ALPHA_ATLAS', 			16, 		'JFD_TurksMehmedAlphaAtlas_16.dds',		1, 				1),
		('JFD_BOMBARD_FLAG_ART_ATLAS', 		32, 		'JFD_GreatBombardUnitFlag_32.dds',		1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_TURKS_ICON', 			0.858,	0.615,	0.352,	1),
		('COLOR_PLAYER_JFD_TURKS_BACKGROUND',		0.435,	0.113,	0.015,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_JFD_TURKS',	'COLOR_PLAYER_JFD_TURKS_ICON', 	'COLOR_PLAYER_JFD_TURKS_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_MEHMED_PEACE', 		'Mehmed_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_MEHMED_WAR', 		'Mehmed_War', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_MEHMED_PEACE', 		'SND_LEADER_MUSIC_JFD_MEHMED_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_MEHMED_WAR', 		'SND_LEADER_MUSIC_JFD_MEHMED_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_BOMBARD',			'Unit', 	'sv_GreatBombard.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_JFD_BOMBARD'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_CANNON');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_JFD_BOMBARD'),			('ART_DEF_UNIT_MEMBER_JFD_BOMBARD'),	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CANNON');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_BOMBARD'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CANNON');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_BOMBARD'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CANNON');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_BOMBARD'),	Scale,	ZOffset, Domain, ('Bombard.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CANNON');
--==========================================================================================================================	
--==========================================================================================================================	

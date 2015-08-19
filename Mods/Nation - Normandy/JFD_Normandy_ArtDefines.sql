--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_NORMANDY_ATLAS', 					256, 		'JFD_NormandyAtlas_256.dds',			2, 				2),
		('JFD_NORMANDY_ATLAS', 					128, 		'JFD_NormandyAtlas_128.dds',			2, 				2),
		('JFD_NORMANDY_ATLAS', 					80, 		'JFD_NormandyAtlas_80.dds',				2, 				2),
		('JFD_NORMANDY_ATLAS', 					64, 		'JFD_NormandyAtlas_64.dds',				2, 				2),
		('JFD_NORMANDY_ATLAS', 					45, 		'JFD_NormandyAtlas_45.dds',				2, 				2),
		('JFD_NORMANDY_ATLAS', 					32, 		'JFD_NormandyAtlas_32.dds',				2, 				2),
		('JFD_NORMANDY_BUILD_ATLAS', 			64, 		'UnitAction64_DLC_Denmark.dds',			1, 				1),
		('JFD_NORMANDY_BUILD_ATLAS', 			45, 		'UnitAction45_DLC_Denmark.dds',			1, 				1),
		('JFD_NORMANDY_EVENTS_ATLAS', 			256, 		'JFD_NormandyEventsAtlas_256.dds',		1, 				1),
		('JFD_NORMANDY_EVENTS_ATLAS', 			128, 		'JFD_NormandyEventsAtlas_128.dds',		1, 				1),
		('JFD_NORMANDY_EVENTS_ATLAS', 			80, 		'JFD_NormandyEventsAtlas_80.dds',		1, 				1),
		('JFD_NORMANDY_EVENTS_ATLAS', 			64, 		'JFD_NormandyEventsAtlas_64.dds',		1, 				1),
		('JFD_NORMANDY_IMPROVEMENT_ATLAS', 		256, 		'TerrainIcons256_DLC_Denmark.dds',		2, 				1),
		('JFD_NORMANDY_IMPROVEMENT_ATLAS', 		64, 		'TerrainIcons64_DLC_Denmark.dds',		2, 				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			128, 		'JFD_NormandyAlphaAtlas_128.dds',		1,				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			80, 		'JFD_NormandyAlphaAtlas_80.dds',		1, 				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			64, 		'JFD_NormandyAlphaAtlas_64.dds',		1, 				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			48, 		'JFD_NormandyAlphaAtlas_48.dds',		1, 				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			45, 		'JFD_NormandyAlphaAtlas_45.dds',		1, 				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			32, 		'JFD_NormandyAlphaAtlas_32.dds',		1, 				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			24, 		'JFD_NormandyAlphaAtlas_24.dds',		1, 				1),
		('JFD_NORMANDY_ALPHA_ATLAS', 			16, 		'JFD_NormandyAlphaAtlas_16.dds',		1, 				1),
		('JFD_CHEVALIER_FLAG_ART_ATLAS', 		32, 		'JFD_ManAtArmsUnitFlag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_NORMANDY_ICON', 			0.792,	0.658,	0.450,	1),
		('COLOR_PLAYER_JFD_NORMANDY_BACKGROUND',	0.709,	0,		0,		1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_NORMANDY',	'COLOR_PLAYER_JFD_NORMANDY_ICON', 	'COLOR_PLAYER_JFD_NORMANDY_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_WILLIAM_I_PEACE', 	'WilliamI_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_WILLIAM_I_WAR', 		'WilliamI_War', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JFD_WILLIAM_I_AMBIENCE',	'SND_AMBIENCE_ODA_NOBUNAGA_AMBIENCE', 		'GAME_SFX', 	50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JFD_WILLIAM_I_PEACE', 		'SND_LEADER_MUSIC_JFD_WILLIAM_I_PEACE',		'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_WILLIAM_I_WAR', 		'SND_LEADER_MUSIC_JFD_WILLIAM_I_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_CHEVALIER',			'Unit', 	'sv_ManAtArms.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_JFD_CHEVALIER'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_KNIGHT');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_JFD_CHEVALIER'),			('ART_DEF_UNIT_MEMBER_JFD_CHEVALIER'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_CHEVALIER'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_CHEVALIER'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_CHEVALIER'),	Scale,	ZOffset, Domain, ('Knight_England.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_KNIGHT');
--==========================================================================================================================	
--==========================================================================================================================	

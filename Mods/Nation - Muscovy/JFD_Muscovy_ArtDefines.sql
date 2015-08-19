--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,		Asset)
VALUES		('ART_DEF_UNIT_JFD_STRELTSY', 			'Unit', 		'sv_Streltsy.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_STRELTSY'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_STRELTSY'),			('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_STRELTSY'),	Scale,	ZOffset, Domain, ('Streltsy_blue_cap.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_OTTOMAN_JANISSARY');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_MUSCOVY_ATLAS', 					256, 		'JFD_MuscovyAtlas_256.dds',			4, 				1),
			('JFD_MUSCOVY_ATLAS', 					128, 		'JFD_MuscovyAtlas_128.dds',			4, 				1),
			('JFD_MUSCOVY_ATLAS', 					80, 		'JFD_MuscovyAtlas_80.dds',			4, 				1),
			('JFD_MUSCOVY_ATLAS', 					64, 		'JFD_MuscovyAtlas_64.dds',			4, 				1),
			('JFD_MUSCOVY_ATLAS', 					45, 		'JFD_MuscovyAtlas_45.dds',			4, 				1),
			('JFD_MUSCOVY_ATLAS', 					32, 		'JFD_MuscovyAtlas_32.dds',			4, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			128, 		'JFD_MuscovyAlphaAtlas_128.dds',	1, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			80, 		'JFD_MuscovyAlphaAtlas_80.dds',		1, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			64, 		'JFD_MuscovyAlphaAtlas_64.dds',		1, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			48, 		'JFD_MuscovyAlphaAtlas_48.dds',		1, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			45, 		'JFD_MuscovyAlphaAtlas_45.dds',		1, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			32, 		'JFD_MuscovyAlphaAtlas_32.dds',		1, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			24, 		'JFD_MuscovyAlphaAtlas_24.dds',		1, 				1),
			('JFD_MUSCOVY_ALPHA_ATLAS', 			16, 		'JFD_MuscovyAlphaAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_STRELTSY_ATLAS', 		32, 		'JFD_StreltsyUnitFlag_32.dds',		1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_MUSCOVY_ICON', 			0.831, 	0.772,	0.580, 	1),
			('COLOR_PLAYER_JFD_MUSCOVY_BACKGROUND',		0.439,	0.184,	0.050, 	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
			(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_JFD_MUSCOVY', 	'COLOR_PLAYER_JFD_MUSCOVY_ICON', 	'COLOR_PLAYER_JFD_MUSCOVY_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 				LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_IVAN_PEACE', 	'Ivan_Peace', 			'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_IVAN_WAR', 		'Ivan_War', 			'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType, 		 MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_IVAN_PEACE',	'SND_LEADER_MUSIC_JFD_IVAN_PEACE',		'GAME_MUSIC',	120, 		120, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JFD_IVAN_WAR', 		'SND_LEADER_MUSIC_JFD_IVAN_WAR', 		'GAME_MUSIC',	120, 		120, 		1,		 0);
--==========================================================================================================================	
--==========================================================================================================================	

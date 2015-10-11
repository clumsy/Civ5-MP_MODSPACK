--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_CARABINEIRI', 		'Unit', 	'sv_Carabineiri.dds'),
			('ART_DEF_UNIT_CONFEDERATE_IRONCLAD', 	'Unit', 	'sv_confederate_ironclad_acw.dds');
------------------------------	
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_CARABINEIRI'), 		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW1_INFANTRY');
------------------------------	
-- ArtDefine_UnitInfoMemberInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_JFD_CARABINEIRI'), 		('ART_DEF_UNIT_MEMBER_JFD_CARABINEIRI'), 	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WW1_INFANTRY');
------------------------------	
-- ArtDefine_UnitMemberCombats
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_CARABINEIRI'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
	------------------------------	
-- ArtDefine_UnitMemberCombatWeapons
------------------------------	
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_CARABINEIRI'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
------------------------------	
-- ArtDefine_UnitMemberInfos
------------------------------	
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_CARABINEIRI'),	Scale, ZOffset, Domain, ('Infantry_Italy_v3.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
------------------------------	
-- IconTextureAtlases
------------------------------	
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_ITALY_ATLAS', 					256, 		'JFD_ItalyAtlas_256.dds',			2, 				2),
			('JFD_ITALY_ATLAS', 					128, 		'JFD_ItalyAtlas_128.dds',			2, 				2),
			('JFD_ITALY_ATLAS', 					80, 		'JFD_ItalyAtlas_80.dds',			2, 				2),
			('JFD_ITALY_ATLAS', 					45, 		'JFD_ItalyAtlas_45.dds',			2, 				2),
			('JFD_ITALY_ATLAS', 					64, 		'JFD_ItalyAtlas_64.dds',			2, 				2),
			('JFD_ITALY_ATLAS', 					32, 		'JFD_ItalyAtlas_32.dds',			2, 				2),
			('JFD_ITALY_ALPHA_ATLAS', 				128, 		'JFD_ItalyAlphaAtlas_128.dds',		1, 				1),
			('JFD_ITALY_ALPHA_ATLAS', 				80, 		'JFD_ItalyAlphaAtlas_80.dds',		1, 				1),
			('JFD_ITALY_ALPHA_ATLAS', 				64, 		'JFD_ItalyAlphaAtlas_64.dds',		1, 				1),
			('JFD_ITALY_ALPHA_ATLAS', 				48, 		'JFD_ItalyAlphaAtlas_48.dds',		1, 				1),
			('JFD_ITALY_ALPHA_ATLAS', 				45, 		'JFD_ItalyAlphaAtlas_45.dds',		1, 				1),
			('JFD_ITALY_ALPHA_ATLAS', 				32, 		'JFD_ItalyAlphaAtlas_32.dds',		1, 				1),
			('JFD_ITALY_ALPHA_ATLAS', 				24, 		'JFD_ItalyAlphaAtlas_24.dds',		1, 				1),
			('JFD_ITALY_ALPHA_ATLAS', 				16, 		'JFD_ItalyAlphaAtlas_16.dds',		1, 				1),
			('JFD_CARABINEIRI_FLAG_ART_ATLAS', 		32, 		'UnitFlagCarabineiriAtlas_32.dds',	1, 				1);
--==========================================================================================================================
-- Colors
--==========================================================================================================================	
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_ITALY_ICON', 			1, 		0.705,	0, 		1),
			('COLOR_PLAYER_JFD_ITALY_BACKGROUND', 		0.062,	0.4,	0.082, 	1);
--------------------------------	
-- PlayerColors
--------------------------------					
INSERT INTO PlayerColors 
			(Type, 							PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_JFD_ITALY', 		'COLOR_PLAYER_JFD_ITALY_ICON', 	'COLOR_PLAYER_JFD_ITALY_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_MUSSOLINI_PEACE', 	'Mussolini_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_MUSSOLINI_WAR', 		'Mussolini_War',	'DynamicResident');			
------------------------------	
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 											SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_AMBIENCE_LEADER_JFD_MUSSOLINI_AMBIENCE', 	'SND_AMBIENCE_CITY_MED_SMALL',			'GAME_SFX',		50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_MUSSOLINI_PEACE', 			'SND_LEADER_MUSIC_JFD_MUSSOLINI_PEACE',	'GAME_MUSIC',	50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_MUSSOLINI_WAR', 			'SND_LEADER_MUSIC_JFD_MUSSOLINI_WAR', 	'GAME_MUSIC',	50, 		50, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	

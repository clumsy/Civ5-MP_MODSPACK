--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_BYZANTIUM_ALEXIOS_ATLAS', 			256, 		'JFD_ByzantiumAlexiusAtlas_256.dds',		2, 				2),
		('JFD_BYZANTIUM_ALEXIOS_ATLAS', 			128, 		'JFD_ByzantiumAlexiusAtlas_128.dds',		2, 				2),
		('JFD_BYZANTIUM_ALEXIOS_ATLAS', 			80, 		'JFD_ByzantiumAlexiusAtlas_80.dds',			2, 				2),
		('JFD_BYZANTIUM_ALEXIOS_ATLAS', 			64, 		'JFD_ByzantiumAlexiusAtlas_64.dds',			2, 				2),
		('JFD_BYZANTIUM_ALEXIOS_ATLAS', 			45, 		'JFD_ByzantiumAlexiusAtlas_45.dds',			2, 				2),
		('JFD_BYZANTIUM_ALEXIOS_ATLAS', 			32, 		'JFD_ByzantiumAlexiusAtlas_32.dds',			2, 				2),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		128, 		'JFD_ByzantiumAlexiusAlphaAtlas_128.dds',	1,				1),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		80, 		'JFD_ByzantiumAlexiusAlphaAtlas_80.dds',	1, 				1),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		64, 		'JFD_ByzantiumAlexiusAlphaAtlas_64.dds',	1, 				1),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		48, 		'JFD_ByzantiumAlexiusAlphaAtlas_48.dds',	1, 				1),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		45, 		'JFD_ByzantiumAlexiusAlphaAtlas_45.dds',	1, 				1),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		32, 		'JFD_ByzantiumAlexiusAlphaAtlas_32.dds',	1, 				1),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		24, 		'JFD_ByzantiumAlexiusAlphaAtlas_24.dds',	1, 				1),
		('JFD_BYZANTIUM_ALEXIOS_ALPHA_ATLAS', 		16, 		'JFD_ByzantiumAlexiusAlphaAtlas_16.dds',	1, 				1),
		('JFD_LANTERNAS_FLAG_ART_ATLAS', 			32, 		'JFD_LanternasUnitFlag_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_BYZANTIUM_ALEXIOS_ICON', 		0.796, 	0.650, 	0.262,	1),
		('COLOR_PLAYER_JFD_BYZANTIUM_ALEXIOS_BACKGROUND',	0.4,	0.101,	0.435,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_BYZANTIUM_ALEXIOS',	'COLOR_PLAYER_JFD_BYZANTIUM_ALEXIOS_ICON', 	'COLOR_PLAYER_JFD_BYZANTIUM_ALEXIOS_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_ALEXIOS_PEACE', 		'Alexios_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_ALEXIOS_WAR', 		'Alexios_War',		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_ALEXIOS_PEACE', 		'SND_LEADER_MUSIC_JFD_ALEXIOS_PEACE',		'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_ALEXIOS_WAR', 			'SND_LEADER_MUSIC_JFD_ALEXIOS_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_LANTERNAS',			'Unit', 	'sv_Lanternas.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_JFD_LANTERNAS'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GALLEASS');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_JFD_LANTERNAS'),			('ART_DEF_UNIT_MEMBER_JFD_LANTERNAS'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GALLEASS');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_LANTERNAS'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_LANTERNAS'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_LANTERNAS'),	Scale,	ZOffset, Domain, ('lanternas.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GALLEASS');
--==========================================================================================================================	
--==========================================================================================================================	

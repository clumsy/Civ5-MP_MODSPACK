INSERT INTO ArtDefine_UnitInfos(Type, DamageStates)
  VALUES ('ART_DEF_UNIT_TCM_JUNK_SHIP', 3);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_JUNK_SHIP', 'ART_DEF_UNIT_MEMBER_TCM_JUNK_SHIP', 1);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_JUNK_SHIP', 0.140000000596046, 'Sea', 'WarJunk.fxsxml', 'WOOD', 'WOODLRG');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasShortRangedAttack, HasLeftRightAttack, HasRefaceAfterCombat, HasIndependentWeaponFacing)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_JUNK_SHIP', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady AttackSurfaceToAir', 1, 1, 0, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_JUNK_SHIP', 0, 0, 10.0, 20.0, 'ART_DEF_VEFFECT_CANNON_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION6POUND');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_JUNK_SHIP', 'Unit', 'tcmJunkShipSV.dds');

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_FIRE_LANCER', 1, 'HonorableGunpowder');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_FIRE_LANCER', 'ART_DEF_UNIT_MEMBER_TCM_FIRE_LANCER', 14);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_FIRE_LANCER', 0.140000000596046, 'tcmFireLancer.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasShortRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_FIRE_LANCER', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_FIRE_LANCER', 0, 0, 'BULLET', 'BULLET');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_FIRE_LANCER', 'Unit', 'tcmFireLancerSV.dds');
--=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_SONG_ATLAS', 						256, 		'tcmSongIcons256.dds',				2,				2),
			('TCM_SONG_ATLAS', 						128, 		'tcmSongIcons128.dds',				2, 				2),
			('TCM_SONG_ATLAS', 						80, 		'tcmSongIcons80.dds',				2, 				2),
			('TCM_SONG_ATLAS', 						64, 		'tcmSongIcons64.dds',				2, 				2),
			('TCM_SONG_ATLAS', 						45, 		'tcmSongIcons45.dds',				2, 				2),
			('TCM_SONG_ATLAS', 						32, 		'tcmSongIcons32.dds',				2, 				2),
			('TCM_SONG_ALPHA_ATLAS',				128, 		'tcmSongAlpha128.dds',				1,				1),
			('TCM_SONG_ALPHA_ATLAS',				80, 		'tcmSongAlpha80.dds',				1, 				1),
			('TCM_SONG_ALPHA_ATLAS',				64, 		'tcmSongAlpha64.dds',				1, 				1),
			('TCM_SONG_ALPHA_ATLAS',				48, 		'tcmSongAlpha48.dds',				1, 				1),
			('TCM_SONG_ALPHA_ATLAS',				32, 		'tcmSongAlpha32.dds',				1, 				1),
			('TCM_SONG_ALPHA_ATLAS',				24, 		'tcmSongAlpha24.dds',				1, 				1),
			('TCM_SONG_ALPHA_ATLAS',		 		16, 		'tcmSongAlpha16.dds',				1, 				1),
			('TCM_UNIT_FLAG_JUNK_SHIP_ATLAS',		32,			'tcmJunkShipAlpha32.dds',			1, 				1),
			('TCM_UNIT_FLAG_FIRE_LANCER_ATLAS',		32,			'tcmFireLancerAlpha32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================

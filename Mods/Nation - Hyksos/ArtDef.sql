INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 1, 'ChariotElephant');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 'ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 2);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 0.129999995231628, 'tcmHeqaKhasut.fxsxml', 'CLOTH', 'WOODSM');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 0, 0, 'ARROW', 'ARROW', 10.0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_HEQA_KHASUT', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_HEQA_KHASUT', 'Unit', 'tcmHeqaKhasutSV.dds');
--==========================================================================================================================
--==========================================================================================================================
--=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_HYKSOS_ATLAS', 					256, 		'tcmHyksosIcons256.dds',			2,				2),
			('TCM_HYKSOS_ATLAS', 					128, 		'tcmHyksosIcons128.dds',			2, 				2),
			('TCM_HYKSOS_ATLAS', 					80, 		'tcmHyksosIcons80.dds',				2, 				2),
			('TCM_HYKSOS_ATLAS', 					64, 		'tcmHyksosIcons64.dds',				2, 				2),
			('TCM_HYKSOS_ATLAS', 					45, 		'tcmHyksosIcons45.dds',				2, 				2),
			('TCM_HYKSOS_ATLAS', 					32, 		'tcmHyksosIcons32.dds',				2, 				2),
			('TCM_HYKSOS_ALPHA_ATLAS',				128, 		'tcmHyksosAlpha128.dds',			1,				1),
			('TCM_HYKSOS_ALPHA_ATLAS',				80, 		'tcmHyksosAlpha80.dds',				1, 				1),
			('TCM_HYKSOS_ALPHA_ATLAS',				64, 		'tcmHyksosAlpha64.dds',				1, 				1),
			('TCM_HYKSOS_ALPHA_ATLAS',				48, 		'tcmHyksosAlpha48.dds',				1, 				1),
			('TCM_HYKSOS_ALPHA_ATLAS',				32, 		'tcmHyksosAlpha32.dds',				1, 				1),
			('TCM_HYKSOS_ALPHA_ATLAS',				24, 		'tcmHyksosAlpha24.dds',				1, 				1),
			('TCM_HYKSOS_ALPHA_ATLAS',		 		16, 		'tcmHyksosAlpha16.dds',				1, 				1),
			('TCM_UNIT_FLAG_HEQA_KHASUT_ATLAS',		32, 		'tcmHeqaKhasutAlpha32.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================

--Unit
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SIOUX_HORSEMAN_MOD', 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SIOUX_HORSEMAN_MOD', 'ART_DEF_UNIT_MEMBER_SIOUX_HORSEMAN_MOD', 5);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SIOUX_HORSEMAN_MOD', 0.119999997317791, 'Sioux_Knight.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, TargetHeight, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, OnlyTurnInMovementActions, RushAttackFormation)
  VALUES ('ART_DEF_UNIT_MEMBER_SIOUX_HORSEMAN_MOD', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk', 24.0, 0.349999994039536, 0.5, 0.75, 15.0, 20.0, 12.0, 1, 1, 2, 1, 'DefaultCavalry');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SIOUX_HORSEMAN_MOD', 0, 0, 'METAL', 'SWORD');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SIOUX_HORSEMAN_MOD', 1, 0, 10.0, 20.0, 'FLAMING_ARROW');

--Bison
INSERT INTO ArtDefine_Landmarks 
			(Era,			State,					Scale,					ImprovementType,					LayoutHandler,	ResourceType,						Model,										TerrainContour, Tech)
SELECT		Era,			State,					Scale,					ImprovementType,					LayoutHandler,	('ART_DEF_RESOURCE_WILD_BISON'),	Model,										TerrainContour, Tech
FROM ArtDefine_Landmarks WHERE ResourceType = 'ART_DEF_RESOURCE_BISON';

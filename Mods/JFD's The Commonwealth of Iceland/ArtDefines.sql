--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 		TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_SKALD', 	'Unit', 	'sv_Skald.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 						DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_SKALD'), DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE	(Type = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================	
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT		('ART_DEF_UNIT_JFD_SKALD'), 		('ART_DEF_UNIT_MEMBER_JFD_SKALD'),	1
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 								Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_SKALD'),	Scale,	ZOffset, Domain, ('skald.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_EUROMALE35');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 						IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_ICELAND_ATLAS', 			256, 		'JFD_IcelandAtlas_256.dds',				3, 				2),
			('JFD_ICELAND_ATLAS', 			128, 		'JFD_IcelandAtlas_128.dds',				3, 				2),
			('JFD_ICELAND_ATLAS', 			80, 		'JFD_IcelandAtlas_80.dds',				3, 				2),
			('JFD_ICELAND_ATLAS', 			64, 		'JFD_IcelandAtlas_64.dds',				3, 				2),
			('JFD_ICELAND_ATLAS', 			45, 		'JFD_IcelandAtlas_45.dds',				3, 				2),
			('JFD_ICELAND_ATLAS', 			32, 		'JFD_IcelandAtlas_32.dds',				3, 				2),
			('JFD_ICELAND_ALPHA_ATLAS', 	128, 		'JFD_IcelandAlphaAtlas_128.dds',		2, 				2),
			('JFD_ICELAND_ALPHA_ATLAS', 	80, 		'JFD_IcelandAlphaAtlas_80.dds',			1, 				1),
			('JFD_ICELAND_ALPHA_ATLAS', 	64, 		'JFD_IcelandAlphaAtlas_64.dds',			1, 				1),
			('JFD_ICELAND_ALPHA_ATLAS', 	48, 		'JFD_IcelandAlphaAtlas_48.dds',			1, 				1),
			('JFD_ICELAND_ALPHA_ATLAS', 	45, 		'JFD_IcelandAlphaAtlas_45.dds',			1, 				1),
			('JFD_ICELAND_ALPHA_ATLAS', 	32, 		'JFD_IcelandAlphaAtlas_32.dds',			1, 				1),
			('JFD_ICELAND_ALPHA_ATLAS', 	24, 		'JFD_IcelandAlphaAtlas_24.dds',			1, 				1),
			('JFD_ICELAND_ALPHA_ATLAS', 	16, 		'JFD_IcelandAlphaAtlas_16.dds',			1, 				1),
			('JFD_UNIT_FLAG_SKALD_ATLAS', 	32, 		'Unit_Skald_Flag_32.dds',				1, 				1);
--==========================================================================================================================
--==========================================================================================================================

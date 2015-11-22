--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 						TileType,	Asset)
VALUES		('ART_DEF_UNIT_UNION_ARTILLERY_PARROTT', 	'Unit', 	'sv_parrottcannon_acw.dds'),
			('ART_DEF_UNIT_UNION_IRONCLAD', 			'Unit', 	'sv_union_ironclad_acw.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================	
UPDATE ArtDefine_UnitInfoMemberInfos
SET NumMembers = 1
WHERE UnitInfoType = 'ART_DEF_UNIT_UNION_ARTILLERY_PARROTT';
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_AMERICA_LINCOLN_ATLAS', 			256, 		'JFD_AmericaLincolnAtlas_256.dds',		1, 				1),
			('JFD_AMERICA_LINCOLN_ATLAS', 			128, 		'JFD_AmericaLincolnAtlas_128.dds',		1, 				1),
			('JFD_AMERICA_LINCOLN_ATLAS', 			64, 		'JFD_AmericaLincolnAtlas_64.dds',		1, 				1);
--==========================================================================================================================
--==========================================================================================================================

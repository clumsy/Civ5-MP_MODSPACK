
INSERT INTO ArtDefine_StrategicView (StrategicViewType, TileType, Asset )
	SELECT	('ART_DEF_UNIT_LIBERTADOR'), TileType, Asset
	FROM ArtDefine_StrategicView WHERE (Type = 'ART_DEF_UNIT_GENERAL');
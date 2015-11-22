--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,								PrereqTech, ImprovementType, 						Time, Recommendation, Description,							Help, Kill, CtrlDown, OrderPriority, IconIndex, IconAtlas,	HotKey, EntityEvent)
SELECT		('BUILD_JFD_BELGIAN_PLANTATION'),	PrereqTech, ('IMPROVEMENT_JFD_BELGIAN_PLANTATION'), Time, Recommendation, ('TXT_KEY_JFD_BELGIAN_PLANTATION'),	Help, Kill, CtrlDown, OrderPriority, IconIndex, IconAtlas,	HotKey,	EntityEvent
FROM Builds WHERE Type = 'BUILD_PLANTATION';
--==========================================================================================================================
-- BuildFeatures
--==========================================================================================================================
INSERT INTO BuildFeatures
			(BuildType, 						FeatureType, PrereqTech, Time, Remove)
SELECT		('BUILD_JFD_BELGIAN_PLANTATION'),	FeatureType, PrereqTech, Time, Remove
FROM BuildFeatures WHERE BuildType = 'BUILD_PLANTATION';
--==========================================================================================================================
--==========================================================================================================================
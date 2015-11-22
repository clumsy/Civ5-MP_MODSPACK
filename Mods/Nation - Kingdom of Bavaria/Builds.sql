--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,					PrereqTech,				ImprovementType, 			Time, Recommendation,					Description,			Help,								CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey, EntityEvent)
VALUES		('BUILD_JFD_SCHLOSS',	'TECH_ARCHITECTURE',	'IMPROVEMENT_JFD_SCHLOSS',	1000, 'TXT_KEY_BUILD_JFD_SCHLOSS_REC', 'TXT_KEY_JFD_SCHLOSS',	'TXT_KEY_BUILD_JFD_SCHLOSS_HELP',	1,			96,				1,			'JFD_SCHLOSS_ATLAS',	'KB_F',	'ENTITY_EVENT_BUILD');
--==========================================================================================================================
-- BuildFeatures
--==========================================================================================================================
INSERT INTO BuildFeatures
			(BuildType, 			FeatureType, PrereqTech, Time, Remove)
SELECT		('BUILD_JFD_SCHLOSS'),	FeatureType, PrereqTech, Time, 0
FROM BuildFeatures WHERE BuildType = 'BUILD_FORT';
--==========================================================================================================================
--==========================================================================================================================
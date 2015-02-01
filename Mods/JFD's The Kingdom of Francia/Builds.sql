--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,						ImprovementType, 				PrereqTech,				Time,	Recommendation,						Description,				Help,									CtrlDown,	OrderPriority,	IconIndex,	IconAtlas,				HotKey, EntityEvent)
VALUES		('BUILD_JFD_SIEGE_UNIT',	'IMPROVEMENT_JFD_SIEGE_UNIT',	'TECH_MATHEMATICS',		1000,	'TXT_KEY_BUILD_JFD_SIEGE_UNIT_REC',	'TXT_KEY_JFD_SIEGE_UNIT',	'TXT_KEY_BUILD_JFD_SIEGE_UNIT_HELP',	1,			96,				3,			'JFD_SIEGE_UNIT_ATLAS',	'KB_F',	'JFD_SIEGE_UNIT_ATLAS');
--==========================================================================================================================
-- BuildFeatures
--==========================================================================================================================
INSERT INTO BuildFeatures
			(BuildType,					FeatureType, 		PrereqTech,				Time,	Remove)
VALUES		('BUILD_JFD_SIEGE_UNIT',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	700,	1),
			('BUILD_JFD_SIEGE_UNIT',	'FEATURE_FOREST',	'TECH_MINING',			400,	1);
--==========================================================================================================================
--==========================================================================================================================
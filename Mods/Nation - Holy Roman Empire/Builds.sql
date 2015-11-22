--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,							ImprovementType, 						Recommendation, Description,						Help,									Kill,	CtrlDown, OrderPriority, IconIndex,	IconAtlas,				HotKey, EntityEvent)
SELECT		('BUILD_JFD_HOLY_ROMAN_CITY'),	('IMPROVEMENT_JFD_HOLY_ROMAN_CITY'),	Recommendation, ('TXT_KEY_JFD_HOLY_ROMAN_CITY'),	('TXT_KEY_JFD_HOLY_ROMAN_CITY_HELP'),	1,		CtrlDown, OrderPriority, 51,			('UNIT_ACTION_ATLAS'),	HotKey,	EntityEvent
FROM Builds WHERE Type = 'BUILD_TRADING_POST';
--==========================================================================================================================
--==========================================================================================================================
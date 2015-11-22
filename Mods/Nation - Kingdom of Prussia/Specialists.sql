--==========================================================================================================================
-- Specialists
--==========================================================================================================================	
INSERT INTO Specialists
			(Type,								Description,								Strategy,											GreatPeopleTitle, 									Experience, GreatPeopleUnitClass,		GreatPeopleRateChange,	Visible,	IconAtlas,			PortraitIndex)
VALUES		('SPECIALIST_JFD_PRUSSIAN_GENERAL', 'TXT_KEY_SPECIALIST_JFD_PRUSSIAN_GENERAL',	'TXT_KEY_SPECIALIST_JFD_PRUSSIAN_GENERAL_STRATEGY',	'TXT_KEY_SPECIALIST_JFD_PRUSSIAN_GENERAL_TITLE', 	5,			'UNITCLASS_GREAT_GENERAL',	3,						1,			'CITIZEN_ATLAS',	0);
--==========================================================================================================================	
-- SpecialistFlavors
--==========================================================================================================================	
INSERT INTO SpecialistFlavors
			(SpecialistType,					FlavorType,					Flavor)
VALUES		('SPECIALIST_JFD_PRUSSIAN_GENERAL',	'FLAVOR_MILITARY_TRAINING', 10),
			('SPECIALIST_JFD_PRUSSIAN_GENERAL',	'FLAVOR_OFFENSE',			5),
			('SPECIALIST_JFD_PRUSSIAN_GENERAL',	'FLAVOR_DEFENSE',			5);
--==========================================================================================================================	
-- Building_SpecialistYieldChanges
--==========================================================================================================================	
INSERT INTO Building_SpecialistYieldChanges
			(BuildingType,						SpecialistType,						YieldType,			Yield)
VALUES		('BUILDING_STATUE_OF_LIBERTY',		'SPECIALIST_JFD_PRUSSIAN_GENERAL',	'YIELD_PRODUCTION',	1);
--==========================================================================================================================
--==========================================================================================================================
			
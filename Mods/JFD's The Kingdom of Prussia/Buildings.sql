--==========================================================================================================================
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 									SpecialistType,						SpecialistCount, FreeStartEra, GoldMaintenance, PrereqTech, BuildingClass, Cost,	FaithCost,	NukeImmune, MinAreaSize, NeverCapture,	Description, 									Civilopedia, 	Help, 												Strategy,	PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_PRUSSIAN_BARRACKS'),		'SPECIALIST_JFD_PRUSSIAN_GENERAL',	2,				 FreeStartEra, GoldMaintenance, PrereqTech, BuildingClass, Cost,	-1,			NukeImmune, MinAreaSize, 1,				('TXT_KEY_BUILDING_JFD_PRUSSIAN_BARRACKS'), 	Civilopedia, 	('TXT_KEY_BUILDING_JFD_PRUSSIAN_BARRACKS_HELP'), 	Strategy,	PortraitIndex, 	IconAtlas
FROM Buildings WHERE (Type = 'BUILDING_BARRACKS');

INSERT INTO Buildings 	
			(Type, 									SpecialistType,						SpecialistCount, FreeStartEra, GoldMaintenance, PrereqTech, BuildingClass, Cost, FaithCost,	NukeImmune, MinAreaSize, NeverCapture,	Description, 								Civilopedia, 	Help, 											Strategy,	PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_PRUSSIAN_ARMORY'),		'SPECIALIST_JFD_PRUSSIAN_GENERAL',	2,				 FreeStartEra, GoldMaintenance, PrereqTech, BuildingClass, Cost, -1,		NukeImmune, MinAreaSize, 1,				('TXT_KEY_BUILDING_JFD_PRUSSIAN_ARMORY'), 	Civilopedia, 	('TXT_KEY_BUILDING_JFD_PRUSSIAN_ARMORY_HELP'),	Strategy,	PortraitIndex, 	IconAtlas
FROM Buildings WHERE (Type = 'BUILDING_ARMORY');

INSERT INTO Buildings 	
			(Type, 										SpecialistType,						SpecialistCount, FreeStartEra, GoldMaintenance, PrereqTech, BuildingClass, Cost, FaithCost,	NukeImmune, MinAreaSize, NeverCapture,	Description, 											Civilopedia, 	Help, 														Strategy,	PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY'), 'SPECIALIST_JFD_PRUSSIAN_GENERAL',	2,				 FreeStartEra, GoldMaintenance, PrereqTech, BuildingClass, Cost, -1,		NukeImmune, MinAreaSize, 1,				('TXT_KEY_BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY'), 	Civilopedia, 	('TXT_KEY_BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY_HELP'),	Strategy,	PortraitIndex, 	IconAtlas
FROM Buildings WHERE (Type = 'BUILDING_MILITARY_ACADEMY');
--==========================================================================================================================
-- Building_ClassesNeededInCity
--==========================================================================================================================		
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 									BuildingClassType)
SELECT		('BUILDING_JFD_PRUSSIAN_BARRACKS'),				BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_BARRACKS');

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 									BuildingClassType)
SELECT		('BUILDING_JFD_PRUSSIAN_ARMORY'),				BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_ARMORY');

INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 									BuildingClassType)
SELECT		('BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY'),		BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_MILITARY_ACADEMY');
--==========================================================================================================================
-- Building_DomainFreeExperiences
--==========================================================================================================================		
INSERT INTO Building_DomainFreeExperiences 	
			(BuildingType, 									DomainType, Experience)
SELECT		('BUILDING_JFD_PRUSSIAN_BARRACKS'),				DomainType, Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_BARRACKS');

INSERT INTO Building_DomainFreeExperiences 	
			(BuildingType, 									DomainType, Experience)
SELECT		('BUILDING_JFD_PRUSSIAN_ARMORY'),				DomainType, Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_ARMORY');

INSERT INTO Building_DomainFreeExperiences 	
			(BuildingType, 									DomainType, Experience)
SELECT		('BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY'),		DomainType, Experience
FROM Building_DomainFreeExperiences WHERE (BuildingType = 'BUILDING_MILITARY_ACADEMY');
--==========================================================================================================================
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 	
			(BuildingType, 									FlavorType, Flavor)
SELECT		('BUILDING_JFD_PRUSSIAN_BARRACKS'),				FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_BARRACKS');

INSERT INTO Building_Flavors 	
			(BuildingType, 									FlavorType, Flavor)
SELECT		('BUILDING_JFD_PRUSSIAN_ARMORY'),				FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_ARMORY');

INSERT INTO Building_Flavors 	
			(BuildingType, 									FlavorType, Flavor)
SELECT		('BUILDING_JFD_PRUSSIAN_MILITARY_ACADEMY'),		FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_MILITARY_ACADEMY');
--==========================================================================================================================	
--==========================================================================================================================	
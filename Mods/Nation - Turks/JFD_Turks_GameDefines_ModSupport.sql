
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_JFD_MEHMED',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Turks_Decisions.lua');
------------------------------	
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 						DefaultBuilding, 							Description, 								MaxPlayerInstances)
VALUES	('BUILDINGCLASS_DECISIONS_JFD_ENDERUN_ACADEMY', 	'BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY',	'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY',	1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings			
		(Type, 										BuildingClass, 			  						GreatGeneralRateModifier,	Cost, 	FaithCost,	Help,											Description, 								Civilopedia,									IconAtlas,		PortraitIndex,	NukeImmune, ConquestProb)
VALUES	('BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY',	'BUILDINGCLASS_DECISIONS_JFD_ENDERUN_ACADEMY',  20,							-1, 	-1,			'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY_HELP',	'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY', 	'TXT_KEY_DECISIONS_JFD_ENDERUN_ACADEMY_PEDIA',	'TECH_ATLAS_1',	28,				1,			100);
------------------------------
-- Building_UnitCombatFreeExperiences
------------------------------
INSERT INTO Building_UnitCombatFreeExperiences
		(BuildingType,								UnitCombatType,			Experience)
VALUES	('BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY', 'UNITCOMBAT_GUN',		10),
		('BUILDING_DECISIONS_JFD_ENDERUN_ACADEMY', 'UNITCOMBAT_MOUNTED',	10);
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
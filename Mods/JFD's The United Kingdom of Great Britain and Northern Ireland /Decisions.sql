--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 										DefaultBuilding, 									Description)
VALUES		('BUILDINGCLASS_JFD_SPECIAL_RELATIONSHIP',	'BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP',	'TXT_KEY_BUILDING_JFD_SPECIAL_RELATIONSHIP');
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_UnitedKingdomDecisions.lua');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 							BuildingClass, 								Cost,	FaithCost,	PrereqTech, GreatWorkCount, NumTradeRouteBonus, Description, 									Help)
VALUES		('BUILDING_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP', 	'BUILDINGCLASS_JFD_SPECIAL_RELATIONSHIP',	-1,		-1,			null,		-1,				2,					'TXT_KEY_BUILDING_JFD_SPECIAL_RELATIONSHIP',	'TXT_KEY_BUILDING_JFD_SPECIAL_RELATIONSHIP_HELP');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,												Description,													AttackBonusTurns) 
VALUES		('POLICY_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION',	'TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_ADDRESS_THE_NATION',		2),
			('POLICY_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP',	'TXT_KEY_DECISIONS_JFD_UNITED_KINGDOM_SPECIAL_RELATIONSHIP',	0);
--==========================================================================================================================
--==========================================================================================================================


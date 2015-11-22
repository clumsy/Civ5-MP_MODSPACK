--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_CarthageDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies
			(Type)
VALUES		('POLICY_JFD_SUFFETES');
--==========================================================================================================================
-- Policy_BuildingClassProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassProductionModifiers
			(PolicyType,			BuildingClassType,			ProductionModifier)
VALUES		('POLICY_JFD_SUFFETES', 'BUILDINGCLASS_COURTHOUSE', 100);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions 
			(Type, 								Description, 								Help, 											Sound, 				IgnoreZoC,	VisibilityChange,	MovesChange,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_SHOPHET_TRIBUNAL',	'TXT_KEY_PROMOTION_JFD_SHOPHET_TRIBUNAL',	'TXT_KEY_PROMOTION_JFD_SHOPHET_TRIBUNAL_HELP', 	'AS2D_IF_LEVELUP',	1,			1,					2, 				1, 				33, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET_TRIBUNAL');
--==========================================================================================================================
--==========================================================================================================================


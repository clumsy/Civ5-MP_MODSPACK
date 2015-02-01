--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_JapanTojoDecisions.lua');
--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================		
INSERT INTO UnitPromotions 
			(Type, 								VisibilityChange,	RangeChange,	Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_KANTAI_KESSEN', 	1,					1,				'TXT_KEY_PROMOTION_JFD_KANTAI_KESSEN', 	'TXT_KEY_PROMOTION_JFD_KANTAI_KESSEN_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_KANTAI_KESSEN');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,							Description) 
VALUES		('POLICY_JFD_KANTAI_KESSEN',	'TXT_KEY_DECISIONS_JFD_JAPAN_TOJO_KANTAI_KESSEN');
--==========================================================================================================================
--==========================================================================================================================


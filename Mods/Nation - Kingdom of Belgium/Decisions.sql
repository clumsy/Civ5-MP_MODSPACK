--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_BelgiumDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,											Description) 
VALUES		('POLICY_JFD_BELGIAN_FORCE_PUBLIQUE',			'TXT_KEY_DECISIONS_JFD_BELGIUM_FORCE_PUBLIQUE'),
			('POLICY_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE',	'TXT_KEY_DECISIONS_JFD_BELGIUM_GEOGRAPHIC_CONFERENCE');
--==========================================================================================================================
-- Policy_FreePromotions
--==========================================================================================================================
INSERT INTO Policy_FreePromotions 
			(PolicyType, 									PromotionType) 
VALUES 		('POLICY_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE',	'PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE');
--==========================================================================================================================
-- Policy_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementYieldChanges
			(PolicyType, 							ImprovementType, 						YieldType, 			Yield)
VALUES		('POLICY_JFD_BELGIAN_FORCE_PUBLIQUE', 	'IMPROVEMENT_PLANTATION', 				'YIELD_PRODUCTION', 1),
			('POLICY_JFD_BELGIAN_FORCE_PUBLIQUE', 	'IMPROVEMENT_JFD_BELGIAN_PLANTATION', 	'YIELD_PRODUCTION', 1);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
			(Type, 											Description, 												Help, 														Sound, 				VisibilityChange, 	IgnoreTerrainCost, 	CannotBeChosen, OutsideFriendlyLandsModifier, 	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'TXT_KEY_PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE_DESC', 'TXT_KEY_PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE_HELP', 'AS2D_IF_LEVELUP', 	1, 					1, 					1,				0, 								59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE_DESC');
--==========================================================================================================================
-- UnitPromotions_CivilianUnitType
--==========================================================================================================================
INSERT INTO UnitPromotions_CivilianUnitType
			(PromotionType, 								UnitType)
VALUES		('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'UNIT_SETTLER'),
			('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'UNIT_JFD_BELGIAN_WORKER'),
			('PROMOTION_JFD_BELGIAN_GEOGRAPHIC_CONFERENCE', 'UNIT_wORKER');
--==========================================================================================================================
--==========================================================================================================================


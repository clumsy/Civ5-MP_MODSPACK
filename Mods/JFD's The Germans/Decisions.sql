--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_GermansDecisions.lua');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 										NearbyEnemyCombatMod,	NearbyEnemyCombatRange, Description, 								Help, 												Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_GERMANS_SUEBI_KNOT',		-5,						1,						'TXT_KEY_PROMOTION_JFD_GERMANS_SUEBI_KNOT',	'TXT_KEY_PROMOTION_JFD_GERMANS_SUEBI_KNOT_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GERMANS_SUEBI_KNOT');
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType,							UnitCombatType) 
VALUES		('PROMOTION_JFD_GERMANS_SUEBI_KNOT',	'UNITCOMBAT_MELEE');			
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,								Description) 
VALUES		('POLICY_JFD_GERMANS_SUEBI_KNOT',	'TXT_KEY_DECISIONS_JFD_GERMANS_SUEBI_KNOT'),
			('POLICY_JFD_GERMANS_WEREGILD',		'TXT_KEY_DECISIONS_JFD_GERMANS_WEREGILD');
--==========================================================================================================================
-- Policy_FreePromotions
--==========================================================================================================================
INSERT INTO Policy_FreePromotions 
			(PolicyType,						PromotionType) 
VALUES		('POLICY_JFD_GERMANS_SUEBI_KNOT',	'PROMOTION_JFD_GERMANS_SUEBI_KNOT');
--==========================================================================================================================
-- Policy_ImprovementCultureChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementCultureChanges 
			(PolicyType,					ImprovementType, 								CultureChange) 
VALUES		('POLICY_JFD_GERMANS_WEREGILD',	'IMPROVEMENT_JFD_ENCAMPMENT',					1),
			('POLICY_JFD_GERMANS_WEREGILD',	'IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_DEER',		1),
			('POLICY_JFD_GERMANS_WEREGILD',	'IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_HORSE',	1),
			('POLICY_JFD_GERMANS_WEREGILD',	'IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED_IRON',		1),
			('POLICY_JFD_GERMANS_WEREGILD',	'IMPROVEMENT_JFD_ENCAMPMENT_UPGRADED',			1);
--==========================================================================================================================	
--==========================================================================================================================	

--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 							Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_RIBAULT',		'TXT_KEY_PROMOTION_JFD_RIBAULT',	'TXT_KEY_PROMOTION_JFD_RIBAULT_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_RIBAULT');
--==========================================================================================================================
-- UnitPromotions_UnitCombatMods
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombatMods
			(PromotionType,				UnitCombatType,		Modifier)
VALUES		('PROMOTION_JFD_RIBAULT',	'UNITCOMBAT_SIEGE',	33);
--==========================================================================================================================
--==========================================================================================================================

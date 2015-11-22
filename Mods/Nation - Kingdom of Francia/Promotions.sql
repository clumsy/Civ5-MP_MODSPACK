--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_BONUS_VS_MELEE', 	'TXT_KEY_PROMOTION_JFD_BONUS_VS_MELEE',		'TXT_KEY_PROMOTION_JFD_BONUS_VS_MELEE_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BONUS_VS_MELEE');
--==========================================================================================================================
-- UnitPromotions_Terrains
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 					UnitCombatType)
VALUES		('PROMOTION_JFD_BONUS_VS_MELEE', 	'UNITCOMBAT_MELEE');
--==========================================================================================================================
-- UnitPromotions_UnitCombatMods
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombatMods 
			(PromotionType, 					UnitCombatType,			Modifier)
VALUES		('PROMOTION_JFD_BONUS_VS_MELEE', 	'UNITCOMBAT_MELEE',		33);
--==========================================================================================================================	
--==========================================================================================================================	

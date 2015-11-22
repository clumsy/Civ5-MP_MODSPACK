--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 											Description, 											Help, 														Sound, 				CannotBeChosen, LostWithUpgrade, UpgradeDiscount,	NotWithUpgrade, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_MARSHAL', 						'TXT_KEY_PROMOTION_JFD_MARSHAL',						'TXT_KEY_PROMOTION_JFD_MARSHAL_HELP', 						'AS2D_IF_LEVELUP', 	1, 				1, 				 0, 				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MARSHAL'),
			('PROMOTION_JFD_IMPERIAL_GUARD', 				'TXT_KEY_PROMOTION_JFD_IMPERIAL_GUARD',					'TXT_KEY_PROMOTION_JFD_IMPERIAL_GUARD_HELP', 				'AS2D_IF_LEVELUP', 	1, 				0, 				 20, 				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_IMPERIAL_GUARD'),
			('PROMOTION_JFD_BONUS_WHEN_DAMAGED',			'TXT_KEY_PROMOTION_JFD_BONUS_WHEN_DAMAGED',				'TXT_KEY_PROMOTION_JFD_BONUS_WHEN_DAMAGED_HELP', 			'AS2D_IF_LEVELUP', 	1, 				0, 				 0, 				0, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BONUS_WHEN_DAMAGED'),
			('PROMOTION_JFD_NAPOLEONIC_BONUS_VS_SIEGE', 	'TXT_KEY_PROMOTION_JFD_NAPOLEONIC_BONUS_VS_SIEGE',		'TXT_KEY_PROMOTION_JFD_NAPOLEONIC_BONUS_VS_SIEGE_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0, 				 0, 				0, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_NAPOLEONIC_BONUS_VS_SIEGE'),
			('PROMOTION_JFD_NAPOLEONIC_BONUS_VS_MOUNTED', 	'TXT_KEY_PROMOTION_JFD_NAPOLEONIC_BONUS_VS_MOUNTED',	'TXT_KEY_PROMOTION_JFD_NAPOLEONIC_BONUS_VS_MOUNTED_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0,				 0, 				0, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_NAPOLEONIC_BONUS_VS_MOUNTED');
--==========================================================================================================================
-- UnitPromotions_UnitCombatMods
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombatMods
			(PromotionType,									UnitCombatType,			Modifier)
VALUES		('PROMOTION_JFD_NAPOLEONIC_BONUS_VS_MOUNTED',	'UNITCOMBAT_MOUNTED',	20),
			('PROMOTION_JFD_NAPOLEONIC_BONUS_VS_SIEGE',		'UNITCOMBAT_SIEGE',		20);
--==========================================================================================================================
--==========================================================================================================================

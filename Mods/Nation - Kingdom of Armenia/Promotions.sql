--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 								Description, 								Help, 												Sound, 				CannotBeChosen, LostWithUpgrade,	CityAttack, PortraitIndex, 	IconAtlas, 						PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_ARMENIAN_PROPHET', 	'TXT_KEY_PROMOTION_JFD_ARMENIAN_PROPHET',	'TXT_KEY_PROMOTION_JFD_ARMENIAN_PROPHET_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0, 					0,			58, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ARMENIAN_PROPHET'),
			('PROMOTION_JFD_NAKHARAR', 			'TXT_KEY_PROMOTION_JFD_NAKHARAR',			'TXT_KEY_PROMOTION_JFD_NAKHARAR_HELP', 				'AS2D_IF_LEVELUP', 	1, 				1, 					33,			0, 				'JFD_ARMENIA_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_NAKHARAR'),
			('PROMOTION_JFD_MAMIKONIAN', 		'TXT_KEY_PROMOTION_JFD_MAMIKONIAN',			'TXT_KEY_PROMOTION_JFD_MAMIKONIAN_HELP', 			'AS2D_IF_LEVELUP', 	1, 				0,					0,			59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MAMIKONIAN');
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 			UnitCombatType)
VALUES		('PROMOTION_JFD_NAKHARAR', 'UNITCOMBAT_MOUNTED');
--==========================================================================================================================
--==========================================================================================================================

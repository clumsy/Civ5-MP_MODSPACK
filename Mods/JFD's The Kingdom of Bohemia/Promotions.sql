--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 										Description, 									Help, 													Sound, 				CannotBeChosen, ExtraAttacks,	CanMoveAfterAttacking,  DefenseMod,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_TABOR_RANGED', 				'TXT_KEY_PROMOTION_JFD_TABOR_RANGED', 			'TXT_KEY_PROMOTION_JFD_TABOR_RANGED_HELP', 				'AS2D_IF_LEVELUP', 	1, 				1,				1,						0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TABOR_RANGED'),
			('PROMOTION_JFD_TABOR_DEFENSE_OTHER', 		'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_OTHER', 	'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_OTHER_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0,				0,						100, 		59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_OTHER'),
			('PROMOTION_JFD_TABOR_DEFENSE', 			'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE', 			'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE_HELP',				'AS2D_IF_LEVELUP', 	1, 				0,				0,						0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TABOR_DEFENSE');
--==========================================================================================================================
--==========================================================================================================================
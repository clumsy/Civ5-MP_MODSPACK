--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 									VisibilityChange,	Description, 								Help, 												Sound, 				CaptureDefeatedEnemy,	CannotBeChosen, LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_LITHUANIA', 			0,					'TXT_KEY_PROMOTION_JFD_LITHUANIA',			'TXT_KEY_PROMOTION_JFD_LITHUANIA_HELP', 			'AS2D_IF_LEVELUP', 	1,						1, 				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LITHUANIA'),
			('PROMOTION_JFD_DOUBLE_MOVES', 			0,					'TXT_KEY_PROMOTION_JFD_DOUBLE_MOVES',		'TXT_KEY_PROMOTION_JFD_DOUBLE_MOVES_HELP', 			'AS2D_IF_LEVELUP', 	0,						1, 				0, 				 56, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DOUBLE_MOVES'),
			('PROMOTION_JFD_CONVERTS_TO_PAGANS', 	0,					'TXT_KEY_PROMOTION_JFD_CONVERTS_TO_PAGANS',	'TXT_KEY_PROMOTION_JFD_CONVERTS_TO_PAGANS_HELP',	'AS2D_IF_LEVELUP', 	0,						1, 				1, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_CONVERTS_TO_PAGANS');
--==========================================================================================================================
-- UnitPromotions_Features
--==========================================================================================================================	
INSERT INTO UnitPromotions_Features 
			(PromotionType, 						FeatureType,		DoubleMove, Attack, Defense)
VALUES		('PROMOTION_JFD_DOUBLE_MOVES',			'FEATURE_FOREST',	1,			33,		33); 
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 						UnitCombatType)
VALUES		('PROMOTION_JFD_LITHUANIA',				'UNITCOMBAT_MELEE'),
			('PROMOTION_JFD_DOUBLE_MOVES',			'UNITCOMBAT_MELEE'),
			('PROMOTION_JFD_CONVERTS_TO_PAGANS',	'UNITCOMBAT_MELEE');
--==========================================================================================================================
--==========================================================================================================================

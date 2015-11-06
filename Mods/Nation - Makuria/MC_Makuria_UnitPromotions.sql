--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 								Description, 								Help, 												Sound, 				CannotBeChosen, LostWithUpgrade,	PortraitIndex, 		IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_MC_THE_BAQT_1', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_1', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_SHARED', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_2', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_2', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_3', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_3', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_4', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_4', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_5', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_5', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_6', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_6', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_7', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_7', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_8', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_8', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_9', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_9', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_10', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_10', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT'),
			('PROMOTION_MC_THE_BAQT_11', 		'TXT_KEY_PROMOTION_MC_THE_BAQT',			'TXT_KEY_PROMOTION_MC_THE_BAQT_HELP_11', 			'AS2D_IF_LEVELUP', 	1, 				1,					59, 				'PROMOTION_ATLAS', 	'PEDIA_HIDDEN', 	'TXT_KEY_PROMOTION_MC_THE_BAQT');

UPDATE UnitPromotions
	SET CombatPercent = 5
	WHERE Type = 'PROMOTION_MC_THE_BAQT_1';
	
UPDATE UnitPromotions
	SET CombatPercent = 10
	WHERE Type = 'PROMOTION_MC_THE_BAQT_2';
	
UPDATE UnitPromotions
	SET CombatPercent = 15
	WHERE Type = 'PROMOTION_MC_THE_BAQT_3';
	
UPDATE UnitPromotions
	SET CombatPercent = 20
	WHERE Type = 'PROMOTION_MC_THE_BAQT_4';
	
UPDATE UnitPromotions
	SET CombatPercent = 25
	WHERE Type = 'PROMOTION_MC_THE_BAQT_5';
	
UPDATE UnitPromotions
	SET CombatPercent = 30
	WHERE Type = 'PROMOTION_MC_THE_BAQT_6';
	
UPDATE UnitPromotions
	SET CombatPercent = 35
	WHERE Type = 'PROMOTION_MC_THE_BAQT_7';
	
UPDATE UnitPromotions
	SET CombatPercent = 40
	WHERE Type = 'PROMOTION_MC_THE_BAQT_8';
	
UPDATE UnitPromotions
	SET CombatPercent = 45
	WHERE Type = 'PROMOTION_MC_THE_BAQT_9';
	
UPDATE UnitPromotions
	SET CombatPercent = 50
	WHERE Type = 'PROMOTION_MC_THE_BAQT_10';
	
UPDATE UnitPromotions
	SET CombatPercent = 55
	WHERE Type = 'PROMOTION_MC_THE_BAQT_11';
--==========================================================================================================================
--==========================================================================================================================
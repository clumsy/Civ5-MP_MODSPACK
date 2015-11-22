--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================		
INSERT INTO UnitPromotions 
			(Type, 							CityAttack,	Description, 							Help, 										Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_DOJO', 			0,			'TXT_KEY_PROMOTION_JFD_DOJO', 			'TXT_KEY_PROMOTION_JFD_DOJO_HELP',			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DOJO'),
			('PROMOTION_JFD_YAMATO', 		100,		'TXT_KEY_PROMOTION_JFD_YAMATO', 		'TXT_KEY_PROMOTION_JFD_YAMATO_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_YAMATO'),
			('PROMOTION_JFD_JAPAN_TOJO', 	0,			'TXT_KEY_PROMOTION_JFD_JAPAN_TOJO', 	'TXT_KEY_PROMOTION_JFD_JAPAN_TOJO_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_JAPAN_TOJO');
--==========================================================================================================================	
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType,					UnitCombatType)
VALUES		('PROMOTION_JFD_YAMATO',		'UNITCOMBAT_ARMOR'),
			('PROMOTION_JFD_YAMATO',		'UNITCOMBAT_SIEGE');
--==========================================================================================================================		
--==========================================================================================================================		

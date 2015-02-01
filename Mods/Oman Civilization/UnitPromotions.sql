--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 				CannotBeChosen, CityAttack, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_BAGHLAH',					'TXT_KEY_PROMOTION_JFD_BAGHLAH',					'TXT_KEY_PROMOTION_JFD_BAGHLAH_HELP', 					'AS2D_IF_LEVELUP', 	1, 				0, 			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BAGHLAH'),
			('PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10', 	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10',	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10_HELP', 	'AS2D_IF_LEVELUP', 	1, 				10, 		59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_10'),
			('PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20', 	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20',	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20_HELP', 	'AS2D_IF_LEVELUP', 	1, 				20, 		59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_20'),
			('PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30', 	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30',	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30_HELP', 	'AS2D_IF_LEVELUP', 	1, 				30, 		59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_30'),
			('PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40', 	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40',	'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40_HELP', 	'AS2D_IF_LEVELUP', 	1, 				40, 		59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_OMANI_BONUS_VS_CITIES_40');

INSERT INTO Unit_FreePromotions
			(UnitType,				PromotionType)
VALUES		('UNIT_OMANI_BAGHLAH',	'PROMOTION_JFD_BAGHLAH');
--==========================================================================================================================
--==========================================================================================================================

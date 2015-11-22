--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 									Description, 								Help, 												Sound, 				AttackMod,	DefenseMod,	AdjacentTileHealChange, CityAttack, CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_LINCOLN_SPEECH_ONE',	'TXT_KEY_PROMOTION_JFD_LINCOLN_SPEECH_ONE',	'TXT_KEY_PROMOTION_JFD_LINCOLN_SPEECH_ONE_HELP', 	'AS2D_IF_LEVELUP',	15, 		0, 			0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LINCOLN_SPEECH_ONE'),
			('PROMOTION_JFD_PARROTT_DEFENSE', 		'TXT_KEY_PROMOTION_JFD_PARROTT_DEFENSE',	'TXT_KEY_PROMOTION_JFD_PARROTT_DEFENSE_HELP', 		'AS2D_IF_LEVELUP',	10, 		10, 		0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PARROTT_DEFENSE'),
			('PROMOTION_JFD_PARROTT_RIFLE', 		'TXT_KEY_PROMOTION_JFD_PARROTT_RIFLE',		'TXT_KEY_PROMOTION_JFD_PARROTT_RIFLE_HELP', 		'AS2D_IF_LEVELUP', 	0, 			0, 			0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PARROTT_RIFLE'),
			('PROMOTION_JFD_BONUS_VS_LAND', 		'TXT_KEY_PROMOTION_JFD_BONUS_VS_LAND',		'TXT_KEY_PROMOTION_JFD_BONUS_VS_LAND_HELP', 		'AS2D_IF_LEVELUP', 	0, 			0, 			0, 						0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BONUS_VS_LAND'),
			('PROMOTION_JFD_BONUS_VS_CITIES', 		'TXT_KEY_PROMOTION_JFD_BONUS_VS_CITIES',	'TXT_KEY_PROMOTION_JFD_BONUS_VS_CITIES_HELP', 		'AS2D_IF_LEVELUP', 	0, 			0, 			0, 						100, 		1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BONUS_VS_CITIES');
--==========================================================================================================================
-- UnitPromotions_Domains
--==========================================================================================================================	
INSERT INTO UnitPromotions_Domains
		(PromotionType, 				DomainType, 	Modifier)
VALUES	('PROMOTION_JFD_BONUS_VS_LAND', 'DOMAIN_LAND', 	50);
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 						UnitCombatType)
SELECT 		'PROMOTION_JFD_LINCOLN_SPEECH_ONE',		Type
FROM UnitCombatInfos;
--==========================================================================================================================
--==========================================================================================================================

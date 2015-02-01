--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, UpgradeDiscount,	TradeMissionInfluenceModifier,	TradeMissionGoldModifier,	AttackMod,	DefenseMod,	LostWithUpgrade,	PortraitIndex, 	IconAtlas, 						PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_LANSKNECHT',		'TXT_KEY_PROMOTION_JFD_LANSKNECHT',			'TXT_KEY_PROMOTION_JFD_LANSKNECHT_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0,					0,								0,							20, 		20, 		0,					59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_LANSKNECHT'),
			('PROMOTION_JFD_DOPPELSOLDNER', 	'TXT_KEY_PROMOTION_JFD_DOPPELSOLDNER',		'TXT_KEY_PROMOTION_JFD_DOPPELSOLDNER_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0,					0,								0,							0, 			0, 			0,					59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DOPPELSOLDNER'),
			('PROMOTION_JFD_AMBASSADOR', 		'TXT_KEY_PROMOTION_JFD_AMBASSADOR',			'TXT_KEY_PROMOTION_JFD_AMBASSADOR_HELP', 		'AS2D_IF_LEVELUP', 	1, 				0,					-40,							0,							0, 			0, 			1,					8, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_AMBASSADOR'),
			('PROMOTION_JFD_GREAT_AMBASSADOR', 	'TXT_KEY_PROMOTION_JFD_GREAT_AMBASSADOR',	'TXT_KEY_PROMOTION_JFD_GREAT_AMBASSADOR_HELP', 	'AS2D_IF_LEVELUP', 	1, 				0,					100,							100, 						0,			0,			0,					8, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GREAT_AMBASSADOR');
--==========================================================================================================================
-- UnitPromotions_UnitClasses
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions_UnitClasses
		(PromotionType,					UnitClassType,			Attack)
VALUES	('PROMOTION_JFD_DOPPELSOLDNER', 'UNITCLASS_PIKEMAN',	100),
		('PROMOTION_JFD_DOPPELSOLDNER', 'UNITCLASS_SPEARMAN',	100),
		('PROMOTION_JFD_DOPPELSOLDNER', 'UNITCLASS_LANCER',		100);
--==========================================================================================================================
--==========================================================================================================================
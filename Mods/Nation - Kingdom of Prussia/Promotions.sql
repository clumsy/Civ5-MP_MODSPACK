--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 									Description, 									Help, 											Sound, 				CannotBeChosen, 	IgnoreZOC, LostWithUpgrade, 	GoldenAgeValueFromKills,	NearbyEnemyCombatMod,	NearbyEnemyCombatRange,	AdjacentMod,	PortraitIndex, 	IconAtlas, 						PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_PRUSSIAN_VETERAN_4', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_4', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_HELP', 	'AS2D_IF_LEVELUP', 	1, 					0, 			0, 					50,							0,						0,						0,				2, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_4'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_3', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_3', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_HELP', 	'AS2D_IF_LEVELUP', 	1, 					0, 			0, 					50,							0,						0,						0,				2, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_3'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_2', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_2', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_HELP', 	'AS2D_IF_LEVELUP', 	1, 					0, 			0, 					50,							0,						0,						0,				2, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_2'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_1', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_1', 	'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_HELP', 	'AS2D_IF_LEVELUP', 	1, 					0, 			0, 					50,							0,						0,						0,				2, 				'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_PRUSSIAN_VETERAN_1'),
			('PROMOTION_JFD_DEATHS_HEAD', 			'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD', 			'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD_HELP', 		'AS2D_IF_LEVELUP', 	1, 					0, 			1, 					0,							-10,					2,						0,				59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD'),
			('PROMOTION_JFD_DEATHS_HEAD_1', 		'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD_1', 			'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD_1_HELP', 	'AS2D_IF_LEVELUP', 	1, 					0, 			1, 					0,							0,						0,						0,				59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD_1'),
			('PROMOTION_JFD_DEATHS_HEAD_2', 		'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD_2', 			'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD_2_HELP', 	'AS2D_IF_LEVELUP', 	1, 					1, 			1, 					0,							0,						0,						0,				59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD_2'),
			('PROMOTION_JFD_BEWEGUNGSKRIEG', 		'TXT_KEY_PROMOTION_JFD_BEWEGUNGSKRIEG', 		'TXT_KEY_PROMOTION_JFD_BEWEGUNGSKRIEG_HELP', 	'AS2D_IF_LEVELUP', 	1, 					0, 			0, 					0, 							0,						0,						10,				59, 			'ABILITY_ATLAS', 				'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BEWEGUNGSKRIEG');
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 						UnitCombatType)
VALUES		('PROMOTION_JFD_BEWEGUNGSKRIEG', 		'UNITCOMBAT_GUN'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_1', 	'UNITCOMBAT_MOUNTED'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_2', 	'UNITCOMBAT_MOUNTED'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_3', 	'UNITCOMBAT_MOUNTED'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_4', 	'UNITCOMBAT_MOUNTED'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_1', 	'UNITCOMBAT_GUN'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_2', 	'UNITCOMBAT_GUN'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_3', 	'UNITCOMBAT_GUN'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_4', 	'UNITCOMBAT_GUN'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_1', 	'UNITCOMBAT_MELEE'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_2', 	'UNITCOMBAT_MELEE'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_3', 	'UNITCOMBAT_MELEE'),
			('PROMOTION_JFD_PRUSSIAN_VETERAN_4', 	'UNITCOMBAT_MELEE');
--==========================================================================================================================	
--==========================================================================================================================		


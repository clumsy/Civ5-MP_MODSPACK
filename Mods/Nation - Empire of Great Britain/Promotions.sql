--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 											LostWithUpgrade,	ExtraNavalMovement, ExperiencePercent,  HealOutsideFriendly,	Description, 											Help, 														Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_REDCOAT_GARRISON', 				1,					0,					0,					0,						'TXT_KEY_PROMOTION_JFD_REDCOAT_GARRISON',				'TXT_KEY_PROMOTION_JFD_REDCOAT_GARRISON_HELP',				'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_REDCOAT_GARRISON'),
			('PROMOTION_JFD_GRAND_CARRACK_HEAL', 			0,					0,					0,					1,						'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HEAL',				'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HEAL_HELP',			'AS2D_IF_LEVELUP', 	1, 				32, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HEAL'),
			('PROMOTION_JFD_GRAND_CARRACK_HEAL_INFO', 		0,					0,					0,					0,						'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HEAL_INFO',		'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HEAL_INFO_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_GRAND_CARRACK_HEAL_INFO');
--==========================================================================================================================		
--==========================================================================================================================		

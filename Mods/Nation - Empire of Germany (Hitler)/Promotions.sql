--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 						Description, 						Help, 									Sound, 				ExperiencePercent, 	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_JAEGER',	'TXT_KEY_PROMOTION_JFD_JAEGER',		'TXT_KEY_PROMOTION_JFD_JAEGER_HELP', 	'AS2D_IF_LEVELUP', 	15,					1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_JAEGER');
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions_UnitCombats
			(PromotionType,				UnitCombatType)
VALUES		('PROMOTION_SURVIVALISM_2',	'UNITCOMBAT_GUN'),
			('PROMOTION_SURVIVALISM_3',	'UNITCOMBAT_GUN'),
			('PROMOTION_SCOUTING_2',	'UNITCOMBAT_GUN'),
			('PROMOTION_SCOUTING_3',	'UNITCOMBAT_GUN');
--==========================================================================================================================
--==========================================================================================================================

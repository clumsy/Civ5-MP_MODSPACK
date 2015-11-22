--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_VOIVODE_GROWTH', 	'TXT_KEY_PROMOTION_JFD_VOIVODE_GROWTH', 	'TXT_KEY_PROMOTION_JFD_VOIVODE_GROWTH_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_VOIVODE_GROWTH');

UPDATE UnitPromotions
SET CannotBeChosen = 1
WHERE Type = 'PROMOTION_SPAWN_GENERALS_I';
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================	
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType,					UnitCombatType)
VALUES		('PROMOTION_SPAWN_GENERALS_I', 'UNITCOMBAT_MOUNTED');
--==========================================================================================================================
--==========================================================================================================================
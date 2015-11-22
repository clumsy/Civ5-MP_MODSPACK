--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================		
INSERT INTO UnitPromotions 
			(Type, 								Description, 							Help, 										Sound, 				CannotBeChosen, AdjacentTileHealChange, AlwaysHeal,	IgnoreZOC,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_FIELD_MEDIC', 		'TXT_KEY_PROMOTION_JFD_FIELD_MEDIC', 	'TXT_KEY_PROMOTION_JFD_FIELD_MEDIC_HELP', 	'AS2D_IF_LEVELUP', 	1, 				10, 					1,			1,			59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_FIELD_MEDIC');
--==========================================================================================================================	
-- UnitPromotions_Terrains
--==========================================================================================================================		
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 				UnitCombatType)
VALUES		('PROMOTION_JFD_FIELD_MEDIC', 	'UNITCOMBAT_GUN');
--==========================================================================================================================		
--==========================================================================================================================		

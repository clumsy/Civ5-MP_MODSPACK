--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_HungaryEvents.lua');
--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================		
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 										Description, 										Help, 													Sound, 				CannotBeChosen, MovesChange,	IgnoreZOC,	VisibilityChange, 	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_HUGNARY_FOREIGN_HERO', 		'TXT_KEY_PROMOTION_JFD_HUNGARY_FOREIGN_HERO', 		'TXT_KEY_PROMOTION_JFD_HUNGARY_FOREIGN_HERO_HELP', 		'AS2D_IF_LEVELUP', 	1, 				1,				1,			1, 					58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_HUNGARY_FOREIGN_HERO');
--==========================================================================================================================
--==========================================================================================================================


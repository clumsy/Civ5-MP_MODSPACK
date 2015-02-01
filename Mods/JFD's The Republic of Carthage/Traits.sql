--==========================================================================================================================	
-- Policies
--==========================================================================================================================	
INSERT OR REPLACE INTO Policies
			(Type,							Description)
VALUES		('POLICY_JFD_DIDO_CARTHAGE',	'TXT_KEY_TRAIT_JFD_CARTHAGE_DIDO');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT OR REPLACE INTO Traits 
			(Type, 								Description, 							ShortDescription,								CrossesMountainsAfterGreatGeneral)
VALUES		('TRAIT_JFD_CARTHAGE_HANNIBAL', 	'TXT_KEY_TRAIT_JFD_CARTHAGE_HANNIBAL', 	'TXT_KEY_TRAIT_JFD_CARTHAGE_HANNIBAL_SHORT',	1),
			('TRAIT_JFD_CARTHAGE_DIDO', 		'TXT_KEY_TRAIT_JFD_CARTHAGE_DIDO', 		'TXT_KEY_TRAIT_JFD_CARTHAGE_DIDO_SHORT',		0);

INSERT INTO Trait_FreePromotionUnitCombats
			(TraitType,							UnitCombatType, PromotionType)
SELECT		('TRAIT_JFD_CARTHAGE_HANNIBAL'),	Type,			('PROMOTION_JFD_HUNDRED_AND_FOUR')
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_ARMOR', 'UNITCOMBAT_RECON', 'UNITCOMBAT_ARCHER', 'UNITCOMBAT_MELEE', 'UNITCOMBAT_GUN', 'UNITCOMBAT_MOUNTED');

INSERT OR REPLACE INTO Trait_FreePromotionUnitCombats
			(TraitType,							UnitCombatType, PromotionType)
SELECT		('TRAIT_JFD_CARTHAGE_DIDO'),		Type,			('PROMOTION_JFD_COTHON')
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED');
--==========================================================================================================================	
--==========================================================================================================================	
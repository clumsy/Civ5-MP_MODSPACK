--==========================================================================================================================	
-- UnitClasses
--==========================================================================================================================	
INSERT INTO UnitClasses 
			(Type,						Description,				DefaultUnit)
VALUES		('UNITCLASS_JFD_MEDIC',		'TXT_KEY_UNIT_JFD_MEDIC', 	'UNIT_JFD_MEDIC');
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 					Type, 						PrereqTech,			Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Combat, Moves,	CombatClass,		Domain,			DefaultUnitAI,		Description, 						Help,									Civilopedia,							Strategy,									MilitarySupport,	MilitaryProduction, Conscription,	AdvancedStartCost,	UnitArtInfoEraVariation,	UnitArtInfo, 						UnitFlagIconOffset,		ShowInPedia, UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES		('UNITCLASS_JFD_MEDIC',		'UNIT_JFD_MEDIC', 			null,				-1,		-1,			0,								0,		0,		'UNITCOMBAT_GUN',	'DOMAIN_LAND',	'UNITAI_GENERAL',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC_HELP',	'TXT_KEY_CIV5_JFD_COMBAT_MEDIC_TEXT',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC_STRATEGY',	1,					1,					5,				-1,					1,							'ART_DEF_UNIT_JFD_COMBAT_MEDIC',	0,						0, 			 'JFD_UNIT_FLAG_MEDIC_ATLAS',	3, 				'JFD_SWITZERLAND_ATLAS',	'GREAT_PERSON'),
			('UNITCLASS_JFD_MEDIC',		'UNIT_JFD_COMBAT_MEDIC', 	'TECH_BIOLOGY',		240,	480,		1,								28,		2,		'UNITCOMBAT_GUN',	'DOMAIN_LAND',	'UNITAI_GENERAL',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC_HELP',	'TXT_KEY_CIV5_JFD_COMBAT_MEDIC_TEXT',	'TXT_KEY_UNIT_JFD_COMBAT_MEDIC_STRATEGY',	1,					1,					5,				-1,					1,							'ART_DEF_UNIT_JFD_COMBAT_MEDIC',	0,						1,			 'JFD_UNIT_FLAG_MEDIC_ATLAS',	3, 				'JFD_SWITZERLAND_ATLAS',	'GREAT_PERSON');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_COMBAT_MEDIC'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_COMBAT_MEDIC'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GENERAL');	
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
				(UnitType, 					FlavorType, Flavor)
SELECT			('UNIT_JFD_COMBAT_MEDIC'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GENERAL');	
--==========================================================================================================================	
-- Unit_FreePromotions
--==========================================================================================================================		
INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_JFD_FIELD_MEDIC'),
			('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_COMBAT_MEDIC', 	'PROMOTION_SIGHT_PENALTY');
--==========================================================================================================================		
--==========================================================================================================================					
		
			
--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Type, 				 ExtraMaintenanceCost,	Class, PurchaseOnly,	Cost,	Moves,	PrereqTech,				FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 				Civilopedia, 									Help, 								Strategy,								AdvancedStartCost,	WorkRate,	CombatLimit, DontShowYields, UnitArtInfoEraVariation,	UnitArtInfo, 							UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_TABOR'),	 1,						Class, 1,				700,	Moves,	'TECH_METAL_CASTING',	FaithCost,	CivilianAttackPriority, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_TABOR'), 	('TXT_KEY_CIVILOPEDIA_UNITS_JFD_TABOR_TEXT'), 	('TXT_KEY_UNIT_JFD_TABOR_HELP'), 	('TXT_KEY_UNIT_JFD_TABOR_STRATEGY'),	AdvancedStartCost, 	WorkRate,	CombatLimit, DontShowYields, 0,							('ART_DEF_UNIT_JFD_BOHEMIAN_TABOR'),	0,					('JFD_UNIT_FLAG_TABOR_ATLAS'),	MoveRate, 3, 				('JFD_BOHEMIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_TABOR'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TREBUCHET');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_TABOR'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_TABOR'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_TABOR',		'PROMOTION_JFD_TABOR_DEFENSE');
--==========================================================================================================================	
--==========================================================================================================================				
		
			
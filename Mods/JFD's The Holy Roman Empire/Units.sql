--==========================================================================================================================
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses 	
			(Type, 								DefaultUnit, 					Description)
VALUES		('UNITCLASS_JFD_GREAT_AMBASSADOR', 	'UNIT_JFD_GREAT_AMBASSADOR', 	'TXT_KEY_UNIT_JFD_GREAT_AMBASSADOR'),
			('UNITCLASS_JFD_HRE_CONQUISTADOR', 	'UNIT_JFD_HRE_CONQUISTADOR', 	'TXT_KEY_UNIT_JFD_GREAT_AMBASSADOR');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, Type, 						PrereqTech, Combat,		ExtraMaintenanceCost,	Cost, FaithCost, RequiresFaithPurchaseEnabled,	PurchaseOnly, 	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 								Strategy, 										Help, 										MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 							UnitFlagIconOffset, UnitFlagAtlas,							PortraitIndex, 	IconAtlas)
SELECT		Class, 	('UNIT_JFD_DOPPELSOLDNER'), PrereqTech, Combat+3,	2,						Cost, FaithCost, RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_DOPPELSOLDNER'),	('TXT_KEY_CIV5_JFD_DOPPELSOLDNER_TEXT'), 	('TXT_KEY_UNIT_JFD_DOPPELSOLDNER_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_DOPPELSOLDNER'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_DOPPELSOLDNER'), 	0,					('JFD_UNIT_FLAG_DOPPELSOLDNER_ATLAS'),	2, 				('JFD_HOLY_ROME_ATLAS')
FROM Units WHERE (Type = 'UNIT_PIKEMAN');

INSERT INTO Units 	
			(Class, Type, 						Cost,	Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,			Description, 						Civilopedia, 							Strategy, 									Help, 									AdvancedStartCost, WorkRate, CombatLimit, BaseGold, NumGoldPerEra,	CanBuyCityState,	MoveRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		Class, 	('UNIT_JFD_AMBASSADOR'),	100,	Moves, CivilianAttackPriority, Special, Domain, ('UNITAI_MERCHANT'),	('TXT_KEY_UNIT_JFD_AMBASSADOR'),	('TXT_KEY_CIV5_JFD_AMBASSADOR_TEXT'), 	('TXT_KEY_UNIT_JFD_AMBASSADOR_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_AMBASSADOR'), 	AdvancedStartCost, WorkRate, CombatLimit, 25,		25,				0,					MoveRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 	0,					('JFD_UNIT_FLAG_AMBASSADOR_ATLAS'),	3, 				('JFD_HOLY_ROME_ATLAS')
FROM Units WHERE (Type = 'UNIT_VENETIAN_MERCHANT');

INSERT INTO Units 	
			(Class,									Type, 							Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, Description, 							Civilopedia, 							Strategy, 											Help, 											AdvancedStartCost, WorkRate, CombatLimit, BaseGold,	NumGoldPerEra, CanBuyCityState, MoveRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNITCLASS_JFD_GREAT_AMBASSADOR'), 	('UNIT_JFD_GREAT_AMBASSADOR'),	1200, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_GREAT_AMBASSADOR'),	('TXT_KEY_CIV5_JFD_AMBASSADOR_TEXT'), 	('TXT_KEY_UNIT_JFD_GREAT_AMBASSADOR_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_GREAT_AMBASSADOR'), 	AdvancedStartCost, WorkRate, CombatLimit, BaseGold, NumGoldPerEra, CanBuyCityState, MoveRate, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 	0,					('JFD_UNIT_FLAG_AMBASSADOR_ATLAS'),	3, 				('JFD_HOLY_ROME_ATLAS')
FROM Units WHERE (Type = 'UNIT_VENETIAN_MERCHANT');
--------------------------------	
-- Decisions Support
--------------------------------	
INSERT INTO Units 	
			(Class,									Type, 							WorkRate,	ShowInPedia,	Combat,	Cost, 	FaithCost,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		('UNITCLASS_JFD_HRE_CONQUISTADOR'), 	('UNIT_JFD_HRE_CONQUISTADOR'),	1,			0,				Combat, -1, 	-1,			Moves, CombatClass, Domain, DefaultUnitAI, Description, Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_SPANISH_CONQUISTADOR');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DOPPELSOLDNER'), SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_AMBASSADOR'),	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_VENETIAN_MERCHANT');

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_GREAT_AMBASSADOR'),	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_VENETIAN_MERCHANT');
--------------------------------	
-- Decisions Support
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_HRE_CONQUISTADOR'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SPANISH_CONQUISTADOR');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_DOPPELSOLDNER'), UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');	

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_AMBASSADOR'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_VENETIAN_MERCHANT');

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_GREAT_AMBASSADOR'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_VENETIAN_MERCHANT');
--------------------------------	
-- Decisions Support
--------------------------------	
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_HRE_CONQUISTADOR'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SPANISH_CONQUISTADOR');	
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
SELECT		('UNIT_JFD_GREAT_AMBASSADOR'),	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_VENETIAN_MERCHANT');
--------------------------------	
-- Decisions Support
--------------------------------	
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_JFD_HRE_CONQUISTADOR', 	'BUILD_JFD_HOLY_ROMAN_CITY');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_DOPPELSOLDNER'), FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_AMBASSADOR'),	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_VENETIAN_MERCHANT');

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,			Flavor)
VALUES		('UNIT_JFD_DOPPELSOLDNER', 'FLAVOR_DIPLOMACY',	50);
--------------------------------	
-- Decisions Support
--------------------------------	
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_HRE_CONQUISTADOR'),	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SPANISH_CONQUISTADOR');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
VALUES		('UNIT_JFD_DOPPELSOLDNER', 'UNITCLASS_LANCER');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
VALUES		('UNIT_JFD_AMBASSADOR',		'UNITCLASS_JFD_GREAT_AMBASSADOR');
--------------------------------	
-- Decisions Support
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_JFD_HRE_CONQUISTADOR'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SPANISH_CONQUISTADOR');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_JFD_DOPPELSOLDNER'), PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PIKEMAN');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_DOPPELSOLDNER',		'PROMOTION_JFD_DOPPELSOLDNER'),
			('UNIT_JFD_AMBASSADOR',			'PROMOTION_JFD_AMBASSADOR'),
			('UNIT_JFD_GREAT_AMBASSADOR',	'PROMOTION_JFD_GREAT_AMBASSADOR');
--------------------------------	
-- Decisions Support
--------------------------------	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_HRE_CONQUISTADOR'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_SPANISH_CONQUISTADOR');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_HRE_CONQUISTADOR',	'PROMOTION_DEFENSIVE_EMBARKATION'),
			('UNIT_JFD_HRE_CONQUISTADOR',	'PROMOTION_ALLWATER_EMBARKATION');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 							UniqueName)
VALUES		('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_PIZZARO'),
			('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_CORTEZ'),
			('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_CUELLER'),
			('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_DAVILA'),
			('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_CORDOBA'),
			('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_DE_ANZA'),
			('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_VALDIVIA'),
			('UNIT_JFD_HRE_CONQUISTADOR',		'TXT_KEY_JFD_LEGAZPI'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_OTTO_VON_BISMARK'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_ADAM_ADAMI'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_FRONZ_VON_ALBINI'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_KURT_RIEZLER'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_GUSTAV_STRESEMAN'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_FREDERICK_VON_DER_DECKEN'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_PHILLIP_HAINHOFER'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_WALTER_HALLSTEIN'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_JOHANN_MATTHESON'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_HANS_CASPAR_VON_BOTHMER'),
			('UNIT_JFD_AMBASSADOR',				'TXT_KEY_GREAT_PERSON_JFD_FRANZ_VON_PAPEN'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_OTTO_VON_BISMARK'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_ADAM_ADAMI'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_FRONZ_VON_ALBINI'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_KURT_RIEZLER'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_GUSTAV_STRESEMAN'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_FREDERICK_VON_DER_DECKEN'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_PHILLIP_HAINHOFER'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_WALTER_HALLSTEIN'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_JOHANN_MATTHESON'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_HANS_CASPAR_VON_BOTHMER'),
			('UNIT_JFD_GREAT_AMBASSADOR',		'TXT_KEY_GREAT_PERSON_JFD_FRANZ_VON_PAPEN');
--==========================================================================================================================
--==========================================================================================================================		
		
			
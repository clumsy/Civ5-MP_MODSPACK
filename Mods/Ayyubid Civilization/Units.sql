--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class,	Type, 							NoMaintenance,	ShowInPedia,	PrereqTech, Combat,	RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		Class,	('UNIT_JFD_AYYUBID_CHARIOT'),	1,				0,				PrereqTech, Combat, RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_CHARIOT_ARCHER');

INSERT INTO Units 	
			(Class,	Type, 							NoMaintenance,	ShowInPedia,	PrereqTech, Combat,	RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		Class,	('UNIT_JFD_AYYUBID_HORSEMAN'),	1,				0,				PrereqTech, Combat, RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_HORSEMAN');

INSERT INTO Units 	
			(Class,	Type, 							NoMaintenance,	ShowInPedia,	PrereqTech, Combat,	RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		Class,	('UNIT_JFD_AYYUBID_MAMLUK'),	1,				0,				PrereqTech, Combat, RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_MC_AYYUBID_MAMELUKE');

INSERT INTO Units 	
			(Class,	Type, 							NoMaintenance,	ShowInPedia,	ProhibitsSpread, PrereqTech, Combat,	RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		Class,	('UNIT_JFD_AYYUBID_LANCER'),	1,				0,				ProhibitsSpread, PrereqTech, Combat,	RangedCombat, Cost, Range,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, 	Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_LANCER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_AYYUBID_CHARIOT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_AYYUBID_HORSEMAN'),	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_HORSEMAN');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_AYYUBID_MAMLUK'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MC_AYYUBID_MAMELUKE');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_AYYUBID_LANCER'),	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LANCER');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_AYYUBID_CHARIOT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');

INSERT INTO Unit_AITypes 	
			(UnitType, 						 UnitAIType)
SELECT		('UNIT_JFD_AYYUBID_HORSEMAN'),	 UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_HORSEMAN');

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_AYYUBID_MAMLUK'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MC_AYYUBID_MAMELUKE');

INSERT INTO Unit_AITypes 	
			(UnitType, 						 UnitAIType)
SELECT		('UNIT_JFD_AYYUBID_LANCER'),	 UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_AYYUBID_CHARIOT'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_AYYUBID_HORSEMAN'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_HORSEMAN');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_AYYUBID_MAMLUK'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MC_AYYUBID_MAMELUKE');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_AYYUBID_LANCER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_LANCER');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_AYYUBID_CHARIOT'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_AYYUBID_HORSEMAN'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_HORSEMAN');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_AYYUBID_MAMLUK'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_MC_AYYUBID_MAMELUKE');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
SELECT		('UNIT_JFD_AYYUBID_LANCER'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_LANCER');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_AYYUBID_CHARIOT',	'PROMOTION_JFD_AYYUBID_CALIPHATE'),
			('UNIT_JFD_AYYUBID_HORSEMAN', 	'PROMOTION_JFD_AYYUBID_CALIPHATE'),
			('UNIT_JFD_AYYUBID_MAMLUK',		'PROMOTION_JFD_AYYUBID_CALIPHATE'),
			('UNIT_JFD_AYYUBID_LANCER',		'PROMOTION_JFD_AYYUBID_CALIPHATE');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_AYYUBID_CHARIOT'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CHARIOT_ARCHER');	
	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_AYYUBID_HORSEMAN'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_HORSEMAN');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_AYYUBID_MAMLUK'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MC_AYYUBID_MAMELUKE');	
	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_AYYUBID_LANCER'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LANCER');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_YieldFromKills 	
			(UnitType, 						YieldType,		Yield)
VALUES		('UNIT_JFD_AYYUBID_CHARIOT',	'YIELD_FAITH',	100),
			('UNIT_JFD_AYYUBID_HORSEMAN', 	'YIELD_FAITH',	100),
			('UNIT_JFD_AYYUBID_MAMLUK',		'YIELD_FAITH',	100),
			('UNIT_JFD_AYYUBID_LANCER',		'YIELD_FAITH',	100);
--==========================================================================================================================
--==========================================================================================================================		
		
			
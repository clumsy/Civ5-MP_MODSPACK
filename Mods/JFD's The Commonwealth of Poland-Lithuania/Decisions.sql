--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_PolandLithuaniaDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,										Description) 
VALUES		('POLICY_JFD_POLAND_LITHUANIA_NIHIL_NOVI',	'TXT_KEY_DECISIONS_JFD_POLAND_LITHUANIA_NIHIL_NOVI_ACT');
--==========================================================================================================================
-- Policy_BuildingClassCultureChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassCultureChanges
			(PolicyType,								BuildingClassType,		CultureChange) 
VALUES		('POLICY_JFD_POLAND_LITHUANIA_NIHIL_NOVI',	'BUILDINGCLASS_BANK',	2);
--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class,	Type, 						ShowInPedia,	PrereqTech, Combat,	Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		Class,	('UNIT_JFD_POLISH_LANCER'),	0,				PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_LANCER');

INSERT INTO Units 	
			(Class,	Type, 						ShowInPedia,	PrereqTech, Combat,	Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		Class,	('UNIT_JFD_POLISH_KNIGHT'),	0,				PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, CombatClass, Domain, DefaultUnitAI, Description, Help, 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, UnitArtInfo,	UnitFlagIconOffset,	UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_KNIGHT');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_POLISH_LANCER'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_LANCER');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_POLISH_KNIGHT'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_POLISH_LANCER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_LANCER');	

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_POLISH_KNIGHT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_JFD_POLISH_LANCER'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_LANCER');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_JFD_POLISH_KNIGHT'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_KNIGHT');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_POLISH_DEATHS_HEAD'),	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_POLISH_LANCER'),	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_LANCER');

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_POLISH_KNIGHT'),	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_KNIGHT');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_JFD_POLISH_LANCER'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_LANCER');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 					PromotionType)
SELECT		('UNIT_JFD_POLISH_KNIGHT'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_KNIGHT');
--==========================================================================================================================	
--==========================================================================================================================	

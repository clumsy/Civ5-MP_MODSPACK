--==========================================================================================================================	
-- Units
--==========================================================================================================================
INSERT OR REPLACE INTO Units 	
			(Class, 	Type, 						PrereqTech, RangedCombat,	Range, Special, Combat,	  Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 								Strategy, 									 Help, 										Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,							PortraitIndex, 	IconAtlas,						MoveRate)
SELECT		Class,		('UNIT_JFD_GRAND_CARRACK'), PrereqTech, RangedCombat+2, Range, Special, Combat+1, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_GRAND_CARRACK'), ('TXT_KEY_CIV5_JFD_GRAND_CARRACK_TEXT'), 	('TXT_KEY_UNIT_JFD_GRAND_CARRACK_STRATEGY'), ('TXT_KEY_UNIT_HELP_JFD_GRAND_CARRACK'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_GRAND_CARRACK'), 0,					('JFD_GRAND_CARRACK_FLAG_ART_ATLAS'),	2, 				('JFD_GREAT_BRITAIN_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_GALLEASS');

INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		Class, 		('UNIT_JFD_REDCOAT'), 		PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_REDCOAT'), 	('TXT_KEY_CIV5_JFD_REDCOAT_TEXT'), 	('TXT_KEY_UNIT_JFD_REDCOAT_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_REDCOAT'),  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_JFD_REDCOAT'),  0,					('JFD_UNIT_FLAG_REDCOAT_ATLAS'),	3, 				('JFD_GREAT_BRITAIN_ATLAS')
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');

UPDATE Units
SET Cost = 170,
	Moves = Moves+2,
	Combat = Combat-5,
	RangedCombat = RangedCombat-7
WHERE Type = 'UNIT_ENGLISH_SHIPOFTHELINE';
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_GRAND_CARRACK'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GALLEASS');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_REDCOAT'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_GRAND_CARRACK'), UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GALLEASS');

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_REDCOAT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT OR REPLACE INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_GRAND_CARRACK'),		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GALLEASS');	
	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_REDCOAT'),			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_GRAND_CARRACK'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GALLEASS');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_REDCOAT'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT OR REPLACE INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_REDCOAT', 		'PROMOTION_JFD_REDCOAT_GARRISON'),
			('UNIT_JFD_REDCOAT', 		'PROMOTION_IGNORE_TERRAIN_COST'),
			('UNIT_JFD_REDCOAT', 		'PROMOTION_RIVAL_TERRITORY'),
			('UNIT_JFD_GRAND_CARRACK', 	'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_GRAND_CARRACK', 	'PROMOTION_JFD_GRAND_CARRACK_HEAL_INFO');
--==========================================================================================================================		
--==========================================================================================================================					
		
			
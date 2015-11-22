--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 					PrereqTech, RangedCombat, Range, AirInterceptRange, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,						MoveRate)
SELECT		Class,		('UNIT_JFD_SPITFIRE'), 	PrereqTech, RangedCombat, Range, AirInterceptRange, Special, Combat, Cost,	FaithCost, RequiresFaithPurchaseEnabled, Moves, Immobile, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SPITFIRE'), 	('TXT_KEY_CIV5_JFD_SPITFIRE_TEXT'), 	('TXT_KEY_UNIT_JFD_SPITFIRE_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_SPITFIRE'), Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AirUnitCap, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_SPITFIRE'), 	0,					('JFD_SPITFIRE_FLAG_ART_ATLAS'),	3, 				('JFD_UNITED_KINGDOM_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_FIGHTER');


INSERT INTO Units 	
			(Type, 						PrereqTech,					Class, Combat,		ExtraMaintenanceCost,	RangedCombat,	 CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI,	Description, 						Civilopedia, 							Strategy, 									Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,						MoveRate)
SELECT		('UNIT_JFD_DREADNOUGHT'),	'TECH_REPLACEABLE_PARTS',	Class, Combat+8,	1,						RangedCombat+8,  CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI,	('TXT_KEY_UNIT_JFD_DREADNOUGHT'), 	('TXT_KEY_UNIT_JFD_DREADNOUGHT_TEXT'), 	('TXT_KEY_UNIT_JFD_DREADNOUGHT_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_DREADNOUGHT'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_DREADNOUGHT'), 	0,					('JFD_DREADNOUGHT_FLAG_ART_ATLAS'),	2, 				('JFD_UNITED_KINGDOM_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_BATTLESHIP');	
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
--Disciple
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SPITFIRE'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_FIGHTER');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DREADNOUGHT'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_BATTLESHIP');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_SPITFIRE'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BATTLESHIP');
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 					ResourceType)
SELECT		('UNIT_JFD_SPITFIRE'), 		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 					ResourceType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BATTLESHIP');
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_SPITFIRE'), 		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_BATTLESHIP');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_SPITFIRE'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_DREADNOUGHT'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_BATTLESHIP');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_JFD_SPITFIRE'), 				PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_FIGHTER');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_JFD_DREADNOUGHT'), 			PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_JFD_DREADNOUGHT', 			'PROMOTION_JFD_DREADNOUGHT'),
			('UNIT_JFD_SPITFIRE', 				'PROMOTION_PARTIAL_HEAL_IF_DESTROY_ENEMY'),
			('UNIT_JFD_SPITFIRE', 				'PROMOTION_JFD_RAF');
--==========================================================================================================================		
--==========================================================================================================================					
		
			
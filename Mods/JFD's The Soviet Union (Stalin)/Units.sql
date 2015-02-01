--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	(Class, 	Type, 				PrereqTech, Combat, Cost, 	 FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, Mechanized, MoveRate, UnitArtInfo, 				UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
	SELECT			Class,		('UNIT_JFD_IS2'), 	PrereqTech, Combat, Cost-10, FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_IS2'), 	('TXT_KEY_CIV5_JFD_IS2_TEXT'), 	('TXT_KEY_UNIT_JFD_IS2_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_IS2'), 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, Mechanized, MoveRate, ('ART_DEF_UNIT_JFD_IS2'),	0,					('JFD_STALIN_IS2_FLAG_ART_ATLAS'),	3, 				('JFD_USSR_STALIN_ATLAS')
	FROM Units WHERE (Type = 'UNIT_TANK');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_IS2'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TANK');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 			UnitAIType)
SELECT		('UNIT_JFD_IS2'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_TANK');	
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 			UnitClassType)
SELECT		('UNIT_JFD_IS2'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_TANK');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 			FlavorType, Flavor)
SELECT		('UNIT_JFD_IS2'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_TANK');	
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================	
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 			ResourceType, Cost)
SELECT		('UNIT_JFD_IS2'), 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_TANK');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 			PromotionType)
SELECT		('UNIT_JFD_IS2'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_TANK');	

INSERT INTO Unit_FreePromotions 	
			(UnitType, 			PromotionType)
VALUES		('UNIT_JFD_IS2', 	'PROMOTION_JFD_STALIN_IS2_INFO');
--==========================================================================================================================	
--==========================================================================================================================				
		
			
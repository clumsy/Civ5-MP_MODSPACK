--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Type, 					PrereqTech,	Class, Combat,	RangedCombat,	CombatClass,	Cost, Moves,	Range, Domain, DefaultUnitAI,			Description, 					Civilopedia, 						Strategy, 								Help, 								SpecialCargo,			DomainCargo,	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		('UNIT_JFD_YAMATO'),	PrereqTech,	Class, Combat,	RangedCombat,	CombatClass,	Cost, Moves-1,	Range, Domain, ('UNITAI_CITY_BOMBARD'),	('TXT_KEY_UNIT_JFD_YAMATO'), 	('TXT_KEY_UNIT_JFD_YAMATO_TEXT'), 	('TXT_KEY_UNIT_JFD_YAMATO_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_YAMATO'), 	'SPECIALUNIT_FIGHTER',	'DOMAIN_AIR',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_YAMATO'), 	0,					('JFD_YAMATO_FLAG_ART_ATLAS'),	2, 				('JFD_JAPAN_TOJO_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_BATTLESHIP');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_YAMATO'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_BATTLESHIP');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_YAMATO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_YAMATO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CARRIER');

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
VALUES		('UNIT_JFD_YAMATO', 	'UNITAI_CITY_BOMBARD');
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
SELECT		('UNIT_JFD_YAMATO'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BATTLESHIP');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_YAMATO'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_YAMATO'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CARRIER');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_YAMATO'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BATTLESHIP');

INSERT INTO Unit_FreePromotions
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_YAMATO', 	'PROMOTION_CITY_SIEGE'),
			('UNIT_JFD_YAMATO', 	'PROMOTION_CARGO_II');
--==========================================================================================================================		
--==========================================================================================================================					
		
			
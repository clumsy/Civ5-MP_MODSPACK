--=======================================================================================================================
-- UnitClasses
--=======================================================================================================================
INSERT INTO UnitClasses
			(Type, 							DefaultUnit, 						Description)
VALUES		('UNITCLASS_JFD_MONITOR', 		'UNIT_JFD_DUMMY_MONITOR_RANGED', 	'TXT_KEY_UNIT_JFD_MONITOR_MELEE');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat,	RangedCombat, 	Range,	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, 	Domain, DefaultUnitAI, Description, 						Civilopedia, 											Strategy, 										Help, 									 Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 								UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		Class,		('UNIT_JFD_PARROTT_RIFLE'),	PrereqTech, Combat,	RangedCombat, 	Range, 	Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, 	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_PARROTT_RIFLE'),	('TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_RIFLED_CANNON_TEXT'), ('TXT_KEY_UNIT_JFD_PARROTT_RIFLE_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_PARROTT_RIFLE'), Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_UNION_ARTILLERY_PARROTT'), 	2,					('CIVIL_WAR_UNIT_FLAG_ATLAS'),	10, 			('CIVIL_WAR_UNIT_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_CANNON');

INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat,	Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 										Strategy, 								Help, 							Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		Class,		('UNIT_JFD_MONITOR_MELEE'), PrereqTech, Combat,	Cost+40,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_MONITOR_MELEE'),	('TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_TEXT'), 	('TXT_KEY_UNIT_JFD_MONITOR_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_MONITOR'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_UNION_IRONCLAD'), 	1,					('CIVIL_WAR_UNIT_FLAG_ATLAS'),	9, 				('CIVIL_WAR_UNIT_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_IRONCLAD');

INSERT INTO Units 	
			(Class, 						Type, 								ShowInPedia,	PrereqTech, Cost,	FaithCost,	Description, 							Help, 								PortraitIndex, 	IconAtlas)
SELECT		('UNITCLASS_JFD_MONITOR'),		('UNIT_JFD_DUMMY_MONITOR_RANGED'),	0,				null,		-1,		-1,			('TXT_KEY_UNIT_JFD_MONITOR_RANGED'),	('TXT_KEY_UNIT_HELP_JFD_MONITOR'), 	9, 				('CIVIL_WAR_UNIT_ATLAS')
FROM Units WHERE (Type = 'UNIT_IRONCLAD');

INSERT INTO Units 	
			(Class, 						Type, 							ShowInPedia,	PrereqTech, Combat,	RangedCombat, 	Range,	Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, 					Domain, DefaultUnitAI, Description, 						Civilopedia, 										Strategy, 								Help, 								Mechanized, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		('UNITCLASS_JFD_MONITOR'),		('UNIT_JFD_MONITOR_RANGED'),	0,				null,		Combat,	28, 			3, 		Cost+50,	FaithCost, RequiresFaithPurchaseEnabled, Moves, ('UNITCOMBAT_NAVALRANGED'), 	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_MONITOR_RANGED'),	('TXT_KEY_CIVIL_WAR_SCENARIO_UNIT_MONITOR_TEXT'), 	('TXT_KEY_UNIT_JFD_MONITOR_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_MONITOR'), 	Mechanized, Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_UNION_IRONCLAD'), 	1,					('CIVIL_WAR_UNIT_FLAG_ATLAS'),	9, 				('CIVIL_WAR_UNIT_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_IRONCLAD');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CANNON');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_IRONCLAD');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CANNON');	

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_AITypes 	
			(UnitType, 						UnitAIType)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_IRONCLAD');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CANNON');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 						UnitClassType)
VALUES		('UNIT_JFD_MONITOR_RANGED', 	'UNITCLASS_BATTLESHIP');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_PARROTT_RIFLE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CANNON');

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_Flavors 	
			(UnitType, 						FlavorType, Flavor)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_IRONCLAD');	
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_JFD_MONITOR_MELEE'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_IRONCLAD');	

INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 						ResourceType)
SELECT		('UNIT_JFD_MONITOR_RANGED'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_IRONCLAD');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_ONLY_DEFENSIVE'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_NO_DEFENSIVE_BONUSES'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_SIGHT_PENALTY'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_MUST_SET_UP'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_JFD_BONUS_VS_LAND'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_JFD_BONUS_VS_CITIES'),
			('UNIT_JFD_PARROTT_RIFLE', 		'PROMOTION_JFD_PARROTT_RIFLE'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_SUPPLY'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_STEAM_POWERED'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_FIRE_SUPPORT'),
			('UNIT_JFD_MONITOR_MELEE', 		'PROMOTION_MEDIC'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_JFD_BONUS_VS_CITIES'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_INDIRECT_FIRE'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_MUST_SET_UP'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_STEAM_POWERED'),
			('UNIT_JFD_MONITOR_RANGED', 	'PROMOTION_FIRE_SUPPORT');
--==========================================================================================================================		
--==========================================================================================================================				
		
			
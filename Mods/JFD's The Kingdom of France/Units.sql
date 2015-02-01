--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 							 ShowInPedia,	Class, Cost, Moves, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description,								Civilopedia,									Strategy,											AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo,  UnitFlagIconOffset,	UnitFlagAtlas,	MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_NAPOLEONIC_MARSHAL'), 0,				Class, Cost, Moves, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_NAPOLEONIC_MARSHAL'), ('TXT_KEY_UNIT_JFD_NAPOLEONIC_MARSHAL_TEXT'),	('TXT_KEY_UNIT_JFD_NAPOLEONIC_MARSHAL_STRATEGY'),	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo,  UnitFlagIconOffset,	UnitFlagAtlas,	MoveRate, PortraitIndex, 	IconAtlas
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	

INSERT INTO Units 	
			(Type, 							 PrereqTech, Class, Combat, 	Cost, 	 Moves,   FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, 		Description, 							Civilopedia, 								Help, 										Strategy,									  ObsoleteTech, 				GoodyHutUpgradeUnitClass, 			Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_IMPERIAL_GUARD'),	 PrereqTech, Class, Combat+1,   Cost+35, Moves-2, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain,	('UNITAI_DEFENSE'), ('TXT_KEY_UNIT_JFD_IMPERIAL_GUARD'), 	('TXT_KEY_CIV5_JFD_IMPERIAL_GUARD_TEXT'), 	('TXT_KEY_UNIT_JFD_IMPERIAL_GUARD_HELP'), 	('TXT_KEY_UNIT_JFD_IMPERIAL_GUARD_STRATEGY'), ('TECH_REPLACEABLE_PARTS'),	('UNITCLASS_GREAT_WAR_INFANTRY'),	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_IMPERIAL_GUARD'),  	0,					('JFD_UNIT_FLAG_IMPERIAL_GUARD_ATLAS'),	('BIPED'),	2, 				('JFD_FRANCE_ATLAS')
FROM Units WHERE (Type = 'UNIT_LANCER');	

INSERT INTO Units 	
			(Type, 							 PrereqTech,  Class, Combat,	Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, Description, 							Civilopedia, 							Help, 										Strategy,									ObsoleteTech, 	GoodyHutUpgradeUnitClass, 	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, UnitArtInfo,							UnitFlagIconOffset,	UnitFlagAtlas,							MoveRate,	PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_CHEVAU_LEGER'),		 PrereqTech,  Class, Combat,	Cost, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_CHEVAU_LEGER'), 	('TXT_KEY_CIV5_JFD_CHEVAU_LEGER_TEXT'), ('TXT_KEY_UNIT_JFD_CHEVAU_LEGER_HELP'), 	('TXT_KEY_UNIT_JFD_CHEVAU_LEGER_STRATEGY'), ObsoleteTech,	GoodyHutUpgradeUnitClass,	Conscription, XPValueDefense, XPValueAttack, MilitarySupport, MilitaryProduction, AdvancedStartCost, Pillage, IgnoreBuildingDefense, ('ART_DEF_UNIT_JFD_CHEVAU_LEGER'),  	0,					('JFD_UNIT_FLAG_CHEVAU_LEGER_ATLAS'),	MoveRate,	3, 				('JFD_FRANCE_ATLAS')
FROM Units WHERE (Type = 'UNIT_CAVALRY');	
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_NAPOLEONIC_MARSHAL'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_IMPERIAL_GUARD'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_CHEVAU_LEGER'), 				SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CAVALRY');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_JFD_NAPOLEONIC_MARSHAL'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_JFD_IMPERIAL_GUARD'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_JFD_CHEVAU_LEGER'), 				UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 							ResourceType)
SELECT		('UNIT_JFD_CHEVAU_LEGER'), 			ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_NAPOLEONIC_MARSHAL'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_IMPERIAL_GUARD'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_CHEVAU_LEGER'), 				FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_NAPOLEONIC_MARSHAL'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_IMPERIAL_GUARD'), 		FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_JFD_CHEVAU_LEGER'), 			FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_JFD_CHEVAU_LEGER'), 			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CAVALRY');

INSERT INTO Unit_ClassUpgrades
			(UnitType, 						UnitClassType)
VALUES		('UNIT_JFD_IMPERIAL_GUARD',		'UNITCLASS_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 							BuildType)
SELECT		('UNIT_JFD_NAPOLEONIC_MARSHAL'), 	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_JFD_NAPOLEONIC_MARSHAL'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_JFD_CHEVAU_LEGER'), 			PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_CAVALRY');

INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
VALUES		('UNIT_JFD_IMPERIAL_GUARD',		'PROMOTION_SPAWN_GENERALS_I'),
			('UNIT_JFD_IMPERIAL_GUARD',		'PROMOTION_JFD_IMPERIAL_GUARD'),
			('UNIT_JFD_CHEVAU_LEGER',		'PROMOTION_JFD_NAPOLEONIC_BONUS_VS_MOUNTED'),
			('UNIT_JFD_CHEVAU_LEGER',		'PROMOTION_JFD_NAPOLEONIC_BONUS_VS_SIEGE'),
			('UNIT_JFD_CHEVAU_LEGER',		'PROMOTION_JFD_BONUS_WHEN_DAMAGED');			
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 						UniqueName)
VALUES		('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_BERNADOTTE'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_BERTHIER'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_MURAT'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_DE_MONCEY'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_JOURDAN'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_MASSENA'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_AUGEREAU'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_SOULT'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_LANNES'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_MORTIER'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_NEY'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_DAVOUT'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_BESSIERES'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_DE_KALLERMANN'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_LEFEBVRE'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_DE_PERIGNON'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_SERURIER'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_VICTOR'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_MACDONALD'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_OUDINOT'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_DE_MARMONT'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_SUCHET'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_SAINT_CYR'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_PONIATOWSKI'),
			('UNIT_JFD_NAPOLEONIC_MARSHAL', 'TXT_KEY_GREAT_PERSON_JFD_DE_GROUCHY');
--==========================================================================================================================
--==========================================================================================================================		
		
			
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat,		Cost,		FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		Class,		('UNIT_JFD_LENIN_LEVY'), 	PrereqTech, Combat-2,	Cost-30,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_LENIN_LEVY'), 	('TXT_KEY_CIV5_JFD_LENIN_LEVY_TEXT'), 	('TXT_KEY_UNIT_JFD_LENIN_LEVY_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_LENIN_LEVY'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_LENIN_LEVY'), 	0,					('JFD_LENIN_LEVY_FLAG_ART_ATLAS'),	3, 				('JFD_USSR_LENIN_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');

INSERT INTO Units 	
			(Type, 						OneShotTourism, OneShotTourismPercentOthers,	PrereqTech, Class, Capture, ShowInPedia, 	Cost, Moves, CivilianAttackPriority, Domain, DefaultUnitAI,			Description, Civilopedia, Help, Strategy, AdvancedStartCost, WorkRate, 	CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas)
SELECT		('UNIT_JFD_LENIN_WORKER'),	4,				20,								PrereqTech, Class, Capture, 0,				Cost, Moves, CivilianAttackPriority, Domain, ('UNITAI_MUSICIAN'),	Description, Civilopedia, Help, Strategy, AdvancedStartCost, WorkRate,	CombatLimit, UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas
FROM Units WHERE (Type = 'UNIT_WORKER');	
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
--Disciple
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_LENIN_LEVY'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_LENIN_WORKER'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WORKER');	
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_LENIN_LEVY'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_LENIN_WORKER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSICIAN');
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
SELECT		('UNIT_JFD_LENIN_LEVY'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_LENIN_LEVY'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_LENIN_WORKER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSICIAN');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 							BuildType)
SELECT		('UNIT_JFD_LENIN_WORKER'), 			BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_WORKER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_JFD_LENIN_LEVY'), 			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');

INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
VALUES		('UNIT_JFD_LENIN_WORKER', 			'UNITCLASS_GREAT_WAR_INFANTRY');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_JFD_LENIN_LEVY', 			'PROMOTION_JFD_LENIN_LEVY');
--==========================================================================================================================		
--==========================================================================================================================					
		
			
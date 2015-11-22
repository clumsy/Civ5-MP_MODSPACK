--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 							UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 						MoveRate)
SELECT		Class, 	('UNIT_JFD_WEHRMACHT'), PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_WEHRMACHT_DESC'), ('TXT_KEY_JFD_WEHRMACHT_TEXT'), ('TXT_KEY_JFD_WEHRMACHT_STRATEGY'), ('TXT_KEY_JFD_WEHRMACHT_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_WEHRMACHT'), ('UNITS_JFD_WEHRMACHT_FLAG_ART_ATLAS'), 	0,					2, 				('JFD_NAZI_GERMANY_ATLAS'), 	MoveRate
FROM Units WHERE (Type = 'UNIT_INFANTRY');

INSERT OR REPLACE INTO Units 	
			(Class, Type, 					PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 					UnitFlagAtlas, 					UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT		Class, 	('UNIT_JFD_JAEGER'),	PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_JFD_JAEGER_DESC'),	('TXT_KEY_JFD_JAEGER_TEXT'),	('TXT_KEY_JFD_JAEGER_STRATEGY'),	('TXT_KEY_JFD_JAEGER_HELP'),	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_JFD_JAEGER'),		('UNITS_JFD_JAEGER_FLAG_ATLAS'), 0,					0, 				('JFD_JAEGER_ATLAS'), 	MoveRate
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');

INSERT INTO Units 	
			(Class, Type, 				ShowInPedia,	Special, PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, BaseBeakersTurnsToCount, WorkRate, Domain, DefaultUnitAI,			Description,				Civilopedia,				Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation,	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 					MoveRate)
SELECT		Class, 	('UNIT_JFD_SS'), 	0,				Special, PrereqTech, Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, 8,						  WorkRate, Domain, ('UNITAI_SCIENTIST'),	('TXT_KEY_JFD_SS_DESC'),	('TXT_KEY_JFD_SS_TEXT'),	Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation,	UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset,	3, 				('JFD_NAZI_GERMANY_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_WEHRMACHT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT OR REPLACE INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_JAEGER'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SS'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_WEHRMACHT'), UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT OR REPLACE INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_JAEGER'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_SS'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SCIENTIST');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_WEHRMACHT'), FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_INFANTRY');	

INSERT OR REPLACE INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_JAEGER'),	FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');	

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,	Flavor)
SELECT		('UNIT_JFD_SS'), 		FlavorType,	Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
SELECT		('UNIT_JFD_SS'), 		BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_SS'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
	
INSERT OR REPLACE INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_WEHRMACHT', 	'PROMOTION_BLITZ'),
			('UNIT_JFD_JAEGER', 	'PROMOTION_JFD_JAEGER'),
			('UNIT_JFD_JAEGER', 	'PROMOTION_SURVIVALISM_1'),
			('UNIT_JFD_JAEGER',		'PROMOTION_SCOUTING_1');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_WEHRMACHT'), UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_INFANTRY');	

DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_JAEGER';
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_JAEGER'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');	
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================	
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName)
VALUES		('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_JULIUS_SCHREK'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_JOSEPH_BERCHTOLD'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ERHARD_HEIDAN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_HEINRICH_HIMMLER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_HANKE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KURT_DALUEGE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_PAUL_HAUSSER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_FRAZ_XAVER_SCHWARZ'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_FRIEDRICH_ALPERS'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_MAX_AMANN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_HERBERT_BACKE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_GOTTLOB_BERGER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_WERNER_BEST'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_WILHELM_BITTRICH'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ERNST_WILHELM_BOHLE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_MARTIN_BORMANN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_PHILIPP_BOUHLER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_FRANZ_BREITHAUPT'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_WALTER_BUCH'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_RICHARD_WALTHER_DARRE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_MARIA_DEMELHBUER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_OTTO_DIETRICH'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_VON_EBERSTEIN'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_JOACHIM_ALBRECHT_EGGELING'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_THEODOR_EICKE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_FIEHLER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ALBERT_FORSTER'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_KARL_HERMANN_FRANK'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_AUGUST_FRANK'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_HERBERT_OTTO_GILLE'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_CURT_VON_GOTTBERG'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ERNST_ROBERT_GRAWITZ'),
			('UNIT_JFD_SS', 		'TXT_KEY_GREAT_PERSON_ULRICH_GREIFELT');
--==========================================================================================================================	
--==========================================================================================================================	
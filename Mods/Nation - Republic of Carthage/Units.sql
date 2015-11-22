--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Type, 					Class, Cost, Moves, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description,						Civilopedia,						Strategy,								Help,								AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo,  					UnitFlagIconOffset,	UnitFlagAtlas,						MoveRate, PortraitIndex, 	IconAtlas)
SELECT		('UNIT_JFD_SHOPHET'),	Class, Cost, Moves, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SHOPHET'),	('TXT_KEY_UNIT_JFD_SHOPHET_TEXT'),	('TXT_KEY_UNIT_JFD_SHOPHET_STRATEGY'),	('TXT_KEY_UNIT_JFD_SHOPHET_HELP'),	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_SHOPHET'),  	0,					('JFD_UNIT_FLAG_SHOPHET_ATLAS'),	MoveRate, 2, 				('JFD_CARTHAGE_HANNIBAL_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');	

UPDATE Units
SET Combat = 10,
	Help = 'TXT_KEY_UNIT_JFD_QUINQUEREME_HELP',
	Strategy = 'TXT_KEY_UNIT_JFD_QUINQUEREME_STRATEGY'
WHERE Type = 'UNIT_CARTHAGINIAN_QUINQUEREME';
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SHOPHET'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_SHOPHET'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_SHOPHET'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
VALUES		('UNIT_JFD_SHOPHET', 	'BUILD_CITADEL');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_SHOPHET'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT OR REPLACE INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
VALUES		('UNIT_CARTHAGINIAN_QUINQUEREME', 	'PROMOTION_JFD_QUINQUEREME_ZOC'),
			('UNIT_CARTHAGINIAN_QUINQUEREME', 	'PROMOTION_JFD_QUINQUEREME_FRIENDLY_LANDS'),
			('UNIT_JFD_SHOPHET', 				'PROMOTION_JFD_SHOPHET_GENERAL'),
			('UNIT_JFD_SHOPHET', 				'PROMOTION_JFD_SHOPHET');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName)
VALUES		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_BOMILCAR'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HAMILCAR_BARCA'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HANNIBAL'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HANNIBAL_BARCA'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HASDRUBAL_II'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HASDRUBAL_GISCO'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HASDRUBAL_THE_BOETHARCH'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_MAGO_I'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_MAGO_II'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_MAGO_III'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HIMILCO_I'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HIMILCO_II'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HASDRUBAL_THE_FAIR'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_AD_HERBAL'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HANNIBAL_MONOMACHUS'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HANNIBAL_THE_RHODIAN'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HANNO_THE_ELDER'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_HANNO_THE_GREAT'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_MAHARBAL'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_MAHARBAL'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SOPHONISBA'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_ADERBAAL'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_BODASHTART'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_PHILOSIR'),
			('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_ADBMELQART');
--==========================================================================================================================
--==========================================================================================================================		
		
			
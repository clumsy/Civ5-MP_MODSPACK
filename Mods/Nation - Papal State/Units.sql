--==========================================================================================================================
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses 
			(Type,								Description,						DefaultUnit)
VALUES		('UNITCLASS_JFD_DISCIPLE', 			'TXT_KEY_UNIT_JFD_DISCIPLE', 		'UNIT_JFD_DISCIPLE');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 					Type, 					GoldenAgeTurns,	Special,				CivilianAttackPriority,				Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 					Strategy,								ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES		('UNITCLASS_JFD_DISCIPLE',	'UNIT_JFD_DISCIPLE', 	10,				'SPECIALUNIT_PEOPLE',	'CIVILIAN_ATTACK_PRIORITY_HIGH',	-1,		2,		'DOMAIN_LAND',	'UNITAI_ARTIST',	'TXT_KEY_UNIT_JFD_DISCIPLE',	'TXT_KEY_UNIT_JFD_DISCIPLE_STRATEGY',	0,				-1,					'ART_DEF_UNIT_JFD_DISCIPLE',	0,						'JFD_UNIT_FLAG_DISCIPLE_ATLAS',	2, 				'JFD_PAPAL_STATES_ATLAS',	'GREAT_PERSON');

INSERT INTO Units 	
			(Class, Type, 						PolicyType, 		PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled,	PurchaseOnly, 	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						UnitFlagIconOffset, UnitFlagAtlas,						 PortraitIndex, 	IconAtlas)
SELECT		Class, 	('UNIT_JFD_SWISS_GUARD'), 	('POLICY_PIETY'), 	PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_SWISS_GUARD'), ('TXT_KEY_CIV5_JFD_SWISS_GUARD_TEXT'), 	('TXT_KEY_UNIT_JFD_SWISS_GUARD_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_SWISS_GUARD'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_SWISS_GUARD'), 	0,					('JFD_UNIT_FLAG_SWISS_GUARD_ATLAS'), 3, 				('JFD_PAPAL_STATES_ATLAS')
FROM Units WHERE (Type = 'UNIT_GERMAN_LANDSKNECHT');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DISCIPLE'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MISSIONARY');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_DISCIPLE'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ARTIST');	
	
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_DISCIPLE'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ARTIST');	
	
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType, Flavor)
SELECT		('UNIT_JFD_SWISS_GUARD'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PIKEMAN');

INSERT INTO Unit_Flavors 
			(UnitType, 					FlavorType, 		Flavor)
VALUES		('UNIT_JFD_SWISS_GUARD', 	'FLAVOR_CULTURE', 	3);
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 
			(UnitType, 					PromotionType)
VALUES		('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD'),
			('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD_TOURISM'),
			('UNIT_JFD_SWISS_GUARD', 	'PROMOTION_JFD_SWISS_GUARD_HEALING_INFO');
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName,													GreatWorkType)
VALUES		--Artists
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_CARAVAGGIO_DESC',					'GREAT_WORK_THE_CRUCIFIXTION_OF_SAINT_PETER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GWEN_JOHN_DESC',					'GREAT_WORK_THE_NUN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_DESC',				'GREAT_WORK_PAINTING_OF_SAINT_DOMINIC'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ENGUERRAND_QUARTON_DESC',			'GREAT_WORK_CORONATION_OF_THE_VIRGIN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_RAPHAEL_DESC',					'GREAT_WORK_MADONNA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MEMLING_DESC',					'GREAT_WORK_LAST_JUDGEMENT'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_DE_MATTEIS_DESC',			'GREAT_WORK_THE_ANNUNCIATION'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MEISTER_FRANCKE_DESC',			'GREAT_WORK_MAN_OF_SORROWS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_BARTOLOME_ESTEBAN_MURILLO_DESC',	'GREAT_WORK_LIBERATION_OF_SAINT_PETER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MICHELANGELO_DESC',				'GREAT_WORK_FRESCO_OF_THE_LAST_JUDGEMENT'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SCIPIONE_PULZONE_DESC',			'GREAT_WORK_LAMENTATION'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_EL_GRECO_DESC',					'GREAT_WORK_SAINT_PETER_IN_PENITENCE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_REMBRANT_DESC',					'GREAT_WORK_THE_STONING_OF_SAINT_STEPHEN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_REMBRANT_2_DESC',					'GREAT_WORK_ADORATION_OF_THE_MAGI'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRA_ANGELICO_2_DESC',				'GREAT_WORK_MADONNA_OF_HUMILITY'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SANDRO_BOTTICELLI_DESC',			'GREAT_WORK_PAINTING_OF_SAINT_SEBASTIAN'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PAOLO_VERONESE_DESC',				'GREAT_WORK_THE_WEDDING_AT_CANA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MURILLO_DESC',					'GREAT_WORK_IMMACULATE_CONCEPTION'),
			--Musicians
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_DESC',					'GREAT_WORK_ALMA_REDEMPTORIS_MATER'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GREGORIO_ALLEGRI_DESC',			'GREAT_WORK_MISEREREI_MEI_DEUS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_PALESTRINA_2_DESC',				'GREAT_WORK_MISSA_PAPAE_MARCELLI_CREDO'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JHERONIMUS_VINDERS_DESC',			'GREAT_WORK_O_MORS_INEVITABILIS'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ANTOINE_BRUMEL_DESC',				'GREAT_WORK_MISSA_ET_ECCE_TERRAE_MOTUS_GLORIA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JOHN_SHEPPARD_DESC',				'GREAT_WORK_MEDIA_VITA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_JOHANNES_OCKEGHEM_DESC',			'GREAT_WORK_INTEMERATA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_FRANZ_SCHUBERT_DESC',				'GREAT_WORK_AVE_MARIA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_VERDI_DESC',						'GREAT_WORK_REQUIEM_DIES_IRAE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_MOZART_2_DESC',					'GREAT_WORK_REQUIEM'),
			--Writers
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_THE_POPE_DESC',					'GREAT_WORK_HOW_TO_DRESS_FOR_EVERY_OCCASSION_BY_THE_POPE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_BONEVENTURE_DESC',			'GREAT_WORK_THE_SOULS_JOURNEY_TO_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_BROTHER_LAWRENCE_DESC',			'GREAT_WORK_THE_PRACTICE_OF_THE_PRESCENCE_OF_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_GEOFFREY_CHAUCER_DESC',			'GREAT_WORK_THE_PARSONS_TALE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_CATHERINE_OF_SIENA_DESC',	'GREAT_WORK_THE_LETTERS_OF_SAINT_CATHERINE_OF_SIENA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_DANTE_DESC',						'GREAT_WORK_THE_DIVINE_COMEDY'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ALESSANDRO_MANZONI_DESC',			'GREAT_WORK_THE_BETHROTHED'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_TERESA_OF_AVILA_DESC',			'GREAT_WORK_THE_LIFE_OF_SAINT_TERESA_OF_AVILA_BY_HERSELF'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_ST_FRANCOIS_DE_SALES_DESC',		'GREAT_WORK_INTRODUCTION_TO_THE_DEVOUT_LIFE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_JOHN_OF_THE_CROSS_DESC',	'GREAT_WORK_ASCENT_OF_MOUNT_CARMEL'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_THOMAS_OF_CELANO_DESC',			'GREAT_WORK_DIES_IRAE'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_AUGUSTINE_OF_HIPPO_DESC',	'GREAT_WORK_CITY_OF_GOD'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THOMAS_AQUINAS_DESC',		'GREAT_WORK_SUMMA_THEOLOGICA'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_THERESA_DE_LISIEUX_DESC',	'GREAT_WORK_STORY_OF_A_SOUL'),
			('UNIT_JFD_DISCIPLE', 	'TXT_KEY_GREAT_PERSON_JFD_SAINT_GREGORY_THE_GREAT_DESC',	'GREAT_WORK_THE_BOOK_OF_PASTORAL_RULE');
--==========================================================================================================================
--==========================================================================================================================		
		
			
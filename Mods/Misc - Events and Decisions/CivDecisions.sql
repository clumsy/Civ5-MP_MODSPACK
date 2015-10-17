--==========================================================================================================================	
-- GreatWorks
--==========================================================================================================================		
INSERT INTO GreatWorks 	
			(Type, 					GreatWorkClassType,			ArtifactClassType, 				Description)
VALUES		('GREAT_WORK_STMARK', 	'GREAT_WORK_ARTIFACT',		'ARTIFACT_RAZED_CITY', 			'TXT_KEY_GREAT_WORK_STMARK');
--==========================================================================================================================	
-- BuildingClasses/Buildings: Trade Buildings
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_DECISIONS_INDONESIASPICE', 		'BUILDING_DECISIONS_INDONESIASPICE', 		'TXT_KEY_DECISIONS_INDONESIASPICE',  			-1,					-1),
			('BUILDINGCLASS_DECISIONS_DUTCHNAVY', 			'BUILDING_DECISIONS_DUTCHNAVY', 			'TXT_KEY_DECISIONS_DUTCHNAVY',    				-1,					-1),
			('BUILDINGCLASS_DECISIONS_PORTUGALCASADAINDIA', 'BUILDING_DECISIONS_PORTUGALCASADAINDIA', 	'TXT_KEY_DECISIONS_PORTUGALCASADAINDIA',    	-1,					-1),
			('BUILDINGCLASS_DECISIONS_MONGOLIASILKROAD', 	'BUILDING_DECISIONS_MONGOLIASILKROAD', 		'TXT_KEY_DECISIONS_MONGOLIASILKROAD',    		-1,					-1);

INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 									Description,									GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture, 	NumTradeRouteBonus)
VALUES		('BUILDING_DECISIONS_INDONESIASPICE', 			'BUILDINGCLASS_DECISIONS_INDONESIASPICE',		'TXT_KEY_DECISIONS_INDONESIASPICE',				-1, 			-1,   -1, 		 null,			1,				2),
			('BUILDING_DECISIONS_DUTCHNAVY', 				'BUILDINGCLASS_DECISIONS_DUTCHNAVY',			'TXT_KEY_DECISIONS_DUTCHNAVY',					-1, 			-1,   -1, 		 null,			1,				2),
			('BUILDING_DECISIONS_PORTUGALCASADAINDIA', 		'BUILDINGCLASS_DECISIONS_PORTUGALCASADAINDIA',	'TXT_KEY_DECISIONS_PORTUGALCASADAINDIA',		-1, 			-1,   -1, 		 null,			1,				2),
			('BUILDING_DECISIONS_MONGOLIASILKROAD', 		'BUILDINGCLASS_DECISIONS_MONGOLIASILKROAD',		'TXT_KEY_DECISIONS_MONGOLIASILKROAD',			-1, 			-1,   -1, 		 null,			1,				1);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		 			DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_DECISIONS_BYZANTIUMWALLS', 		'BUILDING_DECISIONS_BYZANTIUMWALLS', 		'TXT_KEY_DECISIONS_BYZANTIUMWALLS',  			-1,					1),
			('BUILDINGCLASS_DECISIONS_GERMANCONFEDERATION', 'BUILDING_DECISIONS_GERMANCONFEDERATION', 	'TXT_KEY_DECISIONS_GERMANCONFEDERATION',    	-1,					1),
			('BUILDINGCLASS_DECISIONS_POLANDUNIVERSITY', 	'BUILDING_DECISIONS_POLANDUNIVERSITY', 		'TXT_KEY_DECISIONS_POLANDUNIVERSITY',    		-1,					1),
			('BUILDINGCLASS_SAN_MARCO_BASILICA', 			'BUILDING_SAN_MARCO_BASILICA', 				'TXT_KEY_BUILDING_SAN_MARCO_BASILICA',    		1,					-1),
			('BUILDINGCLASS_DECISIONS_BABYLONGATES', 		'BUILDING_DECISIONS_BABYLONGATES', 			'TXT_KEY_DECISIONS_BABYLONGATES',    			-1,					1);
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 						Description,									GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_SAN_MARCO_BASILICA_DUMMY', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DUMMY',	-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ROMANCONCRETE', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_ROMANCONCRETE',				-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_THAIALPHABET', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_THAIALPHABET',				-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_INCANQUIPUCAMAYOCS', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_INCANQUIPUCAMAYOCS',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_DUTCHWISSELBANK', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_DUTCHWISSELBANK',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_GREATSEJM', 				'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_POLANDSEJM',					-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_IROQUOISLAWOFPEACE', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_IROQUOISLAWOFPEACE',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_MONGOLIASILKROAD2', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_MONGOLIASILKROAD2',			-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_CELTSTINTRADE', 			'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_CELTSTINTRADE',				-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_F', 	'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_EGYPTVALLEYOFTHEKINGS',		-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_C', 	'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_EGYPTVALLEYOFTHEKINGS',		-1, 			-1,   -1, 		 null,			1),
			('BUILDING_DECISIONS_ETHIOPIASOLOMONIC', 		'BUILDINGCLASS_DECISION_EFFECT',	'TXT_KEY_DECISIONS_ETHIOPIASOLOMONIC',			-1, 			-1,   -1, 		 null,			1);
			
UPDATE Buildings
	SET BuildingProductionModifier = 10, WonderProductionModifier = 10
	WHERE Type = 'BUILDING_DECISIONS_ROMANCONCRETE';
	
UPDATE Buildings
	SET FreeTechs = 1
	WHERE Type = 'BUILDING_DECISIONS_THAIALPHABET';
	
UPDATE Buildings
	SET FreeBuildingThisCity = 'BUILDINGCLASS_BANK'
	WHERE Type = 'BUILDING_DECISIONS_DUTCHWISSELBANK';
	
UPDATE Buildings
	SET HappinessPerXPolicies = 2
	WHERE Type = 'BUILDING_DECISIONS_GREATSEJM';
	
UPDATE Buildings
	SET GlobalCultureRateModifier = 10
	WHERE Type = 'BUILDING_DECISIONS_IROQUOISLAWOFPEACE';
	
UPDATE Buildings
	SET TradeRouteLandDistanceModifier = 50
	WHERE Type = 'BUILDING_DECISIONS_MONGOLIASILKROAD2';
	
UPDATE Buildings
	SET TradeRouteRecipientBonus = 2, TradeRouteLandGoldBonus = 200, TradeRouteSeaGoldBonus = 200, TradeRouteSeaDistanceModifier = 25
	WHERE Type = 'BUILDING_DECISIONS_CELTSTINTRADE';
	
UPDATE Buildings
	SET ExtraMissionarySpreads = 1
	WHERE Type = 'BUILDING_DECISIONS_ETHIOPIASOLOMONIC';
--==========================================================================================================================	
-- Buildings: Regular
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 						 					BuildingClass, 									Description,										Civilopedia,													Help,													Strategy,			Cost,	PrereqTech, 	ConquestProb,	IconAtlas, 				PortraitIndex)
VALUES		('BUILDING_DECISIONS_BYZANTIUMWALLS', 			'BUILDINGCLASS_DECISIONS_BYZANTIUMWALLS',		'TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS',		'TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS_CIVILOPEDIA',		'TXT_KEY_DECISIONS_BUILDING_BYZANTIUMWALLS_HELP',		null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	5),
			('BUILDING_DECISIONS_GERMANCONFEDERATION', 		'BUILDINGCLASS_DECISIONS_GERMANCONFEDERATION',	'TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION',	'TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION_CIVILOPEDIA',	'TXT_KEY_DECISIONS_BUILDING_GERMANCONFEDERATION_HELP',	null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	2),
			('BUILDING_DECISIONS_POLANDUNIVERSITY', 		'BUILDINGCLASS_DECISIONS_POLANDUNIVERSITY',		'TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY',		'TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY_CIVILOPEDIA',		'TXT_KEY_DECISIONS_BUILDING_POLANDUNIVERSITY_HELP',		null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	6),
			('BUILDING_SAN_MARCO_BASILICA', 				'BUILDINGCLASS_SAN_MARCO_BASILICA',				'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DESC',			'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_PEDIA',					'TXT_KEY_BUILDING_SAN_MARCO_BASILICA_HELP',				null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	0),
			('BUILDING_DECISIONS_BABYLONGATES', 			'BUILDINGCLASS_DECISIONS_BABYLONGATES',			'TXT_KEY_DECISIONS_BUILDING_BABYLONGATES',			'TXT_KEY_DECISIONS_BUILDING_BABYLONGATES_CIVILOPEDIA',			'TXT_KEY_DECISIONS_BUILDING_BABYLONGATES_HELP',			null,				-1,  	null,			100,			'CORE_DECISIONS_ATLAS',	7);

UPDATE Buildings
	SET Defense = 300, FreeBuildingThisCity = 'BUILDINGCLASS_WALLS'
	WHERE Type = 'BUILDING_DECISIONS_BYZANTIUMWALLS';
	
UPDATE Buildings
	SET FreePolicies = 1
	WHERE Type = 'BUILDING_DECISIONS_GERMANCONFEDERATION';
	
UPDATE Buildings
	SET CultureRateModifier = 10, GreatPeopleRateModifier = 25
	WHERE Type = 'BUILDING_DECISIONS_POLANDUNIVERSITY';
	
UPDATE Buildings
	--SET Quote = 'TXT_KEY_WONDER_SAN_MARCO_BASILICA_QUOTE', ThemingBonusHelp = 'TXT_KEY_SAN_MARCO_BASILICA_THEMING_BONUS_HELP', NukeImmune = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 2, FreeGreatWork = 'GREAT_WORK_STMARK', WonderSplashImage = 'WonderConceptSanMarco.dds'
	SET Quote = 'TXT_KEY_WONDER_SAN_MARCO_BASILICA_QUOTE', NukeImmune = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_ART_ARTIFACT', GreatWorkCount = 1, FreeGreatWork = 'GREAT_WORK_STMARK', WonderSplashImage = 'WonderConceptSanMarco.dds'
	WHERE Type = 'BUILDING_SAN_MARCO_BASILICA';
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================		
INSERT INTO Building_YieldChanges 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_DUTCHWISSELBANK', 			'YIELD_GOLD', 			5),
			('BUILDING_SAN_MARCO_BASILICA', 				'YIELD_CULTURE', 		1),
			('BUILDING_SAN_MARCO_BASILICA_DUMMY', 			'YIELD_CULTURE', 		1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_F', 	'YIELD_FAITH', 			1),
			('BUILDING_DECISIONS_EGYPTVALLEYOFTHEKINGS_C', 	'YIELD_CULTURE', 		1),
			('BUILDING_DECISIONS_BABYLONGATES', 			'YIELD_CULTURE', 		1);
--==========================================================================================================================	
-- Building_YieldModifiers
--==========================================================================================================================		
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 									YieldType, 				Yield)
VALUES		('BUILDING_DECISIONS_POLANDUNIVERSITY', 		'YIELD_SCIENCE', 		10);
--==========================================================================================================================	
-- Building_BuildingClassYieldChanges
--==========================================================================================================================		
INSERT INTO Building_BuildingClassYieldChanges 	
			(BuildingType, 									BuildingClassType,			YieldType, 				YieldChange)
VALUES		('BUILDING_DECISIONS_BYZANTIUMWALLS', 			'BUILDINGCLASS_WALLS',		'YIELD_FAITH', 			1),
			('BUILDING_DECISIONS_BABYLONGATES', 			'BUILDINGCLASS_WALLS',		'YIELD_FOOD', 			2);
--==========================================================================================================================	
-- Building_HurryModifiers
--==========================================================================================================================		
INSERT INTO Building_HurryModifiers 	
			(BuildingType, 									HurryType, 				HurryCostModifier)
VALUES		('BUILDING_DECISIONS_INCANQUIPUCAMAYOCS', 		'HURRY_GOLD', 			-20);
--==========================================================================================================================	
-- Building_ThemingBonuses
--==========================================================================================================================		
/*
INSERT INTO Building_ThemingBonuses 	
			(BuildingType, 						Description, 									Bonus,	MustBeArtifact,	RequiresOwner,	RequiresSamePlayer,	AIPriority)
VALUES		('BUILDING_SAN_MARCO_BASILICA', 	'TXT_KEY_THEMING_BONUS_SAN_MARCO_BASILICA', 	4,		1,				1,				1,					3);
*/
--==========================================================================================================================	
-- Building_YieldFromCityStates
--==========================================================================================================================		
INSERT INTO Building_YieldFromCityStates 	
			(BuildingType, 									YieldType, 				Yield,	IncludeFriendly)
VALUES		('BUILDING_DECISIONS_GERMANCONFEDERATION', 		'YIELD_CULTURE', 		1,		0);
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 										Description) 
VALUES		('POLICY_DECISIONS_SIAMEMBASSIES',	 	    'TXT_KEY_DECISIONS_SIAMEMBASSIES'),
			('POLICY_DECISIONS_VENETIANARSENALE',	 	'TXT_KEY_DECISIONS_VENETIANARSENALE'),
			('POLICY_DECISIONS_INCANCHASQUIS',	 	    'TXT_KEY_DECISIONS_INCANCHASQUIS'),
			('POLICY_DECISIONS_ARABIAHOUSEOFWISDOM',	'TXT_KEY_DECISIONS_ARABIAHOUSEOFWISDOM'),				
			('POLICY_DECISIONS_FRANCEARMEE',			'TXT_KEY_DECISIONS_FRANCEARMEE'),
			('POLICY_DECISIONS_ESTATES_GENERAL',	    'TXT_KEY_DECISIONS_ESTATES_GENERAL'),
			('POLICY_DECISIONS_OTTOMANKANUNI',	 	    'TXT_KEY_DECISIONS_OTTOMANKANUNI'),
			('POLICY_DECISIONS_OTTOMANGUNPOWDER',	 	'TXT_KEY_DECISIONS_OTTOMANGUNPOWDER'),
			('POLICY_DECISIONS_ENGLISHARMADA',	 	    'TXT_KEY_DECISIONS_ENGLISHARMADA'),
			('POLICY_DECISIONS_DENMARKTHING',	 	    'TXT_KEY_DECISIONS_DENMARKTHING'),
			('POLICY_DECISIONS_AZTECFLOWERWAR',	 	    'TXT_KEY_DECISIONS_AZTECFLOWERWAR'),
			('POLICY_DECISIONS_CARTHAGECOTHONS',	    'TXT_KEY_DECISIONS_CARTHAGECOTHONS'),
			('POLICY_DECISIONS_MAYABALLGAME',	 	    'TXT_KEY_DECISIONS_MAYABALLGAME'),
			('POLICY_DECISIONS_MAYAATLATL',	 	        'TXT_KEY_DECISIONS_MAYAATLATL'),
			('POLICY_DECISIONS_KOREANHANGUL',	 	    'TXT_KEY_DECISIONS_KOREANHANGUL'),
			('POLICY_DECISIONS_KOREANGUNPOWDER',	    'TXT_KEY_DECISIONS_KOREANGUNPOWDER'),
			('POLICY_DECISIONS_SONGHAISANKORE',	 	    'TXT_KEY_DECISIONS_SONGHAISANKORE'),
			('POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT',	'TXT_KEY_DECISIONS_AUSTRIANHOFKRIEGSRAT'), 	
			('POLICY_DECISIONS_AUSTRIANHABSBURG',	 	'TXT_KEY_DECISIONS_AUSTRIANHABSBURG'),
			('POLICY_DECISIONS_BRAZILETHANOL',	 	    'TXT_KEY_DECISIONS_BRAZILETHANOL'),
			('POLICY_DECISIONS_BRAZILBANDEIRANTES',	 	'TXT_KEY_DECISIONS_BRAZILBANDEIRANTES'),
			('POLICY_DECISIONS_CHINAIMPERIALEXAM',	 	'TXT_KEY_DECISIONS_CHINAIMPERIALEXAM'),
			('POLICY_DECISIONS_CHINAFUBINGZHI',	 	    'TXT_KEY_DECISIONS_CHINAFUBINGZHI'),
			('POLICY_DECISIONS_PERSIASATRAPY',	 	    'TXT_KEY_DECISIONS_PERSIASATRAPY'),
			('POLICY_DECISIONS_PERSIASAVARAN',	 	    'TXT_KEY_DECISIONS_PERSIASAVARAN'),
			('POLICY_DECISIONS_MOROCCOBLACKGUARD',	 	'TXT_KEY_DECISIONS_MOROCCOBLACKGUARD'),
			('POLICY_DECISIONS_MOROCCOPLUNDER',	 	    'TXT_KEY_DECISIONS_MOROCCOPLUNDER'),
			('POLICY_DECISIONS_MONGOLIAEXECUTION',	 	'TXT_KEY_DECISIONS_MONGOLIAEXECUTION'),
			('POLICY_DECISIONS_INDIARELIGIONS',	 	    'TXT_KEY_DECISIONS_INDIARELIGIONS'),
			('POLICY_DECISIONS_JAPANSHOGUNATE',	 	    'TXT_KEY_DECISIONS_JAPANSHOGUNATE'),
			('POLICY_DECISIONS_JAPANTHEATRE',	 	    'TXT_KEY_DECISIONS_JAPANTHEATRE'),
			('POLICY_DECISIONS_ETHIOPIACOINAGE', 	    'TXT_KEY_DECISIONS_ETHIOPIACOINAGE'),
			('POLICY_DECISIONS_HUNSRECURVEBOW',	 	    'TXT_KEY_DECISIONS_HUNSRECURVEBOW');
			
UPDATE Policies
	SET MinorFriendshipMinimum = 10
	WHERE Type = 'POLICY_DECISIONS_SIAMEMBASSIES';
	
UPDATE Policies
	SET CityConnectionTradeRouteGoldModifier = 25
	WHERE Type = 'POLICY_DECISIONS_INCANCHASQUIS';	
			
UPDATE Policies
	SET PolicyCostModifier = -10
	WHERE Type = 'POLICY_DECISIONS_ESTATES_GENERAL';
	
UPDATE Policies
	SET ExtraHappinessPerCity = 1
	WHERE Type = 'POLICY_DECISIONS_OTTOMANKANUNI';
	
UPDATE Policies
	SET UnitGoldMaintenanceMod = -20
	WHERE Type = 'POLICY_DECISIONS_DENMARKTHING';
	
UPDATE Policies
	SET AfraidMinorPerTurnInfluence = 300
	WHERE Type = 'POLICY_DECISIONS_AZTECFLOWERWAR';
	
UPDATE Policies
	SET MinorGoldFriendshipMod = 10
	WHERE Type = 'POLICY_DECISIONS_AUSTRIANHABSBURG';
	
UPDATE Policies
	SET UnitGoldMaintenanceMod = -10
	WHERE Type = 'POLICY_DECISIONS_CHINAFUBINGZHI';
	
UPDATE Policies
	SET GoldFromKills = 100
	WHERE Type = 'POLICY_DECISIONS_MOROCCOPLUNDER';
	
UPDATE Policies
	SET SeaTradeRouteGoldChange = 200, LandTradeRouteGoldChange = 200
	WHERE Type = 'POLICY_DECISIONS_ETHIOPIACOINAGE';
--==========================================================================================================================
-- Policy_CapitalYieldPerPopChanges
--==========================================================================================================================
INSERT INTO Policy_CapitalYieldPerPopChanges 
			(PolicyType, 							YieldType, 				Yield)
VALUES 		('POLICY_DECISIONS_INDIARELIGIONS', 	'YIELD_FAITH', 			200);
--==========================================================================================================================
-- Policy_CityYieldChanges
--==========================================================================================================================
INSERT INTO Policy_CityYieldChanges 
			(PolicyType, 							YieldType, 				Yield)
VALUES 		('POLICY_DECISIONS_INCANCHASQUIS', 		'YIELD_GOLD', 			1);
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 									BuildingClassType,			YieldType, 				YieldChange)
VALUES 		('POLICY_DECISIONS_CARTHAGECOTHONS', 			'BUILDINGCLASS_HARBOR',		'YIELD_GOLD', 			2),
		 	('POLICY_DECISIONS_SONGHAISANKORE', 			'BUILDINGCLASS_TEMPLE',	 	'YIELD_SCIENCE',		1),
			('POLICY_DECISIONS_MONGOLIAEXECUTION', 			'BUILDINGCLASS_COURTHOUSE',	'YIELD_GOLD',			4),
			('POLICY_DECISIONS_ETHIOPIACOINAGE', 			'BUILDINGCLASS_PALACE',		'YIELD_GOLD',			2);
--==========================================================================================================================
-- Policy_BuildingClassYieldModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldModifiers 
			(PolicyType, 									BuildingClassType,					YieldType, 				YieldMod)
VALUES 		('POLICY_DECISIONS_ARABIAHOUSEOFWISDOM', 		'BUILDINGCLASS_CARAVANSARY',		'YIELD_SCIENCE',		20);
--==========================================================================================================================
-- Policy_BuildingClassCultureChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassCultureChanges 
			(PolicyType, 									BuildingClassType,				CultureChange)
VALUES 		('POLICY_DECISIONS_MAYABALLGAME', 				'BUILDINGCLASS_SHRINE',	 		2),
		 	('POLICY_DECISIONS_SONGHAISANKORE', 			'BUILDINGCLASS_TEMPLE',	 		1),
		 	('POLICY_DECISIONS_CHINAIMPERIALEXAM', 			'BUILDINGCLASS_LIBRARY',	 	1),
		 	('POLICY_DECISIONS_CHINAIMPERIALEXAM', 			'BUILDINGCLASS_UNIVERSITY',	 	1),
		 	('POLICY_DECISIONS_JAPANSHOGUNATE', 			'BUILDINGCLASS_CASTLE',	 		2),
		 	('POLICY_DECISIONS_JAPANTHEATRE', 				'BUILDINGCLASS_OPERA_HOUSE',	1),
		 	('POLICY_DECISIONS_JAPANTHEATRE', 				'BUILDINGCLASS_AMPHITHEATER',	1);
--==========================================================================================================================
-- Policy_BuildingClassHappiness
--==========================================================================================================================
INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType, 									BuildingClassType,				Happiness)
VALUES 		('POLICY_DECISIONS_PERSIASATRAPY', 				'BUILDINGCLASS_BANK',	 		2),
		 	('POLICY_DECISIONS_JAPANTHEATRE', 				'BUILDINGCLASS_OPERA_HOUSE',	1),
		 	('POLICY_DECISIONS_JAPANTHEATRE', 				'BUILDINGCLASS_AMPHITHEATER',	1);
--==========================================================================================================================
-- Policy_BuildingClassProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 									BuildingClassType,				ProductionModifier)
VALUES 		('POLICY_DECISIONS_CHINAIMPERIALEXAM', 			'BUILDINGCLASS_LIBRARY',	 	100),
			('POLICY_DECISIONS_PERSIASATRAPY', 				'BUILDINGCLASS_BANK',	 		100),
			('POLICY_DECISIONS_PERSIASATRAPY', 				'BUILDINGCLASS_MARKET',	 		100),
			('POLICY_DECISIONS_MONGOLIAEXECUTION', 			'BUILDINGCLASS_COURTHOUSE',	 	100);
--==========================================================================================================================
-- Policy_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementYieldChanges 
			(PolicyType, 									ImprovementType,			YieldType, 				Yield)
VALUES 		('POLICY_DECISIONS_KOREANHANGUL', 				'IMPROVEMENT_FARM',			'YIELD_SCIENCE', 		1),
	 		('POLICY_DECISIONS_BRAZILETHANOL', 				'IMPROVEMENT_PLANTATION',	'YIELD_SCIENCE', 		1);
--==========================================================================================================================
-- Policy_ImprovementCultureChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementCultureChanges
			(PolicyType, 									ImprovementType,					CultureChange)
VALUES		('POLICY_DECISIONS_BRAZILBANDEIRANTES', 		'IMPROVEMENT_BRAZILWOOD_CAMP',	1);
--==========================================================================================================================
-- Policy_FreePromotions
--==========================================================================================================================
INSERT INTO Policy_FreePromotions 
			(PolicyType, 							PromotionType) 
VALUES 		('POLICY_DECISIONS_FRANCEARMEE', 		'PROMOTION_DECISIONS_FRANCEARMEE'),
	 		('POLICY_DECISIONS_OTTOMANGUNPOWDER', 	'PROMOTION_DECISIONS_OTTOMANGUNPOWDER'),
		 	('POLICY_DECISIONS_BRAZILBANDEIRANTES', 'PROMOTION_WOODSMAN'),
		 	('POLICY_DECISIONS_MOROCCOBLACKGUARD', 	'PROMOTION_DECISIONS_MOROCCOBLACKGUAR'),
			('POLICY_DECISIONS_HUNSRECURVEBOW', 	'PROMOTION_DECISIONS_HUNSRECURVEBOW');
--==========================================================================================================================
-- Policy_UnitCombatFreeExperiences
--==========================================================================================================================
INSERT INTO Policy_UnitCombatFreeExperiences
			(PolicyType, 								UnitCombatType,				FreeExperience)
VALUES		('POLICY_DECISIONS_ENGLISHARMADA', 			'UNITCOMBAT_NAVALMELEE',	15),
			('POLICY_DECISIONS_ENGLISHARMADA', 			'UNITCOMBAT_NAVALRANGED',	15),
			('POLICY_DECISIONS_ENGLISHARMADA', 			'UNITCOMBAT_SUBMARINE',		15),
			('POLICY_DECISIONS_PERSIASAVARAN', 			'UNITCOMBAT_MOUNTED',		15);
--==========================================================================================================================
-- Policy_UnitCombatProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_UnitCombatProductionModifiers
			(PolicyType, 								UnitCombatType,				ProductionModifier)
VALUES		('POLICY_DECISIONS_VENETIANARSENALE', 		'UNITCOMBAT_NAVALMELEE',	33),
			('POLICY_DECISIONS_VENETIANARSENALE', 		'UNITCOMBAT_NAVALRANGED',	33),
			('POLICY_DECISIONS_VENETIANARSENALE', 		'UNITCOMBAT_SUBMARINE',		33),
			('POLICY_DECISIONS_MAYAATLATL', 			'UNITCOMBAT_ARCHER',		20),
			('POLICY_DECISIONS_KOREANGUNPOWDER', 		'UNITCOMBAT_GUN',			15),
			('POLICY_DECISIONS_KOREANGUNPOWDER', 		'UNITCOMBAT_SIEGE',			15),
			('POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT', 	'UNITCOMBAT_ARCHER',		15),
			('POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT', 	'UNITCOMBAT_GUN',			20),
			('POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT', 	'UNITCOMBAT_MELEE',			20),
			('POLICY_DECISIONS_AUSTRIANHOFKRIEGSRAT', 	'UNITCOMBAT_MOUNTED',		15),
			('POLICY_DECISIONS_CHINAFUBINGZHI', 		'UNITCOMBAT_ARCHER',		25),
			('POLICY_DECISIONS_CHINAFUBINGZHI', 		'UNITCOMBAT_MELEE',			25);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
			(Type, 											Description, 												Help, 													CannotBeChosen, 		Sound, 				PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_DECISIONS_FRANCEARMEE', 			'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_HELP',			1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_DESC'),
			('PROMOTION_DECISIONS_OTTOMANGUNPOWDER', 		'TXT_KEY_PROMOTION_DECISIONS_OTTOMANGUNPOWDER_DESC', 		'TXT_KEY_PROMOTION_DECISIONS_OTTOMANGUNPOWDER_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_OTTOMANGUNPOWDER_DESC'),
			('PROMOTION_DECISIONS_MOROCCOBLACKGUAR', 		'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_DESC', 		'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_DESC'),
			('PROMOTION_DECISIONS_GREECEPHALANX', 			'TXT_KEY_PROMOTION_DECISIONS_GREECEPHALANX_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_GREECEPHALANX_HELP',		1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_GREECEPHALANX_DESC'),			
			('PROMOTION_DECISIONS_HUNSRECURVEBOW', 			'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_HELP',		1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_DESC');			
			
UPDATE UnitPromotions
	SET GreatGeneralModifier = 25
	WHERE Type = 'PROMOTION_DECISIONS_FRANCEARMEE';
	
UPDATE UnitPromotions
	SET CityAttack = 50
	WHERE Type = 'PROMOTION_DECISIONS_OTTOMANGUNPOWDER';
	
UPDATE UnitPromotions
	SET FriendlyLandsModifier = 25
	WHERE Type = 'PROMOTION_DECISIONS_MOROCCOBLACKGUAR';
	
UPDATE UnitPromotions
	SET AdjacentMod = 25
	WHERE Type = 'PROMOTION_DECISIONS_GREECEPHALANX';
	
UPDATE UnitPromotions
	SET RangedAttackModifier = 20
	WHERE Type = 'PROMOTION_DECISIONS_HUNSRECURVEBOW';
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 							UnitCombatType)
VALUES		('PROMOTION_DECISIONS_FRANCEARMEE', 		'UNITCOMBAT_GUN'),
			('PROMOTION_DECISIONS_OTTOMANGUNPOWDER', 	'UNITCOMBAT_GUN'),
			('PROMOTION_DECISIONS_OTTOMANGUNPOWDER', 	'UNITCOMBAT_SIEGE'),
			('PROMOTION_DECISIONS_MOROCCOBLACKGUAR', 	'UNITCOMBAT_MELEE'),
			('PROMOTION_DECISIONS_MOROCCOBLACKGUAR', 	'UNITCOMBAT_GUN'),
			('PROMOTION_DECISIONS_HUNSRECURVEBOW', 		'UNITCOMBAT_ARCHER');
--==========================================================================================================================	
-- UnitClasses
--==========================================================================================================================
INSERT INTO UnitClasses
			(Type, 										Description,							DefaultUnit)
VALUES		('UNITCLASS_DECISIONS_PERSIASAVARAN', 		'TXT_KEY_DECISIONS_PERSIASAVARAN',		'UNIT_DECISIONS_PERSIASAVARAN');
--==========================================================================================================================	
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 									Type, 										PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate)
SELECT		('UNITCLASS_DECISIONS_PERSIASAVARAN'), 		('UNIT_DECISIONS_PERSIASAVARAN'), 			null,		Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, Civilopedia, Strategy, Help, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ('TECH_METALLURGY'), XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	IconAtlas,	MoveRate
FROM Units WHERE (Type = 'UNIT_BYZANTINE_CATAPHRACT');

UPDATE Units
	SET PolicyType = 'POLICY_DECISIONS_PERSIASAVARAN', ShowInPedia = 0
	WHERE Type = 'UNIT_DECISIONS_PERSIASAVARAN';
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 							ResourceType)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BYZANTINE_CATAPHRACT');	
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_BYZANTINE_CATAPHRACT');
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BYZANTINE_CATAPHRACT');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_BYZANTINE_CATAPHRACT');	
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType, Flavor)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_BYZANTINE_CATAPHRACT');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 							PromotionType)
SELECT		('UNIT_DECISIONS_PERSIASAVARAN'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BYZANTINE_CATAPHRACT');
--==========================================================================================================================		
--==========================================================================================================================
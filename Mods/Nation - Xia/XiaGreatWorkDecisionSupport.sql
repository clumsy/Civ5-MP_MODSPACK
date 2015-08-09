INSERT INTO GreatWorks 
			(Type, 										GreatWorkClassType,		                                   Description,						           Audio,			    Image)
VALUES		('GREAT_WORK_XIA_NINE_TRIPOD_CAULDRONS', 	  'GREAT_WORK_ART',		'TXT_KEY_GREAT_WORK_XIA_NINE_TRIPOD_CAULDRONS',		'AS2D_SOUND_XIA_SHANG_SACRIFICE', 	'NineTripods.dds');

INSERT INTO Units 	
			  (Type, 					   Class,	          PrereqTech,			 Cost,   Moves,	 CivilianAttackPriority, Special,	Domain,		DefaultUnitAI, Description,								Civilopedia, Strategy, ShowInPedia,	AdvancedStartCost,  WorkRate, CombatLimit, GoldenAgeTurns, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagIconOffset,   UnitFlagAtlas, PortraitIndex, MoveRate, IconAtlas)
SELECT		  ('UNIT_DECISIONS_XIA_YU'),   Class,	('TECH_AGRICULTURE'),	         Cost,   Moves,	 CivilianAttackPriority, Special,	Domain,		DefaultUnitAI, ('TXT_KEY_XIA_ERLITOU_GREAT_PERSON'),	Civilopedia, Strategy, 	         0, AdvancedStartCost,  WorkRate, CombatLimit, GoldenAgeTurns, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagIconOffset,   UnitFlagAtlas, PortraitIndex, MoveRate, IconAtlas
FROM Units WHERE (Type = 'UNIT_ARTIST');

INSERT INTO Unit_UniqueNames 
			(UnitType, 							                     UniqueName,							 GreatWorkType)
VALUES		('UNIT_DECISIONS_XIA_YU', 	'TXT_KEY_GREAT_PERSON_DECISIONS_XIA_YU',	'GREAT_WORK_XIA_NINE_TRIPOD_CAULDRONS');

INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_BARBARIAN', 			'UNITCLASS_ARTIST',		'UNIT_DECISIONS_XIA_YU');
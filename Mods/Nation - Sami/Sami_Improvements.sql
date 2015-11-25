--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,						OutsideBorders, Description,							Civilopedia,									ArtDefineTag,					PillageGold,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_SIEIDI',		0,				'TXT_KEY_MC_IMPROVEMENT_SAMI_SIEIDI',	'TXT_KEY_MC_IMPROVEMENT_SAMI_SIEIDI_PEDIA',		'ART_DEF_IMPROVEMENT_SIEIDI', 	20,				4,				'SAMI_ATLAS'),
			('IMPROVEMENT_SAMI_HERD',	1,				'TXT_KEY_MC_SAMI_HERD',					'TXT_KEY_MC_CIVILOPEDIA_SAMI_HERD_TEXT',		'ART_DEF_IMPROVEMENT_PASTURE', 	0,				6,				'SAMI_ATLAS');
--==========================================================================================================================
-- Improvement_ResourceTypes: Sieidi
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_SIEIDI'), 					Type
FROM Resources WHERE (ResourceClassType = 'RESOURCECLASS_RUSH');

INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_SIEIDI'), 					Type
FROM Resources WHERE (ResourceClassType = 'RESOURCECLASS_MODERN');

INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_SIEIDI'), 					Type
FROM Resources WHERE (Happiness > 0);

CREATE TRIGGER SieidiResources
AFTER INSERT ON Resources WHEN NEW.Happiness > 0
BEGIN
	INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
	VALUES	('IMPROVEMENT_SIEIDI', 						NEW.Type);		
END;

DELETE FROM Improvement_ResourceTypes
WHERE ImprovementType = 'IMPROVEMENT_SIEIDI' AND ResourceType = 'RESOURCE_ARTIFACTS';

DELETE FROM Improvement_ResourceTypes
WHERE ImprovementType = 'IMPROVEMENT_SIEIDI' AND ResourceType = 'RESOURCE_HIDDEN_ARTIFACTS';
--==========================================================================================================================
-- Improvement_ResourceTypes: Sami Herd Ability
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_SAMI_HERD'), 					ResourceType
FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_CAMP');
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_SAMI_HERD'), 					ResourceType
FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_PASTURE');

CREATE TRIGGER HerdResourceCamp
AFTER INSERT ON Improvement_ResourceTypes WHEN NEW.ImprovementType = 'IMPROVEMENT_CAMP'
BEGIN
	INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
	VALUES	('IMPROVEMENT_SAMI_HERD', 					NEW.ResourceType);
END;
CREATE TRIGGER HerdResourcePasture
AFTER INSERT ON Improvement_ResourceTypes WHEN NEW.ImprovementType = 'IMPROVEMENT_PASTURE'
BEGIN
	INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
	VALUES	('IMPROVEMENT_SAMI_HERD', 					NEW.ResourceType);	
END;

DELETE FROM Improvement_ResourceTypes
WHERE ImprovementType = 'IMPROVEMENT_SAMI_HERD' AND ResourceType = 'RESOURCE_TRUFFLES';
DELETE FROM Improvement_ResourceTypes
WHERE ImprovementType = 'IMPROVEMENT_SAMI_HERD' AND ResourceType = 'RESOURCE_HORSE';
--==========================================================================================================================
-- Improvement_Yields
--==========================================================================================================================
INSERT INTO Improvement_Yields
			(ImprovementType,							YieldType, 			Yield)
VALUES		('IMPROVEMENT_SIEIDI', 						'YIELD_CULTURE',	2),
			('IMPROVEMENT_SIEIDI', 						'YIELD_FAITH',		2);
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,				ImprovementType, 			Time, 	Recommendation, 					Description, 			Help, 								CtrlDown, 	OrderPriority, 	IconIndex, 	IconAtlas, 		EntityEvent)
VALUES		('BUILD_SAMI_HERD',	'IMPROVEMENT_SAMI_HERD',	0,		'TXT_KEY_MC_BUILD_SAMI_HERD_REC',	'TXT_KEY_MC_SAMI_HERD',	'TXT_KEY_MC_BUILD_SAMI_HERD_HELP',	1,			98,				7,			'SAMI_ATLAS',	'ENTITY_EVENT_BUILD');
--==========================================================================================================================
--==========================================================================================================================
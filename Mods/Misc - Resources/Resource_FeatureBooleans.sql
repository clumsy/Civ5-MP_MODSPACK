-- Insert SQL Rules Here 
INSERT INTO Resource_FeatureBooleans	(ResourceType,			FeatureType) VALUES
										('RESOURCE_PINE',		'FEATURE_FOREST'),
										('RESOURCE_LUMBER',		'FEATURE_FOREST'),
										('RESOURCE_AMBER',		'FEATURE_FOREST'),
										('RESOURCE_MAHOGANY',	'FEATURE_JUNGLE'),
										('RESOURCE_COFFEE',		'FEATURE_JUNGLE'),
										('RESOURCE_COCONUT',	'FEATURE_JUNGLE'),
										('RESOURCE_RUBBER',		'FEATURE_JUNGLE'),
										('RESOURCE_MANGO',		'FEATURE_JUNGLE');
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (16, 'Resource_FeatureBooleans.sql');	
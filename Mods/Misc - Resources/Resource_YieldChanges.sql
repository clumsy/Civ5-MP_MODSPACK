-- Insert SQL Rules Here 
INSERT INTO Resource_YieldChanges	(ResourceType,			YieldType,				Yield) VALUES
									('RESOURCE_EMERALD',	'YIELD_GOLD',			1),
									('RESOURCE_HOPS',		'YIELD_GOLD',			1),
									('RESOURCE_LAVENDER',	'YIELD_GOLD',			1),
									('RESOURCE_LEAD',		'YIELD_PRODUCTION',		1),
									('RESOURCE_NICKEL',		'YIELD_PRODUCTION',		1),
									('RESOURCE_RUBY',		'YIELD_GOLD',			1),
									('RESOURCE_SAPPHIRE',	'YIELD_GOLD',			1),
									('RESOURCE_PINE',		'YIELD_PRODUCTION',		1),
									('RESOURCE_LUMBER',		'YIELD_PRODUCTION',		1),
									('RESOURCE_TITANIUM',	'YIELD_PRODUCTION',		1),
									('RESOURCE_COFFEE',		'YIELD_GOLD',			1),
									('RESOURCE_POPPY',		'YIELD_GOLD',			1),
									('RESOURCE_WOOD',		'YIELD_PRODUCTION',		1),
									('RESOURCE_CLAY',		'YIELD_PRODUCTION',		1),
									('RESOURCE_JADE',		'YIELD_GOLD',			1),
									('RESOURCE_AMBER',		'YIELD_GOLD',			1),
									('RESOURCE_TEA',		'YIELD_GOLD',			1),
									('RESOURCE_TOBACCO',	'YIELD_GOLD',			1);
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (11, 'Resource_YieldChanges.sql');	

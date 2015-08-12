-- Insert SQL Rules Here 
INSERT INTO Resource_FeatureTerrainBooleans (ResourceType,			TerrainType) VALUES
											('RESOURCE_LUMBER',		'TERRAIN_PLAINS'),
											('RESOURCE_LUMBER',		'TERRAIN_GRASS'	),
											('RESOURCE_RUBBER',		'TERRAIN_GRASS'	),
											('RESOURCE_PINE',		'TERRAIN_TUNDRA'),
											('RESOURCE_TEA',		'TERRAIN_GRASS'	),
											('RESOURCE_MAHOGANY',	'TERRAIN_GRASS'	),
											('RESOURCE_COFFEE',		'TERRAIN_GRASS'	),
											('RESOURCE_AMBER',		'TERRAIN_TUNDRA'),
											('RESOURCE_AMBER',		'TERRAIN_PLAINS'),
											('RESOURCE_AMBER',		'TERRAIN_GRASS'	),
											('RESOURCE_COCONUT',	'TERRAIN_GRASS'	),
											('RESOURCE_MANGO',		'TERRAIN_GRASS'	);
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (15, 'Resource_FeatureTerrainBooleans.sql');	

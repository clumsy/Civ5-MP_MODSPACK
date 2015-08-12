UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_LUMBER' WHERE UnitType ='UNIT_FRIGATE';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_LUMBER' WHERE UnitType ='UNIT_ENGLISH_SHIPOFTHELINE';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_TITANIUM' WHERE UnitType ='UNIT_MODERN_ARMOR';
UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_TITANIUM' WHERE UnitType ='UNIT_ROCKET_ARTILLERY';
--UPDATE Unit_ResourceQuantityRequirements Set ResourceType ='RESOURCE_TITANIUM' WHERE UnitType ='UNIT_MECH';
--
INSERT INTO Unit_ResourceQuantityRequirements	(UnitType,						ResourceType,				Cost) VALUES
												('UNIT_PRIVATEER',				'RESOURCE_LUMBER',			1),
												('UNIT_CATAPULT',				'RESOURCE_LUMBER',			1),
												('UNIT_CARAVEL',				'RESOURCE_LUMBER',			1),
												('UNIT_ROMAN_BALLISTA',			'RESOURCE_LUMBER',			1),
												('UNIT_TREBUCHET',				'RESOURCE_LUMBER',			1),
												('UNIT_MECHANIZED_INFANTRY',	'RESOURCE_TITANIUM',		1);
-- Debug
INSERT INTO HNRDebugTableCheck(Num, FileName) VALUES (19, 'UpdateUnits.sql');	
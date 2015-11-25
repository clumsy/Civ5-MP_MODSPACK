--==========================================================================================================================
-- ML_CivCultures
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_Cultures(ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT, 'Group' TEXT, Description TEXT, SuggestedCivs TEXT);
INSERT INTO ML_Cultures
			(Type,		'Group')
VALUES		('SAPMI', 			'CULTURE_GROUP_EUROPEAN');

UPDATE ML_Cultures
SET Description = 'TXT_KEY_ML_CULTURE_' || Type,
	SuggestedCivs = 'TXT_KEY_ML_CULTURE_' || Type || '_SUGGESTEDCIVS'
WHERE Type = 'SAPMI';
--------------------------------
-- LAKE
--------------------------------
CREATE TABLE IF NOT EXISTS ML_Labels_Dynamic (ID INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, MainType TEXT default "FEATURE", SubType TEXT, CultureType TEXT);
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_SAPMI_LAKE_AANAARJAVRI'),
			('SAPMI',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_SAPMI_LAKE_HAMMASJAVRI'),
			('SAPMI',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_SAPMI_LAKE_PASASJAVRI'),
			('SAPMI',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_SAPMI_LAKE_COHKKIRASJAVRI'),
			('SAPMI',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_SAPMI_LAKE_ALAJARVI'),
			('SAPMI',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_SAPMI_LAKE_GIEMAJAVRI');
--------------------------------
-- OCEAN
--------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_SAPMI_OCEAN_MEARRABADALUOKTA'),
			('SAPMI',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_SAPMI_OCEAN_NUORTAMEARRA'),
			('SAPMI',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_SAPMI_OCEAN_KARAMEARRA'),
			('SAPMI',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_SAPMI_OCEAN_BARENTSMEARRA'),
			('SAPMI',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_SAPMI_OCEAN_NORGGAMEARRA');
--------------------------------
-- REGION
--------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_GUOLADAT'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_FINNMARKU'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_ROMSA'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_NORDLANDA'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_DAVVITRONDELAGA'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_MATTATRONDELAGA'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_NORRBOTTENA'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_VASTERBOTTENA'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_JAMTLANDDA'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_LAPPI'),
			('SAPMI',			'REGION',	 	'REGION',			'TXT_KEY_NAME_SAPMI_REGION_MURMANSKA');
--------------------------------
-- DESERT
--------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_SAPMI_DESERT_JOSTEDALSBREEN'),
			('SAPMI',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_SAPMI_DESERT_BRIKSDALSBREEN'),
			('SAPMI',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_SAPMI_DESERT_OKSTINDBREEN'),
			('SAPMI',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_SAPMI_DESERT_AKSOVUONJIEHKKI'),
			('SAPMI',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_SAPMI_DESERT_FROSTISEN');
--------------------------------
-- MOUNTAIN
--------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_SAPMI_MOUNTAIN_GIEBMEGAISI'),
			('SAPMI',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_SAPMI_MOUNTAIN_GAVNNESVARRI'),
			('SAPMI',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_SAPMI_MOUNTAIN_BEALJEHKH'),
			('SAPMI',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_SAPMI_MOUNTAIN_AHKKA');
--------------------------------
-- FOREST
--------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_SAPMI_FOREST_PRESTEGARDSSKOGEN'),
			('SAPMI',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_SAPMI_FOREST_BLAFJELLA'),
			('SAPMI',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_SAPMI_FOREST_SKJAEKERFJELLA'),
			('SAPMI',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_SAPMI_FOREST_ANDERDALEN'),
			('SAPMI',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_SAPMI_FOREST_BORGEFJELL'),
			('SAPMI',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_SAPMI_FOREST_FOROLLHOGNA');
--------------------------------
-- ISLAND
--------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_SAPMI_ISLAND_HAUTUUMAASAARI'),
			('SAPMI',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_SAPMI_ISLAND_UKONSAARI'),
			('SAPMI',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_SAPMI_ISLAND_SELKALAHDENSAARI'),
			('SAPMI',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_SAPMI_ISLAND_JAASAARI'),
			('SAPMI',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_SAPMI_ISLAND_HAAPASAARI');
--------------------------------
-- RIVER
--------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('SAPMI',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_SAPMI_RIVER_GIEMAJOHKA'),
			('SAPMI',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_SAPMI_RIVER_OVNNESJOHKA'),
			('SAPMI',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_SAPMI_RIVER_DOALLANJOHKA'),
			('SAPMI',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_SAPMI_RIVER_KARASJOHKA'),
			('SAPMI',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_SAPMI_RIVER_DEATNU'),
			('SAPMI',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_SAPMI_RIVER_ANARJOHKA');
--==========================================================================================================================
-- ML_CivCultures
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures(CivType, CultureType, CultureEra);
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_SAMI',			'SAPMI',		'ANY');
--==========================================================================================================================
--==========================================================================================================================
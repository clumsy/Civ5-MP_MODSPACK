--==========================================================================================================================
-- Events_CulturalDevelopments
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								CivilizationType,						CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_CHINA_01',			'CIVILIZATION_CHINA',					'JFD_Oriental'),
			('TXT_KEY_EVENT_CULDEV_CHINA_02',			'CIVILIZATION_CHINA',					'JFD_Oriental'),
			('TXT_KEY_EVENT_CULDEV_CHINA_03',			'CIVILIZATION_CHINA',					'JFD_Oriental');
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_EVENT_CULDEV_CHINA_01',
		'A game called ''Mahjong'', played with a set of 144 tiles, has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CHINA_02',
		'A strategy board game called ''Weiqi'', played with black and white stones, has been invented in {1_City}.'
	),
	(
		'TXT_KEY_EVENT_CULDEV_CHINA_03',
		'A strategy board game called ''Xiangqi'' has been invented in {1_City}.'
	);
--==========================================================================================================================
--==========================================================================================================================
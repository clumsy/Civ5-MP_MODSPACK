--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_JELGAVA_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_JELGAVA_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_JELGAVA_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_JELGAVA_TEXT_1'
WHERE Type = 'MINOR_CIV_VILNIUS';	
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_VILNIUS';
INSERT INTO MinorCivilization_CityNames
			(MinorCivType, 			CityName)
VALUES		('MINOR_CIV_VILNIUS', 	'TXT_KEY_CITYSTATE_JFD_JELGAVA');
--==========================================================================================================================
--==========================================================================================================================	
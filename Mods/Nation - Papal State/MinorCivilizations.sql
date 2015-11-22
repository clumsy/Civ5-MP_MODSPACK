--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_KARYES_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_KARYES_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_KARYES_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_KARYES_TEXT_1'
WHERE Type = 'MINOR_CIV_VATICAN_CITY';	
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_VATICAN_CITY';
INSERT INTO MinorCivilization_CityNames
			(MinorCivType, 				CityName)
VALUES		('MINOR_CIV_VATICAN_CITY', 	'TXT_KEY_CITYSTATE_JFD_KARYES');
--==========================================================================================================================
--==========================================================================================================================	
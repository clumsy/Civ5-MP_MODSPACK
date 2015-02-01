--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_TBILISI_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_TBILISI_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_TBILISI_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_TBILISI_TEXT_1'
WHERE Type = 'MINOR_CIV_YEREVAN';	
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_YEREVAN';
INSERT INTO MinorCivilization_CityNames
			(MinorCivType, 			CityName)
VALUES		('MINOR_CIV_YEREVAN', 	'TXT_KEY_CITYSTATE_JFD_TBILISI');
--==========================================================================================================================
--==========================================================================================================================	
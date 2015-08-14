--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_NANMADOL_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_NANMADOL_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_NANMADOL_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_NANMADOL_TEXT_1'
WHERE Type = 'MINOR_CIV_HANOI';	
--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = 'MINOR_CIV_HANOI';
INSERT INTO MinorCivilization_CityNames
			(MinorCivType, 			CityName)
VALUES		('MINOR_CIV_HANOI', 	'TXT_KEY_CITYSTATE_NANMADOL');
--==========================================================================================================================
--==========================================================================================================================	
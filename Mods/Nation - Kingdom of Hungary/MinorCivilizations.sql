--==========================================================================================================================	
-- MinorCivilizations
--==========================================================================================================================		
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_LVIV',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_LVIV',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_LVIV_ADJ',
	Civilopedia = 'TXT_KEY_CITYSTATE_JFD_LVIV_TEXT'
WHERE Type = 'MINOR_CIV_BUDAPEST';
--==========================================================================================================================	
-- MinorCivilization_CityNames
--==========================================================================================================================	
DELETE FROM MinorCivilization_CityNames WHERE MinorCivType = "MINOR_CIV_BUDAPEST";
INSERT INTO MinorCivilization_CityNames 
			(MinorCivType, 			CityName)
VALUES		('MINOR_CIV_BUDAPEST', 	'TXT_KEY_CITYSTATE_JFD_LVIV');
--==========================================================================================================================	
--==========================================================================================================================	

--==========================================================================================================================	
-- MinorCivilizations
--==========================================================================================================================			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_LUBECK_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_LUBECK_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_LUBECK_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_LUBECK_TEXT_1'
WHERE Type = 'MINOR_CIV_ZURICH';

UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_SARAJEVO_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_SARAJEVO_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_SARAJEVO_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_SARAJEVO_TEXT_1'
WHERE Type = 'MINOR_CIV_GENEVA';
--==========================================================================================================================	
-- MinorCivilization_CityNames
--==========================================================================================================================		
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_LUBECK_DESC'
WHERE MinorCivType = 'MINOR_CIV_ZURICH';

UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_SARAJEVO_DESC'
WHERE MinorCivType = 'MINOR_CIV_GENEVA';
--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================	
-- MinorCivilizations
--==========================================================================================================================			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_SAN_MARINO_TEXT_1'
WHERE Type = 'MINOR_CIV_BRUSSELS';
--==========================================================================================================================	
-- MinorCivilization_CityNames
--==========================================================================================================================		
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_SAN_MARINO_DESC'
WHERE MinorCivType = 'MINOR_CIV_BRUSSELS';
--==========================================================================================================================		
--==========================================================================================================================		
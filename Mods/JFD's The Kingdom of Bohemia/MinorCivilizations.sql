--==========================================================================================================================	
-- MinorCivilizations
--==========================================================================================================================			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_PADUA_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_PADUA_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_PADUA_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_PADUA_TEXT_1'
WHERE Type = 'MINOR_CIV_PRAGUE';
--==========================================================================================================================	
-- MinorCivilization_CityNames
--==========================================================================================================================		
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_PADUA_DESC'
WHERE MinorCivType = 'MINOR_CIV_PRAGUE';
--==========================================================================================================================		
--==========================================================================================================================		
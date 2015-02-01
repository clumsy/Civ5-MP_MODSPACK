--==========================================================================================================================	
-- MinorCivilizations
--==========================================================================================================================			
UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_ANDORRA_LA_VELLA_TEXT_1'
WHERE Type = 'MINOR_CIV_BRUSSELS';

UPDATE MinorCivilizations
SET Description = 'TXT_KEY_CITYSTATE_JFD_VADUZ_DESC',
	ShortDescription = 'TXT_KEY_CITYSTATE_JFD_VADUZ_SHORT_DESC',
	Adjective = 'TXT_KEY_CITYSTATE_JFD_VADUZ_ADJECTIVE',
	Civilopedia = 'TXT_KEY_CIV5_JFD_VADUZ_TEXT_1'
WHERE Type = 'MINOR_CIV_ANTWERP';
--==========================================================================================================================	
-- MinorCivilization_CityNames
--==========================================================================================================================		
UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_ANDORRA_LA_VELLA_DESC'
WHERE MinorCivType = 'MINOR_CIV_BRUSSELS';

UPDATE MinorCivilization_CityNames
SET CityName = 'TXT_KEY_CITYSTATE_JFD_VADUZ_DESC'
WHERE MinorCivType = 'MINOR_CIV_ANTWERP';
--==========================================================================================================================		
--==========================================================================================================================		
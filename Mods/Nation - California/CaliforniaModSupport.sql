--==========================================================================================================================
-- ML_CivCultures
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_CALIFORNIA',	'US_WESTERN',		'ANY');
--==========================================================================================================================
--==========================================================================================================================

--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                  CultureType,    SplashScreenTag,    SoundtrackTag)
VALUES      ('CIVILIZATION_CALIFORNIA',			'JFD_Colonial', 'JFD_Colonial',     'JFD_Colonial');
--==========================================================================================================================
--==========================================================================================================================

--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
		THEN 'RELIGION_PROTESTANT_METHODISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIANITY' )
		THEN 'RELIGION_CHRISTIANITY'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CHRISTIAN_MORMONISM' )
		THEN 'RELIGION_CHRISTIAN_MORMONISM'
		ELSE 'RELIGION_PROTESTANTISM' END ) END ) END
	) WHERE CivilizationType = 'CIVILIZATION_CALIFORNIA';

CREATE TRIGGER ReligionCALIFORNIASupportMethodism
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_PROTESTANT_METHODISM'
	WHERE CivilizationType IN ('CIVILIZATION_CALIFORNIA');
END;

CREATE TRIGGER ReligionCALIFORNIASupportCatholicism
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
			THEN 'RELIGION_PROTESTANT_METHODISM'
			ELSE 'RELIGION_CHRISTIANITY' END 
		) WHERE CivilizationType = 'CIVILIZATION_CALIFORNIA';
END;
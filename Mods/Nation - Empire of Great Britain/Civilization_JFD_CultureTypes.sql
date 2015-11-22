--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);

DELETE FROM Civilization_JFD_CultureTypes WHERE CivilizationType ='CIVILIZATION_JFD_ENGLAND';
INSERT INTO Civilization_JFD_CultureTypes
			(CivilizationType,						CultureType,	SplashScreenTag)
VALUES		('CIVILIZATION_JFD_GREAT_BRITAIN',		'JFD_Western',	'JFD_Western'),
			('CIVILIZATION_JFD_ENGLAND',			'JFD_Western',	'JFD_Western');
--==========================================================================================================================
--==========================================================================================================================

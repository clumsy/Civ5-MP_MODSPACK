--==========================================================================================================================
-- Civilization_JFD_CultureTypes
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                  CultureType,    SplashScreenTag,    SoundtrackTag)
VALUES      ('CIVILIZATION_CSA',			'JFD_Colonial', 'JFD_Colonial',     'JFD_Colonial');
--==========================================================================================================================
--==========================================================================================================================

--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_BAPTIST' )
		THEN 'RELIGION_PROTESTANT_BAPTIST'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
		THEN 'RELIGION_PROTESTANT_METHODISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
	) WHERE CivilizationType = 'CIVILIZATION_CSA';

CREATE TRIGGER ReligionCSASupportAnglician
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_BAPTIST' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_PROTESTANT_BAPTIST'
	WHERE CivilizationType IN ('CIVILIZATION_CSA');
END;

CREATE TRIGGER ReligionCSASupportMethodism
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_BAPTIST' )
			THEN 'RELIGION_PROTESTANT_BAPTIST'
			ELSE 'RELIGION_PROTESTANT_METHODISM' END 
		) WHERE CivilizationType = 'CIVILIZATION_CSA';
END;
--=======================================================================================================================
-- Leader_SharedTraits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_DAVIS',	 'POLICY_AGGRESSIVE_X',	'POLICY_FINANCIAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Jefferson Davis [ICON_WAR][ICON_TRADE]'
	ELSE 'TXT_KEY_LEADER_DAVIS' END) 
WHERE Type = 'LEADER_DAVIS';

CREATE TRIGGER CivIVTraitsCSA
AFTER INSERT ON Leaders WHEN 'LEADER_DAVIS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Jefferson Davis [ICON_WAR][ICON_TRADE]'
		ELSE 'TXT_KEY_LEADER_DAVIS' END) 
	WHERE Type = 'LEADER_DAVIS';
END;	
--=======================================================================================================================
--=======================================================================================================================

--==========================================================================================================================	
-- Flavors
--==========================================================================================================================			
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');

INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_DAVIS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		6);
--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
            (CivilizationType,                      ColonyName,                             LinguisticType)
VALUES      ('CIVILIZATION_CSA',             null,                                   'JFD_Germanic'),
            ('CIVILIZATION_CSA',             null,                                   'JFD_Latinate'),
            ('CIVILIZATION_CSA',             'TXT_KEY_COLONY_NAME_JFD_AMERICA_01',    null),
            ('CIVILIZATION_CSA',             'TXT_KEY_COLONY_NAME_JFD_AMERICA_02',    null),
            ('CIVILIZATION_CSA',             'TXT_KEY_COLONY_NAME_JFD_AMERICA_03',    null),
            ('CIVILIZATION_CSA',             'TXT_KEY_COLONY_NAME_JFD_AMERICA_04',    null),
            ('CIVILIZATION_CSA',             'TXT_KEY_COLONY_NAME_JFD_AMERICA_05',    null);
------------------------------		
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_AMERICA',					'CIVILIZATION_CSA'),
			('CIVILIZATION_CSA',	'CIVILIZATION_AMERICA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_CSA'),	('CIVILIZATION_TEXAS')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_TEXAS');
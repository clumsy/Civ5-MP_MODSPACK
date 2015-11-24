--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ONYAMESOM' )
		THEN 'RELIGION_ONYAMESOM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
		THEN 'RELIGION_PROTESTANT_METHODISM'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
		THEN 'RELIGION_PROTESTANTISM'
		ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
	) WHERE CivilizationType = 'CIVILIZATION_MC_ASHANTI';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_ONYAMESOM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_ONYAMESOM'
	WHERE CivilizationType IN ('CIVILIZATION_MC_ASHANTI');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions SET ReligionType = 
		( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ONYAMESOM' )
			THEN 'RELIGION_ONYAMESOM'
			ELSE 'RELIGION_PROTESTANT_METHODISM' END 
		) WHERE CivilizationType = 'CIVILIZATION_MC_ASHANTI';
END;

--Ethnic Units and RED
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_SONGHAI")
		THEN "_SONGHAI"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_MC_ASHANTI";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_MC_ASHANTI',	      'AFRICAN',		 'ANY');

--Piety & Prestige
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									  FlavorType,    Flavor)
VALUES      ('LEADER_MC_TUTU_I',	  'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         7);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_MC_ASHANTI',	      'JFD_WestAfrican',    'JFD_WestAfrican',   'JFD_WestAfrican');

UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_WestAfrican' )
	THEN 'JFD_WestAfrican'
	ELSE 'Songhai' END) 
WHERE Type = 'CIVILIZATION_MC_ASHANTI';

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,								   TraitOne,					TraitTwo)
VALUES      ('LEADER_MC_TUTU_I',	          'POLICY_CHARISMATIC_X',		'POLICY_IMPERIALISTIC_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Osei Tutu[ICON_HAPPINESS_1][ICON_CITY_STATE]'
	ELSE 'TXT_KEY_LEADER_MC_TUTU_I_DESC' END) 
WHERE Type = 'LEADER_MC_TUTU_I';

CREATE TRIGGER CivIVTraitsMCAshanti
AFTER INSERT ON Leaders WHEN 'LEADER_MC_TUTU_I' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Osei Tutu[ICON_HAPPINESS_1][ICON_CITY_STATE]'
		ELSE 'TXT_KEY_LEADER_MC_TUTU_I_DESC' END) 
	WHERE Type = 'LEADER_MC_TUTU_I';
END;

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_MC_ASHANTI', 			null,									 'JFD_Songhay'),
			('CIVILIZATION_MC_ASHANTI', 			null,									   'JFD_Bantu');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				   RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_MC_ASHANTI',				  'CIVILIZATION_SONGHAI');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					     RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_MC_ASHANTI'),				 ('CIVILIZATION_BENIN_MOD')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_BENIN_MOD');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					   RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_MC_ASHANTI'),				 ('CIVILIZATION_JFD_NRI')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NRI');

--YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_ASHANTI',						14,		32,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
				(Type,										 X,		 Y,		AltX,	AltY)
VALUES			('CIVILIZATION_MC_ASHANTI',					55,		34,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_ASHANTI',						32,		12,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,											X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_ASHANTI',						46,		20,		null,	null);
--==========================================================================================================================
-- Civilizations_AfricaStartPosition (Africa)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
			(Type,											X,		 Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_ASHANTI',						17,		42,		null,	null);
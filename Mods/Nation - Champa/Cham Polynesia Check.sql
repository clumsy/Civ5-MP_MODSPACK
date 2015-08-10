--Polynesia
UPDATE Civilizations SET ArtDefineTag =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ART_DEF_CIVILIZATION_POLYNESIA"
		ELSE "ART_DEF_CIVILIZATION_SIAM" END
    ) WHERE Type = "CIVILIZATION_CHAMPA_MOD";

UPDATE Civilizations SET ArtDefineTag =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ART_DEF_CIVILIZATION_POLYNESIA"
		ELSE "ART_DEF_CIVILIZATION_SIAM" END
    ) WHERE Type = "CIVILIZATION_INDONESIA";

UPDATE Civilizations SET ArtStyleType =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ARTSTYLE_POLYNESIAN"
		ELSE "ARTSTYLE_ASIAN" END
    ) WHERE Type = "CIVILIZATION_CHAMPA_MOD";

UPDATE Civilizations SET ArtStyleType =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ARTSTYLE_POLYNESIAN"
		ELSE "ARTSTYLE_ASIAN" END
    ) WHERE Type = "CIVILIZATION_INDONESIA";

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INDONESIA")
		THEN "_INDONESIA"
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "_MED"
		ELSE "_ASIA " END ) END
	) WHERE Type = "CIVILIZATION_CHAMPA_MOD";

UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INDONESIA")
		THEN "_INDONESIA"
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "_MED"
		ELSE "_ASIA " END ) END
	) WHERE Type = "CIVILIZATION_INDONESIA";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_CHAMPA_MOD',	   'EAST_ASIAN',		 'ANY');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,												 FlavorType,    Flavor)
VALUES      ('LEADER_CHAMPA_PO_BINASUOR_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         2);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,      SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_CHAMPA_MOD',			  'JFD_Mandala',        'JFD_Mandala',       'JFD_Mandala');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									  TraitOne,					  TraitTwo)
VALUES      ('LEADER_CHAMPA_PO_BINASUOR_MOD',	          'POLICY_SEAFARING_X',		'POLICY_AGGRESSIVE_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Chê Bông Nga[ICON_GREAT_EXPLORER][ICON_WAR]'
	ELSE 'TXT_KEY_LEADER_CHAMPA_PO_BINASUOR_MOD_DESC' END) 
WHERE Type = 'LEADER_CHAMPA_PO_BINASUOR_MOD';

CREATE TRIGGER CivIVTraitsTomatekhChampa
AFTER INSERT ON Leaders WHEN 'LEADER_CHAMPA_PO_BINASUOR_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Chê Bông Nga[ICON_GREAT_EXPLORER][ICON_WAR]'
		ELSE 'TXT_KEY_LEADER_CHAMPA_PO_BINASUOR_MOD_DESC' END) 
	WHERE Type = 'LEADER_CHAMPA_PO_BINASUOR_MOD';
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
VALUES		('CIVILIZATION_CHAMPA_MOD', 			null,									'JFD_Austronesian'),
			('CIVILIZATION_CHAMPA_MOD', 			null,									'JFD_Tai_Khmer');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_CHAMPA_MOD',		'CIVILIZATION_INDONESIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_CHAMPA_MOD'),		('CIVILIZATION_KHMER')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_KHMER');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_CHAMPA_MOD'),		('CIVILIZATION_MC_KHMER')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_KHMER');
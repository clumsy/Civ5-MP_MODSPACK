--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_PERSIA")
		THEN "_PERSIA"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_HITTITE_MOD";

--Wonders of the World
UPDATE Units SET UnitArtInfo =
	( CASE WHEN EXISTS(SELECT Type FROM Buildings WHERE Type="BUILDING_MAUSOLEUM_HALICARNASSUS" )
		THEN "ART_DEF_UNIT_HITTITE_CHARIOT_MOD"
		ELSE "ART_DEF_UNIT_U_EGYPTIAN_WARCHARIOT_ALT" END
    ) WHERE Type = "UNIT_HITTITE_MOD_THREE_MAN_CHARIOT";

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,												FlavorType,    Flavor)
VALUES      ('LEADER_HITTITE_MOD_MUWATALLI',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         0);

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						    CultureType,	CultureEra)
VALUES		('CIVILIZATION_HITTITE_MOD',	      'ARABIAN',		 'ANY');

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                       CultureType,     SplashScreenTag,       SoundtrackTag)
VALUES      ('CIVILIZATION_HITTITE_MOD',       'JFD_Mesopotamic',	'JFD_Mesopotamic',	 'JFD_Mesopotamic');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									      TraitOne,					TraitTwo)
VALUES      ('LEADER_HITTITE_MOD_MUWATALLI',	  'POLICY_IMPERIALISTIC_X',	   'POLICY_DIPLOMATIC_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Suppiluliumas I[ICON_CITY_STATE][ICON_INFLUENCE]'
	ELSE 'TXT_KEY_HITTITE_MOD_MUWATALLI_DESC' END) 
WHERE Type = 'LEADER_HITTITE_MOD_MUWATALLI';

CREATE TRIGGER CivIVTraitsTomatekhHittites
AFTER INSERT ON Leaders WHEN 'LEADER_HITTITE_MOD_MUWATALLI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Suppiluliumas I[ICON_CITY_STATE][ICON_INFLUENCE]'
		ELSE 'TXT_KEY_HITTITE_MOD_MUWATALLI_DESC' END) 
	WHERE Type = 'LEADER_HITTITE_MOD_MUWATALLI';
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
VALUES		('CIVILIZATION_HITTITE_MOD', 			null,									'JFD_Mesopotamian'),
			('CIVILIZATION_HITTITE_MOD', 			null,									'JFD_Indo_Iranian');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_HITTITE_MOD',		'CIVILIZATION_ASSYRIA');
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Create Tables
----------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    RevolutionaryCivilizationType               text    REFERENCES Civilizations(Type)      default null);
----------------------------------------------------------------------------------------------------------------------------
-- Colony Names
----------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 				ColonyName,											LinguisticType)
VALUES		('CIVILIZATION_SAMI', 			null,												'JFD_Finno_Ugric');
 ----------------------------------------------------------------------------------------------------------------------------
 -- Revolutionary Civs
 ----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn   	 
			(CivilizationType,    		 	RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_SWEDEN'),		('CIVILIZATION_SAMI')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_SWEDEN') AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_SAMI');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn   	 
			(CivilizationType,    		 		RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_NORWAY'),		('CIVILIZATION_SAMI')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_NORWAY') AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_SAMI');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn   	 
			(CivilizationType,    		 				RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_DENMARK_NORWAY'),		('CIVILIZATION_SAMI')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_DENMARK_NORWAY') AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_SAMI');
 ----------------------------------------------------------------------------------------------------------------------------
 -- Unit Immunities
 --PROMOTION_JFD_SNOW_IMMUNITY, PROMOTION_JFD_DESERT_IMMUNITY, PROMOTION_JFD_DISEASE_IMMUNITY, PROMOTION_JFD_JUNGLE_IMMUNITY, PROMOTION_JFD_SCUVRY_IMMUNITY, PROMOTION_JFD_IMMUNITY (immunity to all except Disease)
 ----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
			(UnitType, 						PromotionType)
SELECT		('UNIT_SAMI_BOAZOVAZZI'),	('PROMOTION_JFD_SNOW_IMMUNITY')
WHERE EXISTS (SELECT Type FROM UnitPromotions WHERE Type = 'PROMOTION_JFD_SNOW_IMMUNITY');
--==========================================================================================================================
--==========================================================================================================================

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
			(CivilizationType, 					ColonyName,									LinguisticType)
VALUES		('CIVILIZATION_DJSH_SERBIA',	null,										'JFD_Slavic'),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_01',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_02',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_03',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_04',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_05',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_06',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_07',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_08',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_09',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_10',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_11',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_12',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_13',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_14',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_15',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_16',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_17',	null),
			('CIVILIZATION_DJSH_SERBIA',	'TXT_KEY_COLONY_NAME_DJSH_SERBIA_18',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_GREECE',				'CIVILIZATION_DJSH_SERBIA'),
			('CIVILIZATION_DJSH_SERBIA',		'CIVILIZATION_GREECE');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_DJSH_SERBIA'),		('CIVILIZATION_DJSH_MONTENEGRO')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_DJSH_MONTENEGRO');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_DJSH_SERBIA'),		('CIVILIZATION_DJSH_ALBANIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_DJSH_ALBANIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,						RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_DJSH_SERBIA'),		('CIVILIZATION_DJSH_CROATIA')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_DJSH_CROATIA');
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA',		34,		76,		38,		72),
			('CIVILIZATION_RUSSIA',					34,		76,		38,		72);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA',		70,		66,		75,		63),
			('CIVILIZATION_RUSSIA',					70,		66,		75,		63);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA',		43,		38,		45,		36),
			('CIVILIZATION_RUSSIA',					43,		38,		45,		36);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA',		60,		60,		63,		56),
			('CIVILIZATION_RUSSIA',					60,		60,		63,		56);
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_RUSSIA';
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PETRINE_RUSSIA',		52,		61,		60,		53),
			('CIVILIZATION_RUSSIA',					52,		61,		60,		53);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PETRINE_RUSSIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
--==========================================================================================================================
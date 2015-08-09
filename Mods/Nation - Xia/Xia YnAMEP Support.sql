--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_ERLITOU_MOD',			   80,	   59,	    null,	null);	
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YahemStartPosition WHERE Type IN ('CIVILIZATION_CHINA');
INSERT INTO Civilizations_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_ERLITOU_MOD',		      104,	   50,		null,	null),
			('CIVILIZATION_CHINA',					  106,	   52,		null,	null);	
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_CordiformStartPosition WHERE Type IN ('CIVILIZATION_CHINA');
INSERT INTO Civilizations_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_ERLITOU_MOD',			   61,	   34,		null,	null),	
			('CIVILIZATION_CHINA',					   59,	   36,		null,	null);	
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_ERLITOU_MOD',			   85,	   51,		null,	null);
--==========================================================================================================================
-- Civilizations_AsiaStartPosition (Asia)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_ERLITOU_MOD',			64,		49,		null,	null);
--==========================================================================================================================
-- Civilizations_NorthEastAsiaStartPosition (North-East Asia)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_ERLITOU_MOD',			1,	   32,		null,	null);
--==========================================================================================================================
-- Civilizations_EastAsiaStartPosition (South-East Asia Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT OR REPLACE INTO Civilizations_EastAsiaStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_ERLITOU_MOD',		   35,	   60,		null,	null);
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_ERLITOU_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_ERLITOU_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilizations_CordiformRequestedResource (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_ERLITOU_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_ERLITOU_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- (Asia)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_ERLITOU_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- (North East Asia)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthEastAsiaRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_ERLITOU_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthEastAsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- (East Asia)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_ERLITOU_MOD'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EastAsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
--==========================================================================================================================
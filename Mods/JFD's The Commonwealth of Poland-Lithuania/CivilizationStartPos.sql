--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_POLAND';
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA',	28,		69,		null,	null),
			('CIVILIZATION_POLAND',					23,		67,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);			
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',					30,		74,		null,	null); -- Jelgava
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_POLAND';
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA',	67,		61,		null,	null),
			('CIVILIZATION_POLAND',					68,		60,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);				
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',					68,		64,		null,	null); -- Jelgava
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_POLAND';
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA',	42,		32,		null,	null),
			('CIVILIZATION_POLAND',					41,		41,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',					42,		36,		null,	null); -- Jelgava
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_POLAND';
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA',	56,		55,		null,	null),
			('CIVILIZATION_POLAND',					57,		53,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);		
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',					57,		56,		null,	null); -- Jelgava
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_POLAND';
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_POLAND_LITHUANIA',	44,		47,		null,	null),
			('CIVILIZATION_POLAND',					43,		45,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',					47,		55,		null,	null); -- Jelgava
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_POLAND_LITHUANIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
--==========================================================================================================================
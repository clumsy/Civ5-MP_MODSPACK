--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_BELGIUM',	15,		69,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ANTWERP',			18,		65,		null,	null), -- Vaduz
			('MINOR_CIV_BRUSSELS',			12,		61,		null,	null); -- Andorra la Velle
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_BELGIUM',	60,		62,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ANTWERP',			18,		65,		null,	null), -- Vaduz
			('MINOR_CIV_BRUSSELS',			61,		59,		null,	null); -- Andorra la Velle
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_BELGIUM',	36,		26,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ANTWERP',			37,		29,		null,	null), -- Vaduz
			('MINOR_CIV_BRUSSELS',			33,		25,		null,	null); -- Andorra la Velle
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_BELGIUM',	43,		50,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ANTWERP',			47,		50,		null,	null), -- Vaduz
			('MINOR_CIV_BRUSSELS',			41,		42,		null,	null); -- Andorra la Velle
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_BELGIUM',	29,		46,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP', 'MINOR_CIV_BRUSSELS');
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ANTWERP',			32,		40,		null,	null), -- Vaduz
			('MINOR_CIV_BRUSSELS',			26,		36,		null,	null); -- Andorra la Velle
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BELGIUM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BELGIUM'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 													Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BELGIUM'),							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 													Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_BELGIUM'),							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_NETHERLANDS';
--==========================================================================================================================
--==========================================================================================================================
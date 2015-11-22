--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	21,		58,		13,		61);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,						X,		Y)
VALUES		('MINOR_CIV_VATICAN_CITY',	27,		57); -- Karyes
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	62,		54,		59,		56);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_ANTWERP');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,						X,	Y)
VALUES		('MINOR_CIV_VATICAN_CITY',	67,	53); -- Karyes
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	37,		24,		34,		26);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,						X,	Y)
VALUES		('MINOR_CIV_VATICAN_CITY',	42,	23); -- Karyes
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	50,		42,		42,		43);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,						X,	Y)
VALUES		('MINOR_CIV_VATICAN_CITY',	56,	43); -- Karyes
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,								X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_PAPAL_STATES',	36,		32,		26,		35);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_VATICAN_CITY');
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,						X,	Y)
VALUES		('MINOR_CIV_VATICAN_CITY',	48,	29); -- Karyes
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_PAPAL_STATES'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ROME';
--==========================================================================================================================
--==========================================================================================================================
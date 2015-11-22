--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	17,	64);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,					X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ZURICH',	19,		71,		null,	null), -- Lubeck
			('MINOR_CIV_GENEVA',	25,		61,		null,	null); -- Sarajevo
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	61,	58);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,					X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ZURICH',	63,		62,		null,	null), -- Lubeck
			('MINOR_CIV_GENEVA',	66,		55,		null,	null); -- Sarajevo
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	36,	28);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,					X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ZURICH',	38,		34,		null,	null), -- Lubeck
			('MINOR_CIV_GENEVA',	41,		24,		null,	null); -- Sarajevo
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	46,	49);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,					X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ZURICH',	47,		55,		null,	null), -- Lubeck
			('MINOR_CIV_GENEVA',	55,		46,		null,	null); -- Sarajevo
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_JFD_SWITZERLAND',	31,	39);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_ZURICH', 'MINOR_CIV_GENEVA');
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,					X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_ZURICH',	35,		52,		null,	null), -- Lubeck
			('MINOR_CIV_GENEVA',	44,		36,		null,	null); -- Sarajevo
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_SWITZERLAND'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_FRANCE';
--==========================================================================================================================
--==========================================================================================================================
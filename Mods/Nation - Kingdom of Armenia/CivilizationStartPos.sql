--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_ARMENIA',	41,		58,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_YEREVAN');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_YEREVAN',			42,		60,		null,	null); -- Tbilsi
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_ARMENIA',	75,		52,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_YEREVAN');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_YEREVAN',			76,		54,		null,	null); -- Tbilsi
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_ARMENIA',	49,		25,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_YEREVAN');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_YEREVAN',			49,		26,		null,	null); -- Tbilsi
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_ARMENIA',	62,		44,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_YEREVAN');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_YEREVAN',			65,		46,		null,	null); -- Tbilsi
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_ARMENIA',	69,		29,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_YEREVAN');
INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_YEREVAN',			69,		33,		null,	null); -- Tbilsi
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ARMENIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ARMENIA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 													Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ARMENIA'),							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 													Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_ARMENIA'),							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
--==========================================================================================================================
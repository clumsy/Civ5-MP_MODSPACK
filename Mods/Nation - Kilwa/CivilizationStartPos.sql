--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_KILWA',	37,		22,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_MOMBASA', 'MINOR_CIV_ZANZIBAR');
INSERT INTO MinorCiv_YagemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MOMBASA',			3,		40,		null,	null), -- Dakar
			('MINOR_CIV_ZANZIBAR',			33,		38,		null,	null); -- Meroe
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_KILWA',	74,		25,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_MOMBASA', 'MINOR_CIV_ZANZIBAR');
INSERT INTO MinorCiv_YahemStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MOMBASA',			53,		38,		null,	null), -- Dakar
			('MINOR_CIV_ZANZIBAR',			71,		37,		null,	null); -- Meroe
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_KILWA',	42,		7,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_MOMBASA', 'MINOR_CIV_ZANZIBAR');
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MOMBASA',			28,		14,		null,	null), -- Dakar
			('MINOR_CIV_ZANZIBAR',			44,		12,		null,	null); -- Meroe
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_KILWA',	62,		12,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_MOMBASA', 'MINOR_CIV_ZANZIBAR');
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MOMBASA',			39,		25,		null,	null), -- Dakar
			('MINOR_CIV_ZANZIBAR',			60,		27,		null,	null); -- Meroe
--==========================================================================================================================
-- Civilizations_AfricaLargeStartPosition (Africa Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
			(Type,						X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_MC_KILWA',	51,		25,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_AfricaLargeStartPosition WHERE Type IN ('MINOR_CIV_MOMBASA', 'MINOR_CIV_ZANZIBAR');
INSERT INTO MinorCiv_AfricaLargeStartPosition
			(Type,							X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MOMBASA',			4,		47,		null,	null), -- Dakar
			('MINOR_CIV_ZANZIBAR',			44,		53,		null,	null); -- Meroe
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_KILWA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_KILWA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_KILWA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
-- Civilizations_AfricaLargeRequestedResource (Africa Large)
--==========================================================================================================================
INSERT INTO Civilizations_AfricaLargeRequestedResource
			(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_KILWA'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfricaLargeRequestedResource WHERE Type = 'CIVILIZATION_ARABIA';
--==========================================================================================================================
--==========================================================================================================================
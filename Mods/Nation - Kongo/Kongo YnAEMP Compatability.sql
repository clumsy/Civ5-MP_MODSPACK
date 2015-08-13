--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_KONGO_MOD',					24,		23,		null,	null);			
	
CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);	
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_MBANZA_KONGO');			
INSERT INTO MinorCiv_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MBANZA_KONGO',					19,		29,		null,	null); -- Luba
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_KONGO_MOD',					64,		30,		null,	null);	

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_MBANZA_KONGO');			
INSERT INTO MinorCiv_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MBANZA_KONGO',					62,		33,		null,	null); -- Luba
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_KONGO_MOD',					37,		9,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_MBANZA_KONGO');		
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MBANZA_KONGO',					36,		12,		null,	null); -- Luba
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_KONGO_MOD',					53,		16,		null,	null);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_MBANZA_KONGO');	
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MBANZA_KONGO',					52,		18,		null,	null); -- Luba
--==========================================================================================================================
-- Civilizations_AfricaStartPosition (Africa)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS MinorCiv_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_AfricaLargeStartPosition WHERE Type IN ('MINOR_CIV_MBANZA_KONGO');	
INSERT INTO MinorCiv_AfricaLargeStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_MBANZA_KONGO',				   39,	   29,		null,	null); -- Luba
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_KONGO_MOD'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ETHIOPIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_KONGO_MOD'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ETHIOPIA';
--==========================================================================================================================
-- Civilizations_CordiformRequestedResource (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_KONGO_MOD'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_ETHIOPIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_KONGO_MOD'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ETHIOPIA';
--==========================================================================================================================
--==========================================================================================================================

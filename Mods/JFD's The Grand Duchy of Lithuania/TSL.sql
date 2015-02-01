--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO Civilizations_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_LITHUANIA',				31,		72,		null,	null);
			
INSERT INTO MinorCiv_YagemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',						31,		75,		null,	null); -- Dorpat
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO Civilizations_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_LITHUANIA',				69,		63,		null,	null);
			
INSERT INTO MinorCiv_YahemStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',						69,		65,		null,	null); -- Dorpat
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO Civilizations_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_LITHUANIA',				43,		34,		null,	null);
			
INSERT INTO MinorCiv_CordiformStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',						42,		36,		null,	null); -- Dorpat
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_LITHUANIA',				58,		56,		null,	null);
			
INSERT INTO MinorCiv_GreatestEarthStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',						58,		58,		null,	null); -- Dorpat
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
DELETE FROM MinorCiv_EuroLargeStartPosition WHERE Type IN ('MINOR_CIV_VILNIUS');
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_LITHUANIA',				48,		51,		null,	null);

INSERT INTO MinorCiv_EuroLargeStartPosition
			(Type,										X,		Y,		AltX,	AltY)
VALUES		('MINOR_CIV_VILNIUS',						49,		58,		null,	null); -- Dorpat
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_LITHUANIA'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_LITHUANIA'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_LITHUANIA'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_LITHUANIA'),				Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_POLAND';
--==========================================================================================================================
--==========================================================================================================================
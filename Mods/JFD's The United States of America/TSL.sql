--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
INSERT INTO Civilizations_YagemStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',						155,	63,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
INSERT INTO Civilizations_YahemStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',						30,		54,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
INSERT INTO Civilizations_CordiformStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',						13,		32,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_JFD_AMERICA_LINCOLN',						19,		47,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_AMERICA';
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_AMERICA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_AMERICA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_AMERICA';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_AMERICA_LINCOLN'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_AMERICA';
--==========================================================================================================================
--==========================================================================================================================
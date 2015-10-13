--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES', 'MINOR_CIV_PANAMA_CITY');
INSERT INTO Civilizations_YagemStartPosition
(Type,										X,		Y,		AltX,	AltY)
VALUES		
('CIVILIZATION_PARAGUAY',					162,	22,		null,	null);


--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES', 'MINOR_CIV_PANAMA_CITY');
INSERT INTO Civilizations_YahemStartPosition
(Type,										X,		Y,		AltX,	AltY)
VALUES		
('CIVILIZATION_PARAGUAY',					38,		21,		null,	null);

--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES', 'MINOR_CIV_PANAMA_CITY');
INSERT INTO Civilizations_CordiformStartPosition
(Type,										X,		Y,		AltX,	AltY)
VALUES		
('CIVILIZATION_PARAGUAY',					17,		10,		null,	null);

--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES', 'MINOR_CIV_PANAMA_CITY');
INSERT INTO Civilizations_GreatestEarthStartPosition
(Type,										X,		Y,		AltX,	AltY)
VALUES	
('CIVILIZATION_PARAGUAY',					28,		13,		null,	null),;

--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================

INSERT INTO Civilizations_YagemRequestedResource
(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_PARAGUAY'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_BRAZIL';

--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================

INSERT INTO Civilizations_YahemRequestedResource
(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_PARAGUAY'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_BRAZIL';


--==========================================================================================================================
-- Civilizations_CordiformRequestedResource (Earth Standard)
--==========================================================================================================================

INSERT INTO Civilizations_CordiformRequestedResource
(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_PARAGUAY'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_BRAZIL';

--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================

INSERT INTO Civilizations_GreatestEarthRequestedResource
(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_PARAGUAY'),					Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_BRAZIL';

--==========================================================================================================================
--==========================================================================================================================

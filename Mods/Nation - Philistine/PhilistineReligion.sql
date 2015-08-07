--Philistine
INSERT INTO Civilization_Religions
                (CivilizationType,    ReligionType)
SELECT        Type,            ('RELIGION_JUDAISM')
FROM Civilizations WHERE Type = 'CIVILIZATION_LEUGI_PHILISTINE';

UPDATE Civilization_Religions SET ReligionType =
    ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_CANAANISM' )
        THEN 'RELIGION_CANAANISM'
        ELSE 'RELIGION_JUDAISM' END ) END
    ) WHERE CivilizationType = 'CIVILIZATION_LEUGI_PHILISTINE';



CREATE TRIGGER ReligionAymaraMod2
AFTER INSERT ON Religions WHEN 'RELIGION_CANAANISM' = NEW.Type
BEGIN
    UPDATE Civilization_Religions
    SET ReligionType = 'RELIGION_CANAANISM'
    WHERE CivilizationType IN ('CIVILIZATION_LEUGI_PHILISTINE');
END;

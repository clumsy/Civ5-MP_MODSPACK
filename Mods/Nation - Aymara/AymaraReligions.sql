--Qullana
INSERT INTO Civilization_Religions
                (CivilizationType,    ReligionType)
SELECT        Type,            ('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_QULLANA';

UPDATE Civilization_Religions SET ReligionType =
    ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SUMA_QAMANA' )
        THEN 'RELIGION_SUMA_QAMANA'
        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PACHISM' )
        THEN 'RELIGION_PACHISM'
        ELSE 'RELIGION_CHRISTIANITY' END ) END
    ) WHERE CivilizationType = 'CIVILIZATION_QULLANA';

CREATE TRIGGER ReligionAymaraMod1
AFTER INSERT ON Religions WHEN 'RELIGION_PACHISM' = NEW.Type
BEGIN
    UPDATE Civilization_Religions SET ReligionType =
        ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SUMA_QAMANA' )
            THEN 'RELIGION_SUMA_QAMANA'
            ELSE 'RELIGION_PACHISM' END
        ) WHERE CivilizationType = 'CIVILIZATION_QULLANA';
END;

CREATE TRIGGER ReligionAymaraMod2
AFTER INSERT ON Religions WHEN 'RELIGION_SUMA_QAMANA' = NEW.Type
BEGIN
    UPDATE Civilization_Religions
    SET ReligionType = 'RELIGION_SUMA_QAMANA'
    WHERE CivilizationType IN ('CIVILIZATION_QULLANA');
END;

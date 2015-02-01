--=======================================================================================================================
-- Leader_SharedTraits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				TraitOne,					TraitTwo)
VALUES      ('LEADER_JFD_CHARLEMAGNE',	 'POLICY_IMPERIALISTIC_X',	'POLICY_SPIRITUAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Charlemagne [ICON_CITY_STATE][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_CHARLEMAGNE' END) 
WHERE Type = 'LEADER_JFD_CHARLEMAGNE';

CREATE TRIGGER CivIVTraitsFrancia
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_CHARLEMAGNE' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Charlemagne [ICON_CITY_STATE][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_JFD_CHARLEMAGNE' END) 
	WHERE Type = 'LEADER_JFD_CHARLEMAGNE';
END;	
--=======================================================================================================================
--=======================================================================================================================


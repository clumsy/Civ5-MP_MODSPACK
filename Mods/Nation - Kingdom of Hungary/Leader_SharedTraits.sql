--=======================================================================================================================
-- Leader_SharedTraits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_STEPHEN',	 'POLICY_PROTECTIVE_X',		'POLICY_SPIRITUAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Stephen [ICON_STRENGTH][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_STEPHEN' END) 
WHERE Type = 'LEADER_JFD_STEPHEN';

CREATE TRIGGER CivIVTraitsHungary
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_STEPHEN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Stephen [ICON_STRENGTH][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_JFD_STEPHEN' END) 
	WHERE Type = 'LEADER_JFD_STEPHEN';
END;	
--=======================================================================================================================
--=======================================================================================================================


CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_CROMWELL',	 'POLICY_AGGRESSIVE_X',	'POLICY_SPIRITUAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_AGGRESSIVE_X' )
	THEN 'Oliver Cromwell [ICON_WAR][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_CROMWELL' END) 
WHERE Type = 'LEADER_CROMWELL';

CREATE TRIGGER CivIVTraitsMilan
AFTER INSERT ON Leaders WHEN 'LEADER_CROMWELL' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_SPIRITUAL_X' )
		THEN 'Oliver Cromwell [ICON_WAR][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_CROMWELL' END) 
	WHERE Type = 'LEADER_CROMWELL';
END;	
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
VALUES      ('LEADER_JFD_NICHOLAS',	 'POLICY_INDUSTRIOUS_X',	'POLICY_SPIRITUAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Nicholas II [ICON_PRODUCTION][ICON_PEACE]'
	ELSE 'TXT_KEY_LEADER_JFD_NICHOLAS' END) 
WHERE Type = 'LEADER_JFD_NICHOLAS';

CREATE TRIGGER CivIVTraitsNicholas
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_NICHOLAS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Nicholas II [ICON_PRODUCTION][ICON_PEACE]'
		ELSE 'TXT_KEY_LEADER_JFD_NICHOLAS' END) 
	WHERE Type = 'LEADER_JFD_NICHOLAS';
END;	
--=======================================================================================================================
--=======================================================================================================================


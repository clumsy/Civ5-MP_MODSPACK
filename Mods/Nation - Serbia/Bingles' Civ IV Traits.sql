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
VALUES      ('LEADER_UROS_IV',	 'POLICY_CHARISMATIC_X',	'POLICY_AGGRESSIVE_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Dusan [ICON_HAPPINESS_1][ICON_WAR]'
	ELSE 'Dusan' END) 
WHERE Type = 'LEADER_UROS_IV';

CREATE TRIGGER CivIVTraitsSerbia
AFTER INSERT ON Leaders WHEN 'LEADER_UROS_IV' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Dusan [ICON_HAPPINESS_1][ICON_WAR]'
		ELSE 'Dusan' END) 
	WHERE Type = 'LEADER_UROS_IV';
END;	
--=======================================================================================================================
--=======================================================================================================================

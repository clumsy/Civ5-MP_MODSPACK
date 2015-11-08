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
VALUES      ('LEADER_DJSH_PETER_I',	 'POLICY_AGGRESSIVE_X',	'POLICY_FINANCIAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Peter I [ICON_WAR][ICON_TRADE]'
	ELSE 'Peter I' END) 
WHERE Type = 'LEADER_DJSH_PETER_I';

CREATE TRIGGER CivIVTraitsYugoslavia
AFTER INSERT ON Leaders WHEN 'LEADER_DJSH_PETER_I' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Peter I [ICON_WAR][ICON_TRADE]'
		ELSE 'Peter I' END) 
	WHERE Type = 'LEADER_DJSH_PETER_I';
END;	
--=======================================================================================================================
--=======================================================================================================================

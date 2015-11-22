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
VALUES      ('LEADER_JFD_HITLER',	 'POLICY_AGGRESSIVE_X',		'POLICY_INVENTIVE_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Hitler [ICON_WAR][ICON_RESEARCH]'
	ELSE 'TXT_KEY_LEADER_JFD_HITLER' END) 
WHERE Type = 'LEADER_JFD_HITLER';

CREATE TRIGGER CivIVTraitsNaziGermany
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_HITLER' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Hitler [ICON_WAR][ICON_RESEARCH]]'
		ELSE 'TXT_KEY_LEADER_JFD_HITLER' END) 
	WHERE Type = 'LEADER_JFD_HITLER';
END;	
--=======================================================================================================================
--=======================================================================================================================


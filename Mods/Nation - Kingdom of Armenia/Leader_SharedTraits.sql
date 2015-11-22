--=======================================================================================================================
-- Leader_SharedTraits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				 TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_TIRIDATES',	 'POLICY_AGGRESSIVE_X',		'POLICY_PROTECTIVE_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Tiridates III [ICON_WAR][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_JFD_TIRIDATES' END) 
WHERE Type = 'LEADER_JFD_TIRIDATES';

CREATE TRIGGER CivIVTraitsArmenia
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_TIRIDATES' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Tiridates III [ICON_WAR][ICON_STRENGTH]'
		ELSE 'TXT_KEY_LEADER_JFD_TIRIDATES' END) 
	WHERE Type = 'LEADER_JFD_TIRIDATES';
END;	
--=======================================================================================================================
--=======================================================================================================================


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
VALUES      ('LEADER_JFD_LUDWIG',	 'POLICY_CHARISMATIC_X',	'POLICY_INDUSTRIOUS_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Ludwig II [ICON_HAPPINESS_1][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_JFD_LUDWIG' END) 
WHERE Type = 'LEADER_JFD_LUDWIG';

CREATE TRIGGER CivIVTraitsBavaria
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_LUDWIG' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Ludwig II [ICON_HAPPINESS_1][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_JFD_LUDWIG' END) 
	WHERE Type = 'LEADER_JFD_LUDWIG';
END;	
--=======================================================================================================================
--=======================================================================================================================


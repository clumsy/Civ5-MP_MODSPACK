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
VALUES      ('LEADER_JFD_JAMES',	 'POLICY_FINANCIAL_X',		'POLICY_PHILOSOPHICAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'James VI [ICON_TRADE][ICON_GREAT_PEOPLE]'
	ELSE 'TXT_KEY_LEADER_JFD_JAMES' END) 
WHERE Type = 'LEADER_JFD_JAMES';

CREATE TRIGGER CivIVTraitsScotland
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_JAMES' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'James VI [ICON_TRADE][ICON_GREAT_PEOPLE]'
		ELSE 'TXT_KEY_LEADER_JFD_JAMES' END) 
	WHERE Type = 'LEADER_JFD_JAMES';
END;	
--=======================================================================================================================
--=======================================================================================================================


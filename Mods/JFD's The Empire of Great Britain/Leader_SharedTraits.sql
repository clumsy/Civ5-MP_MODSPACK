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
VALUES      ('LEADER_JFD_VICTORIA',		'POLICY_EXPANSIVE_X',		'POLICY_FINANCIAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Victoria [ICON_FOOD][ICON_TRADE]'
	ELSE 'TXT_KEY_LEADER_JFD_VICTORIA' END) 
WHERE Type = 'LEADER_JFD_VICTORIA';

CREATE TRIGGER CivIVTraitsGreatBritain
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_VICTORIA' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Victoria [ICON_FOOD][ICON_TRADE]'
		ELSE 'TXT_KEY_LEADER_JFD_VICTORIA' END) 
	WHERE Type = 'LEADER_JFD_VICTORIA';
END;	
--=======================================================================================================================
--=======================================================================================================================


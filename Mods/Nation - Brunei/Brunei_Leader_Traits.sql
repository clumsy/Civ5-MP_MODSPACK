CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_RBOLKIAH',	 'POLICY_MERCANTILE_X',	'POLICY_SEAFARING_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_MERCANTILE_X' )
	THEN 'Bolkiah [ICON_CONNECTED][ICON_MOVES]'
	ELSE 'TXT_KEY_LEADER_RBOLKIAH' END) 
WHERE Type = 'LEADER_RBOLKIAH';

CREATE TRIGGER CivIVTraitsMilan
AFTER INSERT ON Leaders WHEN 'LEADER_RBOLKIAH' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_SEAFARING_X' )
		THEN 'Bolkiah [ICON_CONNECTED][ICON_MOVES]'
		ELSE 'TXT_KEY_LEADER_RBOLKIAH' END) 
	WHERE Type = 'LEADER_RBOLKIAH';
END;	
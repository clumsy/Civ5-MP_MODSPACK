-- Insert SQL Rules Here 

CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_IDHONE',	 'POLICY_SEAFARING_X',	'POLICY_INDUSTRIOUS_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_SEAFARING_X' )
	THEN 'Illiam Dhone [ICON_MOVES][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_IDHONE' END) 
WHERE Type = 'LEADER_IDHONE';

CREATE TRIGGER CivIVTraitsMilan
AFTER INSERT ON Leaders WHEN 'LEADER_IDHONE' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Illiam Dhone [ICON_MOVES][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_IDHONE' END) 
	WHERE Type = 'LEADER_IDHONE';
END;	
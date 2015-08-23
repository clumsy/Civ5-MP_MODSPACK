-- Insert SQL Rules Here 

CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_OTTO_HENRY',	 'POLICY_INVENTIVE_X',	'POLICY_DIPLOMATIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_INVENTIVE_X' )
	THEN 'Otto Henry [ICON_RESEARCH][ICON_INFLUENCE]'
	ELSE 'TXT_KEY_LEADER_OTTO_HENRY' END) 
WHERE Type = 'LEADER_OTTO_HENRY';

CREATE TRIGGER CivIVTraitsRPalatine
AFTER INSERT ON Leaders WHEN 'LEADER_OTTO_HENRY' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_DIPLOMATIC_X' )
		THEN 'Otto Henry [ICON_RESEARCH][ICON_INFLUENCE]'
		ELSE 'TXT_KEY_LEADER_OTTO_HENRY' END) 
	WHERE Type = 'LEADER_OTTO_HENRY';
END;	
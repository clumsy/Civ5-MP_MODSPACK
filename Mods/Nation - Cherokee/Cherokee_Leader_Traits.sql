-- Insert SQL Rules Here 
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_RJOHN_ROSS',	 'POLICY_INDUSTRIOUS_X',	'POLICY_DIPLOMATIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_INDUSTRIOUS_X' )
	THEN 'John Ross [ICON_PRODUCTION][ICON_INFLUENCE]'
	ELSE 'TXT_KEY_LEADER_RJOHN_ROSS' END) 
WHERE Type = 'LEADER_RJOHN_ROSS';

CREATE TRIGGER CivIVTraitsMilan
AFTER INSERT ON Leaders WHEN 'LEADER_RCROESUS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_DIPLOMATIC_X' )
		THEN 'John Ross [ICON_INDUSTRIOUS][ICON_INFLUENCE]'
		ELSE 'TXT_KEY_LEADER_RJOHN_ROSS' END) 
	WHERE Type = 'LEADER_RJOHN_ROSS';
END;	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_ROGER_BERNARD',	 'POLICY_CREATIVE_X',	'POLICY_CHARISMATIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_CREATIVE_X' )
	THEN 'Roger Bernard III [ICON_CULTURE][ICON_HAPPINESS_1]'
	ELSE 'TXT_KEY_LEADER_ROGER_BERNARD' END) 
WHERE Type = 'LEADER_ROGER_BERNARD';

CREATE TRIGGER CivIVTraitsMilan
AFTER INSERT ON Leaders WHEN 'LEADER_ROGER_BERNARD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_CHARISMATIC_X' )
		THEN 'Roger Bernard III [ICON_CULTURE][ICON_HAPPINESS_1]'
		ELSE 'TXT_KEY_LEADER_ROGER_BERNARD' END) 
	WHERE Type = 'LEADER_ROGER_BERNARD';
END;	
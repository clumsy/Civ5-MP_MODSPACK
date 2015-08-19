-- Insert SQL Rules Here 

CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_RCROESUS',	 'POLICY_FINANCIAL_X',	'POLICY_CHARISMATIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_FINANCIAL_X' )
	THEN 'Croesus [ICON_GOLD][ICON_HAPPINESS_1]'
	ELSE 'TXT_KEY_LEADER_RCROESUS' END) 
WHERE Type = 'LEADER_RCROESUS';

CREATE TRIGGER CivIVTraitsMilan
AFTER INSERT ON Leaders WHEN 'LEADER_RCROESUS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_CHARISMATIC_X' )
		THEN 'Croesus [ICON_GOLD][ICON_HAPPINESS_1]'
		ELSE 'TXT_KEY_LEADER_RCROESUS' END) 
	WHERE Type = 'LEADER_RCROESUS';
END;	
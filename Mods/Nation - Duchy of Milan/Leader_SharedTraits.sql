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
VALUES      ('LEADER_JFD_VISCONTI',	 'POLICY_CHARISMATIC_X',	'POLICY_CREATIVE_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Visconti [ICON_HAPPINESS_1][ICON_CULTURE]'
	ELSE 'TXT_KEY_LEADER_JFD_VISCONTI' END) 
WHERE Type = 'LEADER_JFD_VISCONTI';

CREATE TRIGGER CivIVTraitsGermans
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_VISCONTI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Visconti [ICON_HAPPINESS_1][ICON_CULTURE]'
		ELSE 'TXT_KEY_LEADER_JFD_VISCONTI' END) 
	WHERE Type = 'LEADER_JFD_VISCONTI';
END;	
--=======================================================================================================================
--=======================================================================================================================


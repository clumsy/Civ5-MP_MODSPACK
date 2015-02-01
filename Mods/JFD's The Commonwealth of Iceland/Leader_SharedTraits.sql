--=======================================================================================================================
-- Leader_SharedTraits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,              TraitTwo)
VALUES      ('LEADER_JFD_INGOLFR',	 'POLICY_CREATIVE_X',	'POLICY_SEAFARING_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Ingolfr Arnarson [ICON_CULTURE][ICON_GREAT_EXPLORER]'
	ELSE 'TXT_KEY_LEADER_JFD_INGOLFR' END) 
WHERE Type = 'LEADER_JFD_INGOLFR';

CREATE TRIGGER CivIVTraitsIceland
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_INGOLFR' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Ingolfr Arnarson [ICON_CULTURE][ICON_GREAT_EXPLORER]'
		ELSE 'TXT_KEY_LEADER_JFD_INGOLFR' END) 
	WHERE Type = 'LEADER_JFD_INGOLFR';
END;	
--=======================================================================================================================
--=======================================================================================================================


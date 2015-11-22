--=======================================================================================================================
-- Leader_SharedTraits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				 TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_FREDERICK',	 'POLICY_IMPERIALISTIC_X',	'POLICY_PHILOSOPHICAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Frederick [ICON_CITY_STATE][ICON_GREAT_PEOPLE]'
	ELSE 'TXT_KEY_LEADER_JFD_FREDERICK_DESC' END) 
WHERE Type = 'LEADER_JFD_FREDERICK';

CREATE TRIGGER CivIVTraitsPrussia
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_FREDERICK' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Frederick [ICON_CITY_STATE][ICON_GREAT_PEOPLE]'
		ELSE 'TXT_KEY_LEADER_JFD_FREDERICK_DESC' END) 
	WHERE Type = 'LEADER_JFD_FREDERICK';
END;	
--=======================================================================================================================
--=======================================================================================================================


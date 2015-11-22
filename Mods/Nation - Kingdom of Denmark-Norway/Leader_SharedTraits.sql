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
VALUES      ('LEADER_JFD_CHRISTIAN',	'POLICY_FINANCIAL_X',		'POLICY_INDUSTRIOUS_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Christian IV [ICON_TRADE][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_JFD_CHRISTIAN' END) 
WHERE Type = 'LEADER_JFD_CHRISTIAN';

CREATE TRIGGER CivIVTraitsDenmarkNorway
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_CHRISTIAN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Christian IV [ICON_TRADE][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_JFD_CHRISTIAN' END) 
	WHERE Type = 'LEADER_JFD_CHRISTIAN';
END;	
--=======================================================================================================================
--=======================================================================================================================


--=======================================================================================================================
-- Leader_SharedTraits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,				TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_SIGISMUND',	 'POLICY_DIPLOMATIC_X',		'POLICY_FINANCIAL_X');
--=======================================================================================================================
-- Leaders
--=======================================================================================================================
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Sigismund II [ICON_INFLUENCE][ICON_TRADE]'
	ELSE 'TXT_KEY_LEADER_JFD_SIGISMUND' END) 
WHERE Type = 'LEADER_JFD_SIGISMUND';

CREATE TRIGGER CivIVTraitsPolandLithuania
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_SIGISMUND' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Sigismund II [ICON_INFLUENCE][ICON_TRADE]'
		ELSE 'TXT_KEY_LEADER_JFD_SIGISMUND' END) 
	WHERE Type = 'LEADER_JFD_SIGISMUND';
END;	
--=======================================================================================================================
--=======================================================================================================================


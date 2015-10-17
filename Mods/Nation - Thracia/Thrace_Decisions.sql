--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Thrace_Decisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 										Description) 
VALUES		('POLICY_DECISION_THRACEEXECUTE',	 	    'TXT_KEY_DECISIONS_THRACEEXECUTE'),
			('POLICY_DECISION_THRACERECOGNISE',	 	    'TXT_KEY_DECISIONS_THRACERECOGNISE');

UPDATE Policies
	SET CapitalUnhappinessMod = -50
	WHERE Type = 'POLICY_DECISION_THRACEEXECUTE';
	
UPDATE Policies
	SET ExtraHappinessPerCity = 1
	WHERE Type = 'POLICY_DECISION_THRACERECOGNISE';
--==========================================================================================================================
--==========================================================================================================================
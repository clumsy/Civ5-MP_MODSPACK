CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('AkkadDecisions.lua');

INSERT INTO Policies 
			(Type, 									Description)
VALUES		('POLICY_LITE_AKKAD_POSTALSERVICE', 	'TXT_KEY_DECISIONS_LITE_POSTALSERVICE');	

INSERT INTO Policy_BuildingClassProductionModifiers
                (PolicyType,          				  BuildingClassType,    	 	ProductionModifier)
VALUES          ('POLICY_LITE_AKKAD_POSTALSERVICE',   'BUILDINGCLASS_CARAVANSARY',  50);
				
INSERT INTO Policy_BuildingClassYieldChanges
                (PolicyType,         				 BuildingClassType,			  YieldType,   	  YieldChange)
VALUES          ('POLICY_LITE_AKKAD_POSTALSERVICE',  'BUILDINGCLASS_CARAVANSARY', 'YIELD_GOLD',    1);

INSERT INTO Policy_BuildingClassHappiness 
                (PolicyType,         				 BuildingClassType,			  Happiness)
VALUES          ('POLICY_LITE_AKKAD_POSTALSERVICE',  'BUILDINGCLASS_CARAVANSARY', 1);
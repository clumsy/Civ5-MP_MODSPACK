--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_GERMANY';
INSERT OR REPLACE INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_GERMANY', 	'UNITCLASS_RIFLEMAN', 	'UNIT_JFD_JAEGER');
--==========================================================================================================================	
--==========================================================================================================================	
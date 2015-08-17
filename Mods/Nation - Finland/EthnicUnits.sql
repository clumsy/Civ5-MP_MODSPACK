--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SWEDEN' )
	THEN '_SWEDEN'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_FINNS';
--
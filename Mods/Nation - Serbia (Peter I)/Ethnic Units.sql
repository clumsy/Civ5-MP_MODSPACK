--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_POLAND")
		THEN '_POLAND'
		ELSE '_EURO' END
	) WHERE Type = "CIVILIZATION_DJSH_SERBIA_PETER_I";
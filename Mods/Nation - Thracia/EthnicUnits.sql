UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_GREECE' )
    THEN '_GREECE'
    ELSE '_EURO' END)
WHERE Type = 'CIVILIZATION_MC_THRACE';

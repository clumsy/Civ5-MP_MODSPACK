UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_SLAVINISM" )
		THEN "RELIGION_SLAVINISM"
		ELSE "RELIGION_ORTHODOXY" END
	) WHERE CivilizationType = "CIVILIZATION_GE_SLAVS";
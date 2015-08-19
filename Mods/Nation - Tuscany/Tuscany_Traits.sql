--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 									Description, 								ShortDescription)
VALUES		('TRAIT_CRADLE_OF_THE_RENAISSANCE', 	'TXT_KEY_TRAIT_CRADLE_OF_THE_RENAISSANCE', 	'TXT_KEY_TRAIT_CRADLE_OF_THE_RENAISSANCE_SHORT');

UPDATE Traits SET Description = 
	(CASE WHEN (SELECT Setting FROM MC_Tuscan_Settings WHERE SettingName = 'UseAlternateUA') = 1
		THEN 'TXT_KEY_TRAIT_CRADLE_OF_THE_RENAISSANCE_ALT'
		ELSE 'TXT_KEY_TRAIT_CRADLE_OF_THE_RENAISSANCE'
		END
	) WHERE Type = 'TRAIT_CRADLE_OF_THE_RENAISSANCE';
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
ALTER TABLE Traits ADD JFD_CulturalGPPAnnexCityStates boolean default 0;
ALTER TABLE Traits ADD JFD_TradeLovesPuppetCities boolean default 0;

INSERT INTO Traits 
			(Type, 						Description, 					ShortDescription,						NoAnnexing)
VALUES		('TRAIT_JFD_HOLY_ROME', 	'TXT_KEY_TRAIT_JFD_HOLY_ROME', 	'TXT_KEY_TRAIT_JFD_HOLY_ROME_SHORT',	1);		
--==========================================================================================================================	
-- Trait_NoTrain
--==========================================================================================================================	
INSERT INTO Trait_NoTrain 
			(TraitType, 				UnitClassType)
VALUES		('TRAIT_JFD_HOLY_ROME', 	'UNITCLASS_SETTLER');
--==========================================================================================================================	
--==========================================================================================================================	
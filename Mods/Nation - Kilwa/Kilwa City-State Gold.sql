ALTER TABLE Traits ADD CityStateMetFirstBonus integer DEFAULT 0;
ALTER TABLE Traits ADD CityStateMetFirstBonusEnhanced integer DEFAULT 0;
ALTER TABLE Traits ADD CityStateMetSubsequentBonus integer DEFAULT 0;
ALTER TABLE Traits ADD CityStateMetSubsequentBonusEnhanced integer DEFAULT 0;
ALTER TABLE Traits ADD EnhanceTech text;

UPDATE Traits
	SET CityStateMetFirstBonus = 60, CityStateMetSubsequentBonus = 15, EnhanceTech = 'TECH_GUILDS',
	CityStateMetFirstBonusEnhanced = 60, CityStateMetSubsequentBonusEnhanced = 30
	WHERE Type = 'TRAIT_MC_SWAHILI_TRADERS';
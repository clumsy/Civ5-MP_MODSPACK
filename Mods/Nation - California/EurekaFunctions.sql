	

    INSERT INTO Policies
                            (TYPE,                                                  Description,                                                    Civilopedia,                                                            Help,
                            CultureCost,PortraitIndex,      IconAtlas,      IconAtlasAchieved)
    SELECT          ('POLICY_CALIFORNIAGOLDAGE'),   ('TXT_KEY_POLICY_CALIFORNIAGOLDAGE'),   ('TXT_KEY_POLICY_CALIFORNIAGOLDAGE_TEXT'),      ('TXT_KEY_POLICY_CALIFORNIAGOLDAGE_TEXT'),
                            -1,                     PortraitIndex,  IconAtlas,      IconAtlasAchieved
    FROM Policies WHERE TYPE='POLICY_MONARCHY';
     
     
    INSERT INTO Policy_ImprovementYieldChanges
                            (PolicyType,                                    ImprovementType,                                YieldType,                      Yield)
    VALUES					('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_TRADING_POST',             'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_CUSTOMS_HOUSE',            'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_CHATEAU',                  'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_KASBAH',				    'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_OUTDOOR_MARKET',		    'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_VILLAGE',					'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_VILLAGE_PRO_DUMMY',        'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_TOWN',						'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_OFFSHORE_PLATFORM',		'YIELD_SCIENCE',        1),
                            ('POLICY_CALIFORNIAGOLDAGE',    'IMPROVEMENT_BRAZILWOOD_CAMP',			'YIELD_SCIENCE',        1);
     
     
    INSERT INTO Trait_FreeBuildingDuringGoldenAge
                            (TraitType,                                     BuildingType)
    VALUES          ('TRAIT_CALIFORNIA_GOLD',       'BUILDING_CALIFORNIAGOLDAGE');
     
     
     
    INSERT INTO Trait_FreePolicyDuringGoldenAge
                            (TraitType,                                     PolicyType)
    VALUES          ('TRAIT_CALIFORNIA_GOLD',       'POLICY_CALIFORNIAGOLDAGE');

	CREATE TRIGGER CaliforniaScienceImprovements
AFTER INSERT ON Improvement_Yields
WHEN (NEW.YieldType = 'YIELD_GOLD') AND (NEW.Yield >= 1)
BEGIN
        INSERT OR IGNORE INTO Policy_ImprovementYieldChanges
                        (PolicyType,                    ImprovementType,       YieldType,       Yield)
        VALUES          ('POLICY_CALIFORNIAGOLDAGE',    NEW.ImprovementType,   'YIELD_SCIENCE', 1);
END;
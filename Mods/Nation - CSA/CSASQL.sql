	

           
     
        INSERT INTO Policies
                        (TYPE,                     Description,                        Civilopedia,                               Help,
                                CultureCost,PortraitIndex,      IconAtlas,      IconAtlasAchieved)
        SELECT          ('POLICY_CSAWARPOLICY'),   ('TXT_KEY_POLICY_CSAWARPOLICY'),   ('TXT_KEY_POLICY_CSAWARPOLICY_TEXT'),      ('TXT_KEY_POLICY_CSAWARPOLICY_TEXT'),
                                -1,                     PortraitIndex,  IconAtlas,      IconAtlasAchieved
        FROM Policies WHERE TYPE='POLICY_MONARCHY';
         
         
        INSERT INTO Policy_ImprovementYieldChanges
                        (PolicyType,               ImprovementType,                      YieldType,                 Yield)
        VALUES          ('POLICY_CSAWARPOLICY',    'IMPROVEMENT_ANTEBELLUM',             'YIELD_PRODUCTION',        1),
						('POLICY_CSAWARPOLICY',    'IMPROVEMENT_ANTEBELLUM',             'YIELD_CULTURE',        1);
     
         
        INSERT INTO Trait_FreePolicyDuringWar
                                (TraitType,                                     PolicyType)
        VALUES          ('TRAIT_REBELYELL',       'POLICY_CSAWARPOLICY');
     
     
           
           
    INSERT INTO UnitPromotions
                            (TYPE,                                                                                  Description,                                                                                    Help,                                          
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      PediaEntry,                                                     HeavyCharge)
    SELECT          ('PROMOTION_CSA_REBELYELL_4'),          ('TXT_KEY_PROMOTION_CSAREBELYELL'),            ('TXT_KEY_PROMOTION_CSAREBELYELL_HELP'),
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      ('TXT_KEY_PROMOTION_CSAREBELYELL'), 1
    FROM UnitPromotions     WHERE (TYPE = 'PROMOTION_STEAM_POWERED');
     
    INSERT INTO UnitPromotions
                            (TYPE,                                                                                  Description,                                                                                    Help,                                          
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      PediaEntry,                                                     HeavyCharge)
    SELECT          ('PROMOTION_CSA_REBELYELL_3'),          ('TXT_KEY_PROMOTION_CSAREBELYELL'),            ('TXT_KEY_PROMOTION_CSAREBELYELL_HELP'),
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      ('TXT_KEY_PROMOTION_CSAREBELYELL'), 1
    FROM UnitPromotions     WHERE (TYPE = 'PROMOTION_STEAM_POWERED');
     
    INSERT INTO UnitPromotions
                            (TYPE,                                                                                  Description,                                                                                    Help,                                          
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      PediaEntry,                                                     HeavyCharge)
    SELECT          ('PROMOTION_CSA_REBELYELL_2'),          ('TXT_KEY_PROMOTION_CSAREBELYELL'),            ('TXT_KEY_PROMOTION_CSAREBELYELL_HELP'),
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      ('TXT_KEY_PROMOTION_CSAREBELYELL'), 1
    FROM UnitPromotions     WHERE (TYPE = 'PROMOTION_STEAM_POWERED');
     
    INSERT INTO UnitPromotions
                            (TYPE,                                                                                  Description,                                                                                    Help,                                          
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      PediaEntry,                                                     HeavyCharge)
    SELECT          ('PROMOTION_CSA_REBELYELL_1'),          ('TXT_KEY_PROMOTION_CSAREBELYELL'),            ('TXT_KEY_PROMOTION_CSAREBELYELL_HELP'),
                            CannotBeChosen,         Sound,  PortraitIndex,  IconAtlas,      PediaType,      ('TXT_KEY_PROMOTION_CSAREBELYELL'), 1
    FROM UnitPromotions     WHERE (TYPE = 'PROMOTION_STEAM_POWERED');


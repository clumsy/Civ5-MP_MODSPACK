	

    CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
     
    INSERT INTO DecisionsAddin_Support             
                            (FileName)
    VALUES          ('CaliforniaDecisionsSupport.lua');
     
     
    --Gold Dummy
    INSERT INTO BuildingClasses
                            (TYPE,                                                                                                  DefaultBuilding,                                                                NoLimit)
    VALUES          ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_GOLD',               'BUILDING_DECISIONS_CALIFORNIA_DUMMY_GOLD',             1);
     
    INSERT INTO Buildings
                            (TYPE,                                                          BuildingClass, 
                            Cost,   FaithCost,      GreatWorkCount, PrereqTech, NeverCapture,       NukeImmune)
    VALUES          ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_GOLD',            'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_GOLD',
                            -1,             -1,                     -1,                             NULL,           1,                              1);
     
    INSERT INTO Building_YieldChanges
                            (BuildingType,                                                          YieldType,              Yield)
    VALUES          ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_GOLD','YIELD_GOLD',       1);
     
     
     
    --Tourism Dummies
    INSERT INTO BuildingClasses
                            (TYPE,                                                                                                  DefaultBuilding,                                                                                        NoLimit)
    VALUES          ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_1',  'BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_1',                        0),
                            ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_2',  'BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_2',                        0),
                            ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_4',  'BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_4',                        0),
                            ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_8',  'BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_8',                        0),
                            ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_16', 'BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_16',                       0),
                            ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_32', 'BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_32',                       0),
                            ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_64', 'BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_64',                       0),
                            ('BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_128','BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_128',                      0);
     
    INSERT INTO Buildings
                            (TYPE,                                                                                                  BuildingClass, 
                            Cost,   FaithCost,      GreatWorkCount, PrereqTech, NeverCapture,       NukeImmune,
                            EnhancedYieldTech,      TechEnhancedTourism)
    VALUES          ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_1',               'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_1',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     1),
                            ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_2',               'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_2',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     2),
                            ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_4',               'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_4',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     4),
                            ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_8',               'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_8',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     8),
                            ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_16',              'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_16',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     16),
                            ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_32',              'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_32',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     32),
                            ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_64',              'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_64',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     64),
                            ('BUILDING_DECISIONS_CALIFORNIA_DUMMY_TOURISM_128',             'BUILDINGCLASS_DECISIONS_CALIFORNIA_DUMMY_TOURISM_128',
                            -1,             -1,                     -1,                             NULL,           1,                              1,
                            'TECH_AGRICULTURE',     128);


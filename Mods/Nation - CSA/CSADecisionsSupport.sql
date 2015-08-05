INSERT INTO DecisionsAddin_Support
                        (FileName)
VALUES          ('CSADecisions.lua');
 
INSERT INTO Policies
                        (TYPE,                                                  Description,                                                    MinorBullyScoreModifier)
VALUES          ('POLICY_CSA_GOLDEN_CIRCLE',    'TXT_KEY_DECISIONS_CSA_GOLDEN_CIRCLE',  50);
 
INSERT INTO BuildingClasses    
                        (TYPE,                                                                  DefaultBuilding,                                        Description,                                                            MaxPlayerInstances)
VALUES          ('BUILDINGCLASS_DECISIONS_CSS_VIRGINIA','BUILDING_DECISIONS_CSS_VIRGINIA',      'TXT_KEY_BUILDING_DECISIONS_CSS_VIRGINIA',      1);
 
 
INSERT INTO Buildings  
                        (TYPE,                                                                  BuildingClass,                                                  Description,                                                            Civilopedia,                                                                                    Help,                                                                                   Strategy,                       Cost,   PrereqTech,     ConquestProb,   IconAtlas,                              PortraitIndex,          GreatWorkSlotType,                              GreatWorkCount,         FreeGreatWork)
VALUES          ('BUILDING_DECISIONS_CSS_VIRGINIA',     'BUILDINGCLASS_DECISIONS_CSS_VIRGINIA', 'TXT_KEY_DECISIONS_BUILDING_CSS_VIRGINIA',      'TXT_KEY_DECISIONS_BUILDING_CSS_VIRGINIA_CIVILOPEDIA',  'TXT_KEY_DECISIONS_BUILDING_CSS_VIRGINIA_HELP', NULL,
                        -1,     NULL,                   100,                    'CIVIL_WAR_UNIT_ATLAS', 3,                                      'GREAT_WORK_SLOT_ART_ARTIFACT', 1,                                      'GREAT_WORK_DECISIONS_CSS_VIRGINIA');
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_ArmeniaDecisions.lua');
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================	
INSERT OR REPLACE INTO UnitPromotions 
			(Type, 									Description, 								Help, 											Sound, 				CannotBeChosen, MovesChange,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_ARMENIA_SPARAPET', 		'TXT_KEY_PROMOTION_JFD_ARMENIA_SPARAPET', 	'TXT_KEY_PROMOTION_JFD_ARMENIA_SPARAPET_HELP', 	'AS2D_IF_LEVELUP', 	1, 				2, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_ARMENIA_SPARAPET');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type,											Description) 
VALUES		('POLICY_JFD_ARMENIAN_APOSTOLIC_CHURCH',		'TXT_KEY_DECISIONS_JFD_ARMENIA_APOSTOLIC_CHURCH');
--==========================================================================================================================
-- Policy_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldModifiers
			(PolicyType, 								BuildingClassType, 				YieldType, 			YieldMod)
VALUES		('POLICY_JFD_ARMENIAN_APOSTOLIC_CHURCH', 	'BUILDINGCLASS_GRAND_TEMPLE', 	'YIELD_CULTURE',	10);
--==========================================================================================================================
-- Policy_JFD_PietyRestingRateIncreases
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS
	Policy_JFD_PietyRestingRateIncreases (
	PolicyType																text 	REFERENCES Policies(Type) 		default null,
	Increase																integer									default 0,	
	IncreaseSource															text									default null);

INSERT INTO Policy_JFD_PietyRestingRateIncreases
			(PolicyType, 								Increase, 	IncreaseSource)
VALUES		('POLICY_JFD_ARMENIAN_APOSTOLIC_CHURCH', 	10, 		'TXT_KEY_JFD_PIETY_RESTING_RATE_ARMENIA_APOSTOLIC_CHURCH');
--==========================================================================================================================
--==========================================================================================================================


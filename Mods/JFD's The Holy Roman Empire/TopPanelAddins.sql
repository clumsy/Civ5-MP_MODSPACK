--==========================================================================================================================	
-- JFD_TopPanelIncludes
--==========================================================================================================================			
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT OR REPLACE INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_HolyRomeDynamicTopPanelSupport.lua');
--==========================================================================================================================		
-- JFD_TopPanelAdditions
--==========================================================================================================================		
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default null,
	YieldType  				text 										default null,
	YieldSourceFunction 	text										default null,
	YieldSourceToolTip		text										default	null,
	MiscToolTipFunction		text										default	null);
	
INSERT OR REPLACE INTO JFD_TopPanelAdditions
		(CivilizationType,				YieldType,				YieldSourcefunction,			YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_HOLY_ROME',	'YIELD_FAITH',			'JFD_GetFaithFromMinors',		'TXT_KEY_JFD_FAITH_FROM_HOLY_ROMAN_MEMBERS'),
		('CIVILIZATION_JFD_HOLY_ROME',	'YIELD_GOLD',			'JFD_GetGoldFromMinors',		'TXT_KEY_JFD_GOLD_FROM_HOLY_ROMAN_MEMBERS'),
		('CIVILIZATION_JFD_HOLY_ROME',	'YIELD_GOLDEN_AGE',		'JFD_GetHappinessFromMinors',	'TXT_KEY_JFD_GOLDEN_AGE_FROM_HOLY_ROMAN_MEMBERS');
--==========================================================================================================================		
--==========================================================================================================================		

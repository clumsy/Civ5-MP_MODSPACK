--==========================================================================================================================	
-- JFD_TopPanelIncludes
--==========================================================================================================================			
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT OR REPLACE INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_AngloSaxonDynamicTopPanelSupport.lua');
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
		(CivilizationType,					YieldType,				YieldSourcefunction,		YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_ANGLO_SAXONS',	'YIELD_GOLDEN_AGE',		'JFD_GetAngloSaxonGAP',		'TXT_KEY_JFD_GOLDEN_AGE_FROM_LESS_UNHAPPINESS');
--==========================================================================================================================		
--==========================================================================================================================		

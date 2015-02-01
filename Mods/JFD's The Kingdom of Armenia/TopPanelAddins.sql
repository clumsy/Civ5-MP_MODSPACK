--==========================================================================================================================	
-- JFD_TopPanelIncludes
--==========================================================================================================================			
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT OR REPLACE INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_ArmeniaDynamicTopPanelSupport.lua');
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
		(CivilizationType,				YieldType,			YieldSourcefunction,				YieldSourceToolTip,						MiscToolTipFunction)
VALUES	('CIVILIZATION_JFD_ARMENIA',	'YIELD_FAITH',		'JFD_GetFaithFromFirstReligion',	'TXT_KEY_JFD_FAITH_FROM_OTHER_CIVS',	'JFD_GetFirstWorldReligionMiscTooltip');
--==========================================================================================================================		
--==========================================================================================================================		

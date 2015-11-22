--==========================================================================================================================	
-- JFD_TopPanelIncludes
--==========================================================================================================================			
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT OR REPLACE INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_PeterDynamicTopPanelSupport.lua');
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
		(CivilizationType,					YieldType,			YieldSourcefunction,		YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_PETRINE_RUSSIA',	'YIELD_SCIENCE',	'JFD_GetScienceFromDoF',	'TXT_KEY_JFD_TP_SCIENCE_FROM_DOF');
--==========================================================================================================================		
--==========================================================================================================================		

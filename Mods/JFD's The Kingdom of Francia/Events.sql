--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_FranksEvents.lua');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 				Type, 						Cost,	Moves,	Domain,			DefaultUnitAI,		Description, 						ShowInPedia, 	AdvancedStartCost,	UnitArtInfo, 					UnitFlagIconOffset,		UnitFlagAtlas,					PortraitIndex,	IconAtlas, 					MoveRate)
VALUES		('UNITCLASS_WRITER',	'UNIT_JFD_SONG_OF_ROLAND', 	-1,		2,		'DOMAIN_LAND',	'UNITAI_WRITER',	'TXT_KEY_UNIT_JFD_SONG_OF_ROLAND',	0,				-1,					'ART_DEF_UNIT_GREAT_WRITER',	8,						'EXPANSION2_UNIT_FLAG_ATLAS',	8, 				'EXPANSION2_UNIT_ATLAS',	'GREAT_PERSON');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_SONG_OF_ROLAND'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WRITER');	
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 
			(UnitType, 						UniqueName,									GreatWorkType)
VALUES		('UNIT_JFD_SONG_OF_ROLAND', 	'TXT_KEY_GREAT_PERSON_SONG_OF_ROLAND_DESC',	'GREAT_WORK_SONG_OF_ROLAND');
--==========================================================================================================================	
-- GreatWorks
--==========================================================================================================================	
INSERT INTO GreatWorks 
			(Type, 							GreatWorkClassType,			Description,								Quote,											Audio,							Image)
VALUES		('GREAT_WORK_SONG_OF_ROLAND', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_JFD_SONG_OF_ROLAND',	'TXT_KEY_GREAT_WORK_QUOTE_JFD_SONG_OF_ROLAND',	'AS2D_GREAT_ARTIST_ARTWORK',	'GreatWriter_Background.dds');			
--==========================================================================================================================
--==========================================================================================================================


--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_JAMES_PEACE',	'James_Peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_JAMES_WAR', 		'James_War', 	'DynamicResident');			
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 							SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_AMBIENCE_LEADER_JFD_JAMES_AMBIENCE', 	'SND_AMBIENCE_CEASAR_AMBIENCE', 	'GAME_SFX', 	40, 		40, 		0, 			1),
			('AS2D_LEADER_MUSIC_JFD_JAMES_PEACE', 			'SND_LEADER_MUSIC_JFD_JAMES_PEACE', 'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_JAMES_WAR', 			'SND_LEADER_MUSIC_JFD_JAMES_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	

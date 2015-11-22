--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_CHURCHILL_SPEECH', 	'ChurchillSpeech', 	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_CHURCHILL_PEACE', 	'Churchill_Peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_CHURCHILL_WAR', 		'Churchill_War', 	'DynamicResident');			
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================	
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 									SoundType, 		TaperSoundtrackVolume,  MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_CHURCHILL_SPEECH', 	'SND_LEADER_MUSIC_JFD_CHURCHILL_SPEECH',	'GAME_SPEECH', 	-1.0,					100, 		100, 		0, 		0),
			('AS2D_LEADER_MUSIC_JFD_CHURCHILL_PEACE', 	'SND_LEADER_MUSIC_JFD_CHURCHILL_PEACE',		'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		0),
			('AS2D_LEADER_MUSIC_JFD_CHURCHILL_WAR', 	'SND_LEADER_MUSIC_JFD_CHURCHILL_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		0);
--==========================================================================================================================	
--==========================================================================================================================	

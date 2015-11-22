--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_TIRIDATES_PEACE', 	'Tiridates_Peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_TIRIDATES_WAR', 		'Tiridates_War', 	'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 											SoundID, 									SoundType, 		MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES		('AS2D_AMBIENCE_LEADER_JFD_TIRIDATES_AMBIENCE', 	'SND_AMBIENCE_GRASSLANDS_BED', 				'GAME_SFX', 	50, 		50, 		0, 		1),
			('AS2D_LEADER_MUSIC_JFD_TIRIDATES_PEACE', 			'SND_LEADER_MUSIC_JFD_TIRIDATES_PEACE', 	'GAME_MUSIC', 	50, 		50, 		1, 		0),
			('AS2D_LEADER_MUSIC_JFD_TIRIDATES_WAR', 			'SND_LEADER_MUSIC_JFD_TIRIDATES_WAR', 		'GAME_MUSIC', 	50, 		50, 		1,		0);
--==========================================================================================================================		
--==========================================================================================================================		

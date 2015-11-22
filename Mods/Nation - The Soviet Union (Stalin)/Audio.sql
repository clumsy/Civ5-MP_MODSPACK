--==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_STALIN_ANTHEM', 	'SovietAnthem',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_STALIN_PEACE', 	'Stalin_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_STALIN_WAR', 	'Stalin_War',	'DynamicResident');			
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType, 				TaperSoundtrackVolume,  MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_STALIN_ANTHEM', 'SND_LEADER_MUSIC_JFD_STALIN_ANTHEM',	'GAME_MUSIC_STINGS',	0.0,					60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_STALIN_PEACE', 	'SND_LEADER_MUSIC_JFD_STALIN_PEACE',	'GAME_MUSIC',			-1.0,					50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_STALIN_WAR', 	'SND_LEADER_MUSIC_JFD_STALIN_WAR', 		'GAME_MUSIC',			-1.0,					30, 		30, 		1,			0);
--==========================================================================================================================
--==========================================================================================================================

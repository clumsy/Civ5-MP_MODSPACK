--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_LENIN_PEACE', 	'Lenin_Peace',	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_LENIN_WAR', 		'Lenin_War',	'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_LENIN_PEACE', 	'SND_LEADER_MUSIC_JFD_LENIN_PEACE',		'GAME_MUSIC',	50, 		50, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_LENIN_WAR', 	'SND_LEADER_MUSIC_JFD_LENIN_WAR', 		'GAME_MUSIC',	50, 		50, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	

--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_DUFOUR_PEACE', 	'Dufour_Peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_DUFOUR_WAR', 	'Dufour_War', 		'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume, IsMusic, Looping)
VALUES		('AS2D_AMBIENCE_LEADER_JFD_DUFOUR_AMBIENCE', 	'SND_AMBIENCE_CITY_MED_SMALL', 			'GAME_SFX', 	50, 		50, 		0, 		1),
			('AS2D_LEADER_MUSIC_JFD_DUFOUR_PEACE',			'SND_LEADER_MUSIC_JFD_DUFOUR_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 		0),
			('AS2D_LEADER_MUSIC_JFD_DUFOUR_WAR', 			'SND_LEADER_MUSIC_JFD_DUFOUR_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		0);
--==========================================================================================================================		
--==========================================================================================================================		

--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 										Filename, 						LoadType)
VALUES		('SND_LEADER_MUSIC_EADNI_PEACE', 		'SamiPeace',			'DynamicResident'),
			('SND_LEADER_MUSIC_EADNI_WAR', 			'SamiWar', 				'DynamicResident'),
			('SND_DOM_SPEECH_SAMI', 				'SamiDoM',				'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 			MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_EADNI_PEACE', 				'SND_LEADER_MUSIC_EADNI_PEACE', 			'GAME_MUSIC', 		100, 		100, 		1, 		 0),
			('AS2D_LEADER_MUSIC_EADNI_WAR', 				'SND_LEADER_MUSIC_EADNI_WAR', 				'GAME_MUSIC', 		100, 		100, 		1,		 0),
			('AS2D_AMBIENCE_LEADER_EADNI_AMBIENCE', 		'SND_AMBIENCE_SNOW_BED', 					'GAME_AMBIENCE',	40, 		40, 		1,		 1),
			('AS2D_DOM_SPEECH_SAMI', 						'SND_DOM_SPEECH_SAMI',					 	'GAME_SPEECH', 		100, 		100, 		1, 		 0);
--==========================================================================================================================		
--==========================================================================================================================		

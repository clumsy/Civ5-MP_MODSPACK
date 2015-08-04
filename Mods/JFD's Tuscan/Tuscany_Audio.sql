--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 										Filename, 						LoadType)
VALUES		('SND_LEADER_MUSIC_LORENZO_PEACE', 				'Tuscany_Peace',				'DynamicResident'),
			('SND_LEADER_MUSIC_LORENZO_WAR', 				'Tuscany_War', 					'DynamicResident'),
			('SND_DOM_SPEECH_TUSCANY', 						'Tuscany_DoM',					'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 			MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_LORENZO_PEACE', 				'SND_LEADER_MUSIC_LORENZO_PEACE', 		'GAME_MUSIC', 		100, 		100, 		1, 		 0),
			('AS2D_LEADER_MUSIC_LORENZO_WAR', 					'SND_LEADER_MUSIC_LORENZO_WAR', 		'GAME_MUSIC', 		100, 		100, 		1,		 0),
			('AS2D_DOM_SPEECH_TUSCANY', 						'SND_DOM_SPEECH_TUSCANY',				'GAME_SPEECH', 		100, 		100, 		1, 		 0);
--==========================================================================================================================		
--==========================================================================================================================		

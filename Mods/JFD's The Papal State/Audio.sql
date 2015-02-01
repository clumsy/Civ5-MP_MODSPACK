--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 							Filename, 						LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_PIUS_PEACE', 'Pius_Peace',					'Streamed'),
			('SND_LEADER_MUSIC_JFD_PIUS_WAR', 	'Pius_War', 					'Streamed'),		
			('SND_JFD_PAPAL_PEACE_01', 			'AllegriMiserere', 				'Streamed'),
			('SND_JFD_PAPAL_PEACE_02', 			'BrumelGloria', 				'Streamed'),
			('SND_JFD_PAPAL_PEACE_03', 			'ChantDeus', 					'Streamed'),
			('SND_JFD_PAPAL_PEACE_04', 			'ChantLaudate', 				'Streamed'),
			('SND_JFD_PAPAL_PEACE_05', 			'DesprezElGrillo', 				'Streamed'),
			('SND_JFD_PAPAL_PEACE_06', 			'DesprezLament', 				'Streamed'),
			('SND_JFD_PAPAL_PEACE_07', 			'LassusAlmaRedemptorisMater', 	'Streamed'),
			('SND_JFD_PAPAL_PEACE_08', 			'OckeghemIntemerata', 			'Streamed'),
			('SND_JFD_PAPAL_PEACE_09', 			'OckeghemKyrie', 				'Streamed'),
			('SND_JFD_PAPAL_PEACE_10', 			'PalestrinaCredo', 				'Streamed'),
			('SND_JFD_PAPAL_PEACE_11', 			'SheppardMediaVita', 			'Streamed');
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 							SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_PIUS_PEACE', 	'SND_LEADER_MUSIC_JFD_PIUS_PEACE', 	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
			('AS2D_LEADER_MUSIC_JFD_PIUS_WAR', 		'SND_LEADER_MUSIC_JFD_PIUS_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_1', 				'SND_JFD_PAPAL_PEACE_01', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_2', 				'SND_JFD_PAPAL_PEACE_02', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_3', 				'SND_JFD_PAPAL_PEACE_03', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_4', 				'SND_JFD_PAPAL_PEACE_04', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_5', 				'SND_JFD_PAPAL_PEACE_05', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_6', 				'SND_JFD_PAPAL_PEACE_06', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_7', 				'SND_JFD_PAPAL_PEACE_07', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_8', 				'SND_JFD_PAPAL_PEACE_08', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_9', 				'SND_JFD_PAPAL_PEACE_09', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_10', 			'SND_JFD_PAPAL_PEACE_10', 			'GAME_MUSIC', 	60, 		60, 		1,		 0),
			('SONG_JFD_PAPAL_PEACE_11', 			'SND_JFD_PAPAL_PEACE_11', 			'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================		
--==========================================================================================================================		

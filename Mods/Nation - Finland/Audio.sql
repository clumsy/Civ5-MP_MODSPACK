-- Insert SQL Rules Here --==========================================================================================================================
-- Audio_Sounds
--==========================================================================================================================	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_MANNERHEIM_PEACE', 		'MannerheimPeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_MANNERHEIM_WAR', 		'MannerheimWar', 		'DynamicResident'),	
			('SND_KALEVALA_AINO_AND_THE_WATER_MAIDENS', 		'AinoAndTheWaterMaidens', 	'DynamicResident'),
			('SND_KALEVALA_BIRTH_OF_WAINAMOINEN', 		'BirthOfWainamoinen', 	'DynamicResident'),
			('SND_KALEVALA_BREWING_OF_BEER', 		'BrewingOfBeer', 	'DynamicResident'),
			('SND_KALEVALA_DEPARTURE_OF_WAINAMOINEN', 		'DepartureOfWainamoinen', 	'DynamicResident'),
			('SND_KALEVALA_JOUKAHAINEN', 		'Joukahainen', 	'DynamicResident'),
			('SND_KALEVALA_KULLERVO', 		'Kullervo', 	'DynamicResident'),
			('SND_KALEVALA_ORIGIN_OF_IRON', 		'OriginOfIron', 	'DynamicResident'),
			('SND_KALEVALA_WAINAMOINENS_SOWING', 		'WainamoinensSowing', 	'DynamicResident'),		
			('SND_AMBIENCE_LEADER_MANNERHEIM_AMBIENCE', 		'MannerheimAmbience', 	'DynamicResident');	
--==========================================================================================================================
-- Audio_2DSounds
--==========================================================================================================================	
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_MANNERHEIM_PEACE', 	'SND_LEADER_MUSIC_MANNERHEIM_PEACE',	'GAME_MUSIC', 	200, 		200, 		1, 		0),
			('AS2D_LEADER_MUSIC_MANNERHEIM_WAR', 		'SND_LEADER_MUSIC_MANNERHEIM_WAR', 	'GAME_MUSIC', 	120, 		120, 		1,		0),
			('AS2D_AMBIENCE_LEADER_MANNERHEIM_AMBIENCE', 		'SND_AMBIENCE_LEADER_MANNERHEIM_AMBIENCE', 	'GAME_SFX', 	60, 		60, 		1,		0);
--==========================================================================================================================	
--==========================================================================================================================	

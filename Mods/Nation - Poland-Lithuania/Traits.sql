--==========================================================================================================================
-- Traits
--==========================================================================================================================		
ALTER TABLE Traits ADD JFD_ProductionBoostFromPolicies boolean default 0;

INSERT INTO Traits 
			(Type, 							FreeUnit,						FreeUnitPrereqTech,		Description, 							ShortDescription)
VALUES		('TRAIT_JFD_POLAND_LITHUANIA', 	null,							null,					'TXT_KEY_TRAIT_JFD_POLAND_LITHUANIA', 	'TXT_KEY_TRAIT_JFD_POLAND_LITHUANIA_SHORT'),
			('TRAIT_JFD_POLAND', 			'UNITCLASS_GREAT_GENERAL',		'TECH_CHIVALRY',		'TXT_KEY_TRAIT_JFD_POLAND', 			'TXT_KEY_TRAIT_JFD_POLAND_SHORT');	
--==========================================================================================================================
-- Policies
--==========================================================================================================================	
INSERT INTO Policies
			(Type,								Description,								MinorGoldFriendshipMod, MinorQuestFriendshipMod)
VALUES		('POLICY_JFD_POLAND_LITHUANIA',		'TXT_KEY_TRAIT_JFD_POLAND_LITHUANIA_SHORT',	100,					100);
--==========================================================================================================================	
--==========================================================================================================================				


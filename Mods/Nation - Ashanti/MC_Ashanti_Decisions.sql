--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Ashanti_Decisions.lua');
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_DECISIONS_ASHANTINKWANSRAFO',
		'Establish the Nkwansrafo'
	),
	(
		'TXT_KEY_DECISIONS_ASHANTINKWANSRAFO_DESC',
		'The road systems of our nation are essential to the flow of gold and the maintenance of our political power throughout the cities within the Ashanti Empire and we cannot have bandits harassing those who would travel within the it. Nkwansrafo will henceforth be stationed throughout our roads to guarantee safety.[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be the Ashanti
		[NEWLINE][ICON_BULLET]Must have a Constabulary in the Capital
		[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]2 [ICON_MAGISTRATES] Magistrates
		[NEWLINE][ICON_BULLET]-5 [ICON_GOLDEN_STOOL] per turn in Cities not connected to the Capital
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]+2 [ICON_GOLDEN_STOOL] per turn in Cities connected to the Capital
		[NEWLINE][ICON_BULLET]Units trained in the Capital begin with extra experience
		[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Note: The amount of extra experience your Units begin with increases with the number of Cities connected to the Capital. Currently they would gain an extra {1_Num} XP[ENDCOLOR]'
	),
	(
		'TXT_KEY_DECISIONS_ASHANTINKWANSRAFO_ENACTED_DESC',
		'The road systems of our nation are essential to the flow of gold and the maintenance of our political power throughout the cities within the Ashanti Empire and we cannot have bandits harassing those who would travel within the it. Nkwansrafo will henceforth be stationed throughout our roads to guarantee safety.[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]+2[ICON_GOLDEN_STOOL] per turn in Cities connected to the Capital
		[NEWLINE][ICON_BULLET]Units trained in the Capital begin with extra experience
		[NEWLINE][NEWLINE][COLOR_POSITIVE_TEXT]Note: The amount of extra experience your Units begin with increases with the number of Cities connected to the Capital. Currently they gain an extra {1_Num} XP[ENDCOLOR]'
	),
	(
		'TXT_KEY_DECISIONS_ASHANTIASANTEMANHYIAMU',
		'Convene the Asantemanhyiamu'
	),
	(
		'TXT_KEY_DECISIONS_ASHANTIASANTEMANHYIAMU_DESC',
		'Our Confederacy has come a long way from the disjointed Astanteman clans of old; it is time to ensure the continued strength of our government and its laws. Let the Asantemanhyiamu be convened and the voices of the wisest of our people be heard![NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be the Ashanti
		[NEWLINE][ICON_BULLET]Must have completed at least 1 Social Policy tree
		[NEWLINE][ICON_BULLET]May only be enacted once per era
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]1 [ICON_MAGISTRATES] Magistrates
		[NEWLINE][ICON_BULLET]Blocks the “Convene the Agyina” Decision for the remainder of this era
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]For the remainder of this era Great People may be purchased with [ICON_GOLDEN_STOOL] Golden Stool Points'
	),
	(
		'TXT_KEY_DECISIONS_ASHANTIASANTEMANHYIAMU_ENACTED_DESC',
		'Our Confederacy has come a long way from the disjointed Astanteman clans of old; it is time to ensure the continued strength of our government and its laws. Let the Asantemanhyiamu be convened and the voices of the wisest of our people be heard![NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]For the remainder of this era Great People may be purchased with [ICON_GOLDEN_STOOL] Golden Stool Points'
	),
	(
		'TXT_KEY_DECISIONS_ASHANTAGYINA',
		'Convene the Agyina '
	),
	(
		'TXT_KEY_DECISIONS_ASHANTAGYINA_DESC',
		'Our Confederacy has come a long way from the disjointed Astanteman clans of old; it is time to ensure the continued strength of our government and its laws. Let the Agyina be convened and the voices of the most noble among us be heard![NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be the Ashanti
		[NEWLINE][ICON_BULLET]Must have completed at least 1 Social Policy tree
		[NEWLINE][ICON_BULLET]May only be enacted once per era
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]1 [ICON_MAGISTRATES] Magistrates
		[NEWLINE][ICON_BULLET]Blocks the “Convene the Asantemanhyiamu” Decision for the remainder of this era
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]For the remainder of this era currying Influence [ICON_INFLUENCE] and Integrating City-States with [ICON_GOLDEN_STOOL] Golden Stool Points costs less'
	),
	(
		'TXT_KEY_DECISIONS_ASHANTAGYINA_ENACTED_DESC',
		'Our Confederacy has come a long way from the disjointed Astanteman clans of old; it is time to ensure the continued strength of our government and its laws. Let the Agyina be convened and the voices of the most noble among us be heard![NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]For the remainder of this era currying Influence [ICON_INFLUENCE] and Integrating City-States with [ICON_GOLDEN_STOOL] Golden Stool Points costs less'
	);
--==========================================================================================================================
--==========================================================================================================================
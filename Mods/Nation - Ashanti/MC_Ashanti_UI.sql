--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_GOLDEN_STOOL',		'Golden_Stool_FontIcon');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping 
			(IconName, 					IconFontTexture,					IconMapping)
VALUES		('ICON_GOLDEN_STOOL',		'ICON_FONT_TEXTURE_GOLDEN_STOOL',		1);
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_MC_ASHANTI_UI_RECRUIT',
		'Recruit a {1_Unit} ({2_Cost}[ICON_GOLDEN_STOOL])'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_RECRUIT_HELP',
		'Recruit a {1_Unit} for {2_Cost}[ICON_GOLDEN_STOOL]'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_RECRUIT_ELITE',
		'Recruit an elite {1_Unit} ({2_Cost}[ICON_GOLDEN_STOOL])'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_RECRUIT_ELITE_HELP',
		'Recruit an elite {1_Unit} for {2_Cost}[ICON_GOLDEN_STOOL]. Elite Units begin with an extra 30 XP.'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_INFLUENCE',
		'Curry {1_Influence}[ICON_INFLUENCE] Influence ({2_Cost}[ICON_GOLDEN_STOOL])'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_INFLUENCE_HELP',
		'Gain {1_Influence}[ICON_INFLUENCE] Influence at the cost of {2_Cost}[ICON_GOLDEN_STOOL]'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_INTEGRATE',
		'Integrate {1_Civ} ({2_Cost}[ICON_GOLDEN_STOOL])'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_INTEGRATE_HELP',
		'Pay {1_Cost}[ICON_GOLDEN_STOOL], {2_Civ} will join your empire.'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_CONQUEST',
		'You have gained {1_Amount}[ICON_GOLDEN_STOOL] for conquering {2_City}.'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_CONVERSION',
		'You have gained {1_Amount}[ICON_GOLDEN_STOOL] from {2_City} converting to your religion.'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_CONVERSION_UNKNOWN_CITY',
		'an unknown City'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_GP_EXPENDED',
		'You have gained {1_Amount}[ICON_GOLDEN_STOOL] for expending a Great Person.'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_GSP_TALLY',
		'You currently have {1_Amount}[ICON_GOLDEN_STOOL] Golden Stool Points'
	),
	(
		'TXT_KEY_MC_ASHANTI_UI_TITLE',
		'The Golden Stool'
	),
	(
		'TXT_KEY_MC_ASHANTI_MINOR_BUYOUT',
		'{1_Name} has been convinced to join the Ashanti Confederacy!'
	);
--==========================================================================================================================
--==========================================================================================================================
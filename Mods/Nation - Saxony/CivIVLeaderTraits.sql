-- Insert SQL Rules Here -- Insert SQL Rules Here 
 --=======================================================================================================================
-- Leader_Traits
--=======================================================================================================================
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
            (LeaderType,						TraitOne,                   TraitTwo)
VALUES      ('LEADER_FREDERICK',			'POLICY_IMPERIALISTIC_X',		'POLICY_SPIRITUAL_X'),
--==========================================================================================================================
--		Reference table for text keys. Use these to keep Leader names accurate.
--		[ICON_WAR] Aggressive
--		[ICON_HAPPINESS_1] Charismatic
--		[ICON_CULTURE] Creative
--		[ICON_INFLUENCE] Diplomatic
--		[ICON_FOOD] Expansive
--		[ICON_TRADE] Financial
--		[ICON_CITY_STATE] Imperialistic
--		[ICON_PRODUCTION] Industrious
--		[ICON_RESEARCH] Inventive
--		[ICON_GOLD] Mercantile
--		[ICON_GREAT_PEOPLE] Philosophical
--		[ICON_STRENGTH] Protective
--		[ICON_GREAT_EXPLORER] Seafaring
--		[ICON_PEACE] Spiritual
--==========================================================================================================================
UPDATE [Language_en_US] SET Text = 'Frederick Augustus III [ICON_CITY_STATE][ICON_PEACE]' WHERE Tag = 'TXT_KEY_LEADER_LEONIDAS';

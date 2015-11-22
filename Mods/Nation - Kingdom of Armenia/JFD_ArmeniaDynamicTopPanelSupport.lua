-- JFD_ArmeniaDynamicTopPanelSupport
-- Author: JFD
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
include("NewSaveUtils.lua"); MY_MOD_NAME = "Armenia";
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetArmenianReligiousLeader
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetFirstWorldReligion()
	return GetPersistentProperty("JFD_FirstWorldReligion")
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetReligiousLeader
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetArmenianReligiousLeader()
	local religiousLeader
	if JFD_GetFirstWorldReligion() ~= nil then
		religiousLeader = Game.GetFounder(JFD_GetFirstWorldReligion(), -1)
	end

	return religiousLeader
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetFaithFromFirstReligion
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetFaithFromFirstReligion()
	local religiousLeader = Players[JFD_GetArmenianReligiousLeader()]
	local religiousLeaderFaith = 0
	if religiousLeader then
		religiousLeaderFaith = math.floor(religiousLeader:GetTotalFaithPerTurn() * 33/100)
	end

	return religiousLeaderFaith
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetFirstWorldReligionMiscTooltip
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetFirstWorldReligionMiscTooltip()
	if JFD_GetFirstWorldReligion() then
		local firstWorldReligionName = Game.GetReligionName(JFD_GetFirstWorldReligion())
		local tooltip = Locale.ConvertTextKey("TXT_KEY_JFD_FIRST_WORLD_RELIGION", firstWorldReligionName)

		return tooltip
	end
end
--=======================================================================================================================
--=======================================================================================================================



-- JFD_USSRStalinCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("IconSupport")
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end

local civilisationID = GameInfoTypes["CIVILIZATION_JFD_USSR_STALIN"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_USSRStalinCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_USSRStalinCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDUSSRStalin)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDUSSRStalin)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDUSSRStalin)
	
	Controls.IconFrame:SetHide(true)
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingUSSRStalinID = GameInfoTypes["BUILDING_JFD_STALIN_SATELLITES"]

isCityScreenOpen = false
g_JFDUSSRStalinTipControls = {}
TTManager:GetTypeControlTable("JFDUSSRStalinTooltip", g_JFDUSSRStalinTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)

	if not(instance) then
		instance = Controls
	end

	-- Ensure City Selected
	local activePlayer = Players[Game.GetActivePlayer()]
	local city = UI.GetHeadSelectedCity()
	if not(city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("JFDUSSRStalinTooltip")
	IconHookup(0, 64, "JFD_USSR_STALIN_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingUSSRStalinID)*10
	if bonus == 0 then
		instance.IconFrame:SetHide(true)
		return
	end

	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_USSR_STALIN_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_USSR_STALIN_CITY_VIEW_HELP", bonus)
	g_JFDUSSRStalinTipControls.Heading:SetText(titleText)
	g_JFDUSSRStalinTipControls.Body:SetText(helpText)
	g_JFDUSSRStalinTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDUSSRStalin()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDUSSRStalin)

function SerialEventCityDirty_JFDUSSRStalin()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDUSSRStalin)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDUSSRStalin)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDUSSRStalin()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDUSSRStalin)
--=======================================================================================================================
--=======================================================================================================================

-- JFD_VegvarCityInfo
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

local civilisationID = GameInfoTypes["CIVILIZATION_JFD_HUNGARY"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
--------------------------------------------------------------
-- JFD_ReturnVegvar
--------------------------------------------------------------
function JFD_ReturnVegvar(city, buildingVegvarID)
	if city:IsHasBuilding(buildingVegvarID) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_VegvarCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_VegvarCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDVegvar)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDVegvar)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDVegvar)
	
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
local buildingVegvarID = GameInfoTypes["BUILDING_JFD_VEGVAR"]
local buildingVegvarFaithID = GameInfoTypes["BUILDING_JFD_VEGVAR_FAITH"]

isCityScreenOpen = false
g_JFDVegvarTipControls = {}
TTManager:GetTypeControlTable("JFDVegvarTooltip", g_JFDVegvarTipControls)
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
	
	-- Ensure City has a Vegvar
	local hasVegvar = JFD_ReturnVegvar(city, buildingVegvarID)
	if not (hasVegvar) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingVegvar = GameInfo.Buildings[buildingVegvarID]
	instance.IconFrame:SetToolTipType("JFDVegvarTooltip")
	IconHookup(buildingVegvar.PortraitIndex, 64, buildingVegvar.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingVegvarFaithID)
	local bonusPressure = 0
	local religionName = Game.GetReligionName(city:GetReligiousMajority()) or "no religion"
	if bonus > 0 then bonusPressure = 25 end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingVegvar.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_VEGVAR_CITY_VIEW_HELP", bonus, bonusPressure, religionName)
	g_JFDVegvarTipControls.Heading:SetText(titleText)
	g_JFDVegvarTipControls.Body:SetText(helpText)
	g_JFDVegvarTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDVegvar()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDVegvar)

function SerialEventCityDirty_JFDVegvar()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDVegvar)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDVegvar)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDVegvar()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDVegvar)
--=======================================================================================================================
--=======================================================================================================================

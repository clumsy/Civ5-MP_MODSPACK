-- JFD_KrepostCityInfo
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

local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PETRINE_RUSSIA"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
--------------------------------------------------------------
-- JFD_ReturnKrepost
--------------------------------------------------------------
function JFD_ReturnKrepost(city, buildingKrepostID)
	if city:IsHasBuilding(buildingKrepostID) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_KrepostCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_KrepostCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDKrepost)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDKrepost)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDKrepost)
	
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
local buildingKrepostID = GameInfoTypes["BUILDING_KREPOST"]
local buildingKrepostExpansionID = GameInfoTypes["BUILDING_JFD_PETRINE_EXPANSION"]

isCityScreenOpen = false
g_JFDKrepostTipControls = {}
TTManager:GetTypeControlTable("JFDKrepostTooltip", g_JFDKrepostTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)

	if not(instance) then
		instance = Controls
	end

	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if not(city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure City has a Krepost
	local hasKrepost = JFD_ReturnKrepost(city, buildingKrepostID)
	if not (hasKrepost) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingKrepost = GameInfo.Buildings[buildingKrepostID]
	instance.IconFrame:SetToolTipType("JFDKrepostTooltip")
	IconHookup(buildingKrepost.PortraitIndex, 64, buildingKrepost.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingKrepostExpansionID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingKrepost.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_KREPOST_CITY_VIEW_HELP", bonus)
	g_JFDKrepostTipControls.Heading:SetText(titleText)
	g_JFDKrepostTipControls.Body:SetText(helpText)
	g_JFDKrepostTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDKrepost()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDKrepost)

function SerialEventCityDirty_JFDKrepost()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDKrepost)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDKrepost)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDKrepost()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDKrepost)
--=======================================================================================================================
--=======================================================================================================================

-- JFD_EstateCityInfo
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

local civilisationID = GameInfoTypes["CIVILIZATION_JFD_POLAND_LITHUANIA"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
--------------------------------------------------------------
-- JFD_ReturnEstate
--------------------------------------------------------------
function JFD_ReturnEstate(city, buildingEstateID)
	if city:IsHasBuilding(buildingEstateID) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_EstateCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_EstateCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDEstate)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDEstate)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDEstate)
	
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
local buildingEstateID = GameInfoTypes["BUILDING_JFD_ESTATE"]
local buildingEstateHappinessID = GameInfoTypes["BUILDING_JFD_POLAND_LITHUANIA_HAPPINESS"]

isCityScreenOpen = false
g_JFDEstateTipControls = {}
TTManager:GetTypeControlTable("JFDEstateTooltip", g_JFDEstateTipControls)
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
	
	-- Ensure City has an Estate
	local hasEstate = JFD_ReturnEstate(city, buildingEstateID)
	if not (hasEstate) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingEstate = GameInfo.Buildings[buildingEstateID]
	instance.IconFrame:SetToolTipType("JFDEstateTooltip")
	IconHookup(buildingEstate.PortraitIndex, 64, buildingEstate.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingEstateHappinessID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingEstate.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_ESTATE_CITY_VIEW_HELP", bonus)
	g_JFDEstateTipControls.Heading:SetText(titleText)
	g_JFDEstateTipControls.Body:SetText(helpText)
	g_JFDEstateTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDEstate()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDEstate)

function SerialEventCityDirty_JFDEstate()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDEstate)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDEstate)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDEstate()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDEstate)
--=======================================================================================================================
--=======================================================================================================================

-- JFD_ThingsteadCityInfo
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

local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ICELAND"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
--------------------------------------------------------------
-- JFD_ReturnThingstead
--------------------------------------------------------------
function JFD_ReturnThingstead(city, buildingThingsteadID)
	if city:IsHasBuilding(buildingThingsteadID) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_ThingsteadCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_ThingsteadCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDThingstead)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDThingstead)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDThingstead)
	
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
local buildingThingsteadID = GameInfoTypes["BUILDING_JFD_THINGSTEAD"]
local buildingThingsteadHappinessID = GameInfoTypes["BUILDING_JFD_ICELAND_HAPPINESS"]

isCityScreenOpen = false
g_JFDThingsteadTipControls = {}
TTManager:GetTypeControlTable("JFDThingsteadTooltip", g_JFDThingsteadTipControls)
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
	
	-- Ensure City has a Thingstead
	local hasThingstead = JFD_ReturnThingstead(city, buildingThingsteadID)
	if not (hasThingstead) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingThingstead = GameInfo.Buildings[buildingThingsteadID]
	instance.IconFrame:SetToolTipType("JFDThingsteadTooltip")
	IconHookup(buildingThingstead.PortraitIndex, 64, buildingThingstead.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingThingsteadHappinessID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingThingstead.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_THINGSTEAD_CITY_VIEW_HELP")
	g_JFDThingsteadTipControls.Heading:SetText(titleText)
	g_JFDThingsteadTipControls.Body:SetText(helpText)
	g_JFDThingsteadTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDThingstead()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDThingstead)

function SerialEventCityDirty_JFDThingstead()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDThingstead)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDThingstead)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDThingstead()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDThingstead)
--=======================================================================================================================
--=======================================================================================================================

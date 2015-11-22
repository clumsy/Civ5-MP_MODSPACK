-- JFD_DragoonCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("IconSupport")
--------------------------------------------------------------
-- JFD_ReturnDragoonGarrison
--------------------------------------------------------------
function JFD_ReturnDragoonGarrison(city, unitDragoonID)
	if not (city:GetGarrisonedUnit()) then return false end
	local unit = city:GetGarrisonedUnit()
	if unit:GetUnitType() == unitDragoonID then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_DragoonCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_DragoonCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDDragoon)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDDragoon)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDDragoon)
	
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
local buildingTourism1ID = GameInfoTypes["BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM"]
local buildingTourism2ID = GameInfoTypes["BUILDING_JFD_AUSTRIAN_DRAGOON_TOURISM_2"]
local techRadioID = GameInfoTypes["TECH_RADIO"]
local unitDragoonID = GameInfoTypes["UNIT_AUSTRIAN_HUSSAR"]

isCityScreenOpen = false
g_JFDDragoonTipControls = {}
TTManager:GetTypeControlTable("JFDDragoonTooltip", g_JFDDragoonTipControls)
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
	
	-- Ensure the player has Radio
	local activePlayerTeam = Teams[Players[Game.GetActivePlayer()]:GetTeam()]
	if not (activePlayerTeam:IsHasTech(techRadioID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure City has a Dragoon garrisoned
	local dragoonGarrison = JFD_ReturnDragoonGarrison(city, unitDragoonID)
	if not (dragoonGarrison) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local unitDragoon = GameInfo.Units[unitDragoonID]
	instance.IconFrame:SetToolTipType("JFDDragoonTooltip")
	IconHookup(unitDragoon.PortraitIndex, 64, unitDragoon.IconAtlas, instance.IconImage)
	
	local bonus = (city:GetNumBuilding(buildingTourism1ID) *2)
	if bonus == 0 then bonus = (city:GetNumBuilding(buildingTourism2ID) *4) end
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_PROMOTION_JFD_CEREMONIAL_DRAGOONS")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_DRAGOON_CITY_VIEW_HELP", bonus)
	g_JFDDragoonTipControls.Heading:SetText(titleText)
	g_JFDDragoonTipControls.Body:SetText(helpText)
	g_JFDDragoonTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDDragoon()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDDragoon)

function SerialEventCityDirty_JFDDragoon()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDDragoon)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDDragoon)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDDragoon()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDDragoon)
--=======================================================================================================================
--=======================================================================================================================

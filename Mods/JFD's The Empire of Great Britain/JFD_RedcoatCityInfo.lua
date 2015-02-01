-- JFD_RedcoatCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
include("IconSupport")
include("JFD_GreatBritainUtilities")
--------------------------------------------------------------
-- JFD_ReturnRedcoatGarrison
--------------------------------------------------------------
function JFD_ReturnRedcoatGarrison(city, unitRedcoatID)
	if not (city:GetGarrisonedUnit()) then return false end
	local unit = city:GetGarrisonedUnit()
	if unit:GetUnitType() == unitRedcoatID then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_RedcoatCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_RedcoatCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDRedcoat)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDRedcoat)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDRedcoat)
	
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
local buildingRedcoatProductionID = GameInfoTypes["BUILDING_JFD_REDCOAT_PRODUCTION"]
local unitRedcoatID = GameInfoTypes["UNIT_JFD_REDCOAT"]

isCityScreenOpen = false
g_JFDRedcoatTipControls = {}
TTManager:GetTypeControlTable("JFDRedcoatTooltip", g_JFDRedcoatTipControls)
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
	
	-- Ensure City has a Redcoat garrisoned
	local redcoatGarrison = JFD_ReturnRedcoatGarrison(city, unitRedcoatID)
	if not (redcoatGarrison) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local unitRedcoat = GameInfo.Units[unitRedcoatID]
	instance.IconFrame:SetToolTipType("JFDRedcoatTooltip")
	IconHookup(unitRedcoat.PortraitIndex, 64, unitRedcoat.IconAtlas, instance.IconImage)
	
	local bonus = JFD_GetProductionPenalty(Game.GetActivePlayer())
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_JFD_REDCOAT_PRODUCTION")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_REDCOAT_CITY_VIEW_HELP", bonus)
	g_JFDRedcoatTipControls.Heading:SetText(titleText)
	g_JFDRedcoatTipControls.Body:SetText(helpText)
	g_JFDRedcoatTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDRedcoat()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDRedcoat)

function SerialEventCityDirty_JFDRedcoat()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDRedcoat)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDRedcoat)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDRedcoat()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDRedcoat)
--=======================================================================================================================
--=======================================================================================================================

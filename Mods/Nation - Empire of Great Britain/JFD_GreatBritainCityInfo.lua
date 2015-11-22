-- JFD_GreatBritainCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
include("IconSupport")
include("JFD_GreatBritainUtilities")
--------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_GREAT_BRITAIN"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_GreatBritainCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_GreatBritainCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDGreatBritain)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDGreatBritain)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDGreatBritain)
	
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
local processScienceID = GameInfoTypes["PROCESS_RESEARCH"]

isCityScreenOpen = false
g_JFDGreatBritainTipControls = {}
TTManager:GetTypeControlTable("JFDGreatBritainTooltip", g_JFDGreatBritainTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)

	if not(instance) then
		instance = Controls
	end

	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if not(city) or city ~= Players[Game.GetActivePlayer()]:GetCapitalCity() then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local processScience = GameInfo.Processes[processScienceID]
	instance.IconFrame:SetToolTipType("JFDGreatBritainTooltip")
	IconHookup(processScience.PortraitIndex, 64, processScience.IconAtlas, instance.IconImage)
	
	local bonus = JFD_GetProductionFromCities(Game.GetActivePlayer())
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_BRITAIN_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_GREAT_BRITAIN_CITY_VIEW_HELP", bonus)
	g_JFDGreatBritainTipControls.Heading:SetText(titleText)
	g_JFDGreatBritainTipControls.Body:SetText(helpText)
	g_JFDGreatBritainTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDGreatBritain()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDGreatBritain)

function SerialEventCityDirty_JFDGreatBritain()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDGreatBritain)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDGreatBritain)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDGreatBritain()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDGreatBritain)
--=======================================================================================================================
--=======================================================================================================================

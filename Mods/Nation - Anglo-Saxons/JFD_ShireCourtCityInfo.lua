-- JFD_ShireCourtCityInfo
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

local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ANGLO_SAXONS"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
--------------------------------------------------------------
-- JFD_ReturnShireCourt
--------------------------------------------------------------
function JFD_ReturnShireCourt(city, buildingShireCourtID)
	if city:IsHasBuilding(buildingShireCourtID) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_ShireCourtCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_ShireCourtCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDShireCourt)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDShireCourt)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDShireCourt)
	
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
local buildingShireCourtID = GameInfoTypes["BUILDING_JFD_SHIRE_COURT"]
local buildingShireCourtCultureID = GameInfoTypes["BUILDING_JFD_ANGLO_CULTURE"]

isCityScreenOpen = false
g_JFDShireCourtTipControls = {}
TTManager:GetTypeControlTable("JFDShireCourtTooltip", g_JFDShireCourtTipControls)
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
	if not(city) or city ~= activePlayer:GetCapitalCity() then
		instance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure City has a Shire Court
	local hasShireCourt = JFD_ReturnShireCourt(city, buildingShireCourtID)
	if not (hasShireCourt) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingShireCourt = GameInfo.Buildings[buildingShireCourtID]
	instance.IconFrame:SetToolTipType("JFDShireCourtTooltip")
	IconHookup(buildingShireCourt.PortraitIndex, 64, buildingShireCourt.IconAtlas, instance.IconImage)
	
	local bonus = (activePlayer:CountNumBuildings(buildingShireCourtID) *2)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingShireCourt.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_SHIRE_COURT_CITY_VIEW_HELP", bonus)
	g_JFDShireCourtTipControls.Heading:SetText(titleText)
	g_JFDShireCourtTipControls.Body:SetText(helpText)
	g_JFDShireCourtTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDShireCourt()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDShireCourt)

function SerialEventCityDirty_JFDShireCourt()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDShireCourt)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDShireCourt)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDShireCourt()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDShireCourt)
--=======================================================================================================================
--=======================================================================================================================

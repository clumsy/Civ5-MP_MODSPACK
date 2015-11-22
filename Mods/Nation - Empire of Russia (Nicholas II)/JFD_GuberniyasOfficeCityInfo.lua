-- JFD_GuberniyasOfficeCityInfo
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

local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NICHOLAS_RUSSIA"]
if not(JFD_IsCivilisationActive(civilisationID)) then return end
--------------------------------------------------------------
-- JFD_ReturnGuberniyasOffice
--------------------------------------------------------------
function JFD_ReturnGuberniyasOffice(city, buildingGuberniyasOfficeID)
	if city:IsHasBuilding(buildingGuberniyasOfficeID) then
		return true
	end

	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "JFD_GuberniyasOfficeCityInfo", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
	table.insert(tEventsToHook, Events.SpecificCityInfoDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "JFD_GuberniyasOfficeCityInfo" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_JFDGuberniyasOffice)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityDirty_JFDGuberniyasOffice)
	Events.SpecificCityInfoDirty.Remove(SerialEventCityDirty_JFDGuberniyasOffice)
	
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
local buildingGuberniyaID = GameInfoTypes["BUILDING_JFD_GUBERNIYA"]
local buildingGuberniyaGrowthID = GameInfoTypes["BUILDING_JFD_GUBERNIYA_GROWTH"]
local buildingGuberniyaProductionID = GameInfoTypes["BUILDING_JFD_GUBERNIYA_PRODUCTION"]

isCityScreenOpen = false
g_JFDGuberniyasOfficeTipControls = {}
TTManager:GetTypeControlTable("JFDGuberniyasOfficeTooltip", g_JFDGuberniyasOfficeTipControls)
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
	
	-- Ensure City has a GuberniyasOffice
	local hasGuberniyasOffice = JFD_ReturnGuberniyasOffice(city, buildingGuberniyaID)
	if not (hasGuberniyasOffice) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingGuberniyasOffice = GameInfo.Buildings[buildingGuberniyaID]
	instance.IconFrame:SetToolTipType("JFDGuberniyasOfficeTooltip")
	IconHookup(buildingGuberniyasOffice.PortraitIndex, 64, buildingGuberniyasOffice.IconAtlas, instance.IconImage)
	
	local bonus = (city:GetNumBuilding(buildingGuberniyaProductionID) * 5)
	local cityViewHelp = "TXT_KEY_JFD_GUBERNIYAS_OFFICE_PRODUCTION_CITY_VIEW_HELP"
	if city ~= Players[Game.GetActivePlayer()]:GetCapitalCity() then
		bonus = city:GetNumBuilding(buildingGuberniyaGrowthID)
		cityViewHelp = "TXT_KEY_JFD_GUBERNIYAS_OFFICE_GROWTH_CITY_VIEW_HELP"
	end

	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingGuberniyasOffice.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey(cityViewHelp, bonus)
	g_JFDGuberniyasOfficeTipControls.Heading:SetText(titleText)
	g_JFDGuberniyasOfficeTipControls.Body:SetText(helpText)
	g_JFDGuberniyasOfficeTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_JFDGuberniyasOffice()
	isCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_JFDGuberniyasOffice)

function SerialEventCityDirty_JFDGuberniyasOffice()
	if isCityScreenOpen then
		ProcessCityScreen()
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityDirty_JFDGuberniyasOffice)
Events.SpecificCityInfoDirty.Add(SerialEventCityDirty_JFDGuberniyasOffice)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_JFDGuberniyasOffice()
	isCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_JFDGuberniyasOffice)
--=======================================================================================================================
--=======================================================================================================================

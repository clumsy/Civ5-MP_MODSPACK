-- JFD_ItalyMussoliniCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
local activePlayer					= Players[Game.GetActivePlayer()]
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_ITALY"]
local isItalyMussoliniActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_ItalyMussoliniCityInfo", ["SortOrder"] = 1})
end

if isItalyMussoliniActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_ItalyMussoliniCityInfo" then return end
	ProcessCityScreen(instance)
end

if isItalyMussoliniActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingItalyID = GameInfoTypes["BUILDING_JFD_ITALIAN_PRODUCTION"]

g_JFDItalyMussoliniTipControls = {}
TTManager:GetTypeControlTable("JFDItalyMussoliniTooltip", g_JFDItalyMussoliniTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("JFDItalyMussoliniTooltip")
	IconHookup(0, 64, "JFD_ITALY_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingItalyID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_ITALY_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_ITALY_CITY_VIEW_HELP", bonus)
	g_JFDItalyMussoliniTipControls.Heading:SetText(titleText)
	g_JFDItalyMussoliniTipControls.Body:SetText(helpText)
	g_JFDItalyMussoliniTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

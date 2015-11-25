-- JFD_AnaktoraScienceCityInfo
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
local activePlayer			= Players[Game.GetActivePlayer()]
local civilisationID		= GameInfoTypes["CIVILIZATION_MC_MINOA"]
local isMinoaActivePlayer	= activePlayer:GetCivilizationType() == civilisationID
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_AnaktoraScienceCityInfo", ["SortOrder"] = 1})
end

if isMinoaActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_AnaktoraScienceCityInfo" then return end
	ProcessCityScreen(instance)
end

if isMinoaActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingAnaktoraID 		= GameInfoTypes["BUILDING_MC_MINOAN_ANAKTORA"]
local buildingAnaktoraScienceID = GameInfoTypes["BUILDING_MC_ANAKTORA_SCIENCE"]

g_JFDAnaktoraScienceTipControls = {}
TTManager:GetTypeControlTable("JFDAnaktoraScienceTooltip", g_JFDAnaktoraScienceTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure City has an Anaktora
	if (not city:IsHasBuilding(buildingAnaktoraID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingAnaktora = GameInfo.Buildings[buildingAnaktoraID]
	instance.IconFrame:SetToolTipType("JFDAnaktoraScienceTooltip")
	IconHookup(buildingAnaktora.PortraitIndex, 64, buildingAnaktora.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingAnaktoraScienceID)*2
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingAnaktora.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_MC_ANAKTORA_SCIENCE_CITY_VIEW_HELP", bonus)
	g_JFDAnaktoraScienceTipControls.Heading:SetText(titleText)
	g_JFDAnaktoraScienceTipControls.Body:SetText(helpText)
	g_JFDAnaktoraScienceTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

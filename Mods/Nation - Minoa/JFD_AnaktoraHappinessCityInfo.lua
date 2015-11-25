-- JFD_AnaktoraHappinessCityInfo
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
   table.insert(tCityInfoAddins, {["Key"] = "JFD_AnaktoraHappinessCityInfo", ["SortOrder"] = 1})
end

if isMinoaActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_AnaktoraHappinessCityInfo" then return end
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
local buildingAnaktoraID 			= GameInfoTypes["BUILDING_MC_MINOAN_ANAKTORA"]
local buildingAnaktoraHappinessID 	= GameInfoTypes["BUILDING_MC_ANAKTORA_HAPPINESS"]

g_JFDAnaktoraHappinessTipControls = {}
TTManager:GetTypeControlTable("JFDAnaktoraHappinessTooltip", g_JFDAnaktoraHappinessTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	print("process city screen")
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
	instance.IconFrame:SetToolTipType("JFDAnaktoraHappinessTooltip")
	IconHookup(buildingAnaktora.PortraitIndex, 64, buildingAnaktora.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingAnaktoraHappinessID)*2
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingAnaktora.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_MC_ANAKTORA_HAPPINESS_CITY_VIEW_HELP", bonus)
	g_JFDAnaktoraHappinessTipControls.Heading:SetText(titleText)
	g_JFDAnaktoraHappinessTipControls.Body:SetText(helpText)
	g_JFDAnaktoraHappinessTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

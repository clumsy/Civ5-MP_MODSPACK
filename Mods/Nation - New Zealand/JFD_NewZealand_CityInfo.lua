-- JFD_NewZealandCityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_GetCityTradeRouteList
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetCityTradeRouteList(playerID)
	local player = Players[playerID]
	local numTradeRoutes = 0 
	local tradeRoutes = player:GetTradeRoutes()
	local traderouteListText = "[NEWLINE]"
	for _, tradeRoute in ipairs(tradeRoutes) do
		local originatingCity = tradeRoute.FromCity
		local targetCity = tradeRoute.ToCity
		if (tradeRoute.FromCivilizationType ~= tradeRoute.ToCivilizationType) then
			traderouteListText = traderouteListText .. "[ICON_BULLET]+10% [ICON_FOOD] stored after growth from [ICON_INTERNATIONAL_TRADE] with " .. targetCity:GetName() .. "[NEWLINE]"
			numTradeRoutes = numTradeRoutes + 1
			if numTradeRoutes >= 3 then
				break
			end
		end
	end
	
	return traderouteListText
end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID	= Game.GetActivePlayer()
local activeTeamID		= Game.GetActiveTeam()
local activePlayer		= Players[activePlayerID]
local activeTeam		= Teams[activeTeamID]
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_NEW_ZEALAND"]
local isCivActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_NewZealandCityInfo", ["SortOrder"] = 1})
end

if isCivActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_NewZealandCityInfo" then return end
	ProcessCityScreen(instance)
end

if isCivActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingNewZealandGrowthID = GameInfoTypes["BUILDING_JFD_NEW_ZEALAND_GROWTH"]

g_JFDNewZealandTipControls = {}
TTManager:GetTypeControlTable("JFDNewZealandTooltip", g_JFDNewZealandTipControls)
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
	
	print("city screen")
	instance.IconFrame:SetToolTipType("JFDNewZealandTooltip")
	IconHookup(0, 64, "JFD_NEW_ZEALAND_ATLAS", instance.IconImage)
	
	local growthBonus = (city:GetNumBuilding(buildingNewZealandGrowthID) * 10)
	local tradeBonus = 0
	local tradeList = JFD_GetCityTradeRouteList(activePlayerID)
	if activeTeam:GetDefensivePactCount() > 0 then
		tradeBonus = 2
	end
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_NEW_ZEALAND_CITY_VIEW_HELP", tradeBonus, tradeList, growthBonus)

	if growthBonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_NEW_ZEALAND_SHORT")) .. "[ENDCOLOR]"
	g_JFDNewZealandTipControls.Heading:SetText(titleText)
	g_JFDNewZealandTipControls.Body:SetText(helpText)
	g_JFDNewZealandTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

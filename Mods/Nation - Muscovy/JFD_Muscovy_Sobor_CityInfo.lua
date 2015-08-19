-- JFD_Muscovy_Sobor_CityInfo
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
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_MUSCOVY"]
local isMuscovyActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_SoborCityInfo", ["SortOrder"] = 1})
end

if isMuscovyActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_SoborCityInfo" then return end
	ProcessCityScreen(instance)
end

if isMuscovyActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingSoborID			= GameInfoTypes["BUILDING_JFD_SOBOR"]
local buildingSoborExpansionID	= GameInfoTypes["BUILDING_JFD_SOBOR_FAITH"]

g_JFDSoborTipControls = {}
TTManager:GetTypeControlTable("JFDSoborTooltip", g_JFDSoborTipControls)
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
	
	-- Ensure City has a Sobor's Office
	if (not city:IsHasBuilding(buildingSoborID)) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local buildingSobor = GameInfo.Buildings[buildingSoborID]
	instance.IconFrame:SetToolTipType("JFDSoborTooltip")
	IconHookup(buildingSobor.PortraitIndex, 64, buildingSobor.IconAtlas, instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingSoborExpansionID) 
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey(buildingSobor.Description)) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_SOBOR_CITY_VIEW_HELP", bonus)
	g_JFDSoborTipControls.Heading:SetText(titleText)
	g_JFDSoborTipControls.Body:SetText(helpText)
	g_JFDSoborTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

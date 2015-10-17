-- ChartresCathedral_Functions
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("IconSupport")

--=======================================================================================================================
-- Initial Defines
--=======================================================================================================================
local iWonder = GameInfoTypes.BUILDING_SAN_MARCO_BASILICA
local iDummy = GameInfoTypes.BUILDING_SAN_MARCO_BASILICA_DUMMY

local sTitle = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DESC")) .. "[ENDCOLOR]"
local sNoCulture = Locale.ConvertTextKey("TXT_KEY_WONDER_SAN_MARCO_BASILICA_NO_CULTURE_YIELDING_ROUTES")
local sInfo = Locale.ConvertTextKey("TXT_KEY_WONDER_SAN_MARCO_BASILICA_INFO")
local sSection = "[NEWLINE]----------------"

local iMod = 0.1

MW_SanMarco_Tooltip = {}
TTManager:GetTypeControlTable("MW_SanMarco_Tooltip", MW_SanMarco_Tooltip)
--=======================================================================================================================
-- Pedia Callback: Adapted from EUI
--=======================================================================================================================
CivilopediaControl = "/FrontEnd/MainMenu/Other/Civilopedia"
local getPedia

local function getPediaB(...)
	Events.SearchForPediaEntry(...)
end
local function getPediaA(...)
	UIManager:QueuePopup(LookUpControl(CivilopediaControl), PopupPriority.eUtmost)
	getPedia = getPediaB
	getPedia(...)
end

getPedia = CivilopediaControl and getPediaA
--=======================================================================================================================
-- Core Functions: St Mark's Basilica
--=======================================================================================================================
function GetTradeRoutesWithCity(pCity)

	local tCities = {}

	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]

	-- Your Trade Routes
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for iKey, tRoute in ipairs(tTradeRoutes) do
		-- To This City
		if (tRoute.ToCity == pCity) then
			tCities[tRoute.FromCity] = true
		-- From This City		
		elseif (tRoute.FromCity == pCity) then
			tCities[tRoute.ToCity] = true
		end
	end
	
	-- Trade Routes from Other Players
	local tTradeRoutes = pPlayer:GetTradeRoutesToYou()
	for iKey, tRoute in ipairs(tTradeRoutes) do
		if (tRoute.ToCity == pCity) then
			local pFromCity = tRoute.FromCity
			tCities[pFromCity] = true
		end
	end	
	
	return tCities
end

function GetCultureFromCities(tCities)
	local iCulture = 0
	for pCity, _ in pairs(tCities) do
		if pCity:GetJONSCulturePerTurn() > 0 then
			iCulture = iCulture + pCity:GetJONSCulturePerTurn() * iMod
		end
	end
	return math.ceil(iCulture)
end

function SetSanMarcoDummy(pCity)
	-- City has St Mark's Basilica
	if pCity:IsHasBuilding(iWonder) then
		local tCities = GetTradeRoutesWithCity(pCity)
		local iCulture = GetCultureFromCities(tCities)
		
		if pCity:GetNumRealBuilding(iDummy) ~= iCulture then
			pCity:SetNumRealBuilding(iDummy, iCulture)
		end
		
	-- City has St Mark's Dummies but not St Mark's Basilica
	elseif pCity:IsHasBuilding(iDummy) then
		pCity:SetNumRealBuilding(iDummy, 0)
	end
end

function SerialEventGameDataDirty()
	local pPlayer = Players[Game.GetActivePlayer()]
	for	pCity in pPlayer:Cities() do
		SetSanMarcoDummy(pCity)
	end
end
Events.SerialEventGameDataDirty.Add(SerialEventGameDataDirty)

function PlayerDoTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	for	pCity in pPlayer:Cities() do
		SetSanMarcoDummy(pCity)
	end
end
GameEvents.PlayerDoTurn.Add(PlayerDoTurn)
--=======================================================================================================================
-- UI Functions: St Mark's Basilica
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "MW_SanMarco", ["SortOrder"] = 2})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(sKey, pInstance)
	if sKey ~= "MW_SanMarco" then return end
	
	-- Ensure City Selected
	local pCity = UI.GetHeadSelectedCity()
	if not(pCity) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	
	-- Ensure City Has St Mark's Basilica
	if not(pCity:IsHasBuilding(iWonder)) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	
	SetSanMarcoDummy(pCity)
	
	local iCulture = 0
	local tCities = GetTradeRoutesWithCity(pCity)
	local sCitiesString = ""
	for pCity, _ in pairs(tCities) do
		local iCultureThisCity = pCity:GetJONSCulturePerTurn() * iMod
		if iCultureThisCity > 0 then
			iCulture = iCulture + iCultureThisCity
			sCitiesString = sCitiesString .. Locale.ConvertTextKey("TXT_KEY_WONDER_SAN_MARCO_BASILICA_PER_CITY", iCultureThisCity, pCity:GetName())
		end
	end
	local sCultureTotal = Locale.ConvertTextKey("TXT_KEY_WONDER_SAN_MARCO_BASILICA_TOTAL", math.ceil(iCulture), iCulture)
	if sCitiesString == "" then
		sCitiesString = sNoCulture
	end
	
	IconHookup(0, 64, "CORE_DECISIONS_ATLAS", pInstance.IconImage)
	pInstance.IconFrame:RegisterCallback(Mouse.eRClick, function() getPedia("TXT_KEY_BUILDING_SAN_MARCO_BASILICA_DESC") end)
	pInstance.IconFrame:SetToolTipType("MW_SanMarco_Tooltip")
	
	local sBody = sInfo .. sSection .. sCitiesString .. sSection .. sCultureTotal
	
	MW_SanMarco_Tooltip.Heading:SetText(sTitle)
	MW_SanMarco_Tooltip.Body:SetText(sBody)
	MW_SanMarco_Tooltip.Box:DoAutoSize()
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
--=======================================================================================================================
--=======================================================================================================================
-- Modular City Info Stack
-- Author: Sukritact
--=======================================================================================================================

print("loaded")
include("IconSupport")

--=======================================================================================================================
-- Utility Functions	
--=======================================================================================================================
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
local iCiv = GameInfoTypes.CIVILIZATION_NORTE_CHICO_MOD;
local bCaralCheck = GameInfoTypes.BUILDING_NORTE_CHICO_COAST_CHECK;

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

if not(JFD_IsCivilisationActive(iCiv)) then return end
--=======================================================================================================================
-- Initial Defines
--=======================================================================================================================
bCityScreenOpen = false
g_CaralTipControls = {}
TTManager:GetTypeControlTable("CaralTooltip", g_CaralTipControls)

local iFishingBoat = GameInfoTypes.IMPROVEMENT_FISHING_BOATS
local sFishingBoatAtlas = GameInfo.Improvements[iFishingBoat].IconAtlas
local iFishingBoatAtlas = GameInfo.Improvements[iFishingBoat].PortraitIndex

--
local iOffshorePlatform = GameInfoTypes.IMPROVEMENT_OFFSHORE_PLATFORM
--

local tDummy = {}
tDummy[GameInfoTypes.YIELD_PRODUCTION]	=	GameInfoTypes.BUILDING_CARAL_DUMMY_PROD
tDummy[GameInfoTypes.YIELD_FOOD]		=	GameInfoTypes.BUILDING_CARAL_DUMMY_FOOD
tDummy[GameInfoTypes.YIELD_GOLD]		=	GameInfoTypes.BUILDING_CARAL_DUMMY_GOLD
tDummy[GameInfoTypes.YIELD_CULTURE]		=	GameInfoTypes.BUILDING_CARAL_DUMMY_CULT
tDummy[GameInfoTypes.YIELD_SCIENCE]		=	GameInfoTypes.BUILDING_CARAL_DUMMY_SCIE
tDummy[GameInfoTypes.YIELD_FAITH]		=	GameInfoTypes.BUILDING_CARAL_DUMMY_FAIT

local sSection = "[NEWLINE]----------------"

-- Retrieve all Maritime Resources
local tValidResources = {}
for tRow in GameInfo.Improvement_ResourceTypes() do
	--if tRow.ImprovementType == "IMPROVEMENT_FISHING_BOATS" then
	--
	if (tRow.ImprovementType == "IMPROVEMENT_FISHING_BOATS") or (tRow.ImprovementType == "IMPROVEMENT_OFFSHORE_PLATFORM") then
	--
		tValidResources[GameInfoTypes[tRow.ResourceType]] = {}
	end
end

-- Retrieve Font Icons & Yields
for iResource, tTable in pairs(tValidResources) do
	local tResource = GameInfo.Resources[iResource]
	tTable.Yields = {}
	
	local sCondition = "ResourceType = '" .. tResource.Type .. "'"
	local bFirst = true
	local sYieldString = ""
	for tRow in GameInfo.Resource_YieldChanges(sCondition) do
		if tRow.Yield > 0 then
			if bFirst then 
				bFirst = false
				sYieldString = sYieldString.."+"
			else
				sYieldString = sYieldString..", +"
			end
			
			tTable.Yields[GameInfoTypes[tRow.YieldType]] = tRow.Yield
			
			--Handle Fish as a special case
			if tResource.Type == "RESOURCE_FISH" and tRow.YieldType == "YIELD_FOOD" then
				tTable.Yields[GameInfoTypes[tRow.YieldType]] = tTable.Yields[GameInfoTypes[tRow.YieldType]] + 1
			end

		end
		sYieldString = sYieldString .. tostring(tTable.Yields[GameInfoTypes[tRow.YieldType]]) .. GameInfo.Yields[tRow.YieldType].IconString
	end
	
	tTable.String = tResource.IconString .. " " .. Locale.ConvertTextKey(tResource.Description) .. " (" .. sYieldString .. ")"
	print(tTable.String)
end
	
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
-------------------------------------------------------------------------------------------------------------------------
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "Tomatekh_Caral", ["SortOrder"] = 1})

	table.insert(tEventsToHook, Events.SerialEventCityHexHighlightDirty)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(sKey, pInstance)
	if sKey ~= "Tomatekh_Caral" then return end
	
	Events.SerialEventEnterCityScreen.Remove(EventEnterCityScreen_Caral)
	Events.SerialEventCityHexHighlightDirty.Remove(SerialEventCityHexHighlightDirty_Caral)
	
	Controls.IconFrame:SetHide(true)
	
	local iPlayer = Game.GetActivePlayer()
	ProcessCaral(iPlayer)	
	ProcessCityScreen(pInstance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
--=======================================================================================================================
-- Core Functions: Caral UA
--=======================================================================================================================
-- GetWorkedMaritime
-------------------------------------------------------------------------------------------------------------------------
function GetWorkedMaritime(pCity)

	local tResources = {}
	for iResource, tTable in pairs(tValidResources) do
		tResources[iResource] = 0
	end	
	
	local iNum = 0
	
	for iPlot = 0, pCity:GetNumCityPlots() - 1, 1 do
		local pAdjacentPlot = pCity:GetCityIndexPlot(iPlot)
		--if (pAdjacentPlot:GetImprovementType() == iFishingBoat) and pCity:IsWorkingPlot(pAdjacentPlot) then	
		--		
		if pAdjacentPlot ~= -1 then		
			if (pAdjacentPlot:GetImprovementType() == iFishingBoat) or (pAdjacentPlot:GetImprovementType() == iOffshorePlatform) then
				if pCity:IsWorkingPlot(pAdjacentPlot) then
			--
					local iResource = pAdjacentPlot:GetResourceType()
					if tValidResources[iResource] then
						iNum = iNum + 1
						tResources[iResource] = tResources[iResource] + 1
					end
				end
			--
			end
		end
		--
	end
	
	for iResource, tTable in pairs(tValidResources) do
		if tResources[iResource] < 1 then tResources[iResource] = nil end
	end	
	if iNum < 1 then return end
	
	return tResources
end
-------------------------------------------------------------------------------------------------------------------------
-- GetTradeRoutesTo
-------------------------------------------------------------------------------------------------------------------------
function GetTradeRouteCoastalResources(pCity)

	local tCities = {}

	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]
	
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for iKey, tRoute in ipairs(tTradeRoutes) do
		if (tRoute.ToCity == pCity) and (tRoute.FromID == iPlayer) and (tRoute.FromID == tRoute.ToID) then
			local pFromCity = tRoute.FromCity
			if pFromCity:IsHasBuilding(bCaralCheck) then
				tCities[pFromCity] = GetWorkedMaritime(pFromCity)
			end
		end
	end	

	local tiTradeRoutes = pPlayer:GetTradeRoutesToYou()
	for iKey, tRoute in ipairs(tiTradeRoutes) do
		if (tRoute.ToCity == pCity) and (tRoute.ToID == iPlayer) and (tRoute.FromID ~= tRoute.ToID) then
			local pFromCity = tRoute.FromCity
			if pFromCity:IsCoastal() then
				tCities[pFromCity] = GetWorkedMaritime(pFromCity)
			end
		end
	end	

	return tCities
end
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(pInstance)

	if not(pInstance) then
		pInstance = Controls
	end
	
	local pCity = UI.GetHeadSelectedCity()
	if not(pCity) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	
	-- Don't show if player isn't Caral
	local pPlayer = Players[pCity:GetOwner()]
	if (pPlayer:GetCivilizationType() ~= iCiv) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	
	-- Don't show in Coastal Cities
	if pCity:IsHasBuilding(bCaralCheck) then
		pInstance.IconFrame:SetHide(true)
		return
	end
	
	pInstance.IconFrame:SetToolTipType("CaralTooltip")
	
	local sTitle = Locale.ConvertTextKey("TXT_KEY_CARAL_UA_INTRO")
	
	-- Get Cities & Resources
	local tCities = GetTradeRouteCoastalResources(pCity)
	
	local tTotalYields = {}
	for tYield in GameInfo.Yields() do
		tTotalYields[tYield.ID] = 0
	end
	
	local sCitiesString = ""
	local iNumRoutes = 0
	
	for pFromCity, tResources in pairs(tCities) do
		sCitiesString = sCitiesString .. "[NEWLINE]" 
		sCitiesString = sCitiesString .. pFromCity:GetName() .. ":"
		iNumRoutes = iNumRoutes + 1
		for iResource, iNumResource in pairs(tResources) do
			sCitiesString = sCitiesString .. "[NEWLINE][ICON_BULLET] " .. iNumResource .. " " .. tValidResources[iResource].String
			for iYieldType, iYield in pairs(tValidResources[iResource].Yields) do
				tTotalYields[iYieldType] = tTotalYields[iYieldType] + (iYield * iNumResource)
			end
		end
	end

	--
	if iNumRoutes == 0 then
		sDesc = Locale.ConvertTextKey("TXT_KEY_CARAL_UA_DESCRIPTION_NEGATIVE", pCity:GetName(), iNumRoutes)
	elseif iNumRoutes >= 1 then
	--

		sDesc = Locale.ConvertTextKey("TXT_KEY_CARAL_UA_DESCRIPTION", pCity:GetName(), iNumRoutes)

	--
	end
	--
	
	local sYieldString = ""
	
	if sCitiesString == "" then

		sCitiesString = Locale.ConvertTextKey("TXT_KEY_CARAL_UA_NO_IMPORTS")

	else
		sYieldString = sSection .. "[NEWLINE][COLOR_POSITIVE_TEXT]"
		local bFirst = true
		for tYield in GameInfo.Yields() do
		
			if tTotalYields[tYield.ID] > 0 then
				if bFirst then 
					bFirst = false
					sYieldString = sYieldString.."+" .. tTotalYields[tYield.ID] .. tYield.IconString
				else
					sYieldString = sYieldString..", +" .. tTotalYields[tYield.ID] .. tYield.IconString
				end
			end		
		end
	end
	
	--
	if iNumRoutes == 0 then
		sTooltip = sDesc .. sSection .. sCitiesString .. sYieldString .. "[ENDCOLOR]"
	elseif iNumRoutes >= 1 then
	--

		sTooltip = sDesc .. sSection .. sCitiesString .. sYieldString .. " Total[ENDCOLOR]"

	--
	end
	--
	
	IconHookup(iFishingBoatAtlas, 64, sFishingBoatAtlas, pInstance.IconImage)
	IconHookup(iFishingBoatAtlas, 64, sFishingBoatAtlas, g_CaralTipControls.Icon)
	g_CaralTipControls.Heading:SetText(string.upper(sTitle))
	g_CaralTipControls.Body:SetText(sTooltip)
	g_CaralTipControls.Box:DoAutoSize()
	pInstance.IconFrame:SetHide(false)
end

function EventEnterCityScreen_Caral()
	bCityScreenOpen = true
	ProcessCityScreen()
end
Events.SerialEventEnterCityScreen.Add(EventEnterCityScreen_Caral)

function SerialEventCityHexHighlightDirty_Caral()
	if bCityScreenOpen then
		ProcessCityScreen()
		local iPlayer = Game.GetActivePlayer()
		ProcessCaral(iPlayer)
	end
end
Events.SerialEventCityHexHighlightDirty.Add(SerialEventCityHexHighlightDirty_Caral)
-------------------------------------------------------------------------------------------------------------------------
-- EventExitCityScreen
-------------------------------------------------------------------------------------------------------------------------
function EventExitCityScreen_Caral()
	bCityScreenOpen = false
	Controls.IconFrame:SetHide(true)
end
Events.SerialEventExitCityScreen.Add(EventExitCityScreen_Caral)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCaral
-------------------------------------------------------------------------------------------------------------------------
function ProcessCaral(iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() ~= iCiv) then return end
	
	for pCity in pPlayer:Cities() do
	
		if not(pCity:IsHasBuilding(bCaralCheck)) then
			local tCities = GetTradeRouteCoastalResources(pCity)
			
			-- Get Total Yields for City
			local tTotalYields = {}
			for tYield in GameInfo.Yields() do
				tTotalYields[tYield.ID] = 0
			end
			for pFromCity, tResources in pairs(tCities) do
				for iResource, iNumResource in pairs(tResources) do
					for iYieldType, iYield in pairs(tValidResources[iResource].Yields) do
						tTotalYields[iYieldType] = tTotalYields[iYieldType] + (iYield * iNumResource)
					end
				end
			end
			
			--Add/Remove Dummy Buildings
			for iYieldType, iYield in pairs(tTotalYields) do
				if tDummy[iYieldType] then pCity:SetNumRealBuilding(tDummy[iYieldType], iYield) end
			end
		end
		
	end
end

function ProcessCaralTradeTrigger()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		ProcessCaral(iPlayer)
	end
end
Events.SerialEventGameDataDirty.Add(ProcessCaralTradeTrigger)
GameEvents.PlayerDoTurn.Add(ProcessCaral)
--=======================================================================================================================
--=======================================================================================================================
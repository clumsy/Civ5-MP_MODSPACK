-- Peter I's Serbia
-- Author: DJSHenninger
-- DateCreated: 7/31/2015 2:26:13 PM
--------------------------------------------------------------
-- Globals
--------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function JFD_IsCivilisationActive(civilisationPeterISerbiaID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationPeterISerbiaID then
				return true
			end
		end
	end

	return false
end

local civilisationPeterISerbiaID = GameInfoTypes["CIVILIZATION_DJSH_SERBIA_PETER_I"]
local isDJSHPeterISerbiaCivActive = JFD_IsCivilisationActive(civilisationPeterISerbiaID)

include("FLuaVector.lua")
include("PlotIterators")
--------------------------------------------------------------
-- Happiness Boost after adopting Policy
--------------------------------------------------------------
function DJSH_PeterISerbiaHappiness(playerID, policyID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationPeterISerbiaID then
		if (policyID ~= nil) then
			local capCity = player:GetCapitalCity()
			local capPop = math.floor(capCity:GetPopulation() * 0.75)
			capCity:SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS"], capPop)
			capCity:SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS_COUNT"], 10)
		end
	end
end

function DJSH_PeterISerbiaHappinessCount(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationPeterISerbiaID then
		if player:GetCapitalCity():GetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS_COUNT"]) > 0 then
			local numHappiness = player:GetCapitalCity():GetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS_COUNT"])
			local happinessChange = math.floor(numHappiness - 1)
			player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS_COUNT"], happinessChange)
	else
			player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS"], 0)
		end
	end
end

function DJSH_PeterISerbiaHappinessMessage(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationPeterISerbiaID then
		if player:GetCapitalCity():GetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS_COUNT"]) > 0 then
			local numHappinessTurns = player:GetCapitalCity():GetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS_COUNT"])
			local numHappiness = player:GetCapitalCity():GetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_HAPPINESS"])
			local happinessChange = math.floor(numHappiness - 1)
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("+".. numHappiness  .." [ICON_HAPPINESS_1] Happiness for ".. numHappinessTurns .." Turn(s).", numHappiness))
			end
		end
	end
end

if isDJSHPeterISerbiaCivActive then
	GameEvents.PlayerAdoptPolicy.Add(DJSH_PeterISerbiaHappiness)
	GameEvents.PlayerDoTurn.Add(DJSH_PeterISerbiaHappinessCount)
	GameEvents.PlayerDoTurn.Add(DJSH_PeterISerbiaHappinessMessage)
end
--------------------------------------------------------------
-- Culture Boost if City is growing
--------------------------------------------------------------
function DJSH_PeterISerbiaCultureGrowth(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationPeterISerbiaID then
		for city in player:Cities() do
			local foodSurplus = city:FoodDifference()
			if foodSurplus > 0 then
				local culturePercent = math.floor(foodSurplus * 0.15)
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_DJSH_SERBIA_PETER_I_CULTURE"], culturePercent)
			end
		end
	end
end

if isDJSHPeterISerbiaCivActive then
	GameEvents.PlayerDoTurn.Add(DJSH_PeterISerbiaCultureGrowth)
end
--------------------------------------------------------------
-- Food Boost from Pijacas
--------------------------------------------------------------
function DJSH_PeterISerbiaPijacaCheck(playerID, city, plot)
	local player = Players[playerID]
	local BonusResource = false
	for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
		if plot:GetOwner() == city:GetOwner() then
			if (plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_DJSH_PIJACA"]) then
				if city:IsWorkingPlot(plot) then
					for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
						if (adjacentPlot:GetResourceType() == GameInfoTypes["RESOURCE_WHEAT"]) or (adjacentPlot:GetResourceType() == GameInfoTypes["RESOURCE_COW"]) or (adjacentPlot:GetResourceType() == GameInfoTypes["RESOURCE_SHEEP"]) or (adjacentPlot:GetResourceType() == GameInfoTypes["RESOURCE_FISH"]) or (adjacentPlot:GetResourceType() == GameInfoTypes["RESOURCE_BISON"]) or (adjacentPlot:GetResourceType() == GameInfoTypes["RESOURCE_DEER"]) or (adjacentPlot:GetResourceType() == GameInfoTypes["RESOURCE_BANANA"]) then
							BonusResource = true
						end
					end
				end
			end
		end
	end

	return BonusResource
end

function  DJSH_PeterISerbiaGrowthPijaca(playerID)
	local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilisationPeterISerbiaID then
		for city in player:Cities() do
			for cityPlot = 0, city:GetNumCityPlots() - 1, 1 do
				local plot = city:GetCityIndexPlot(cityPlot)
				if plot:GetOwner() == city:GetOwner() then
					if (plot:GetImprovementType() == GameInfoTypes["IMPROVEMENT_DJSH_PIJACA"]) then
						if city:IsWorkingPlot(plot) then
							if JFD_GetRandom(1,100) <= 15 then
								if (DJSH_PeterISerbiaPijacaCheck(playerID, city, plot) == true) then
									local foodBoost = math.floor(city:GetPopulation() * 2)
									city:ChangeFood(foodBoost)
									Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), "[COLOR_POSITIVE_TEXT]+".. foodBoost .." [ICON_FOOD][ENDCOLOR]", foodBoost)
								end
							end
						end
					end
				end
			end
		end
	end
end
								
if isDJSHPeterISerbiaCivActive then
	GameEvents.PlayerDoTurn.Add(DJSH_PeterISerbiaGrowthPijaca)
end		
--------------------------------------------------------------
-- Iron Regiment Functions
--------------------------------------------------------------			
function DJSH_PeterISerbiaGvozdeniPukHeal(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_DJSH_GVOZDENI_PUK"]) then
			if unit:IsEnemyInMovementRange() then
				local healAmount = math.floor(unit:GetExperience() / 7)
				unit:ChangeDamage(-healAmount)
			end
		end
	end
end

function DJSH_PeterISerbiaGvozdeniPukExp(playerID, unitID)
    local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:IsHasPromotion(GameInfoTypes["PROMOTION_DJSH_GVOZDENI_PUK"]) then
		local expBoost = math.min(player:GetTotalPopulation() * 0.40)
		unit:ChangeExperience(expBoost)
    end
end

if isDJSHPeterISerbiaCivActive then
	GameEvents.PlayerDoTurn.Add(DJSH_PeterISerbiaGvozdeniPukHeal)
	Events.SerialEventUnitCreated.Add(DJSH_PeterISerbiaGvozdeniPukExp)
end		
-- Tomatekh

print ("Sumer Scripts")

local isBNW = (GameInfoTypes.UNITCOMBAT_SUBMARINE ~= nil)

-- Pop
GameEvents.PlayerCityFounded.Add(
function(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	local pPlot = Map.GetPlot(iCityX, iCityY);
	local pCity = pPlot:GetPlotCity();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then
			if not isBNW then
				if ((Teams[pTeam]:GetCurrentEra()) >= 2) then
					pCity:ChangePopulation(2, true);
				else
					pCity:ChangePopulation(1, true);
				end
			elseif isBNW then
				local pPlot = pCity:Plot();
				if pPlot:IsRiver() then
					pCity:ChangePopulation(2, true);
				elseif not pPlot:IsRiver() then
					pCity:ChangePopulation(1, true);
				end
			end
		end
	end
end)

-- Vulture
local pVultureXPScript = GameInfoTypes.PROMOTION_MOD_XP_BONUS;
local uVulture = GameInfoTypes.UNIT_AKKADIAN_MOD_VULTURE;

function VultureTrainedBonus(playerID, cityID, unitID)
	local pPlayer = Players[playerID];
	if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if (pUnit:GetUnitType() == uVulture) then
			local BaseXP = pUnit:GetExperience()
			local VultureXP = BaseXP + 10
			pUnit:SetExperience(VultureXP);
		end
	end
end
GameEvents.CityTrained.Add(VultureTrainedBonus)

function VultureStartingBonus (arg0, currPlayer)
	for i, pPlayer in pairs(Players) do
		if pPlayer:IsEverAlive() then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then
				for pUnit in pPlayer:Units() do
					if (pUnit:GetUnitType() == uVulture) then
						local BaseXP = pUnit:GetExperience()
						if BaseXP == 0 then
							local VultureXP = BaseXP + 10
							pUnit:SetExperience(VultureXP);
						end
					end
				end
			end
		end
	end
end
Events.LoadScreenClose.Add(VultureStartingBonus)

-- Ziggurat Faith
local tSpecialists = {}
for tSpecialist in GameInfo.Specialists() do
	if tSpecialist.ID ~= GameInfoTypes.SPECIALIST_CITIZEN then
		table.insert(tSpecialists, tSpecialist.ID)
	end
end

local bZiggurat = GameInfoTypes.BUILDING_AKKADIAN_MOD_ZIGGURAT
local bSumer = GameInfoTypes.BUILDING_SUMER_DUMMY

function ResetSpecialists(pCity)
	pCity:SetNumRealBuilding(bSumer, 0)
	if (pCity:GetNumBuilding(bZiggurat) > 0) then
		local cSpecialists = 0
		for iKey, iSpecialist in ipairs(tSpecialists) do
			print(GameInfo.Specialists[iKey].Description, pCity:GetSpecialistCount(iSpecialist))
			cSpecialists = cSpecialists + pCity:GetSpecialistCount(iSpecialist)
		end
		pCity:SetNumRealBuilding(bSumer, cSpecialists);
	end
end

function PlayerDoTurn_ResetSpecialists(iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then return end
	for pCity in pPlayer:Cities() do
		ResetSpecialists(pCity)
	end
end
if isBNW then GameEvents.PlayerDoTurn.Add(PlayerDoTurn_ResetSpecialists) end

local iSpecialistUpdateType = CityUpdateTypes.CITY_UPDATE_TYPE_SPECIALISTS
function SpecificCityInfoDirty_ResetSpecialists(iPlayer, iCity, iUpdateType)

	if iUpdateType ~= iSpecialistUpdateType then return end

	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if not(pPlayer:IsTurnActive()) then	return end
	
	if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then return end
	
	local pCity = pPlayer:GetCityByID(iCity)
	ResetSpecialists(pCity)
end
if isBNW then Events.SpecificCityInfoDirty.Add(SpecificCityInfoDirty_ResetSpecialists) end

-- Ziggurate Specialist Tooltip
local bZigguratDummy = GameInfoTypes.BUILDING_AKKADIAN_MOD_ZIGGURAT_DUMMY

function RemoveZigguratDisplay()
    local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer] 
    if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then
				for pCity in pPlayer:Cities() do
					if (pCity:GetNumBuilding(bZigguratDummy) > 0) then
						pCity:SetNumRealBuilding(bZigguratDummy, 0);
					end
				end
			end
		end
	end
end
if isBNW then Events.SerialEventExitCityScreen.Add(RemoveZigguratDisplay) end

function AddZigguratDisplay()
	local pCity = UI.GetHeadSelectedCity();
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
    if (pPlayer:IsAlive()) then
		if (pPlayer:IsHuman()) then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then
				if (pCity ~= nil) then
					if (pCity:GetNumBuilding(bZigguratDummy) > 0) then
						pCity:SetNumRealBuilding(bZigguratDummy, 0);
					end
					if (pCity:GetNumBuilding(bZiggurat) > 0) then
						pCity:SetNumRealBuilding(bZigguratDummy, 1);
					end
				end
			end
		end
	end
end
if isBNW then Events.SerialEventEnterCityScreen.Add(AddZigguratDisplay) end
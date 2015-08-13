--Tomatekh

print("Kongo Decisions")

local tArchery = GameInfoTypes.TECH_ARCHERY;
local tConstruction = GameInfoTypes.TECH_CONSTRUCTION;
local tMachinery = GameInfoTypes.TECH_MACHINERY;
local tEconomics = GameInfoTypes.TECH_ECONOMICS;
local bRaffia = GameInfoTypes.BUILDING_KONGO_MOD_RAFFIA_MILL;
local bRaffiaDummy = GameInfoTypes.BUILDING_KONGO_RAFFIA_DUMMY;
local bRaffiaClass = GameInfoTypes.BUILDINGCLASS_MINT;
local pWoodsman = GameInfoTypes.PROMOTION_WOODSMAN;
local cArcher = GameInfoTypes.UNITCOMBAT_ARCHER;

--Monetize Raffia

local Decisions_KongoRaffia = {}
	Decisions_KongoRaffia.Name = "TXT_KEY_DECISIONS_TOMATEKH_KONGO_RAFFIA"
	Decisions_KongoRaffia.Desc = "TXT_KEY_DECISIONS_TOMATEKH_KONGO_RAFFIA_DESC"
	HookDecisionCivilizationIcon(Decisions_KongoRaffia, "CIVILIZATION_KONGO_MOD")
	Decisions_KongoRaffia.Weight = nil
	Decisions_KongoRaffia.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_KONGO_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_KongoRaffia") == true then
			Decisions_KongoRaffia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KONGO_RAFFIA_ENACTED_DESC")
			return false, false, true
		end			

		local iCost = math.ceil(200 * iMod)
		Decisions_KongoRaffia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KONGO_RAFFIA_DESC", iCost)

		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		local pTeam = pPlayer:GetTeam();
		if not (Teams[pTeam]:IsHasTech(tEconomics)) then return true, false end	
		local cKongoMint = pPlayer:GetBuildingClassCount(bRaffiaClass)
		if cKongoMint <= 2 then return true, false end

		return true, true
	end
	)
	
	Decisions_KongoRaffia.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil(200) * iMod
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(bRaffia) then
				if not pCity:IsHasBuilding(bRaffiaDummy) then
					pCity:SetNumRealBuilding(bRaffiaDummy, 1);
				end
			end
		end

		save(pPlayer, "Decisions_KongoRaffia", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_KONGO_MOD"], "Decisions_KongoRaffia", Decisions_KongoRaffia)

--Slave Trade
--[[
local Decisions_KongoSlaveTrade = {}
	Decisions_KongoSlaveTrade.Name = "TXT_KEY_DECISIONS_TOMATEKH_KONGO_SLAVERY"
	Decisions_KongoSlaveTrade.Desc = "TXT_KEY_DECISIONS_TOMATEKH_KONGO_SLAVERY_DESC"
	HookDecisionCivilizationIcon(Decisions_KongoSlaveTrade, "CIVILIZATION_KONGO_MOD")
	Decisions_KongoSlaveTrade.Weight = nil
	Decisions_KongoSlaveTrade.CanFunc = (
	function(pPlayer)	
	
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_KONGO_MOD"]) then return false, false end

		local iEra = load(pPlayer, "Decisions_KongoSlaveTrade")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_KongoSlaveTrade", nil)
			else
				Decisions_KongoSlaveTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KONGO_SLAVERY_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_KongoSlaveTrade.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KONGO_SLAVERY_DESC")

		if pPlayer:GetCurrentEra() == GameInfoTypes["ERA_ANCIENT"] then return true, false end
		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_MODERN"] then return true, false end
		local popCheck = 0;
		for pCity in pPlayer:Cities() do
			if pCity:GetPopulation() >= 2 then
				popCheck = popCheck + 1;
				break
			end
		end
		if popCheck <= 0 then return true, false end
		local contCheck = 0;
		for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local mPlayer = Players[mPlayer];
			if mPlayer ~= pPlayer then
				if (mPlayer:IsAlive()) then	
					local pTeam = pPlayer:GetTeam();
					local mTeam = mPlayer:GetTeam();
					if Teams[pTeam]:IsHasMet(mTeam) then
						contCheck = contCheck + 1;
					end
				end
			end
		end
		if contCheck <= 1 then return true, false end					

		return true, true
	end
	)
	
	Decisions_KongoSlaveTrade.DoFunc = (
	function(pPlayer)

		local slaveGold = 0;
		for pCity in pPlayer:Cities() do
			if pCity:GetPopulation() >= 2 then
				pCity:ChangePopulation(-1, true);
				slaveGold = slaveGold + 1;
			end
		end
		local slaveAward = (50 * slaveGold);
		pPlayer:ChangeGold (slaveAward);

		local pcCity = pPlayer:GetCapitalCity();
		if slaveGold >= 4 then
			pcCity:ChangeResistanceTurns(4);
		elseif slaveGold < 4 then
			pcCity:ChangeResistanceTurns(slaveGold);
		end

		save(pPlayer, "Decisions_KongoSlaveTrade", pPlayer:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_KONGO_MOD"], "Decisions_KongoSlaveTrade", Decisions_KongoSlaveTrade)
--]]

--Kongo Archers

local Decisions_KongoArchers = {}
	Decisions_KongoArchers.Name = "TXT_KEY_DECISIONS_TOMATEKH_KONGO_ARCHERS"
	Decisions_KongoArchers.Desc = "TXT_KEY_DECISIONS_TOMATEKH_KONGO_ARCHERS_DESC"
	HookDecisionCivilizationIcon(Decisions_KongoArchers, "CIVILIZATION_KONGO_MOD")
	Decisions_KongoArchers.Weight = nil
	Decisions_KongoArchers.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_KONGO_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_KongoArchers") == true then
			Decisions_KongoArchers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KONGO_ARCHERS_ENACTED_DESC")
			return false, false, true
		end			

		local pTeam = pPlayer:GetTeam();
		local iCost = math.ceil(50 * iMod)
		Decisions_KongoArchers.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KONGO_ARCHERS_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_INDUSTRIAL"] then return true, false end
		if Teams[pTeam]:GetAtWarCount(true) == 0 then return true, false end
		if not (Teams[pTeam]:IsHasTech(tConstruction)) then return true, false end	

		return true, true
	end
	)
	
	Decisions_KongoArchers.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local iCost = math.ceil(50 * iMod)
        pPlayer:ChangeGold(-iCost);

		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitCombatType() == cArcher) then
				if not (pUnit:IsHasPromotion(pWoodsman)) then
					pUnit:SetHasPromotion(pWoodsman,true);
				end
			end
		end

		save(pPlayer, "Decisions_KongoArchers", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_KONGO_MOD"], "Decisions_KongoArchers", Decisions_KongoArchers)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KONGO_MOD) then
			if load(pPlayer, "Decisions_KongoArchers") == true then
				for pUnit in pPlayer:Units() do
					if (pUnit:GetUnitCombatType() == cArcher) then
						if not (pUnit:IsHasPromotion(pWoodsman)) then
							pUnit:SetHasPromotion(pWoodsman,true);
						end
					end
				end
			end
			if load(pPlayer, "Decisions_KongoRaffia") == true then
				for pCity in pPlayer:Cities() do
					if pCity:IsHasBuilding(bRaffiaDummy) then
						if not pCity:IsHasBuilding(bRaffia) then
							pCity:SetNumRealBuilding(bRaffiaDummy, 0);
						end
					end
					if pCity:IsHasBuilding(bRaffia) then
						if not pCity:IsHasBuilding(bRaffiaDummy) then
							pCity:SetNumRealBuilding(bRaffiaDummy, 1);
						end
					end
				end
			end
		end
	end
end)
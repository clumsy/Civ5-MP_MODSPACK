--Tomatekh

print("Mali Decisions")

local pHCS = GameInfoTypes.PROMOTION_MALI_HOLY_CITY_BONUS;
local uPROPHET = GameInfoTypes.UNITCLASS_PROPHET;
local bStoneWorks = GameInfoTypes.BUILDING_STONE_WORKS;

--Dogon

local Decisions_MaliArchitecture = {}
	Decisions_MaliArchitecture.Name = "TXT_KEY_DECISIONS_TOMATEKH_MALI_DOGON_ARCHITECTURE"
	Decisions_MaliArchitecture.Desc = "TXT_KEY_DECISIONS_TOMATEKH_MALI_DOGON_ARCHITECTURE_DESC"
	HookDecisionCivilizationIcon(Decisions_MaliArchitecture, "CIVILIZATION_MALI_MOD")
	Decisions_MaliArchitecture.Weight = nil
	Decisions_MaliArchitecture.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MALI_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_MaliArchitecture") == true then
			Decisions_MaliArchitecture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_MALI_DOGON_ARCHITECTURE_ENACTED_DESC")
			return false, false, true
		end		
	
		local iCost = math.ceil(50 * iMod)
		Decisions_MaliArchitecture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_MALI_DOGON_ARCHITECTURE_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetNumCities() < 2) then return true, false end		
		local checkHajj = 0;
		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitClassType() == uPROPHET) then
				if pUnit:IsHasPromotion(pHCS) then
					checkHajj = checkHajj + 1;
					break
				end
			end
		end
		if (pPlayer:IsHuman()) then
			if checkHajj <= 0 then return true, false end
		end
		return true, true
	end
	)
	
	Decisions_MaliArchitecture.DoFunc = (
	function(pPlayer)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_DOGON_ARCHITECTURE_MOD"], true)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		local iCost = math.ceil(50 * iMod)
		pPlayer:ChangeGold(-iCost);

		local pcCity = pPlayer:GetCapitalCity();
		if not (pcCity:IsHasBuilding(bStoneWorks)) then
			pcCity:SetNumRealBuilding(bStoneWorks, 1);
		elseif (pcCity:IsHasBuilding(bStoneWorks)) then
			for pCity in pPlayer:Cities() do
				if not (pCity:IsHasBuilding(bStoneWorks)) then
					pCity:SetNumRealBuilding(bStoneWorks, 1);
					break
				end
			end
		end

		save(pPlayer, "Decisions_MaliArchitecture", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MALI_MOD"], "Decisions_MaliArchitecture", Decisions_MaliArchitecture)

--Tax

local Decisions_MaliTax = {}
	Decisions_MaliTax.Name = "TXT_KEY_DECISIONS_TOMATEKH_MALI_TRADE_TAX"
	Decisions_MaliTax.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_MALI_TRADE_TAX_DESC")
	HookDecisionCivilizationIcon(Decisions_MaliTax, "CIVILIZATION_MALI_MOD")
	Decisions_MaliTax.Weight = nil
	Decisions_MaliTax.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MALI_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_MaliTax") == true then
			Decisions_MaliTax.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_MALI_TRADE_TAX_ENACTED_DESC")
			return false, false, true
		end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		local tradeCount = 0;
		local tradedata = pPlayer:GetTradeRoutesToYou();
		for i,v in ipairs(tradedata) do
			if Players[v.FromCity:GetOwner()] ~= pPlayer then
				tradeCount = tradeCount + 1;
			end
		end
		if tradeCount < 2 then return true, false end
		return true, true
	end
	)
	
	Decisions_MaliTax.DoFunc = (
	function(pPlayer)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_MALI_TAX_MOD"], true)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		save(pPlayer, "Decisions_MaliTax", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MALI_MOD"], "Decisions_MaliTax", Decisions_MaliTax)

local uCaravan = GameInfoTypes.UNIT_CARAVAN;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	local pTeam = pPlayer:GetTeam();
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MALI_MOD) then
			if load(pPlayer, "Decisions_MaliTax") == true then
				local EraCount = ((Teams[pTeam]:GetCurrentEra()) + 2);
				local MaliTax = 0;
				for mPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
					local mPlayer = Players[mPlayer];
					if (mPlayer:IsAlive()) then
						if mPlayer ~= pPlayer then
							for mUnit in mPlayer:Units() do			
								if mUnit:GetUnitType() == uCaravan then
									local uPlot = mUnit:GetPlot()
									if uPlot:GetOwner() ~= -1 then
										if (Players[uPlot:GetOwner()] == pPlayer) then
											pPlayer:ChangeGold(EraCount);
											MaliTax = MaliTax + EraCount;
										end
									end
								end
							end
						end
					end
				end
				if MaliTax > 0 then
					if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then	
						Events.GameplayAlertMessage("You have collected " .. MaliTax .. " [ICON_GOLD] Gold from taxing foreign Caravans!");
					end
				end
			end
		end
	end
end)
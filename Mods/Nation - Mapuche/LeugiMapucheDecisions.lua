print("Mapuche Decisions")

--Mapuche Raids

local Decisions_MapucheRaids = {}
	Decisions_MapucheRaids.Name = "TXT_KEY_DECISIONS_LEUGI_MAPUCHE_RAIDS"
	Decisions_MapucheRaids.Desc = "TXT_KEY_DECISIONS_LEUGI_MAPUCHE_RAIDS_DESC"
	HookDecisionCivilizationIcon(Decisions_MapucheRaids, "CIVILIZATION_MAPUCHE")
	Decisions_MapucheRaids.Weight = nil
	Decisions_MapucheRaids.CanFunc = (
	function(pPlayer)	
	
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MAPUCHE"]) then return false, false end

		local iEra = load(pPlayer, "Decisions_MapucheRaids")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_MapucheRaids", nil)
			else
				Decisions_MapucheRaids.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_MAPUCHE_RAIDS_ENACTED_DESC")
				return false, false, true
			end
		end

		local iCost = math.ceil((100) * iMod)
		Decisions_MapucheRaids.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_MAPUCHE_RAIDS_DESC", iCost)

		local pTeam = pPlayer:GetTeam();
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetFaith() < iCost) then return true, false end
		-- Easy war check wasn't firing in my test?
		--if Teams[pTeam]:GetAtWarCount(false) then return true, false end
		local isWar = 0;
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer ~= pPlayer then
				if (oPlayer:IsAlive()) then
					local oTeam = oPlayer:GetTeam();
					if Teams[pTeam]:IsAtWar(oTeam) then
						isWar = isWar + 1;
						break
					end
				end
			end
		end
		if isWar <= 0 then return true, false end
				
		return true, true
	end
	)
	
	local pMalonRaid = GameInfoTypes.PROMOTION_TOQUI;

	Decisions_MapucheRaids.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil((100) * iMod)
		pPlayer:ChangeFaith(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then 
				if not pUnit:IsHasPromotion(pMalonRaid) then
					pUnit:SetHasPromotion(pMalonRaid,true);
				end
			end
		end

		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_TOQUI, 1)

		save(pPlayer, "Decisions_MapucheRaids", pPlayer:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MAPUCHE"], "Decisions_MapucheRaids", Decisions_MapucheRaids)

--Maule Defense

local tChivalry = GameInfoTypes.TECH_CHIVALRY;
directions = {DirectionTypes.DIRECTION_NORTHEAST, DirectionTypes.DIRECTION_EAST, DirectionTypes.DIRECTION_SOUTHEAST,
              DirectionTypes.DIRECTION_SOUTHWEST, DirectionTypes.DIRECTION_WEST, DirectionTypes.DIRECTION_NORTHWEST}

local Decisions_MapucheDefense = {}
	Decisions_MapucheDefense.Name = "TXT_KEY_DECISIONS_LEUGI_MAULE_DEFENSE"
	Decisions_MapucheDefense.Desc = "TXT_KEY_DECISIONS_LEUGI_MAULE_DEFENSE_DESC"
	HookDecisionCivilizationIcon(Decisions_MapucheDefense, "CIVILIZATION_MAPUCHE")
	Decisions_MapucheDefense.Weight = nil
	Decisions_MapucheDefense.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MAPUCHE"]) then return false, false end
		if load(pPlayer, "Decisions_MapucheDefense") == true then
			Decisions_MapucheDefense.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_MAULE_DEFENSE_ENACTED_DESC")
			return false, false, true
		end			

		local iCost = math.ceil((500) * iMod)
		Decisions_MapucheDefense.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_MAULE_DEFENSE_DESC", iCost)

		local pTeam = pPlayer:GetTeam();
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetFaith() < iCost) then return true, false end
		if not (Teams[pTeam]:IsHasTech(tChivalry)) then return true, false end
		local cRiverCheck = 0;
		local cMountainCheck = 0;
		for pCity in pPlayer:Cities() do
			local cPlot = pCity:Plot();
			if cPlot:IsRiver() then	
				cRiverCheck = 1;
			end
			for loop, direction in ipairs(directions) do
				local cAdjPlot = Map.PlotDirection(cPlot:GetX(), cPlot:GetY(), direction);
				if (cAdjPlot:IsMountain()) then
					cMountainCheck = 1;
				end
			end
		end
		if cRiverCheck <= 0 then return true, false end
		if cMountainCheck <= 0 then return true, false end
		-- Easy war check wasn't firing in my test?
		--if Teams[pTeam]:GetAtWarCount(false) then return true, false end
		local isWar = 0;
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer ~= pPlayer then
				if (oPlayer:IsAlive()) then
					local oTeam = oPlayer:GetTeam();
					if Teams[pTeam]:IsAtWar(oTeam) then
						isWar = isWar + 1;
						break
					end
				end
			end
		end
		if isWar <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_MapucheDefense.DoFunc = (
	function(pPlayer)

		local iCost = math.ceil((500) * iMod)
		pPlayer:ChangeFaith(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_TOQUI, 1)

		save(pPlayer, "Decisions_MapucheDefense", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MAPUCHE"], "Decisions_MapucheDefense", Decisions_MapucheDefense)


local pMauleDefense = GameInfoTypes.PROMOTION_MAULE;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_MAPUCHE) then
			if load(pPlayer, "Decisions_MapucheDefense") == true then
				for pUnit in pPlayer:Units() do
					if pUnit:IsCombatUnit() then 
						if not pUnit:IsHasPromotion(pMauleDefense) then
							pUnit:SetHasPromotion(pMauleDefense,true);
						end
					end
				end
			end
		end
	end
end)
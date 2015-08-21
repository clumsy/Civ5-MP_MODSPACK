function KWSDecisionUtility(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasPolicy(GameInfoTypes["POLICY_GE_KWS"]) then
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_UNIVERSITY"]) then
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_SCIENTIST"], 100)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(KWSDecisionUtility)

local Decisions_GE_Fleet = {}
	Decisions_GE_Fleet.Name = "TXT_KEY_DECISIONS_GE_GERMANY_FLEET"
	Decisions_GE_Fleet.Desc = "TXT_KEY_DECISIONS_GE_GERMANY_FLEET_DESC"
	HookDecisionCivilizationIcon(Decisions_GE_Fleet, "CIVILIZATION_GREATEREUROPE_GERMANY")
	Decisions_GE_Fleet.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"]) then return false, false end
		if load(pPlayer, "Decisions_GE_Fleet") == true then
			Decisions_GE_Fleet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GE_GERMANY_FLEET_ENACTED")
			return false, false, true
		end
		
		local iCost = 1200
		Decisions_GE_Fleet.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GE_GERMANY_FLEET_DESC", iCost)
 
		local currentEra = pPlayer:GetCurrentEra()
		local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
		if currentEra < eraIndustrialID then
			return true, false
		end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
 
		local yourNavy = 0
		local theirNavy = 0
 
		for unit in pPlayer:Units() do
			if unit:IsCombatUnit() and unit:GetDomainType() == GameInfoTypes["DOMAIN_SEA"] then
				yourNavy = yourNavy + 1
			end
		end
 
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local otherplayer = Players[iPlayer];			
			if (otherplayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"]) then 
				for unit in otherplayer:Units() do
					if unit:IsCombatUnit() and unit:GetDomainType() == GameInfoTypes["DOMAIN_SEA"] then
						theirNavy = theirNavy + 1
					end
				end
				if theirNavy > yourNavy then
					return true, true
				end
			end
		end
 
		return true, false
	end
	)
       
	Decisions_GE_Fleet.DoFunc = (
	function(pPlayer)
		local iCost = 1200
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_GE_FLEET"], true)
		
		save(pPlayer, "Decisions_GE_Fleet", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"], "Decisions_GE_Fleet", Decisions_GE_Fleet)

local Decisions_GE_KWS = {}
	Decisions_GE_KWS.Name = "TXT_KEY_DECISIONS_GE_GERMANY_KWS"
	Decisions_GE_KWS.Desc = "TXT_KEY_DECISIONS_GE_GERMANY_KWS_DESC"
	HookDecisionCivilizationIcon(Decisions_GE_KWS, "CIVILIZATION_GREATEREUROPE_GERMANY")
	Decisions_GE_KWS.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"]) then return false, false end
		if load(pPlayer, "Decisions_GE_KWS") == true then
			Decisions_GE_KWS.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GE_GERMANY_KWS_ENACTED")
			return false, false, true
		end
		
		Decisions_GE_KWS.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GE_GERMANY_KWS_DESC")

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < 800) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_EDUCATION)) then return true, false end

		return true, true
	end
	)
       
	Decisions_GE_KWS.DoFunc = (
	function(pPlayer)
		local iCost = 800
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_GE_KWS"], true)
		
		for city in pPlayer:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_LIBRARY"]) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_UNIVERSITY"], 1)
			end
		end
		
		save(pPlayer, "Decisions_GE_KWS", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_GREATEREUROPE_GERMANY"], "Decisions_GE_KWS", Decisions_GE_KWS)
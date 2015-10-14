print("Aymara Decisions")

--Tesis de Pulacayo

local tGunpowder = GameInfoTypes.TECH_GUNPOWDER;
local tChemistry = GameInfoTypes.TECH_CHEMISTRY;

local Decisions_Pulacayo = {}
	Decisions_Pulacayo.Name = "TXT_KEY_DECISIONS_LEUGI_PULACAYO"
	Decisions_Pulacayo.Desc = "TXT_KEY_DECISIONS_LEUGI_PULACAYO_DESC"
	Decisions_Pulacayo.Pedia = "TXT_KEY_UNIT_QULLANA_REDPONCHO"
	HookDecisionCivilizationIcon(Decisions_Pulacayo, "CIVILIZATION_QULLANA")
	Decisions_Pulacayo.Weight = nil
	Decisions_Pulacayo.CanFunc = (
	function(pPlayer)	
		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_QULLANA"]) then return false, false end
		if load(pPlayer, "Decisions_Pulacayo") == true then
			Decisions_Pulacayo.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_PULACAYO_ENACTED_DESC")
			return false, false, true
		end	
	

		Decisions_Pulacayo.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_PULACAYO_DESC")
		local iCost = math.ceil((700) * iMod)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 4) then return true, false end	 	
		if (pPlayer:GetFaith() < iCost) then return true, false end
		local pTeam = pPlayer:GetTeam();
		if not (Teams[pTeam]:IsHasTech(tGunpowder)) then return true, false end

		return true, true
	end
	)
	
	Decisions_Pulacayo.DoFunc = (
	function(pPlayer)
	
		local iCost = math.ceil((700) * iMod)
		pPlayer:ChangeFaith(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -4)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_PULACAYO, true);
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_QULLANA_REDPONCHO, 2)
		save(pPlayer, "Decisions_Pulacayo", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_QULLANA"], "Decisions_Pulacayo", Decisions_Pulacayo)



local Decisions_Coca = {}
	Decisions_Coca.Name = "TXT_KEY_DECISIONS_LEUGI_SACRED_LEAF"
	Decisions_Coca.Desc = "TXT_KEY_DECISIONS_LEUGI_SACRED_LEAF_DESC"
	Decisions_Coca.Pedia = "TXT_KEY_RESOURCE_COCA"
	HookDecisionCivilizationIcon(Decisions_Coca, "CIVILIZATION_QULLANA")
	Decisions_Coca.Weight = nil
	Decisions_Coca.CanFunc = (
	function(pPlayer)	
		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_QULLANA"]) then return false, false end
		if load(pPlayer, "Decisions_Coca") == true then
			Decisions_Coca.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_SACRED_LEAF_ENACTED_DESC")
			return false, false, true
		end	
	

		Decisions_Coca.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_SACRED_LEAF_DESC")
		local iCost = math.ceil((1500) * iMod)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end	 	
		if (pPlayer:GetFaith() < iCost) then return true, false end
		local pTeam = pPlayer:GetTeam();
		if not (Teams[pTeam]:IsHasTech(tChemistry)) then return true, false end
	
		return true, true
	end
	)
	
	Decisions_Coca.DoFunc = (
	function(pPlayer)
	
		local iCost = math.ceil((1500) * iMod)
		pPlayer:ChangeFaith(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_COCA, true);

		local iProphetID = GameInfo.Units.UNIT_PROPHET.ID
		local iMallkuID = GameInfo.Units.UNIT_MALLKU_GENERAL.ID
		local iMallkuCocaID = GameInfo.Units.UNIT_MALLKU_COCA.ID
		ProphetCount = 0

		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitType() == iMallkuID) then
				local newUnit = pPlayer:InitUnit(iMallkuCocaID, pUnit:GetX(), pUnit:GetY())
				newUnit:Convert(pUnit);
			end
		end

		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_MALLKU, 1)
		save(pPlayer, "Decisions_Coca", true)

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_QULLANA"], "Decisions_Coca", Decisions_Coca)

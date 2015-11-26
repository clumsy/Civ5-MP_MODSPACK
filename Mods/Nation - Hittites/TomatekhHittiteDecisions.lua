--Tomatekh

print("Hittite Decisions")

local bTreatyGods = GameInfoTypes.BUILDING_HITTITE_METORIC_IRON_DUMMY;

--Treaty Gods

local Decisions_HittiteMeteor = {}
	Decisions_HittiteMeteor.Name = "TXT_KEY_DECISIONS_TOMATEKH_HITTITE_METEOR"
	Decisions_HittiteMeteor.Desc = "TXT_KEY_DECISIONS_TOMATEKH_HITTITE_METEOR_DESC"
	HookDecisionCivilizationIcon(Decisions_HittiteMeteor, "CIVILIZATION_HITTITE_MOD")
	Decisions_HittiteMeteor.Weight = nil
	Decisions_HittiteMeteor.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_HITTITE_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_HittiteMeteor") == true then
			Decisions_HittiteMeteor.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HITTITE_METEOR_ENACTED_DESC")
			return false, false, true
		end		

		local iCost = math.ceil(30 * iMod)
		Decisions_HittiteMeteor.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HITTITE_METEOR_DESC", iCost)

		if (pPlayer:GetFaith() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		local isDoF = 0;
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer ~= pPlayer then
				local oID = oPlayer:GetID()
				if pPlayer:IsDoF(oID) then
					isDoF = isDoF + 1;
					break
				end
			end
		end
		if isDoF <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_HittiteMeteor.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		local iCost = math.ceil(30 * iMod)
		pPlayer:ChangeFaith(-iCost);

		local fReligion = -1;
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer ~= pPlayer then
				local oID = oPlayer:GetID()
				if pPlayer:IsDoF(oID) then
					if oPlayer:GetReligionCreatedByPlayer() >= 1 then
						fReligion = oPlayer:GetReligionCreatedByPlayer();
						break
					end
				end
			end
		end

		for pCity in pPlayer:Cities() do
			if not (pCity:IsHasBuilding(bTreatyGods)) then
				pCity:SetNumRealBuilding(bTreatyGods, 1);
			end
			if fReligion ~= -1 then
				if not pCity:IsHolyCityAnyReligion() then
					pCity:ConvertPercentFollowers(fReligion, -1, 25);
				end
			end
		end

		save(pPlayer, "Decisions_HittiteMeteor", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_HITTITE_MOD"], "Decisions_HittiteMeteor", Decisions_HittiteMeteor)

--Hittite Bully

local Decisions_HittiteBully = {}
	Decisions_HittiteBully.Name = "TXT_KEY_DECISIONS_TOMATEKH_HITTITE_BULLY"
	Decisions_HittiteBully.Desc = "TXT_KEY_DECISIONS_TOMATEKH_HITTITE_BULLY_DESC"
	HookDecisionCivilizationIcon(Decisions_HittiteBully, "CIVILIZATION_HITTITE_MOD")
	Decisions_HittiteBully.Weight = nil
	Decisions_HittiteBully.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_HITTITE_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_HittiteBully") == true then
			Decisions_HittiteBully.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HITTITE_BULLY_ENACTED_DESC")
			return false, false, true
		end		
	
		Decisions_HittiteBully.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_HITTITE_BULLY_DESC")

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		local pID = pPlayer:GetID();
		local isFriend = 0;
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
			local cPlayer = Players[i];	
			if (cPlayer:GetMinorCivFriendshipLevelWithMajor(pID) >= 1) then
				isFriend = 1;
				break
			end
		end
		if isFriend <= 0 then return true, false end
		if (pPlayer:GetNumMinorCivsMet() < 3) then return true, false end

		return true, true
	end
	)
	
	Decisions_HittiteBully.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_HITTITE_BULLY_MOD"], true)
		save(pPlayer, "Decisions_HittiteBully", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_HITTITE_MOD"], "Decisions_HittiteBully", Decisions_HittiteBully)

--Decisions

local bMeteoricIron = GameInfoTypes.BUILDING_HITTITE_METORIC_IRON_DUMMY;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_HITTITE_MOD"]) then
			if load(pPlayer, "Decisions_HittiteMeteor") == true then
				for pCity in pPlayer:Cities() do
					if not (pCity:IsHasBuilding(bTreatyGods)) then
						pCity:SetNumRealBuilding(bTreatyGods, 1);
					end
				end
			end
		end
	end
end)
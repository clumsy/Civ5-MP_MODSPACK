--Sfavid Emissaries

local Decisions_SafavidEmissaries = {}
	Decisions_SafavidEmissaries.Name = "TXT_KEY_DECISIONS_SAFAVID_EMISSARIES"
	Decisions_SafavidEmissaries.Desc = "TXT_KEY_DECISIONS_SAFAVID_EMISSARIES_DESC"
	HookDecisionCivilizationIcon(Decisions_SafavidEmissaries, "CIVILIZATION_SAFAVIDS")
	Decisions_SafavidEmissaries.Weight = nil
	Decisions_SafavidEmissaries.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_SAFAVIDS"]) then return false, false end
		if load(pPlayer, "Decisions_SafavidEmissaries") == true then
			Decisions_SafavidEmissaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SAFAVID_EMISSARIES_ENACTED_DESC")
			return false, false, true
		end		

		local iCost = math.ceil(750 * iMod)
		Decisions_SafavidEmissaries.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SAFAVID_EMISSARIES_DESC", iCost)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		local pID = pPlayer:GetID();
		local isFriend = 0;
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
			local cPlayer = Players[i];	
			if (cPlayer:GetMinorCivFriendshipLevelWithMajor(pID) >= 1) then
				isFriend = isFriend + 1;
			end
		end
		if isFriend < 3 then return true, false end

		return true, true
	end
	)
	
	Decisions_SafavidEmissaries.DoFunc = (
	function(pPlayer)
		
		for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
			local cPlayer = Players[i];
			local pTeam = pPlayer:GetTeam();
			local cTeam = cPlayer:GetTeam();
			local pID = pPlayer:GetID()
			local cID = cPlayer:GetID()
			if (Teams[pTeam]:IsHasMet(cTeam)) then
				if (cPlayer:GetMinorCivFriendshipWithMajor(pID) >= 30) then
					if (cPlayer:GetMinorCivFriendshipWithMajor(pID) < 60) then
						local iInfluence = cPlayer:GetMinorCivFriendshipWithMajor(pID)
						local iDifference = (60 - iInfluence)
						cPlayer:ChangeMinorCivFriendshipWithMajor(pID, iDifference)
					end
				end
			end
		end

		local iCost = math.ceil(750 * iMod)
		pPlayer:ChangeGold(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		save(pPlayer, "Decisions_SafavidEmissaries", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_SAFAVIDS"], "Decisions_SafavidEmissaries", Decisions_SafavidEmissaries)

--Modernize the Army

local tGunpowder = GameInfoTypes.TECH_GUNPOWDER;
local pGunpowderEmpire = GameInfoTypes.PROMOTION_SAFVID_MODERN_ARMY;

local Decisions_SafavidModernArmy = {}
	Decisions_SafavidModernArmy.Name = "TXT_KEY_DECISIONS_SAFAVID_MODERNIZE_ARMY"
	Decisions_SafavidModernArmy.Desc = "TXT_KEY_DECISIONS_SAFAVID_MODERNIZE_ARMY_DESC"
	HookDecisionCivilizationIcon(Decisions_SafavidModernArmy, "CIVILIZATION_SAFAVIDS")
	Decisions_SafavidModernArmy.Weight = nil
	Decisions_SafavidModernArmy.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_SAFAVIDS"]) then return false, false end
		if load(pPlayer, "Decisions_SafavidModernArmy") == true then
			Decisions_SafavidModernArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SAFAVID_MODERNIZE_ARMY_ENACTED_DESC")
			return false, false, true
		end		

		Decisions_SafavidModernArmy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_SAFAVID_MODERNIZE_ARMY_DESC")
		
		local pTeam = pPlayer:GetTeam();
		if not (Teams[pTeam]:IsHasTech(tGunpowder)) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		return true, true
	end
	)
	
	Decisions_SafavidModernArmy.DoFunc = (
	function(pPlayer)
		
		for pUnit in pPlayer:Units() do
			if pUnit:IsCombatUnit() then 
				if not pUnit:IsHasPromotion(pGunpowderEmpire) then
					pUnit:SetHasPromotion(pGunpowderEmpire,true);
				end
			end
		end

		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		save(pPlayer, "Decisions_SafavidModernArmy", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_SAFAVIDS"], "Decisions_SafavidModernArmy", Decisions_SafavidModernArmy)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SAFAVIDS"]) then
			if load(pPlayer, "Decisions_SafavidModernArmy") == true then
				for pUnit in pPlayer:Units() do
					if pUnit:IsCombatUnit() then 
						if not pUnit:IsHasPromotion(pGunpowderEmpire) then
							pUnit:SetHasPromotion(pGunpowderEmpire,true);
						end
					end
				end
			end
		end
	end
end)
-- Belgian Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Papal States Decisions: loaded")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Papal States: Declare the Kingdom of God
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumChapels(playerID)
	local numChapels = 0
	local player = Players[playerID]
	for city in player:Cities() do
		if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_CHAPEL_ART"]) then
			numChapels = numChapels + 1
		end

		if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_CHAPEL_MUSIC"]) then
			numChapels = numChapels + 1
		end

		if city:IsHasBuilding(GameInfoTypes["BUILDING_JFD_CHAPEL_WRITING"]) then
			numChapels = numChapels + 1
		end
	end

	return numChapels
end

local Decisions_KingdomofGod = {}
	Decisions_KingdomofGod.Name = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD"
	Decisions_KingdomofGod.Desc = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC"
	HookDecisionCivilizationIcon(Decisions_KingdomofGod, "CIVILIZATION_JFD_PAPAL_STATES")
	Decisions_KingdomofGod.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]) then return false, false end
		if load(pPlayer, "Decisions_KingdomofGod") == true then
			Decisions_KingdomofGod.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(100 * iMod * JFD_GetNumChapels(pPlayer:GetID()))
		local iFaithCost = math.ceil(200 * iMod * JFD_GetNumChapels(pPlayer:GetID()))
		local iNumMagistrates = JFD_GetNumChapels(pPlayer:GetID())
		Decisions_KingdomofGod.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_KINGDOM_OF_GOD_DESC", iCost, iFaithCost, iNumMagistrates)
		
		if (pPlayer:GetGold() < iCost) then	return true, false end
		if (pPlayer:GetFaith() < iFaithCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if pPlayer:GetReligionCreatedByPlayer() <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_KingdomofGod.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(100 * iMod * JFD_GetNumChapels(pPlayer:GetID()))
		local iFaithCost = math.ceil(200 * iMod * JFD_GetNumChapels(pPlayer:GetID()))
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeFaith(-iFaithCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, JFD_GetNumChapels(pPlayer:GetID()))
		Events.AudioPlay2DSound("AS2D_DISCIPLE_ARTIST_WRITER")
		save(pPlayer, "Decisions_KingdomofGod", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"], "Decisions_KingdomofGod", Decisions_KingdomofGod)
-------------------------------------------------------------------------------------------------------------------------
-- Papal States: Institute the Societas Jesu
-------------------------------------------------------------------------------------------------------------------------
local Decisions_SocietasJesu = {}
	Decisions_SocietasJesu.Name = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU"
	Decisions_SocietasJesu.Desc = "TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_DESC"
	HookDecisionCivilizationIcon(Decisions_SocietasJesu, "CIVILIZATION_JFD_PAPAL_STATES")
	Decisions_SocietasJesu.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"]) then return false, false end
		if load(pPlayer, "Decisions_SocietasJesu") == true then
			Decisions_SocietasJesu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_ENACTED_DESC")
			return false, false, true
		end
		
		local iCost = math.ceil(1050 * iMod)
		Decisions_SocietasJesu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PAPAL_STATES_SOCIETAS_JESU_DESC", iCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetFaith() < iCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if Game.GetNumReligionsStillToFound() > 0 then return true, false end
		if pPlayer:GetReligionCreatedByPlayer() <= 0 then return true, false end

		return true, true
	end
	)
	
	Decisions_SocietasJesu.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(1050 * iMod)
		pPlayer:ChangeFaith(-iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_JFD_PAPAL_SOCIETAS_JESU"], true)
		save(pPlayer, "Decisions_SocietasJesu", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_PAPAL_STATES"], "Decisions_SocietasJesu", Decisions_SocietasJesu)
--=======================================================================================================================
--=======================================================================================================================
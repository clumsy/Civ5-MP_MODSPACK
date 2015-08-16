-- Decisions Support
-- Author: John -- template by JFD
-- DateCreated: 11/8/2014 7:56:32 PM
--------------------------------------------------------------
--=======================================================================================================================
print("Loading the Cree First Nation's Decisions")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Cree: Grand Council of the Crees
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CLGrandCouncil = {}
	Decisions_CLGrandCouncil.Name = "TXT_KEY_DECISIONS_THECREEFIRSTNATION_CREEGRANDCOUNCIL_NAME"
	Decisions_CLGrandCouncil.Desc = "TXT_KEY_DECISIONS_THECREEFIRSTNATION_CREEGRANDCOUNCIL_DESC"
	HookDecisionCivilizationIcon(Decisions_CLGrandCouncil, "CIVILIZATION_THECREEFIRSTNATION")
	Decisions_CLGrandCouncil.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION) then return false, false end
		if load(pPlayer, "Decisions_CLGrandCouncil") == true then
			Decisions_CLGrandCouncil.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_CREEGRANDCOUNCIL_ADOPTED")
			return false, false, true
		end
		
		Decisions_CLGrandCouncil.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_CREEGRANDCOUNCIL_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return true, false end
		if not Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE) then return true, false end
		local Coastalness = false
		for pCity in pPlayer:Cities() do
			if pCity:IsCoastal() then
				Coastalness = true
			end
		end
		if Coastalness == false then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end

		return true, true
	end
	)
	
	Decisions_CLGrandCouncil.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		save(pPlayer, "Decisions_CLGrandCouncil", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_THECREEFIRSTNATION"], "Decisions_CLGrandCouncil", Decisions_CLGrandCouncil)

function GetCreeNations(pPlayer)
	local CreeNationsNum = 0
	local HasSwampy = false
	local HasBay = false
	local HasWoodlands = false
	local HasInnu = false
	local HasPlains = false
	local HasMetis = false
	for pCity in pPlayer:Cities() do
		local pPlot = pCity:Plot()
		local NationNum = SabtuanAudit(pPlot)
		if NationNum == 0 then
			HasSwamp = true
		elseif NationNum == 1 then
			HasBay = true
		elseif NationNum == 2 then
			HasWoodlands = true
		elseif NationNum == 3 then
			HasInnu = true
		elseif NationNum == 4 then
			HasPlains = true
		elseif NationNum == 5 then
			HasMetis = true
		end
	end
	if HasSwamp == true then
		CreeNationsNum = CreeNationsNum + 1
	end
	if HasBay == true then
		CreeNationsNum = CreeNationsNum + 1
	end
	if HasWoodlands == true then
		CreeNationsNum = CreeNationsNum + 1
	end
	if HasInnu == true then
		CreeNationsNum = CreeNationsNum + 1
	end
	if HasPlains == true then
		CreeNationsNum = CreeNationsNum + 1
	end
	if HasMetis == true then
		CreeNationsNum = CreeNationsNum + 1
	end
	return CreeNationsNum
end

function CreeCouncilExplosion(iTeam, era)
	if load(pPlayer, "Decisions_CLGrandCouncil") == true then
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pPlayer = Players[iPlayer]
			if (pPlayer:GetTeam() == iTeam) then
				if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
					local iBonus = GetCreeNations(pPlayer)
					local iCulture = math.ceil((5 + iBonus) * 9 * iMod)
					local iProd = math.ceil((4 + iBonus) * 6 * iMod)
					pPlayer:ChangeJONSCulture(iCulture)
					for pCity in pPlayer:Cities() do
						if pCity:IsCoastal() then
							pCity:SetOverflowProduction(pCity:GetOverflowProduction() + iProd)
						end
					end
					if pPlayer:IsHuman() then
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_CREEGRANDCOUNCIL_NOTIFICATION", iCulture, iGold))
					end
				end
			end
		end
	end
end
GameEvents.TeamSetEra.Add(CreeCouncilExplosion)

--=======================================================================================================================
-- Cree: Become the Middleman
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CLFurTradeGet = {}
	Decisions_CLFurTradeGet.Name = "TXT_KEY_DECISIONS_THECREEFIRSTNATION_FURTRADEGET_NAME"
	Decisions_CLFurTradeGet.Desc = "TXT_KEY_DECISIONS_THECREEFIRSTNATION_FURTRADEGET_DESC"
	Decisions_CLFurTradeGet.tLuxuries = {}
	for tResource in GameInfo.Resources("ResourceUsage = 2") do
		table.insert(Decisions_CLFurTradeGet.tLuxuries, tResource.ID)
	end
	--HookDecisionCivilizationIcon(Decisions_CLFurTradeGet, "CIVILIZATION_THECREEFIRSTNATION")
	Decisions_CLFurTradeGet.CanFunc = (

	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then return false, false end
		
		--if load(pPlayer, "Decisions_CLFurTradeGet") == nil then
	--		save(pPlayer, "Decisions_CLFurTradeGet", 0)
	--	end
		--if load(pPlayer, "DominantCreeResource") ~= nil then return false, false end
		
		local tDomResources = {}
		for iKey, iResource in ipairs(Decisions_CLFurTradeGet.tLuxuries) do
			if (pPlayer:GetNumResourceTotal(iResource, false) > 2) then
				tDomResources[iResource] = true
			end
		end


		-------------------------------------
		-- Begin Decision Generation
		-------------------------------------				
		for iResource, _ in pairs(tDomResources) do
			local sKey = "Decisions_CLFurTradeGet" .. iResource
			local tResource = GameInfo.Resources[iResource]
		
			tTempDecisions[sKey] = {}
			tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_FURTRADEGET_NAME", tResource.Description)
			tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_FURTRADEGET_DESC", tResource.Description, tResource.IconString)
			tTempDecisions[sKey].Data1 = tResource
			--tTempDecisions[sKey].Weight = function(pPlayer, tResource) return tResource.OnlyMinorCivs end
			tTempDecisions[sKey].Type = "Civilization"
			HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_THECREEFIRSTNATION")
			tTempDecisions[sKey].CanFunc = (
			function(pPlayer, tResource)
				local iResource = tResource.ID
				local sKey = "Decisions_CLFurTradeGet" .. iResource
				local sName = tResource.Description
				local sIcon = tResource.IconString
				local domRes = load(pPlayer, "DominantCreeResource")
				if load(pPlayer, "Decisions_CLFurTradeGet") == true then
					if domRes ~= nil then
						if domRes == iResource then
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_FURTRADEGET_ADOPTED", sName, sIcon)
							return false, false, true
						end
					end
					return false, false
				end
				--if tDomResources[iResource] then return false, false end
				--if load(pPlayer, "Decisions_CLFurTradeGet") >= 3 then return false, false end
				
				tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_FURTRADEGET_DESC", sName, sIcon)
				
				if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
				
				return true, true
			end
			)
			
			tTempDecisions[sKey].DoFunc = (
			function(pPlayer, tResource)
				local iResource = tResource.ID
				
				pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
				save(pPlayer, "Decisions_CLFurTradeGet", true)
				save(pPlayer, "DominantCreeResource", iResource)
				save(pPlayer, sKey, true)
			end
			)
		end
		-------------------------------------
		-- End Decision Generation
		-------------------------------------	
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION, "Decisions_CLFurTradeGet", Decisions_CLFurTradeGet)


function ExploitTheFurTrade(minor, player, friendshipismagic)
	local pPlayer = Players[player]
	local pMinor = Players[minor]
	local pAdj = pMinor:GetCivilizationAdjective()
	if load(pPlayer, "Decisions_CLFurTradeGet") == true then
		if friendshipismagic == true then
			local domRes = load(pPlayer, "DominantCreeResource")
			local iResource = GameInfo.Resources[domRes]
			local iBonus = pPlayer:GetNumResourceTotal(iResource, false)
			local iGold = ((3 + iBonus) * 11 * iMod)
			pPlayer:ChangeGold(iGold)
			if pPlayer:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_DECISIONS_THECREEFIRSTNATION_FURTRADEGET_NOTIFICATION", iGold, iResource.Description, iResource.IconString, pAdj))
			end
		end
	end
end
GameEvents.MinorFriendsChanged.Add(ExploitTheFurTrade)
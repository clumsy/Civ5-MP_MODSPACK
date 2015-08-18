-- Lua Script1
-- Author: Tarcísio
-- DateCreated: 11/7/2014 9:42:42 PM
--------------------------------------------------------------

local Decisions_ToledoSteel = {}
	Decisions_ToledoSteel.Name = "TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL"
	Decisions_ToledoSteel.Desc = "TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL_DESC"
	HookDecisionCivilizationIcon(Decisions_ToledoSteel, "CIVILIZATION_TCM_THE_IBERIANS")
	Decisions_ToledoSteel.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"]) then return false, false end
			if load(pPlayer, "Decisions_ToledoSteel") == true then
				Decisions_ToledoSteel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL_ENACTED_DESC")
				return false, false, true
			end

			local iCost = math.ceil(250 * iMod)
			Decisions_ToledoSteel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL_DESC", iCost)
			if (pPlayer:GetCurrentEra() < GameInfoTypes["ERA_CLASSICAL"]) then return true, false end
			if (pPlayer:GetGold() < iCost) then return true, false end
			if (pPlayer:GetJONSCulture() < iCost) then return true, false end

			for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
				local pPlot = Map.GetPlotByIndex(plotLoop)
				local IberianPlayerID = pPlayer:GetID()
				if pPlot:GetOwner() == IberianPlayerID then
					if pPlot:GetResourceType() == GameInfoTypes["RESOURCE_IRON"] then
						if pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_MINE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CITADEL"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_HOLY_SITE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_MANUFACTORY"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_ACADEMY"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_LANDMARK"]) then
							return true, true
						end
					end
				end
			end
			return true, false
	end
	)
	
	Decisions_ToledoSteel.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_TOLEDO_STEEL"], true)
		save(pPlayer, "Decisions_ToledoSteel", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"], "Decisions_ToledoSteel", Decisions_ToledoSteel)

-- Lua Script1
-- Author: Tarcísio
-- DateCreated: 11/7/2014 9:42:42 PM
--------------------------------------------------------------

local Decisions_ToledoSteel = {}
	Decisions_ToledoSteel.Name = "TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL"
	Decisions_ToledoSteel.Desc = "TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL_DESC"
	HookDecisionCivilizationIcon(Decisions_ToledoSteel, "CIVILIZATION_TCM_THE_IBERIANS")
	Decisions_ToledoSteel.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"]) then return false, false end
			if load(pPlayer, "Decisions_ToledoSteel") == true then
				Decisions_ToledoSteel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL_ENACTED_DESC")
				return false, false, true
			end

			local iCost = math.ceil(250 * iMod)
			Decisions_ToledoSteel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_THE_IBERIANS_TOLEDO_STEEL_DESC", iCost)
			if (pPlayer:GetCurrentEra() < GameInfoTypes["ERA_CLASSICAL"]) then return true, false end
			if (pPlayer:GetGold() < iCost) then return true, false end
			if (pPlayer:GetJONSCulture() < iCost) then return true, false end

			for plotLoop = 0, Map.GetNumPlots() - 1, 1 do
				local pPlot = Map.GetPlotByIndex(plotLoop)
				local IberianPlayerID = pPlayer:GetID()
				if pPlot:GetOwner() == IberianPlayerID then
					if pPlot:GetResourceType() == GameInfoTypes["RESOURCE_IRON"] then
						if pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_MINE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CITADEL"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_HOLY_SITE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_MANUFACTORY"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_ACADEMY"]) or pPlot:IsResourceConnectedByImprovement(GameInfoTypes["IMPROVEMENT_LANDMARK"]) then
							return true, true
						end
					end
				end
			end
			return true, false
	end
	)
	
	Decisions_ToledoSteel.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(250 * iMod)
		pPlayer:ChangeGold(-iCost)
		pPlayer:ChangeJONSCulture(-iCost)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_TOLEDO_STEEL"], true)
		save(pPlayer, "Decisions_ToledoSteel", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"], "Decisions_ToledoSteel", Decisions_ToledoSteel)

local Decisions_IberianSculpture = {}
	Decisions_IberianSculpture.Name = "TXT_KEY_DECISIONS_IBERIANSCULPTURE"
	Decisions_IberianSculpture.Desc = "TXT_KEY_DECISIONS_IBERIANSCULPTURE_DESC"
	Decisions_IberianSculpture.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TCM_THE_IBERIANS then return end
		
		--------------------------------------------------------------
		-- Get a list of Valid Trade Route Players
		--------------------------------------------------------------
		local tPlayers = {}
		-- Your Trade Routes
		local tTradeRoutes = pPlayer:GetTradeRoutes()
		for iKey, tRoute in ipairs(tTradeRoutes) do
			local pCity = tRoute.ToCity
			local pToPlayer = Players[pCity:GetOwner()]
			tPlayers[pToPlayer] = true
		end
		-- Foreign Trade Routes
		local tTradeRoutes = pPlayer:GetTradeRoutesToYou()
		for iKey, tRoute in ipairs(tTradeRoutes) do
			local pCity = tRoute.FromCity
			local pFromPlayer = Players[pCity:GetOwner()]
			tPlayers[pFromPlayer] = true
		end	
		--------------------------------------------------------------	
		-- Generate Decisions
		--------------------------------------------------------------
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local foreignCiv = Players[iPlayer];
			if foreignCiv:IsAlive() and not(foreignCiv:IsMinorCiv()) and Teams[pPlayer:GetTeam()]:IsHasMet(foreignCiv:GetTeam()) and foreignCiv ~= pPlayer and not(foreignCiv:IsBarbarian()) then
				local sKey = "Decisions_IberianSculpture" .. foreignCiv:GetID()
				local sName = foreignCiv:GetCivilizationShortDescription()
				local sAdjective = foreignCiv:GetCivilizationAdjective()
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IBERIANSCULPTURE", sAdjective)
				tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IBERIANSCULPTURE_DESC", sName, "placeholder", "placeholder")
				tTempDecisions[sKey].Data1 = foreignCiv
				tTempDecisions[sKey].Data2 = tPlayers[foreignCiv]
				tTempDecisions[sKey].Weight = 0
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_TCM_THE_IBERIANS")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, foreignCiv, isHasTradeRoute)
					local sKey = "Decisions_IberianSculpture" .. foreignCiv:GetID()
					local sName = foreignCiv:GetCivilizationShortDescription()
					local sAdjective = foreignCiv:GetCivilizationAdjective()
					
					local iEra = load(pPlayer, "Decisions_IberianSculpture")
					local iCurrentEra = pPlayer:GetCurrentEra()
					local iCost = math.ceil((iCurrentEra + 1) * 100 * iMod)

					if load ( foreignCiv, "Iberian_Decision_Bonus" ) == nil then
						local randomBonus = GetRandom(1,15)
						save( foreignCiv, "Iberian_Decision_Bonus", randomBonus ) 
					end
	
					--Get Civ Bonus for display
					local civBonus = "Nothing"
					if load ( foreignCiv, "Iberian_Decision_Bonus") == 1 then
						civBonus = "Sculptor Workshops yield +2 [ICON_CULTURE] Culture"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 2 then
						civBonus = "Sculptor Workshops generate +1 [ICON_HAPPINESS_1] Happiness"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 3 then
						civBonus = "Sculptor Workshops yield +1 [ICON_PRODUCTION] Production"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 4 then
						civBonus = "Sculptor Workshops yield +5% [ICON_PRODUCTION] Production"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 5 then
						civBonus = "Sculptor Workshops yield +1 [ICON_GOLD] Gold from incoming trade routes"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 6 then
						civBonus = "Sculptor Workshops yield +2 [ICON_GOLD] Gold"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 7 then
						civBonus = "Sculptor Workshops yield +1 [ICON_GOLD] Gold and 1 [ICON_CULTURE] Culture"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 8 then
						civBonus = "Sculptor Workshops maintenance increases by 1 [ICON_GOLD] Gold and yields +3 [ICON_CULTURE] Culture"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 9 then
						civBonus = "Sculptor Workshops maintenance increases by 1 [ICON_GOLD] Gold and yields +2 [ICON_PRODUCTION] Production"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 10 then
						civBonus = "Sculptor Workshops maintenance increases by 2 [ICON_GOLD] Gold and yields +2 [ICON_HAPPINESS_1] Happiness"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 11 then
						civBonus = "Sculptor Workshops maintenance increases by 2 [ICON_GOLD] Gold and yields +10% [ICON_PRODUCTION] Production"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 12 then
						civBonus = "Sculptor Workshops maintenance increases by 2 [ICON_GOLD] Gold and yields +2 [ICON_CULTURE] Culture and +1 [ICON_PRODUCTION] Production"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 13 then
						civBonus = "Sculptor Workshops yield +1 [ICON_GOLD] Gold and +1 [ICON_FOOD] Food"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 14 then
						civBonus = "Sculptor Workshops maintenance increases by 1 [ICON_GOLD] Gold and yields +2 [ICON_FOOD] Food"
					elseif load ( foreignCiv, "Iberian_Decision_Bonus") == 15 then
						civBonus = "Sculptor Workshops yield +5% [ICON_GOLD] Gold"
					end
					-- end

					if iEra ~= nil then
						if iEra < iCurrentEra then
							save(pPlayer, "Decisions_IberianSculpture", nil)
						else
							if load(pPlayer, sKey) == true then
								tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ADOPTSCULPTURES_ENACTED_DESC", sName, civBonus)
								return false, false, true
							else
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ADOPTSCULPTURES_ENACTED_DESC", sName, civBonus)
							return false, false, false
							end
						end
					end
					
					if load(pPlayer, sKey) == true then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ADOPTSCULPTURES_ENACTED_DESC", sName, civBonus)
						return false, false, true
					end

					tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_IBERIANSCULPTURE_DESC", sName, iCost, civBonus)
					
					if not(isHasTradeRoute) then
						return true, false
					end
					
					if (pPlayer:GetJONSCulture() <= iCost) then
						return true, false
					end

					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, foreignCiv)
					local sKey = "Decisions_IberianSculpture" .. foreignCiv:GetID()
					save(pPlayer, sKey, true)
					save(pPlayer, "Decisions_IberianSculpture", pPlayer:GetCurrentEra())

					local iCurrentEra = pPlayer:GetCurrentEra()
					local iCost = math.ceil((iCurrentEra + 1) * 100 * iMod)
					pPlayer:ChangeJONSCulture(-iCost)

					--Remove previous bonus

					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_1"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_2"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_3"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_4"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_5"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_6"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_7"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_8"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_9"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_10"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_11"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_12"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_13"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_14"], false)
					pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_15"], false)

					for city in pPlayer:Cities() do
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_GOLDFROM"], 0)
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_IBERIAN_DUMMY_MAINTENANCE"], 0)
					end

					--Get Bonus and do it
					if load ( foreignCiv, "Iberian_Decision_Bonus" ) == 1 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_1"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 2 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_2"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 3 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_3"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 4 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_4"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 5 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_5"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 6 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_6"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 7 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_7"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 8 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_8"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 9 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_9"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 10 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_10"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 11 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_11"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 12 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_12"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 13 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_13"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 14 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_14"], true)

					elseif load ( foreignCiv, "Iberian_Decision_Bonus" ) == 15 then
						pPlayer:SetNumFreePolicies(1)
						pPlayer:SetNumFreePolicies(0)
						pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_IBERIAN_BONUS_15"], true)

					end
				end
				)
			end
		end
		--------------------------------------------------------------
		--End Generation
		--------------------------------------------------------------
		return
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_THE_IBERIANS"], "Decisions_IberianSculpture", Decisions_IberianSculpture)
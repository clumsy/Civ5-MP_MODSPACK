local Decisions_TCM_HyksosAncientTexts = {}
	Decisions_TCM_HyksosAncientTexts.Name = "TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_1"
	Decisions_TCM_HyksosAncientTexts.Desc = "TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_1_DESC"
	Decisions_TCM_HyksosAncientTexts.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_TCM_HYKSOS then return end
			local noValidTargets = true
			--------------------------------------------------------------	
			-- Generate Decisions
			--------------------------------------------------------------
			for iForeignPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
				local foreignCiv = Players[iForeignPlayer];
				local playerID = pPlayer:GetID()
				if not(foreignCiv:IsMinorCiv()) and foreignCiv ~= pPlayer and not(foreignCiv:IsBarbarian()) and foreignCiv:IsCapitalCapturedBy(playerID) then
					
					--
					local sKey = "Decisions_TCM_HyksosAncientTexts" .. foreignCiv:GetID()
					local sName = foreignCiv:GetCivilizationShortDescription()
					local sAdjective = foreignCiv:GetCivilizationAdjective()
					tTempDecisions[sKey] = {}
					tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_2", sAdjective)
					tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_2_DESC", sName, "placeholder", "placeholder")
					tTempDecisions[sKey].Data1 = foreignCiv
					tTempDecisions[sKey].Weight = 0
					HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_TCM_HYKSOS")
					tTempDecisions[sKey].CanFunc = (
					function(pPlayer, foreignCiv, iForeignPlayer)
						local sKey = "Decisions_TCM_HyksosAncientTexts" .. foreignCiv:GetID()
						local sName = foreignCiv:GetCivilizationShortDescription()
						local sAdjective = foreignCiv:GetCivilizationAdjective()

						if load(pPlayer, sKey) == true then
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_2_ENACTED_DESC", sName, sAdjective)
							return false, false, true
						end
						noValidTargets = false

						local iTech = pPlayer:GetCurrentResearch()
						local iReward = math.ceil(0.15 * pPlayer:GetResearchCost(iTech))
						local iCurrentEra = pPlayer:GetCurrentEra()
						local iCost = math.ceil((iCurrentEra + 1) * 125 * iMod)
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_2_DESC", sName, sAdjective, iCost, iReward)

						if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
						if pPlayer:GetGold() < iCost then
							return true, false
						end
						return true, true
					end
					)
					
					tTempDecisions[sKey].DoFunc = (
					function(pPlayer, foreignCiv, iForeignPlayer)
						pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

						local iCurrentEra = pPlayer:GetCurrentEra()
						local iCost = math.ceil((iCurrentEra + 1) * 125 * iMod)
						pPlayer:ChangeGold(-iCost)

						if pPlayer:HasAvailableGreatWorkSlot(GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]) then
							local capitalX = pPlayer:GetCapitalCity():GetX()
							local capitalY = pPlayer:GetCapitalCity():GetY()
							pPlayer:InitUnit(GameInfoTypes["UNIT_WRITER"], capitalX, capitalY):PushMission(unitMissionCreateGreatWorkID)
						end

						for city in pPlayer:Cities() do
							local foreignPlayerID = foreignCiv:GetID()
							if city:GetOriginalOwner() == foreignPlayerID then
								city:SetNumRealBuilding(GameInfoTypes["BUILDING_LIBRARY"], 1)
							end
						end

						local iTech = pPlayer:GetCurrentResearch()
						local iReward = math.ceil(0.15 * pPlayer:GetResearchCost(iTech))
			
						local pTeamTech = Teams[pPlayer:GetTeam()]:GetTeamTechs()
						pTeamTech:ChangeResearchProgress(iTech, iReward, pPlayer:GetID())

						local sKey = "Decisions_TCM_HyksosAncientTexts" .. foreignCiv:GetID()
						save(pPlayer, sKey, true)
					end
					)
				end
			end
			--------------------------------------------------------------
			--End Generation
			--------------------------------------------------------------
			if noValidTargets == true then
				HookDecisionCivilizationIcon(Decisions_TCM_HyksosAncientTexts, "CIVILIZATION_TCM_HYKSOS")
				local iCost = math.ceil(400 * iMod)
				local iTech = pPlayer:GetCurrentResearch()
				local iReward = math.ceil(0.15 * pPlayer:GetResearchCost(iTech))
				Decisions_TCM_HyksosAncientTexts.Name = "TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_1"
				Decisions_TCM_HyksosAncientTexts.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_HYKSOSANCIENTTEXTS_1_DESC", iCost, iReward)
				return true, false
			end

			return
		end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_HYKSOS"], "Decisions_TCM_HyksosAncientTexts", Decisions_TCM_HyksosAncientTexts)

local Decisions_TCM_HyksosFortifyFrontier = {}
	Decisions_TCM_HyksosFortifyFrontier.Name = "TXT_KEY_DECISIONS_TCM_HYKSOSFORTIFYFRONTIER"
	Decisions_TCM_HyksosFortifyFrontier.Desc = "TXT_KEY_DECISIONS_TCM_HYKSOSFORTIFYFRONTIER_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_HyksosFortifyFrontier, "CIVILIZATION_TCM_HYKSOS")
	Decisions_TCM_HyksosFortifyFrontier.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_HYKSOS"]) then return false, false end
		if load(pPlayer, "Decisions_TCM_HyksosFortifyFrontier") == true then
			Decisions_TCM_HyksosFortifyFrontier.Desc = Locale.ConvertTextKey("TTXT_KEY_DECISIONS_TCM_HYKSOSFORTIFYFRONTIER_ENACTED")
			return false, false, true
		end

		local goldCost = math.ceil(650 * iMod)
		Decisions_TCM_HyksosFortifyFrontier.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_HYKSOSFORTIFYFRONTIER_DESC", goldCost)

		if pPlayer:GetGold() < goldCost then
			return true, false
		end

		local numConqueredCities = 0
		for city in pPlayer:Cities() do
			if city:IsOccupied() or city:IsPuppet() then
				numConqueredCities = numConqueredCities + 1
			end
		end
		if numConqueredCities < 4 then
			return true, false
		end

		return true, true
	end
	)
       
	Decisions_TCM_HyksosFortifyFrontier.DoFunc = (
	function(pPlayer)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_HYKSOS_DECISION"], true)

		local goldCost = math.ceil(650 * iMod)
		pPlayer:ChangeGold(-goldCost)

		save(pPlayer, "Decisions_TCM_HyksosFortifyFrontier", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_HYKSOS"], "Decisions_TCM_HyksosFortifyFrontier", Decisions_TCM_HyksosFortifyFrontier)

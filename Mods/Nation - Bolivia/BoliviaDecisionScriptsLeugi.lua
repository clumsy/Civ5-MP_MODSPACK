print("Bolivia Decisions")

--Bolivia Palace

local Decisions_Bolivia_Palace = {}
	Decisions_Bolivia_Palace.Name = "TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CAPITAL"
	Decisions_Bolivia_Palace.Desc = "TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CAPITAL_DESC"
	HookDecisionCivilizationIcon(Decisions_Bolivia_Palace, "CIVILIZATION_BOLIVIA")
	Decisions_Bolivia_Palace.Weight = nil
	Decisions_Bolivia_Palace.CanFunc = (
		function(pPlayer)	
			-- Check Civ
			if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_BOLIVIA"]) then return false, false end
			-- Check if the decision has been enacted before
			if load(pPlayer, "Decisions_Bolivia_Palace") == true then
				Decisions_Bolivia_Palace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CAPITAL_ENACTED_DESC")
				return false, false, true
			end	
			-- Get the Capital and the Second City
			nCapital = "No City"
			CityName = "Your second city"
			for pCity in pPlayer:Cities() do
				if pCity:IsCapital() then
					nCapital = Locale.ConvertTextKey(pCity:GetName());
				else
					TurnFounded = pCity:GetGameTurnFounded()
					if (OldTurnFounded == nil) or (TurnFounded < OldTurnFounded) then
						OldTurnFounded = TurnFounded
						OldestCity = pCity
					end
				end
			end
			if OldestCity ~= nil then
				CityName = Locale.ConvertTextKey(OldestCity:GetName());
			end 
			-- Set the number of Resistance Turns
			local iResistance = math.ceil((5) * iMod)
			-- Build the Description		
			Decisions_Bolivia_Palace.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CAPITAL_DESC", nCapital, iResistance, CityName)
			-- Requirements
			---- More than one city
			nCities = 0
			for pCity in pPlayer:Cities() do
				nCities = nCities + 1
			end
			if (nCities < 2) then return true, false end	
			---- Industrial Era
			if (pPlayer:GetCurrentEra() ~= GameInfo.Eras["ERA_INDUSTRIAL"].ID) then return true, false end
			-- Costs
			---- Magistrates
			if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end	
			
			-- Allow the decision!
			return true, true
		end
	)
	
	Decisions_Bolivia_Palace.DoFunc = (
	function(pPlayer)
		-- Set the number of Resistance Turns just in case
			iResistance = math.ceil((5) * iMod)
		-- Get the Capital and the Second City just in case
			for pCity in pPlayer:Cities() do
				if pCity:IsCapital() then
					-- Fire Resistance
					pCity:ChangeResistanceTurns(iResistance)
				else
					TurnFounded = pCity:GetGameTurnFounded()
					if (TurnFounded < OldTurnFounded) or (OldTurnFounded == nil) then
						OldTurnFounded = TurnFounded
						OldestCity = pCity
					end
				end
			end
			if OldestCity ~= nil then
				-- Make Capital
				local iPalace = GameInfoTypes.BUILDING_PALACE
				OldestCity:SetNumRealBuilding(iPalace, 1)
				-- Start WLTKD
				iWLTKD = math.ceil((20) * iMod)
				OldestCity:ChangeWeLoveTheKingDayCounter(iWLTKD);
			end 
		-- Add perpetual unhappiness
		pPlayer:ChangeUnhappinessFromUnits(200)
		-- Remove Magistrates (We put 3 here because the Palace will gift 2 Magistrates when acquired)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		-- Save the Decision
		save(pPlayer, "Decisions_Bolivia_Palace", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BOLIVIA"], "Decisions_Bolivia_Palace", Decisions_Bolivia_Palace)

-------------------------------------------------------------------------------------------------
--Bolivian Constitution

local Decisions_Bolivia_Constitucion = {}
	Decisions_Bolivia_Constitucion.Name = "TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CONSTITUCION"
	Decisions_Bolivia_Constitucion.Desc = "TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CONSTITUCION_DESC"
	HookDecisionCivilizationIcon(Decisions_Bolivia_Constitucion, "CIVILIZATION_BOLIVIA")
	Decisions_Bolivia_Constitucion.Weight = nil
	Decisions_Bolivia_Constitucion.CanFunc = (
		function(pPlayer)	
			-- Check Civ
			if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_BOLIVIA"]) then return false, false end
			-- Check if the decision has been enacted before
			if load(pPlayer, "Decisions_Bolivia_Constitucion") == true then
				Decisions_Bolivia_Constitucion.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CONSTITUCION_ENACTED_DESC")
				return false, false, true
			end	
			-- Get the turns of Anarchy/Policies
			n = 0
			for row in GameInfo.Policies() do
				if (row.PolicyBranchType == "POLICY_BRANCH_LIBERTY") or (row.PolicyBranchType == "POLICY_BRANCH_TRADITION") or (row.PolicyBranchType == "POLICY_BRANCH_HONOR") or (row.PolicyBranchType == "POLICY_BRANCH_PIETY") then
					local PolicyType = row.Type
					if (pPlayer:HasPolicy(GameInfo.Policies["" .. PolicyType .. ""].ID)) then
						n = n + 1
					end
				end
			end
			numPol = math.floor(n/2)
			-- Build the Description		
			Decisions_Bolivia_Constitucion.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_BOLIVIA_CONSTITUCION_DESC", numPol)
			-- Requirements
			---- Tech Check
			local tPrereq = GameInfoTypes.TECH_CIVIL_SERVICE;
			local pTeam = pPlayer:GetTeam();
			if not (Teams[pTeam]:IsHasTech(tPrereq)) then return true, false end
			-- Costs
			---- Magistrates
			if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end	
			
			-- Allow the decision!
			return true, true
		end
	)
	
	Decisions_Bolivia_Constitucion.DoFunc = (
	function(pPlayer)
		-- Get the turns of Anarchy/Policies
		n = 0
		for row in GameInfo.Policies() do
			if (row.PolicyBranchType == "POLICY_BRANCH_LIBERTY") or (row.PolicyBranchType == "POLICY_BRANCH_TRADITION") or (row.PolicyBranchType == "POLICY_BRANCH_HONOR") or (row.PolicyBranchType == "POLICY_BRANCH_PIETY") then
				local PolicyType = row.Type
				if (pPlayer:HasPolicy(GameInfo.Policies["" .. PolicyType .. ""].ID)) then
					n = n + 1
				end
			end
		end
		numPol = math.floor(n/2)
		-- Grant Anarchy
		pPlayer:ChangeAnarchyNumTurns(numPol)
		-- Grant Policies
		pPlayer:ChangeNumFreePolicies(numPol)
		-- Start GOlden Age
		pPlayer:ChangeGoldenAgeTurns(10)
		-- Remove Magistrates
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		-- Save the Decision
		save(pPlayer, "Decisions_Bolivia_Constitucion", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BOLIVIA"], "Decisions_Bolivia_Constitucion", Decisions_Bolivia_Constitucion)

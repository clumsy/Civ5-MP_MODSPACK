print("Philistine Decisions")

--Sea Peoples
local tBronze = GameInfoTypes. 	TECH_BRONZE_WORKING;


local Decisions_SeaPeoples = {}
	Decisions_SeaPeoples.Name = "TXT_KEY_DECISIONS_LEUGI_SEA_PEOPLES"
	Decisions_SeaPeoples.Desc = "TXT_KEY_DECISIONS_LEUGI_SEA_PEOPLES_DESC"
	Decisions_SeaPeoples.Pedia = "TXT_KEY_UNIT_PHILISTINE_PELESET"
	HookDecisionCivilizationIcon(Decisions_SeaPeoples, "CIVILIZATION_LEUGI_PHILISTINE")
	Decisions_SeaPeoples.Weight = nil
	Decisions_SeaPeoples.CanFunc = (
	function(pPlayer)	
		-- Civ Checking
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_PHILISTINE"]) then return false, false end
		--
		-- May only be enacted once
		if load(pPlayer, "Decisions_SeaPeoples") == true then
			Decisions_SeaPeoples.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_SEA_PEOPLES_ENACTED_DESC")
			return false, false, true
		end
		Decisions_SeaPeoples.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_SEA_PEOPLES_DESC")
		--
		-- Era Checking
		if (pPlayer:GetCurrentEra() > GameInfo.Eras["ERA_CLASSICAL"].ID) then return true, false end
		--
		-- Tech Checking
		local pTeam = pPlayer:GetTeam();
		if not (Teams[pTeam]:IsHasTech(tBronze)) then return true, false end
		--
		-- Magistrate Checking
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		--
		-- Cost Checking
		local iCost = math.ceil((600) * iMod) 	
		if (pPlayer:GetGold() < iCost) then return true, false end
		--
		return true, true
	end
	)
	
	Decisions_SeaPeoples.DoFunc = (
	function(pPlayer)
		-- Pay the Cost
		local iCost = math.ceil((600) * iMod)
		pPlayer:ChangeGold(-iCost);
		--
		-- Expend Magistrates
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		--
		-- Grant 1 Peleset per City (max 4 cities)
		numCities = 0
		if numCities < 5 then
			for pCity in pPlayer:Cities() do
				numCities = numCities + 1
				InitUnitFromCity(pCity, GameInfoTypes.UNIT_PHILISTINE_PELESET_FREE, 1)
			end
		end
		--
		-- Grant the City Combat Bonus
		local ConquerPromotion = GameInfo.UnitPromotions["PROMOTION_SIEGE"].ID
		for pUnit in pPlayer:Units() do
			 if (pUnit:GetUnitType() == GameInfoTypes.UNIT_PHILISTINE_PELESET_FREE) or (pUnit:GetUnitType() == GameInfoTypes.UNIT_PHILISTINE_PELESET) then
				pUnit:SetHasPromotion(ConquerPromotion,true);
			 end
		end
		--
		-- Save so its never enacted again
		save(pPlayer, "Decisions_SeaPeoples", true)
		--
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_PHILISTINE"], "Decisions_SeaPeoples", Decisions_SeaPeoples)

-- Pentapolis


local Decisions_Philistine_Pentapolis = {}
	Decisions_Philistine_Pentapolis.Name = "TXT_KEY_DECISIONS_LEUGI_PENTAPOLIS"
	Decisions_Philistine_Pentapolis.Desc = "TXT_KEY_DECISIONS_LEUGI_PENTAPOLIS_DESC"
	Decisions_Philistine_Pentapolis.Pedia = "TXT_KEY_BUILDING_SERANIM_PALACE"
	HookDecisionCivilizationIcon(Decisions_Philistine_Pentapolis, "CIVILIZATION_LEUGI_PHILISTINE")
	Decisions_Philistine_Pentapolis.Weight = nil
	Decisions_Philistine_Pentapolis.CanFunc = (
	function(pPlayer)	
		-- Civ Checking
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_PHILISTINE"]) then return false, false end
		--
		-- May only be enacted once
		if load(pPlayer, "Decisions_Philistine_Pentapolis") == true then
			Decisions_Philistine_Pentapolis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_PENTAPOLIS_ENACTED_DESC")
			return false, false, true
		end
		Decisions_Philistine_Pentapolis.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_PENTAPOLIS_DESC")
		--
		-- Era Checking
		if (pPlayer:GetCurrentEra() < GameInfo.Eras["ERA_CLASSICAL"].ID) then return true, false end
		--
		-- Number of Cities Checking
		numCities = 0
		for pCity in pPlayer:Cities() do
			numCities = numCities + 1
		end
		if (numCities < 5) then return true, false end
		--
		-- Magistrate Checking
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		--
		-- Cost Checking
		local iCost = math.ceil((800) * iMod) 	
		if (pPlayer:GetGold() < iCost) then return true, false end
		--
		return true, true
	end
	)
	
	Decisions_Philistine_Pentapolis.DoFunc = (
	function(pPlayer)
		-- Pay the Cost
		local iCost = math.ceil((800) * iMod)
		pPlayer:ChangeGold(-iCost);
		--
		-- Expend Magistrates
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		--
		-- Grant Seranim Palaces to each of the 5 cities
		numCities = 0
		if numCities < 6 then
			for pCity in pPlayer:Cities() do
				numCities = numCities + 1
				pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_SERANIM_PALACE"], 1)
			end
		end
		--
		-- Grant Golden Age
		pPlayer:ChangeGoldenAgeTurns(20)
		-- 
		-- Change the Civ's name to Philistia
		str =  Locale.ConvertTextKey("TXT_KEY_LEUGI_PHILISTINE_SHORT_DESC_ENACTED");
		local tquery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = 'TXT_KEY_LEUGI_PHILISTINE_SHORT_DESC'"}
		for i, iQuery in pairs(tquery) do
			for result in DB.Query(iQuery) do
			end
		end
		-- refresh UI texts
		Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
		--
		-- Save so its never enacted again
		save(pPlayer, "Decisions_Philistine_Pentapolis", true)
		--
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_PHILISTINE"], "Decisions_Philistine_Pentapolis", Decisions_Philistine_Pentapolis)

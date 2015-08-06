print("Cuba Decisions")

--Dia de Reyes

local Decisions_DiadeReyes = {}
	Decisions_DiadeReyes.Name = "TXT_KEY_DECISIONS_LEUGI_CABILDO_DE_REYES"
	Decisions_DiadeReyes.Desc = "TXT_KEY_DECISIONS_LEUGI_CABILDO_DE_REYES_DESC"
	HookDecisionCivilizationIcon(Decisions_DiadeReyes, "CIVILIZATION_LEUGI_CUBA")
	Decisions_DiadeReyes.Weight = nil
	Decisions_DiadeReyes.CanFunc = (
	function(pPlayer)	
		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_CUBA"]) then return false, false end

		local iEra = load(pPlayer, "Decisions_DiadeReyes")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_DiadeReyes", nil)
			else
				Decisions_DiadeReyes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_CABILDO_DE_REYES_ENACTED_DESC")
				return false, false, true
			end
		end
		Decisions_DiadeReyes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_CABILDO_DE_REYES_DESC")
		local pTeam = pPlayer:GetTeam();
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end	 	
		if( pPlayer:GetNumCities() ~= pPlayer:CountNumBuildings(GameInfo.Buildings["BUILDING_CUBAN_CABILDO"].ID) ) then return true, false end
		if (pPlayer:GetCurrentEra() < GameInfo.Eras["ERA_RENAISSANCE"].ID) then return true, false end
				
		return true, true
	end
	)
	
	Decisions_DiadeReyes.DoFunc = (
	function(pPlayer)
	
	local Gmspecialist = GameInfo.Specialists.SPECIALIST_MUSICIAN.ID;
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		for pCity in pPlayer:Cities() do
			pCity:ChangeResistanceTurns(3)
		end
		InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_MUSICIAN, 1)
		pPlayer:ChangeGoldenAgeTurns(10)
		

		save(pPlayer, "Decisions_DiadeReyes", pPlayer:GetCurrentEra())
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_CUBA"], "Decisions_DiadeReyes", Decisions_DiadeReyes)

--Grito de Yara

local Decisions_GritoYara = {}
	Decisions_GritoYara.Name = "TXT_KEY_DECISIONS_LEUGI_GRITO_DE_YARA"
	Decisions_GritoYara.Desc = "TXT_KEY_DECISIONS_LEUGI_GRITO_DE_YARA_DESC"
	HookDecisionCivilizationIcon(Decisions_GritoYara, "CIVILIZATION_LEUGI_CUBA")
	Decisions_GritoYara.Weight = nil
	Decisions_GritoYara.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_CUBA"]) then return false, false end
		if load(pPlayer, "Decisions_GritoYara") == true then
			Decisions_GritoYara.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_GRITO_DE_YARA_ENACTED_DESC")
			return false, false, true
		end			

		local iCost = math.ceil((100) * iMod)
		Decisions_GritoYara.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_GRITO_DE_YARA_DESC", iCost)

		local pTeam = pPlayer:GetTeam();
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetGold() < iCost) then return true, false end
		-- Easy war check wasn't firing in my test?
		--if Teams[pTeam]:GetAtWarCount(false) then return true, false end
		local isWar = 0;
		for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
			local oPlayer = Players[oPlayer];
			if oPlayer ~= pPlayer then
				if (oPlayer:IsAlive()) then
					local oTeam = oPlayer:GetTeam();
					if Teams[pTeam]:IsAtWar(oTeam) then
						isWar = isWar + 1;
						break
					end
				end
			end
		end
		if isWar <= 0 then return true, false end
		nPlantation = 0
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					if ( plot:GetOwner() == pCity:GetOwner() ) then
						local ImpID = plot:GetImprovementType()
						if ImpID == GameInfoTypes.IMPROVEMENT_PLANTATION then
							nPlantation = nPlantation + 1
						end
					end
				end
			end
		end
		if nPlantation < 3 then return true, false end
		if (pPlayer:GetUnitClassCount(GameInfo.UnitClasses.UNITCLASS_GREAT_GENERAL.ID) < 1) then return true, false end
		if (pPlayer:GetCurrentEra() < GameInfo.Eras["ERA_RENAISSANCE"].ID) then return true, false end

		return true, true
	end
	)
	
	Decisions_GritoYara.DoFunc = (
	function(pPlayer)

		nPlantationCount = 0
		local LandInfantry = { 
	GameInfo.Units.UNIT_MECHANIZED_INFANTRY.ID, 
	GameInfo.Units.UNIT_INFANTRY.ID, 
	GameInfo.Units.UNIT_GREAT_WAR_INFANTRY.ID, 
	GameInfo.Units.UNIT_RIFLEMAN.ID, 
	GameInfo.Units.UNIT_MUSKETMAN.ID, 
	GameInfo.Units.UNIT_PIKEMAN.ID, 
	GameInfo.Units.UNIT_SPEARMAN.ID, 
	GameInfo.Units.UNIT_WARRIOR.ID
	}

		local iCost = math.ceil((100) * iMod)
		pPlayer:ChangeGold(-iCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		nUnitsCreated = 0
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					if ( plot:GetOwner() == pCity:GetOwner() ) then
						local ImpID = plot:GetImprovementType()
						if ImpID == GameInfoTypes.IMPROVEMENT_PLANTATION then
							if nUnitsCreated < 6 then
							for _, iUnit in pairs(LandInfantry) do
							if pCity:CanTrain(iUnit) then
								pUnit = pPlayer:InitUnit(iUnit, plot:GetX(), plot:GetY())
								pUnit:JumpToNearestValidPlot()
								nUnitsCreated = nUnitsCreated + 1
								break
							end
							end
							end
						end
					end
				end
			end
		end
		

		GreatGeneralCount = 0
		local iRevolucionarioID = GameInfo.Units.UNIT_CUBAN_REVOLUCIONARIO.ID

		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitType() == iRevolucionarioID) then
				if GreatGeneralCount < 1 then
					pUnit:Kill(true, -1);
					GreatGeneralCount = GreatGeneralCount + 1
				end
			end
		end

		save(pPlayer, "Decisions_GritoYara", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_CUBA"], "Decisions_GritoYara", Decisions_GritoYara)


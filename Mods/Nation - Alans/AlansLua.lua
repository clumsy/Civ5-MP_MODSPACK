local gSaveData	= Modding.OpenSaveData();

function tcm_StackedNart(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_GREAT_NAR"] then	
			local plot = unit:GetPlot()
			local otherUnit = plot:GetUnit()
			if not(otherUnit:GetUnitType() == GameInfoTypes["UNIT_TCM_GREAT_NAR"]) then	
				otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE"], true)
				if otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE_2"]) then
					otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE_2"], false)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(tcm_StackedNart)
GameEvents.PlayerDoTurn.Add(tcm_StackedNart)

function tcm_NartBonus(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE_2"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE_2"], false)
		end
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE"]) and not(unit:GetUnitType() == GameInfoTypes["UNIT_TCM_GREAT_NAR"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_NARTMOVE_2"], true)
		end
		if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_GREAT_NAR"] then	
			if not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_DUMMYPROMALAN"])) then
				for city in player:Cities() do			
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANHAPPINESS"], 0)
				end
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_DUMMYPROMALAN"], true)
			end
			for city in player:Cities() do
				if not(city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANBLOCKDUMMY"])) then 
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANHAPPINESS"], 1)
				end
			end
		end	
	end
	for city in player:Cities() do
		if not(city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANBLOCKDUMMY"])) then 
			local prePop = city:GetPopulation()
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PREPOPALAN"], prePop)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBLOCKDUMMY"], 1)
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_NartBonus)
GameEvents.PlayerDoTurn.Add(tcm_StackedNart)

function tcm_AlanRaze(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ALAN"] then
		for city in player:Cities() do
			if city:IsCapital() or city:IsOccupied() or city:IsPuppet() or city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"]) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_CAPITALCHECK"], 1) 
			else
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_CAPITALCHECK"], 0) 
			end
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANRAZE"]) then 	
				local plot = city:Plot()
				city:SetFood(0)
				--city:FoodConsumption(true, 100)
				city:ChangeResistanceTurns(99)
				city:ChangePopulation(-1, true)
				local alanPopulation = city:GetPopulation() 
				local foundationPopulation = city:GetNumBuilding(GameInfoTypes["BUILDING_TCM_PREPOPALAN"])
				if alanPopulation >= foundationPopulation then 
					local spawnUnitPop = city:GetNumBuilding(GameInfoTypes["BUILDING_TCM_POPALAN"]) + 1
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_POPALAN"], spawnUnitPop)
					if city:GetNumBuilding(GameInfoTypes["BUILDING_TCM_POPALAN"]) >= 2 then
						if (player:GetCurrentEra() == GameInfo.Eras["ERA_ANCIENT"].ID) then
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_M1"], city:GetX(), city:GetY())
						elseif (player:GetCurrentEra() == GameInfo.Eras["ERA_CLASSICAL"].ID) then
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_M2"], city:GetX(), city:GetY())
						elseif (player:GetCurrentEra() == GameInfo.Eras["ERA_MEDIEVAL"].ID) then
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_M3"], city:GetX(), city:GetY())
						else
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_M4"], city:GetX(), city:GetY())
						end
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_POPALAN"], 0)
					end
				end

				if city:GetPopulation() <= 0 then
					if player:IsHuman() then
						if (player:GetCurrentEra() == GameInfo.Eras["ERA_ANCIENT"].ID) then
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_FM1"], city:GetX(), city:GetY())
						elseif (player:GetCurrentEra() == GameInfo.Eras["ERA_CLASSICAL"].ID) then
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_FM2"], city:GetX(), city:GetY())
						elseif (player:GetCurrentEra() == GameInfo.Eras["ERA_MEDIEVAL"].ID) then
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_FM3"], city:GetX(), city:GetY())
						else
							player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER_FM4"], city:GetX(), city:GetY())
						end
					else
						player:InitUnit(GameInfoTypes["UNIT_TCM_ALAN_SETTLER"], city:GetX(), city:GetY())
					end
					player:Disband(city)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_AlanRaze)

function tcm_AlanMigrant(playerID, unitID)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_ALANMIGRANT"]) then	
		local iX = unit:GetX()
		local iY = unit:GetY()
		if Map.GetPlot(iX, iY):GetPlotCity() then
			local city = Map.GetPlot(iX, iY):GetPlotCity() 
			if not city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_REALLYANOTHERDUMMY"]) then
				city:ChangePopulation(1, true)
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_REALLYANOTHERDUMMY"], 1) 
			else
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_REALLYANOTHERDUMMY"], 0) 
			end
		end
	end		
end
GameEvents.CanSaveUnit.Add(tcm_AlanMigrant)

function tcm_AlanSedentism(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ALAN"] then	
		for city in player:Cities() do
			if (GetTimer(playerID) == Game.GetGameTurn()) then
				local randomvalue = math.random(1,50)
				local Reroll = math.random(1,2)
				if randomvalue <= 20 then
					local newCity
					if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"]) then
						if Reroll == 1 then	
							for otherCity in player:Cities() do
								if otherCity:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"]) then
									otherCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"], 0)
									newCity = otherCity
								end
							end
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"], 1)
							if player:IsHuman() and not(newCity == city) then
								local cityName = city:GetName()
								local title = "New Point of Sedentism."
								local descr = "The city of " .. cityName .. " has become the point of sedentism.";
								player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, city:GetX(), city:GetY())
							end
							return
						end
					else
						for otherCity in player:Cities() do
							if otherCity:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"]) then
								otherCity:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"], 0)
								newCity = otherCity
							end
						end
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"], 1)
						if player:IsHuman() and not(newCity == city) then
							local cityName = city:GetName()
							local title = "New Point of Sedentism."
							local descr = "The city of " .. cityName .. " has become the point of sedentism.";
							player:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, descr, title, city:GetX(), city:GetY())
						end
						return
					end
				end
			elseif (GetTimer(playerID) < Game.GetGameTurn()) then
				SaveTimer(playerID, (Game.GetGameTurn() + 10)) 
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_AlanSedentism)

function tcm_alanSpreadBonus(vHexPos, iPlayer, iCity, artStyleType, eraType, continent, populationSize, size, fogState)
	local player = Players[iPlayer]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ALAN"] then
		for PoS in player:Cities() do
			if PoS:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"]) then 
				for city in player:Cities() do
					--if not city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANBLOCKDUMMY"]) then 
						local iDistance
						if Map.PlotDistance(city:GetX(), city:GetY(), PoS:GetX(), PoS:GetY()) <= 7 then

						elseif Map.PlotDistance(city:GetX(), city:GetY(), PoS:GetX(), PoS:GetY()) <= 11 then
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSRAW"], 1)
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSHAPPINESS"], 1) 
							iDistance = 1
						elseif Map.PlotDistance(city:GetX(), city:GetY(), PoS:GetX(), PoS:GetY()) <= 17 then
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSMODIFIER"], 10) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSRAW"], 1) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSHAPPINESS"], 2) 
							iDistance = 2
						else
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSMODIFIER"], 10) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSRAW"], 2) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSHAPPINESS"], 2) 
							iDistance = 3
						end

						if iDistance ~= nil and not city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANBLOCKDUMMY"]) then 
							local cityPlot = city:Plot()
							for unit in player:Units() do
								if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_GREAT_NAR"] then
									local unitPlot = unit:GetPlot()
									if unitPlot == cityPlot then
										local randomvalue
										local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
										if iDistance == 1 then
											randomvalue = math.random(1,15)
											if randomvalue < 5 and teamTechs:HasTech(GameInfoTypes["TECH_POTTERY"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_GRANARY"], 1)
											end 
											randomvalue = math.random(1,20)
											if randomvalue < 5 and teamTechs:HasTech(GameInfoTypes["TECH_BRONZE_WORKING"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_BARRACKS"], 1) 
											end
											randomvalue = math.random(1,25)
											if randomvalue < 5 and teamTechs:HasTech(GameInfoTypes["TECH_POTTERY"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_SHRINE"], 1) 
											end
											randomvalue = math.random(1,30)
											if randomvalue < 5 and teamTechs:HasTech(GameInfoTypes["TECH_TRAPPING"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_CIRCUS"], 1) 
											end
										elseif iDistance == 2 then
											randomvalue = math.random(1,15)
											if randomvalue < 8 and teamTechs:HasTech(GameInfoTypes["TECH_POTTERY"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_GRANARY"], 1)
											end 
											randomvalue = math.random(1,20)
											if randomvalue < 9 and teamTechs:HasTech(GameInfoTypes["TECH_BRONZE_WORKING"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_BARRACKS"], 1) 
											end
											randomvalue = math.random(1,25)
											if randomvalue < 10 and teamTechs:HasTech(GameInfoTypes["TECH_POTTERY"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_SHRINE"], 1) 
											end
											randomvalue = math.random(1,30)
											if randomvalue < 11 and teamTechs:HasTech(GameInfoTypes["TECH_TRAPPING"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_CIRCUS"], 1) 
											end
										elseif iDistance == 3 then
											randomvalue = math.random(1,15)
											if randomvalue < 10 and teamTechs:HasTech(GameInfoTypes["TECH_POTTERY"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_GRANARY"], 1)
											end 
											randomvalue = math.random(1,20)
											if randomvalue < 11 and teamTechs:HasTech(GameInfoTypes["TECH_BRONZE_WORKING"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_BARRACKS"], 1) 
											end
											randomvalue = math.random(1,25)
											if randomvalue < 12 and teamTechs:HasTech(GameInfoTypes["TECH_POTTERY"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_SHRINE"], 1) 
											end
											randomvalue = math.random(1,30)
											if randomvalue < 13 and teamTechs:HasTech(GameInfoTypes["TECH_TRAPPING"]) then
												city:SetNumRealBuilding(GameInfoTypes["BUILDING_CIRCUS"], 1) 
											end
										end
									end
								end
							end
						end
					--end
				end
			end
		end
	end
end
Events.SerialEventCityCreated.Add(tcm_alanSpreadBonus) 

function tcm_alanSpreadBonusDoTurn(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_ALAN"] then
		for PoS in player:Cities() do
			if PoS:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANPOS"]) then 
				for city in player:Cities() do
					--if not city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_ALANBLOCKDUMMY"]) then 
						if Map.PlotDistance(city:GetX(), city:GetY(), PoS:GetX(), PoS:GetY()) <= 7 then
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSRAW"], 0)
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSHAPPINESS"], 0)
						elseif Map.PlotDistance(city:GetX(), city:GetY(), PoS:GetX(), PoS:GetY()) <= 11 then
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSRAW"], 1)
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSHAPPINESS"], 1) 
						elseif Map.PlotDistance(city:GetX(), city:GetY(), PoS:GetX(), PoS:GetY()) <= 17 then
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSMODIFIER"], 10) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSRAW"], 1) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSHAPPINESS"], 2) 
						else
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSMODIFIER"], 10) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSRAW"], 2) 
							city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ALANBONUSHAPPINESS"], 2) 
						end
					--end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcm_alanSpreadBonusDoTurn) 
			
--------------------------------------------------------------
function SaveTimer(iPlayer, iTurn)
	SetPersistentProperty(string.format("Player%iAlanTimer", iPlayer), iTurn)
end
--------------------------------------------------------------
function GetTimer(iPlayer)
	return GetPersistentProperty(string.format("Player%iAlanTimer", iPlayer)) or 0
end
--------------------------------------------------------------
function GetPersistentProperty(name)
	if(g_Properties == nil) then
		g_Properties = {};
	end
	
	if(g_Properties[name] == nil) then
		g_Properties[name] = gSaveData.GetValue(name);
	end
	
	return g_Properties[name];
end
--------------------------------------------------------------
function SetPersistentProperty(name, value)
	if(g_Properties == nil) then
		g_Properties = {};
	end
	
	gSaveData.SetValue(name, value);
	g_Properties[name] = value;
end
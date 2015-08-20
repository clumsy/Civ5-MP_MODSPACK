

function TCM_Ptolemy_Functions(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_PTOLEMAIC"] and player:IsAlive() then
	local capital = player:GetCapitalCity()
		if (player:GetGoldenAgeTurns() == 0) then
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY"], 0)
		elseif (player:GetGoldenAgeTurns() ~= 0) then
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY"], 1) -- Dummy 1
		end
	end
end
GameEvents.PlayerDoTurn.Add(TCM_Ptolemy_Functions)

function TCM_Ptolemy_Capital(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_PTOLEMAIC"] and player:IsAlive() then
		for city in player:Cities() do
			local capital = player:GetCapitalCity()
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY_2"], 0)
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY_2"], 1) --Dummy 2
		end
	end
end
GameEvents.PlayerDoTurn.Add(TCM_Ptolemy_Capital)

function TarcisioCM_PolyremeCanBuild(playerID, unitTypeID)
	local player = Players[playerID]
	local Polyreme = GameInfo.Units[unitTypeID].tcmGoldenAge
	if Polyreme then
		if (player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_PTOLEMAIC"]) and (player:GetGoldenAgeTurns() ~= 0)  then
			return true
		elseif not(player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_PTOLEMAIC"]) and (player:GetGoldenAgeTurns() == 0) then
			return false
		end
	else 
		return true
	end
end
GameEvents.PlayerCanTrain.Add(TarcisioCM_PolyremeCanBuild)

function TCM_PolyremeCulture(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_PTOLEMAIC"] then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY_3"], 0)	
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY_5"], 0)	
			local plot = city:Plot()
			for i = 0, plot:GetNumUnits() - 1, 1 do
				if plot:GetUnit(i):GetUnitType() == GameInfoTypes["UNIT_TCM_POLYREME"] then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY_3"], 1)	
					if city:IsHasBuilding(GameInfoTypes["BUILDING_HARBOR"]) then
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY_5"], 1)	
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TCM_PolyremeCulture)
GameEvents.UnitSetXY.Add(TCM_PolyremeCulture)

function GetPtolemy()
	if ptolemy == nil then	
		for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local player = Players[iPlayer];			
			if player ~= nil and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_PTOLEMAIC"] then
				ptolemy = player
				break
			end
		end
	end
	
	return ptolemy
end

function TCM_Serapeum(teamOne, teamTwo, bWar)
	if bWar then
		local ptolemy = GetPtolemy()
		if ptolemy then
			if Teams[teamOne]:IsMinorCiv() or Teams[teamOne]:IsBarbarian() then return end
			if Teams[teamTwo]:IsMinorCiv() or Teams[teamTwo]:IsBarbarian() then return end
			for city in ptolemy:Cities() do
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_SERAPEUM"]) then
					if teamOne == ptolemy:GetTeam() then
						if Teams[teamOne]:GetAtWarCount() == 1 then
							if (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_CLASSICAL"].ID) then
								player:InitUnit(GameInfoTypes["UNIT_WARRIOR"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_MEDIEVAL"].ID) then
								player:InitUnit(GameInfoTypes["UNIT_SPEARMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_RENAISSANCE"].ID) then
								player:InitUnit(GameInfoTypes["UNIT_PIKEMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
								player:InitUnit(GameInfoTypes["UNIT_MUSKETMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_MODERN"].ID) then
								player:InitUnit(GameInfoTypes["UNIT_RIFLEMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_POSTMODERN"].ID) then
								player:InitUnit(GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_FUTURE"].ID) then
								player:InitUnit(GameInfoTypes["UNIT_INFANTRY"], city:GetX(), city:GetY())
							end
						end
					elseif teamTwo == ptolemy:GetTeam() then
						if Teams[teamTwo]:GetAtWarCount() == 1 then
							if (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_CLASSICAL"].ID) then
								ptolemy:InitUnit(GameInfoTypes["UNIT_WARRIOR"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_MEDIEVAL"].ID) then
								ptolemy:InitUnit(GameInfoTypes["UNIT_SPEARMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_RENAISSANCE"].ID) then
								ptolemy:InitUnit(GameInfoTypes["UNIT_PIKEMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_INDUSTRIAL"].ID) then
								ptolemy:InitUnit(GameInfoTypes["UNIT_MUSKETMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_MODERN"].ID) then
								ptolemy:InitUnit(GameInfoTypes["UNIT_RIFLEMAN"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_POSTMODERN"].ID) then
								ptolemy:InitUnit(GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"], city:GetX(), city:GetY())
							
							elseif (ptolemy:GetCurrentEra() == GameInfo.Eras["ERA_FUTURE"].ID) then
								ptolemy:InitUnit(GameInfoTypes["UNIT_INFANTRY"], city:GetX(), city:GetY())
							end
						end
					end
				end
			end
		end
	end
end
Events.WarStateChanged.Add(TCM_Serapeum)





function TCM_SerapeumBonus(playerID)
	local player = Players[playerID]
	if player:IsEverAlive() and player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_PTOLEMAIC"] then
		for city in player:Cities() do
			if city:IsOccupied() then
				for city in player:Cities() do
					if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_SERAPEUM"]) then
						city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_PTOLEMY_DUMMY_4"], 1)	-- Dummy 4
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TCM_SerapeumBonus)

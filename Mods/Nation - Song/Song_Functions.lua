WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "TarcisioCMSong";
include("PlotIterators")
include("IconSupport")

function tcmGetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local tcmCityforSpecialist

function tcm_specialistWhenFounding(playerID, cityX, cityY)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_SONG"] then 
		local plot = Map.GetPlot(cityX, cityY)
		local city = plot:GetPlotCity()
		if player:IsHuman() then
			tcmCityforSpecialist = city
			LuaEvents.tcmChooseSpecialist()
		else
			songAIPlayer(city)
		end
	end
end
GameEvents.PlayerCityFounded.Add(tcm_specialistWhenFounding)  

function tcm_specialistWhenCapturing(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_SONG"] then 
		local plot = Map.GetPlot(iX, iY)
		local city = plot:GetPlotCity()
		if player:IsHuman() then
			tcmCityforSpecialist = city
			LuaEvents.tcmChooseSpecialist()
		else
			songAIPlayer(city)
		end
	end
end
GameEvents.CityCaptureComplete.Add(tcm_specialistWhenCapturing)

function tcm_GreatPersonBorn(playerID, unitID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_SONG"] then
		local oldNum = load(player, "tcmSongNumberGreatPeople")
		local currentNum = player:GetGreatPeopleCreated()
		if not(oldNum) then
			oldNum = 0
		end
		if currentNum > oldNum then
			local unit = player:GetUnitByID(unitID)
			local plot = unit:GetPlot()
			for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				local city = loopPlot:GetPlotCity()
				if city then 
					tcmCityforSpecialist = city
					if player:IsHuman() then
						local buildingID = GameInfoTypes["BUILDING_TCM_SONG_ENGINEER"]
						if city:GetNumSpecialistsInBuilding(buildingID) > 0 then
							city:DoTask(TaskTypes.TASK_REMOVE_SPECIALIST, 0, buildingID, 0)
						end
						buildingID = GameInfoTypes["BUILDING_TCM_SONG_SCIENTIST"]
						if city:GetNumSpecialistsInBuilding(buildingID) > 0 then
							city:DoTask(TaskTypes.TASK_REMOVE_SPECIALIST, 0, buildingID, 0)
						end
						buildingID = GameInfoTypes["BUILDING_TCM_SONG_MERCHANT"]
						if city:GetNumSpecialistsInBuilding(buildingID) > 0 then
							city:DoTask(TaskTypes.TASK_REMOVE_SPECIALIST, 0, buildingID, 0)
						end
						buildingID = GameInfoTypes["BUILDING_TCM_SONG_WRITER"]
						if city:GetNumSpecialistsInBuilding(buildingID) > 0 then
							city:DoTask(TaskTypes.TASK_REMOVE_SPECIALIST, 0, buildingID, 0)
						end
						buildingID = GameInfoTypes["BUILDING_TCM_SONG_ARTIST"]
						if city:GetNumSpecialistsInBuilding(buildingID) > 0 then
							city:DoTask(TaskTypes.TASK_REMOVE_SPECIALIST, 0, buildingID, 0)
						end
						buildingID = GameInfoTypes["BUILDING_TCM_SONG_MUSICIAN"]
						if city:GetNumSpecialistsInBuilding(buildingID) > 0 then
							city:DoTask(TaskTypes.TASK_REMOVE_SPECIALIST, 0, buildingID, 0)
						end
					end
					tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_ENGINEER"], 0)
					tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_SCIENTIST"], 0)
					tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_MERCHANT"], 0)
					tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_WRITER"], 0)
					tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_ARTIST"], 0)
					tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_MUSICIAN"], 0)
					city:DoReallocateCitizens()
					for otherCity in player:Cities() do
						local foodBoost = otherCity:GetYieldRate(YieldTypes.YIELD_FOOD) * 3
						otherCity:ChangeFood(foodBoost)
					end
					if player:IsHuman() then
						LuaEvents.tcmChooseSpecialist()
					else
						songAIPlayer(city)
					end
					break
				end
			end
		end
		save(player, "tcmSongNumberGreatPeople", currentNum)
	end
end
Events.SerialEventUnitCreated.Add(tcm_GreatPersonBorn)

function songAIPlayer(city)
	local random = tcmGetRandom(1,15)
	local specialist 
	if random > 10 then
		specialist = "SCIENTIST"
	elseif random > 5 then
		specialist = "ENGINEER"
	elseif random >= 4 then
		specialist = "WRITER"
	elseif random >= 3 then
		specialist = "MERCHANT"
	elseif random >= 2 then
		specialist = "ARTIST"
	else
		specialist = "MUSICIAN"
	end

	city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_" .. specialist], 1)
end
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
function ShowPopup()
	Controls.TCMPickSpecialistPopupBG:SetHide(false)
	Controls.TCMPickSpecialistPopup:SetHide(false)

	Controls.Engineer:LocalizeAndSetToolTip("TXT_KEY_SPECIALIST_ENGINEER")
	Controls.Scientist:LocalizeAndSetToolTip("TXT_KEY_SPECIALIST_SCIENTIST")
	Controls.Merchant:LocalizeAndSetToolTip("TXT_KEY_SPECIALIST_MERCHANT")
	Controls.Writer:LocalizeAndSetToolTip("TXT_KEY_SPECIALIST_WRITER")
	Controls.Artist:LocalizeAndSetToolTip("TXT_KEY_SPECIALIST_ARTIST")
	Controls.Musician:LocalizeAndSetToolTip("TXT_KEY_SPECIALIST_MUSICIAN")
end
LuaEvents.tcmChooseSpecialist.Add(function() ShowPopup() end)
--==========================================================================================================================
function OnEngineer()
	Controls.TCMPickSpecialistPopupBG:SetHide(true)
	Controls.TCMPickSpecialistPopup:SetHide(true)	

	tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_ENGINEER"], 1)
end
Controls.Engineer:RegisterCallback(Mouse.eLClick, OnEngineer)

function OnScientist()
	Controls.TCMPickSpecialistPopupBG:SetHide(true)
	Controls.TCMPickSpecialistPopup:SetHide(true)	

	tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_SCIENTIST"], 1)
end
Controls.Scientist:RegisterCallback(Mouse.eLClick, OnScientist)

function OnMerchant()
	Controls.TCMPickSpecialistPopupBG:SetHide(true)
	Controls.TCMPickSpecialistPopup:SetHide(true)	

	tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_MERCHANT"], 1)
end
Controls.Merchant:RegisterCallback(Mouse.eLClick, OnMerchant)

function OnWriter()
	Controls.TCMPickSpecialistPopupBG:SetHide(true)
	Controls.TCMPickSpecialistPopup:SetHide(true)	

	tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_WRITER"], 1)
end
Controls.Writer:RegisterCallback(Mouse.eLClick, OnWriter)

function OnArtist()
	Controls.TCMPickSpecialistPopupBG:SetHide(true)
	Controls.TCMPickSpecialistPopup:SetHide(true)	

	tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_ARTIST"], 1)
end
Controls.Artist:RegisterCallback(Mouse.eLClick, OnArtist)

function OnMusician()
	Controls.TCMPickSpecialistPopupBG:SetHide(true)
	Controls.TCMPickSpecialistPopup:SetHide(true)	

	tcmCityforSpecialist:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_MUSICIAN"], 1)
end
Controls.Musician:RegisterCallback(Mouse.eLClick, OnMusician)

Controls.Message:LocalizeAndSetText("TXT_KEY_TCM_SONG_CHOOSE_SPECIALIST")
IconHookup(23, 80, "CIV_COLOR_ATLAS", Controls.DialogTopIcon)
--==========================================================================================================================
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
function tcmSongPlotReset(playerID)
	local player = Players[playerID]
	if load(player, "tcmSongHasJunkBomber") == true then
		local resetJunkBomber = true
		for unit in player:Units() do
			local unitID = unit:GetID()
			save(player, "tcmSongJunkShipGold" .. unitID, false)
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_JUNK_DEFENSE"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_JUNK_DEFENSE"], false)
			end
			if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_JUNK_SHIP"] then
				local damage = unit:GetDamage()
				if damage >= 50 then
					if not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_JUNK_DEFENSE"])) then
						unit:ChangeMoves(1)
						unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_JUNK_DEFENSE"], true)
					end
				end
			end
		end
		if resetJunkBomber == true then
			save(player, "tcmSongHasJunkBomber", false)
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcmSongPlotReset)

function tcmSongBomberJunk(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_JUNK_SHIP"] then
		save(player, "tcmSongHasJunkBomber", true)
		if load(player, "tcmSongJunkShipGold" .. unitID) == false or load(player, "tcmSongJunkShipGold" .. unitID) == nil then
			for cargoShip in player:Units() do			
				if cargoShip:GetUnitType() == GameInfoTypes["UNIT_CARGO_SHIP"] then
					local cargoPlot = cargoShip:GetPlot()
					if plot == cargoPlot then
						local specialistNum = 0
						for city in player:Cities() do
							specialistNum = specialistNum + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_ENGINEER"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_SCIENTIST"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_MUSICIAN"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_ARTIST"]) + city:GetSpecialistCount(GameInfoTypes["SPECIALIST_WRITER"])
						end
						local gold = (specialistNum * 0.5) + 2
						player:ChangeGold(gold)
						save(player, "tcmSongJunkShipGold" .. unitID, true)
						break
					end
				end
			end
		end
		local damage = unit:GetDamage()
		if damage >= 50 then
			if not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_JUNK_DEFENSE"])) then
				unit:ChangeMoves(1)
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_JUNK_DEFENSE"], true)
			end
		end
	end
end
GameEvents.UnitSetXY.Add(tcmSongBomberJunk)
----------------------------------------------------------------------------------------------------------------------------
function tcmSongFireLancer(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if plot then
		if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_FIRE_LANCER"] then
			if plot:GetPlotCity() then
				local numMoves = unit:GetMoves()
				unit:SetMoves(0)
				newUnit = player:InitUnit(GameInfoTypes["UNIT_TCM_RANGED_FIRE_LANCER"], unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_FIRE_LANCER_DEFENSE"], true)
				newUnit:SetMoves(numMoves)
			end
		elseif unit:GetUnitType() == GameInfoTypes["UNIT_TCM_RANGED_FIRE_LANCER"] then
			if not(plot:GetPlotCity()) then
				local numMoves = unit:GetMoves()
				unit:SetMoves(0)
				newUnit = player:InitUnit(GameInfoTypes["UNIT_TCM_FIRE_LANCER"], unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_SONG_FIRE_LANCER_DEFENSE"], false)
				newUnit:SetMoves(numMoves)
			end
		end
	end 
end
GameEvents.UnitSetXY.Add(tcmSongFireLancer)

function tcmSongFireLancerBuildFaster(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_SONG"] then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_PRODUCTION"], 0)
			if city:GetProductionUnit() == GameInfoTypes["UNIT_TCM_FIRE_LANCER"] then
				local plot = city:Plot()
				for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
						local otherUnit = loopPlot:GetUnit(i)
						if otherUnit and otherUnit:GetOwner() ~= playerID and otherUnit:IsCombatUnit() then
							local otherPlayer = Players[otherUnit:GetOwner()]
							local otherTeam = Teams[otherPlayer:GetTeam()]
							local team = Teams[player:GetTeam()]
							if otherTeam:IsAtWar(team) then
								city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_SONG_PRODUCTION"], 1)
								break
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcmSongFireLancerBuildFaster)
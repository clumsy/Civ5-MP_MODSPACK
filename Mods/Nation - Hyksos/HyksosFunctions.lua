WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "TarcisioCMHyksosFunctions";
include("PlotIterators")
------------------------------------------------------------------------------------------
---------------------------------Why are you reading this---------------------------------
------------------------------------------------------------------------------------------
------------------------------------Begone vile demon!------------------------------------
------------------------------------------------------------------------------------------
------------------------------------Programmed by TCM.------------------------------------
---------------------------------(Except that bit below)----------------------------------
------------------------------------------------------------------------------------------
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--
------------------------------------------------------------------------------------------
---------------------------------Obviously taken from JFD---------------------------------
------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
local civilizationHyksosID	 = GameInfoTypes["CIVILIZATION_TCM_HYKSOS"]
local isCivHyksosActive		 = JFD_IsCivilisationActive(civilizationHyksosID)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function CultureAndScienceFromResistance(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_HYKSOS"] then
		local resistance = 0
		for city in player:Cities() do
			resistance = math.ceil((city:GetResistanceTurns() * 0.8) + resistance)
		end
		local capital = player:GetCapitalCity()
		capital:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_DUMMY_HYKSOS_SCIENCE_AND_CULTURE"], resistance)
	end
end
GameEvents.PlayerDoTurn.Add(CultureAndScienceFromResistance)

function CultureRecorder(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		local culture = city:GetJONSCulturePerTurn()
		if culture == nil then
			culture = 0
		end
		local plot = city:Plot()
		local previousCulture = load(plot, "tcmCultureThisCityHasGenerated")
		if previousCulture == nil then
			previousCulture = 0
		end
		culture = culture + previousCulture
		save(plot, "tcmCultureThisCityHasGenerated", culture)
	end
end
if isCivHyksosActive then
	GameEvents.PlayerDoTurn.Add(CultureRecorder)
end

function CultureFromCityCapture(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_HYKSOS"] then 
		local plot = Map.GetPlot(iX, iY)
		if not(load(plot, "tcmHyksosHaveAlreadyCapturedThis?") == true) then
			local loadedCulture = load(plot, "tcmCultureThisCityHasGenerated")
			if loadedCulture == nil then
				loadedCulture = 1
			end
			local culture =  math.ceil((loadedCulture / 100) * 15)
			player:ChangeJONSCulture(culture)
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey(culture) .. " Culture was gained from the capture of this city")
			end
			save(plot, "tcmHyksosHaveAlreadyCapturedThis?", true)
		end
	end
end
GameEvents.CityCaptureComplete.Add(CultureFromCityCapture)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function MekterExperience(ownerId, cityId, buildingType, bGold, bFaithOrCulture)
	local player = Players[ownerId]
	local city = player:GetCityByID(cityId)
	local plot = city:Plot()
	--I forgot how this gameevent works so I'm improvising here bear with me bruh
	local potato = GameInfo.Buildings[buildingType].Description
	if potato == "TXT_KEY_BUILDING_TCM_MEKTER" then
		if city:IsOccupied() then
			if not(load(plot, "tcmHyksosHaveAlreadyBuiltThisHere") == true) then
				for unit in player:Units() do
					local experience = load(unit, "tcmHyksosExperienceFromMekterGained")
					if experience == nil then
						experience = 0
					end
					if experience < 15 then
						local expGainedNow = 3
						if load(unit, "tcmHyksosCityHadMekter") == false or load(unit, "tcmHyksosCityHadMekter") == nil then
							expGainedNow = 5
						end
						unit:ChangeExperience(expGainedNow)
						experience = experience + expGainedNow
						save(unit, "tcmHyksosExperienceFromMekterGained", experience)
					end
				end
				save(plot, "tcmHyksosHaveAlreadyBuiltThisHere?", true)
			end
		end 
	end
end
GameEvents.CityConstructed.Add(MekterExperience)

function mekterExperienceClean(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	if bDelay then
		local player = Players[unitOwnerId]
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_HYKSOS"] then
			local unit = player:GetUnitByID(unitId)
			save(unit, "tcmHyksosExperienceFromMekterGained", nil)
			save(unit, "tcmHyksosCityHadMekter", nil)
		end
	end
end
GameEvents.UnitPrekill.Add(mekterExperienceClean)

function mekterExperienceUpgrade(playerId, unitId, newUnitId, bGoodyHut)
	local player = Players[playerId]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_HYKSOS"] then
		local unit = player:GetUnitByID(unitId)
		local newUnit = player:GetUnitByID(newUnitId)

		local one = load(unit, "tcmHyksosExperienceFromMekterGained")
		local two = load(unit, "tcmHyksosCityHadMekter")

		save(newUnit, "tcmHyksosExperienceFromMekterGained", one)
		save(newUnit, "tcmHyksosCityHadMekter", two)
		save(unit, "tcmHyksosExperienceFromMekterGained", nil)
		save(unit, "tcmHyksosCityHadMekter", nil)
	end
end
GameEvents.UnitUpgraded.Add(mekterExperienceUpgrade)

function unitTrainedWithMekter(playerID, unitID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_HYKSOS"] then
		local unit = player:GetUnitByID(unitID)
		local plot = unit:GetPlot()
		local city = plot:GetPlotCity()
		if city then 
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_MEKTER"]) then
				save(unit, "tcmHyksosCityHadMekter", true)
			end
		end
	end
end
Events.SerialEventUnitCreated.Add(unitTrainedWithMekter)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function chariotBuildFort(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if not(unit:IsEmbarked()) then
		if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_HEQA_KHASUT_FORT"] and plot then
			--Why do I need to know if the unit is in a city? Because this will not only fire when it moves (As intended), but also when the
			--unit is created. And if they are instantly converted to the "UNIT_TCM_HEQA_KHASUT_NOT_FORT" version (Or vice versa) of the unit
			--on the same second they are created, no experience from buildings, traits, policies, etc... will be awarded to the unit. So the
			--easiest fix for this is make this function only do stuff if the unit is not inside a city.
			local garrisonedCity = plot:GetPlotCity()
			if not(garrisonedCity) then
				local removeFortBuild = true
				for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					local city = loopPlot:GetPlotCity()
					if city and city:GetOwner() == playerID then
							if city:IsPuppet() or city:IsOccupied() then
								removeFortBuild = false
							break
						end
					end
				end
				if removeFortBuild == true then
					local numMoves = unit:GetMoves()
					--Remove movements so the unit is not duplicated while moving at the same time it is converted.
					unit:SetMoves(0)
					newUnit = player:InitUnit(GameInfoTypes["UNIT_TCM_HEQA_KHASUT_NOT_FORT"], unit:GetX(), unit:GetY())
					newUnit:Convert(unit)
					newUnit:SetMoves(numMoves)
				end
			end
		elseif unit:GetUnitType() == GameInfoTypes["UNIT_TCM_HEQA_KHASUT_NOT_FORT"] and plot then
			local garrisonedCity = plot:GetPlotCity()
			if not(garrisonedCity) then
				local addFortBuild = false
				for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					local city = loopPlot:GetPlotCity()
					if city and city:GetOwner() == playerID then
						if city:IsPuppet() or city:IsOccupied() then
							addFortBuild = true
							break
						end
					end
				end
				if addFortBuild == true then
					local numMoves = unit:GetMoves()
					unit:SetMoves(0)
					newUnit = player:InitUnit(GameInfoTypes["UNIT_TCM_HEQA_KHASUT_FORT"], unit:GetX(), unit:GetY())
					newUnit:Convert(unit)
					newUnit:SetMoves(numMoves)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(chariotBuildFort)

function buildFort(playerID, plotX, plotY, improvementID) 
	local player = Players[playerID]
	if improvementID == GameInfoTypes["IMPROVEMENT_FORT"] then
		local plot = Map.GetPlot(plotX, plotY)
		if player:HasPolicy(GameInfoTypes["POLICY_TCM_HYKSOS_DECISION"]) then
			for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if loopPlot:IsCity() then
					local city = loopPlot:GetPlotCity()
					local productionPerTurn = city:GetYieldRate(YieldTypes.YIELD_PRODUCTION) * 1.5
					city:ChangeProduction(productionPerTurn)
				end
			end
		end

		for i = 0, plot:GetNumUnits() - 1, 1 do  
			local unit = plot:GetUnit(i)
			if unit and unit:GetOwner() == playerID and unit:GetUnitType() == GameInfoTypes["UNIT_TCM_HEQA_KHASUT_FORT"] then
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if loopPlot:GetOwner() == playerID then
						if loopPlot:IsImprovementPillaged() then
							loopPlot:SetImprovementPillaged(false)
						end
						if (loopPlot:GetImprovementType() == -1) and not(loopPlot:IsCity()) then
							local plotResource = loopPlot:GetResourceType()
							if loopPlot:GetResourceType() ~= -1 then
								if GameInfo.Resources[plotResource].ResourceClassType == "RESOURCECLASS_RUSH" or GameInfo.Resources[plotResource].ResourceClassType == "RESOURCECLASS_LUXURY" then
									local teamTechs = Teams[player:GetTeam()]:GetTeamTechs()
									if loopPlot:CanBuild(GameInfoTypes["BUILD_MINE"], player) and teamTechs:HasTech(GameInfoTypes["TECH_MINING"]) then
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_FOREST"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_MARSH"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_JUNGLE"], 1000, team)
										loopPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_MINE"])
									end
									if loopPlot:CanBuild(GameInfoTypes["BUILD_PASTURE"], player) and teamTechs:HasTech(GameInfoTypes["TECH_ANIMAL_HUSBANDRY"]) then
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_FOREST"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_MARSH"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_JUNGLE"], 1000, team)
										loopPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_PASTURE"])
									end
									if loopPlot:CanBuild(GameInfoTypes["BUILD_QUARRY"], player) and teamTechs:HasTech(GameInfoTypes["TECH_MASONRY"]) then
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_FOREST"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_MARSH"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_JUNGLE"], 1000, team)
										loopPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_QUARRY"])
									end
									if loopPlot:CanBuild(GameInfoTypes["BUILD_PLANTATION"], player) and teamTechs:HasTech(GameInfoTypes["TECH_CALENDAR"]) then
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_FOREST"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_MARSH"], 1000, team)
										loopPlot:ChangeBuildProgress(GameInfoTypes["BUILD_REMOVE_JUNGLE"], 1000, team)
										loopPlot:SetImprovementType(GameInfoTypes["IMPROVEMENT_PLANTATION"])
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.BuildFinished.Add(buildFort)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
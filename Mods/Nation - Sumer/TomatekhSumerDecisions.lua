--Tomatekh

print("Sumer Decisions")

local bClassZigg = GameInfoTypes.BUILDINGCLASS_TEMPLE;
local bCuneiform = GameInfoTypes.BUILDING_AKKADIAN_MOD_ZIGGURAT_DECISIONS_DUMMY;
local tWriting = GameInfoTypes.TECH_WRITING;

local WheatID = GameInfo.Units["UNIT_SUMER_WHEAT_DUMMY"].ID;

local tPlains = GameInfoTypes.TERRAIN_PLAINS;
local tGrass = GameInfoTypes.TERRAIN_GRASS;
local fFloodPlains = GameInfoTypes.FEATURE_FLOOD_PLAINS;
local fForest = GameInfoTypes.FEATURE_FOREST;
local fJungle = GameInfoTypes.FEATURE_JUNGLE;

local rWheat = GameInfoTypes.RESOURCE_WHEAT;
local iFarm = GameInfoTypes.IMPROVEMENT_FARM;

function SumGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

--Agriculture

local iPasture = GameInfo.Improvements["IMPROVEMENT_PASTURE"].ID

local Decisions_SumerAgriculture = {}
	Decisions_SumerAgriculture.Name = "TXT_KEY_DECISIONS_TOMATEKH_SUMER_AGRICULTURE"
	Decisions_SumerAgriculture.Desc = "TXT_KEY_DECISIONS_TOMATEKH_SUMER_AGRICULTURE_DESC"
	HookDecisionCivilizationIcon(Decisions_SumerAgriculture, "CIVILIZATION_AKKADIAN_MOD")
	Decisions_SumerAgriculture.Weight = nil
	Decisions_SumerAgriculture.CanFunc = (
	function(pPlayer)
	
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_AKKADIAN_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_SumerAgriculture") == true then
			Decisions_SumerAgriculture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SUMER_AGRICULTURE_ENACTED_DESC")
			return false, false, true
		end		

		Decisions_SumerAgriculture.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SUMER_AGRICULTURE_DESC")

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_RENAISSANCE"] then return true, false end

		local iPastureCount = pPlayer:GetImprovementCount(iPasture)
		if iPastureCount < 1 then return true, false end
	
		return true, true
	end
	)
	
	Decisions_SumerAgriculture.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local pID = pPlayer:GetID()
		local pTeam = pPlayer:GetTeam()
		local pcCity = pPlayer:GetCapitalCity();
		local bWheatCheck = 0;
		local bWheatCount = 1;
		local plotX = pcCity:GetX();
		local plotY = pcCity:GetY();
		for iDX = -2, 2 do
			for iDY = -2, 2 do
				local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, 2);
				if pTargetPlot then
					if (pTargetPlot:GetOwner() == -1) or (pTargetPlot:GetOwner() == pID) then
						if (pTargetPlot:GetResourceType() == -1) then
							if (pTargetPlot:GetTerrainType() == tPlains) or (pTargetPlot:GetFeatureType() == fFloodPlains) then
								if not pTargetPlot:IsCity() and not pTargetPlot:IsMountain() and not pTargetPlot:IsImpassable() and not pTargetPlot:IsHills() and (pTargetPlot:GetFeatureType() ~= fForest) and (pTargetPlot:GetFeatureType() ~= fJungle) then
									if bWheatCount == 1 then 
										pTargetPlot:SetResourceType(rWheat, 1)
										if (pTargetPlot:GetImprovementType() == iFarm) then
											pTargetPlot:SetImprovementType(-1);
											pTargetPlot:SetImprovementType(iFarm);
										elseif (pTargetPlot:GetImprovementType() == -1) then
											pTargetPlot:SetImprovementType(iFarm);
										end
										pTargetPlot:SetRevealed(pTeam, true)
										local title = "Wheat Field";
										local descr = "Farmers have planted a field of [ICON_RES_WHEAT] Wheat near " .. pcCity:GetName() .. ".";
										pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pTargetPlot:GetX(), pTargetPlot:GetY(), WheatID, -1);
										bWheatCount = 0;
										bWheatCheck = 1;
										break	
									end	
								end
							end
						end
					end
				end
			end
		end
		if bWheatCheck < 1 then 
			bWheatCount = 1;
			for iDX = -3, 3 do
				for iDY = -3, 3 do
					local pTargetPlot = Map.PlotXYWithRangeCheck(plotX, plotY, iDX, iDY, 3);
					if pTargetPlot then
						if (pTargetPlot:GetOwner() == -1) or (pTargetPlot:GetOwner() == pID) then
							if (pTargetPlot:GetResourceType() == -1) then
								if (pTargetPlot:GetTerrainType() == tGrass) then
									if not pTargetPlot:IsCity() and not pTargetPlot:IsMountain() and not pTargetPlot:IsImpassable() and not pTargetPlot:IsHills() and (pTargetPlot:GetFeatureType() ~= fForest) and (pTargetPlot:GetFeatureType() ~= fJungle) then
										if bWheatCount == 1 then 
											pTargetPlot:SetResourceType(rWheat, 1)
											if (pTargetPlot:GetImprovementType() == iFarm) then
												pTargetPlot:SetImprovementType(-1);
												pTargetPlot:SetImprovementType(iFarm);
											elseif (pTargetPlot:GetImprovementType() == -1) then
												pTargetPlot:SetImprovementType(iFarm);
											end
											pTargetPlot:SetRevealed(pTeam, true)
											local title = "Wheat Field";
											local descr = "Farmers have planted a field of [ICON_RES_WHEAT] Wheat near " .. pcCity:GetName() .. ".";
											pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, descr, title, pTargetPlot:GetX(), pTargetPlot:GetY(), WheatID, -1);
											bWheatCount = 0;
											break		
										end
									end
								end
							end
						end
					end
				end
			end
		end

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_SUMER_AGRICULTURE"], true)

		save(pPlayer, "Decisions_SumerAgriculture", true)

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_AKKADIAN_MOD"], "Decisions_SumerAgriculture", Decisions_SumerAgriculture)

--Cuneiform

local Decisions_SumerCuneiform = {}
	Decisions_SumerCuneiform.Name = "TXT_KEY_DECISIONS_TOMATEKH_SUMER_CUNEIFORM"
	Decisions_SumerCuneiform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SUMER_CUNEIFORM_DESC")
	HookDecisionCivilizationIcon(Decisions_SumerCuneiform, "CIVILIZATION_AKKADIAN_MOD")
	Decisions_SumerCuneiform.Weight = nil
	Decisions_SumerCuneiform.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_AKKADIAN_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_SumerCuneiform") == true then
			Decisions_SumerCuneiform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_SUMER_CUNEIFORM_ENACTED_DESC")
			return false, false, true
		end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end

		if not (Teams[pPlayer:GetTeam()]:IsHasTech(tWriting)) then return true, false end
		return true, true
	end
	)
	
	Decisions_SumerCuneiform.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:GetCapitalCity():SetNumRealBuilding(bCuneiform, 1)
		save(pPlayer, "Decisions_SumerCuneiform", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_AKKADIAN_MOD"], "Decisions_SumerCuneiform", Decisions_SumerCuneiform)

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_AKKADIAN_MOD) then
			if load(pPlayer, "Decisions_SumerCuneiform") == true then
				for pCity in pPlayer:Cities() do
					if pCity:IsCapital() then
						if not (pCity:GetNumBuilding(bCuneiform) > 0) then
							pCity:SetNumRealBuilding(bCuneiform, 1);
						end
					end
				end
			end
		end
	end
end)
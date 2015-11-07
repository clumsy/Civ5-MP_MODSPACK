-- Whoward's Civ Specific Events

iMyCiv = GameInfoTypes.CIVILIZATION_MAPUCHE

function IsCivInPlay(iCivType)
  for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
    local iSlotStatus = PreGame.GetSlotStatus(iSlot)
    if (iSlotStatus == SlotStatus.SS_TAKEN or iSlotStatus == SlotStatus.SS_COMPUTER) then
      if (PreGame.GetCivilization(iSlot) == iCivType) then
        return true
      end
    end
  end
  
  return false
end




-- Chemamullscripts
-- Author: Leugi
-- DateCreated: 7/16/2014 10:48:33 AM
--------------------------------------------------------------

local iCivType = GameInfoTypes.CIVILIZATION_MAPUCHE
local ChPromo = GameInfoTypes.PROMOTION_CHEMAMULL;

iTeam = -1
oTeam = -1
pTeam = -1
teamID = -1

print ("This is the Chemamull script")

-- Chemamull's Promotion

function CheckChemamull (iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == iCivType) then
			for pUnit in pPlayer:Units() do
				local uPlot = pUnit:GetPlot();
				if uPlot ~= nil then
					if uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_CHEMAMULL.ID then
						pUnit:SetHasPromotion(ChPromo,true);
						if (uPlot:GetOwner() ~= pUnit:GetOwner() and uPlot:GetOwner() ~= -1) then
							local oTeam = uPlot:GetTeam()
							--local oTeam = Teams[iTeam]

							local teamID = pUnit:GetTeam();
							local pTeam = Teams[teamID];
							print ("prewar")
							--print ((pTeam:GetNumMembers()))
							--print ((oTeam:GetNumMembers()))
							local bWar = pTeam:IsAtWar(oTeam);
							print (bWar)
							if (not bWar) then
							else
								print ("At War")
								if uPlot:IsImprovementPillaged() then
									local pID = pPlayer:GetID()
									uPlot:SetOwner(pID)
									uPlot:SetImprovementPillaged(false);
									if (pPlayer:IsHuman()) then
										local name = pUnit:GetName();
										if pUnit:IsGreatPerson() then
											local alert = Locale.ConvertTextKey("TXT_KEY_CHEMAMULL_REPAIR_ALERT_GP", name);
											Events.GameplayAlertMessage(alert)
										else
											local alert = Locale.ConvertTextKey("TXT_KEY_CHEMAMULL_REPAIR_ALERT", name);
											Events.GameplayAlertMessage(alert)
										end
									end
								end
							end
						elseif uPlot:GetOwner()== -1 then
							if uPlot:IsImprovementPillaged() then	
								local pID = pPlayer:GetID()
								uPlot:SetOwner(pID)
								uPlot:SetImprovementPillaged(false);
								if (pPlayer:IsHuman()) then
									local name = pUnit:GetName();
									if pUnit:IsGreatPerson() then
										local alert = Locale.ConvertTextKey("TXT_KEY_CHEMAMULL_REPAIR_ALERT_GP", name);
										Events.GameplayAlertMessage(alert)
									else
										local alert = Locale.ConvertTextKey("TXT_KEY_CHEMAMULL_REPAIR_ALERT", name);
										Events.GameplayAlertMessage(alert)
									end
								end	
							end			
						end
	
					else
						pUnit:SetHasPromotion(ChPromo,false);
					end
				end
			end
		end
	end
end


-- Pillage removes territory

local t = {}


function onImprovementCreated(iHexX, iHexY, iContinent1, iContinent2)
	local pPlot = Map.GetPlot(ToGridFromHex(iHexX, iHexY))
	--local sImprovement = Map.GetImprovementType() > -1 and GameInfo.Improvements{Map.GetImprovementType()}().Type or "Improvement in progress"
	--local plotOwner = pPlot:GetOwner() > -1 and Players[pPlot:GetOwner()]:GetName() or "nobody"
	--print(string.format("%s built on tile %d, %d by player %d. Plot owned by %s", sImprovement, pPlot:GetX(), pPlot:GetY(), iPlayerID, plotOwner))
	if pPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_CHEMAMULL.ID then
		if pPlot:IsImprovementPillaged() then
			--if not pPlot:IsBeingWorked() then
				pPlot:SetOwner(-1)	
				for _, pPlayer in pairs(Players) do
					if (pPlayer:IsAlive()) then
						for pCity in pPlayer:Cities() do
							local iPlotCost = pCity:GetBuyPlotCost( pPlot:GetX(), pPlot:GetY() )
							local anticost = 0 - iPlotCost
							--print (pPlayer:GetGold())
							pPlayer:ChangeGold (iPlotCost);
							if (pCity:CanBuyPlotAt(pPlot:GetX(), pPlot:GetY(), false)) then
								print (pPlayer:GetName())
								pPlot:SetOwner(pCity:GetOwner())
								pPlot:SetOwnershipDuration(1);
								--print ((pPlot:GetOwner()):GetName())
							end
							pPlayer:ChangeGold (anticost);
							--print (pPlayer:GetGold())
						end
					end
				end
			--end
		end
	end
end







-- Dissappears once an AI non-mapuche worker starts its turn on chemamull
local iWorkerID = GameInfo.Units.UNIT_WORKER.ID

function KillChem (iPlayer)
	local pPlayer = Players[iPlayer];
	if not (pPlayer:IsHuman()) then
		if not (pPlayer:GetCivilizationType() == iCivType) then
			for pUnit in pPlayer:Units() do
				local uPlot = pUnit:GetPlot();
				if uPlot ~= nil then
					if uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_CHEMAMULL.ID then
						if (pUnit:GetUnitType() == iWorkerID) then
							if (uPlot:GetOwner() == pUnit:GetOwner()) then
								uPlot:SetImprovementType(-1)
							end
						end
					end
				end
			end
		end
	end
end







function GetUnpillagedChem (iPlayer)
	for iPlotLoop = 0, Map.GetNumPlots()-1, 1 do
		local pPlot = Map.GetPlotByIndex(iPlotLoop)
		if pPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_CHEMAMULL.ID then
			if not (pPlot:IsImprovementPillaged()) then
				if pPlot:GetOwner()== -1 then
					for _, pPlayer in pairs(Players) do 
						if (pPlayer:IsAlive()) then
							if (pPlayer:GetCivilizationType() == iCivType) then
								local pID = pPlayer:GetID()
								pPlot:SetOwner(pID)
							end
						end
					end
				end
			end
		end
	end
end



-- Chemamull's Generation


deadUnit = nil
deadUnitT = nil
deadPlot = nil
deadOwner = nil
Mapucheck = 0

function OnCanSaveUnit(iPlayer, iUnit)
	--fires for both combat and non-combat death (disband, settler settled, etc)
	--for combat death, fires right before and after OnUnitKilledInCombat; use this to capture unit data before death
	unit = Players[iPlayer]:GetUnitByID(iUnit)
	unitTypeID = unit and unit:GetUnitType()
	--print("CanSaveUnit Listener test; iPlayer, iUnit, unitType = ", iPlayer, iUnit, unitTypeID and GameInfo.Units[unitTypeID].Type)
	g_infoAboutUnitX = unit:GetX()
	g_infoAboutUnitY = unit:GetY()
	g_infoAboutUnitDMG = unit:GetDamage()
	--etc...
	--return false
	pPlayer = Players[iPlayer]

	-- Now, let's make our globals work!
	deadUnit = unit;
	deadPlot = Map.GetPlot(g_infoAboutUnitX, g_infoAboutUnitY)
	deadUnitT = unitTypeID
	deadOwner = pPlayer

	if (deadOwner:GetCivilizationType() == iCivType) then
		Mapucheck = 1
		print ("A Mapuche unit is lost")
	else
		Mapucheck = 0
	end
end



local iPrereq = GameInfo.Technologies["TECH_CALENDAR"].ID
local iToquiID = GameInfo.Units.UNIT_TOQUI.ID
local direction_types = {
                        DirectionTypes.DIRECTION_NORTHEAST,
                        DirectionTypes.DIRECTION_EAST,
                        DirectionTypes.DIRECTION_SOUTHEAST,
                        DirectionTypes.DIRECTION_SOUTHWEST,
                        DirectionTypes.DIRECTION_WEST,
                        DirectionTypes.DIRECTION_NORTHWEST
                }



function CreateChemamull(iKiller, iPlayer, iUnitType)
	if Mapucheck == 1 then
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() == iCivType) then
		if pPlayer == deadOwner then
			if (deadUnit:GetUnitType() == iUnitType) then
				print ("... and the Mapuche Unit actually died on combat")
				local teamID = pPlayer:GetTeam();
				local pTeam = Teams[teamID];
				if (pTeam:IsHasTech(iPrereq)) then
					if (deadPlot:GetImprovementType() == -1) then
						--for _, mPlayer in pairs(Players) do
						--if (mPlayer:IsAlive()) then
						--if (mPlayer:GetCivilizationType() == iCivType) then
						if not deadPlot:IsWater() then
							deadPlot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_CHEMAMULL.ID)
							print ("A Chemamull has been created")
							local pID = pPlayer:GetID()
							deadPlot:SetOwner(pID)
						--end
						--end
						--end
						end
					end
					if deadPlot:IsImprovementPillaged() then
						deadPlot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_CHEMAMULL.ID)
						print ("A Chemamull has been created on a pillaged tile")
							local pID = pPlayer:GetID()
							deadPlot:SetOwner(pID)
						if iUnitType == iToquiID then

							for a, direction in ipairs(direction_types) do
								local pNextPlot = Map.PlotDirection(deadPlot:GetX(), deadPlot:GetY(), direction)
								if pNextPlot ~= nil then
									if not (pNextPlot:IsCity()) then
										--pNextPlot:SetOwner(pPlayer)
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
	deadUnit = nil
	deadUnitT = nil
	deadPlot = nil
	deadOwner = nil
	Mapucheck = 0
end





if (IsCivInPlay(iMyCiv)) then
  	GameEvents.UnitKilledInCombat.Add(CreateChemamull)
	GameEvents.CanSaveUnit.Add(OnCanSaveUnit)
	GameEvents.PlayerDoTurn.Add(GetUnpillagedChem);
	GameEvents.PlayerDoTurn.Add(KillChem);
	Events.SerialEventImprovementCreated.Add(onImprovementCreated)
	GameEvents.PlayerDoTurn.Add(CheckChemamull);
end
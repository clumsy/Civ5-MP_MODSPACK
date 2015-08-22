-- Lua Script1
-- Author: good ol' almighty whoward
-- DateCreated: 3/28/2013 2:47:51 PM
--------------------------------------------------------------
print("The Gran Colombia Mod Lua loaded succesfully")

local iCivGranColombia = GameInfoTypes.CIVILIZATION_GRANCOLOMBIA
local iBuildingCourtHouse = GameInfoTypes.BUILDING_COURTHOUSE
GCpolicycount = 0

function OnCityCaptureComplete(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
  print("A city has been acquired by someone ...")
  local pNewOwner = Players[iNewOwner]

  -- Despite being named "Type", GetCivilizationType() actually returns the ID column from the Civilizations table - thanks Firaxis!!!
  if (pNewOwner:GetCivilizationType() == iCivGranColombia) then
    print("  ... Gran Colombia acquired the city")
    local pCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
		
    if (pCity:IsOccupied() and not pCity:IsRazing()) then
      print("  ... giving the city a court house")
      pCity:SetNumRealBuilding(iBuildingCourtHouse, 1)
    end
  end
end
GameEvents.CityCaptureComplete.Add(OnCityCaptureComplete)



local GoldenAgeBoost = 12

function OnCityCaptureCompleteBoost(iPlayer, bCapital, iX, iY, iNewPlayer)
  -- Did a minor just acquire a new city?
  if (iNewPlayer >= GameDefines.MAX_MAJOR_CIVS) then
    local pPlot = Map.GetPlot(iX, iY)
    local pCity = pPlot:GetPlotCity()

    -- Is it their original capital?
    if (pCity and pCity:GetOriginalOwner() == iNewPlayer and pCity:IsOriginalCapital()) then
      -- It's just possible they recaptured it, so check the units at the plot
      for iPlotUnit = 0, pPlot:GetNumUnits()-1, 1 do
        local pPlotUnit = pPlot:GetUnit(iPlotUnit)
        if (pPlotUnit:GetOwner() == iPlayer and pPlotUnit:IsCombatUnit()) then
          -- iPlayer, who just returned the capital to the minor, has a combat unit in the city
          -- the only way this can happen is if the player just captured and liberated the minor
          -- so give the liberating player a large culture boost
          local pPlayer = Players[iPlayer]
		  local GAturns = pPlayer:GetGoldenAgeTurns();
		  pPlayer:ChangeGoldenAgeTurns(GAturns + GoldenAgeBoost)
          if (pPlayer:IsHuman() and Game.GetActivePlayer() == iPlayer) then
            -- These should be TXT_KEY_s
            local sHeading = Locale.ConvertTextKey("City State Liberated!")
            local sText = Locale.ConvertTextKey("You have liberated {1_CityState} and have started a Golden Age!", pCity:GetName(), iLiberationCultureBoost)
            -- Send them a "Thank-You" card!
            pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GOLDEN_AGE_BEGUN_ACTIVE_PLAYER, sText, sHeading)
          end
          break
        end
      end
    end
  end
end
GameEvents.CityCaptureComplete.Add(OnCityCaptureCompleteBoost);
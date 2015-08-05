-- CSA Decisions
-- Author: Vicevirtuoso
-- DateCreated: 8/24/2014 6:37:08 PM
--------------------------------------------------------------
 
local Decisions_CSAGoldenCircle = {}
        Decisions_CSAGoldenCircle.Name = "TXT_KEY_DECISIONS_CSA_GOLDEN_CIRCLE"
        Decisions_CSAGoldenCircle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CSA_GOLDEN_CIRCLE_DESC")
        HookDecisionCivilizationIcon(Decisions_CSAGoldenCircle, "CIVILIZATION_CSA")
        Decisions_CSAGoldenCircle.CanFunc = (
        function(pPlayer)
                if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CSA) then
                        return false, false
                end
                if load(pPlayer, "Decisions_CSAGoldenCircle") == true then
                        Decisions_CSAGoldenCircle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CSA_GOLDEN_CIRCLE_ENACTED_DESC")
                        return false, false, true
                end
                               
                                local iEra = pPlayer:GetCurrentEra()
                                if iEra <= GameInfoTypes.ERA_ANCIENT then return true, false end
               
                local iGoldCost = math.ceil(500 * iMod)
                local iCultureCost = math.ceil(100 * iMod)
                Decisions_CSAGoldenCircle.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CSA_GOLDEN_CIRCLE_DESC", iGoldCost, iCultureCost)
               
                if pPlayer:GetGold() < iGoldCost then return true, false end
                if pPlayer:GetJONSCulture() < iCultureCost then return true, false end
                if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
                               
                                local pTeam = Teams[pPlayer:GetTeam()]
                                for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
                                        local pCityState = Players[i]
                                        if pCityState:IsAlive() and pTeam:IsAtWar(pCityState:GetTeam()) then
                                                return true, true
                                        end
                                end
               
                return true, false
        end
        )
       
        Decisions_CSAGoldenCircle.DoFunc = (
        function(pPlayer)
                local iGoldCost = math.ceil(500 * iMod)
                local iCultureCost = math.ceil(100 * iMod)
                pPlayer:ChangeGold(-iGoldCost)
                pPlayer:ChangeJONSCulture(-iCultureCost)
                pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
               
                pPlayer:SetNumFreePolicies(1)
                pPlayer:SetHasPolicy(GameInfoTypes.POLICY_CSA_GOLDEN_CIRCLE, true)
                pPlayer:SetNumFreePolicies(0)
               
                save(pPlayer, "Decisions_CSAGoldenCircle", true)
        end
        )
 
        Decisions_CSAGoldenCircle.Monitors = {}
        Decisions_CSAGoldenCircle.Monitors[GameEvents.CityCaptureComplete] =  (
        function(iVictim, bCapital, iX, iY, iConqueror, iPop, bConquest)
                if bConquest == true and iConqueror < GameDefines.MAX_MAJOR_CIVS and iVictim >= GameDefines.MAX_MAJOR_CIVS then
                        local pPlayer = Players[iConqueror]
                        if load(pPlayer, "Decisions_CSAGoldenCircle") == true then
                                local pCity = Map.GetPlot(iX, iY):GetPlotCity()
                                if pCity then
                                        pCity:ChangeResistanceTurns(pCity:GetResistanceTurns() * -1)
                                end
                        end
                end
        end
        )
 
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CSA, "Decisions_CSAGoldenCircle", Decisions_CSAGoldenCircle)
 
 
--------------------------------------------------------------------------------------------------------------------------------------------
 
 
local Decisions_CSAVirginia = {}
        Decisions_CSAVirginia.Name = "TXT_KEY_DECISIONS_CSA_CSS_VIRGINIA"
        Decisions_CSAVirginia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CSA_CSS_VIRGINIA_DESC")
        HookDecisionCivilizationIcon(Decisions_CSAVirginia, "CIVILIZATION_CSA")
        Decisions_CSAVirginia.CanFunc = (
        function(pPlayer)
                if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_CSA) then
                        return false, false
                end
                if load(pPlayer, "Decisions_CSAVirginia") == true then
                        Decisions_CSAVirginia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CSA_CSS_VIRGINIA_ENACTED_DESC")
                        return false, false, true
                end
 
                local iCost = math.ceil(1000 * iMod)
                Decisions_CSAVirginia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_CSA_CSS_VIRGINIA_DESC", iCost)
               
                if pPlayer:GetGold() < iCost then return true, false end
 
                if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
               
                if (pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_COAL, true) < 1) then return true, false end
                               
                                local pTeam = Teams[pPlayer:GetTeam()]
                                local pTeamTechs = pTeam:GetTeamTechs()
                               
                                if not pTeamTechs:HasTech(GameInfoTypes.TECH_INDUSTRIALIZATION) then return true, false end
 
                for pUnit in pPlayer:Units() do
                        if pUnit:GetUnitType() == GameInfoTypes.UNIT_FRIGATE and pUnit:GetPlot():IsCity() then
                                return true, true
                        end
                end
 
                return true, false
        end
        )
       
        Decisions_CSAVirginia.DoFunc = (
        function(pPlayer)
                local iCost = math.ceil(1000 * iMod)
                pPlayer:ChangeGold(-iCost)
                pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
                for pUnit in pPlayer:Units() do
                        if pUnit:GetUnitType() == GameInfoTypes.UNIT_FRIGATE and pUnit:GetPlot():IsCity() then
                                local pNewUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_DECISIONS_CSS_VIRGINIA, pUnit:GetX(), pUnit:GetY(), UNITAI_ATTACK_SEA )
                                pNewUnit:Convert(pUnit)
                        end
                end
                save(pPlayer, "Decisions_CSAVirginia", true)
        end
        )
       
        Decisions_CSAVirginia.Monitors = {}
        Decisions_CSAVirginia.Monitors[GameEvents.UnitKilledInCombat] =  (
        function(iKiller, iOwner, iUnitType)
                if iUnitType == GameInfoTypes.UNIT_DECISIONS_CSS_VIRGINIA then
                        local pPlayer = Players[iOwner]
                        if load(pPlayer, "Decisions_CSAVirginia") == true then
                                local pCapital = pPlayer:GetCapitalCity()
                                if pCapital then
                                        if not pCapital:IsHasBuilding(GameInfoTypes.BUILDING_DECISIONS_CSS_VIRGINIA) then
                                                pCapital:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_CSS_VIRGINIA, 1)
                                        end
                                end
                        end
                end
        end
        )
 
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_CSA, "Decisions_CSAVirginia", Decisions_CSAVirginia)
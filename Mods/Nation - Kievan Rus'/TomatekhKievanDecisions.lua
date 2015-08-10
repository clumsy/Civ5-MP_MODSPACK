print("Kievan Rus Decisions")

function JFD_IsUsingPietyPrestige()
        local pietyPrestigeModID = "eea66053-7579-481a-bb8d-2f3959b59974"
        local isUsingPiety = false
       
        for _, mod in pairs(Modding.GetActivatedMods()) do
          if (mod.ID == pietyPrestigeModID) then
            isUsingPiety = true
            break
          end
        end
 
        return isUsingPiety

end
 
local isUsingPietyPrestige = JFD_IsUsingPietyPrestige()

local tTheology = GameInfoTypes.TECH_THEOLOGY;
local tCivilService = GameInfoTypes.TECH_CIVIL_SERVICE;
local bCathedral = GameInfoTypes.BUILDING_CATHEDRAL;
local bVechePolicy = GameInfoTypes.BUILDING_KIEVAN_RUS_TRAIT_DUMMY_BUILDING_POLICY;
local pFinishers = {
        GameInfoTypes.POLICY_TRADITION_FINISHER,
        GameInfoTypes.POLICY_LIBERTY_FINISHER,
        GameInfoTypes.POLICY_HONOR_FINISHER,
        GameInfoTypes.POLICY_PIETY_FINISHER,
        GameInfoTypes.POLICY_PATRONAGE_FINISHER,
        GameInfoTypes.POLICY_COMMERCE_FINISHER,
        GameInfoTypes.POLICY_RATIONALISM_FINISHER,
        GameInfoTypes.POLICY_AESTHETICS_FINISHER,
        GameInfoTypes.POLICY_EXPLORATION_FINISHER,
        }
 
--Justice of the Rus'
 
local Decisions_KievanJustice = {}
        Decisions_KievanJustice.Name = "TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_JUSTICE"
        Decisions_KievanJustice.Desc = "TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_JUSTICE_DESC"
        HookDecisionCivilizationIcon(Decisions_KievanJustice, "CIVILIZATION_KIEVAN_RUS_MOD")
        Decisions_KievanJustice.Weight = nil
        Decisions_KievanJustice.CanFunc = (
        function(pPlayer)              
                if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"]) then return false, false end
                if load(pPlayer, "Decisions_KievanJustice") == true then
                        Decisions_KievanJustice.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_JUSTICE_ENACTED_DESC")
                        return false, false, true
                end            
       
                local iCost = math.ceil(100 * iMod)
                Decisions_KievanJustice.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_JUSTICE_DESC", iCost)
 
                if (pPlayer:GetGold() < iCost) then return true, false end
                if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
                if not (Teams[pPlayer:GetTeam()]:IsHasTech(tCivilService)) then return true, false end 
                --wasn't firing for some reason?
                --if pPlayer:GetNumPolicyBranchesFinished() < 1 then return true, false end
                local cPOLICY = 0
                for _, iPolicy in pairs(pFinishers) do
                        if pPlayer:HasPolicy(iPolicy) then
                                cPOLICY = cPOLICY + 1
                                break
                        end
                end
                if cPOLICY <= 0 then return true, false end    
                return true, true
        end
        )
       
        Decisions_KievanJustice.DoFunc = (
        function(pPlayer)
                local iCost = math.ceil(100 * iMod)
                pPlayer:ChangeGold(-iCost);
                pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
                pPlayer:GetCapitalCity():SetNumRealBuilding(bVechePolicy, 1)
                save(pPlayer, "Decisions_KievanJustice", true)
        end
        )
 
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"], "Decisions_KievanJustice", Decisions_KievanJustice)
 
--Baptism of the Rus'
 
local Decisions_KievanFaith = {}
        Decisions_KievanFaith.Name = "TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_FAITH"
        Decisions_KievanFaith.Desc = "TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_FAITH_DESC"
        HookDecisionCivilizationIcon(Decisions_KievanFaith, "CIVILIZATION_KIEVAN_RUS_MOD")
        Decisions_KievanFaith.Weight = nil
        Decisions_KievanFaith.CanFunc = (
        function(pPlayer)              
                if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"]) then return false, false end
               
                local religionReward = "TXT_KEY_EVENT_TOMATEKH_KIEVAN_FAITH_RELIGION_REWARD"
                if isUsingPietyPrestige then   
                        religionReward = "your State Religion"
                end
               
                if load(pPlayer, "Decisions_KievanFaith") == true then
                        Decisions_KievanFaith.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_FAITH_ENACTED_DESC", religionReward)
                        return false, false, true
                end            
               
                local religionPrereq = "TXT_KEY_EVENT_TOMATEKH_KIEVAN_FAITH_RELIGION_PREREQ"
                local religionID = pPlayer:GetReligionCreatedByPlayer()
                if religionID <= 0 then 
					if (pPlayer:GetNumCities() >= 1) then
						religionID = pPlayer:GetCapitalCity():GetReligiousMajority() 
					end
				end

                if isUsingPietyPrestige then   
                        religionPrereq = "a State Religion"
                        religionID = JFD_GetStateReligion(pPlayer:GetID())
                end
               
                local iCost = math.ceil(200 * iMod)
                Decisions_KievanFaith.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_KIEVAN_FAITH_DESC", religionPrereq, iCost, religionReward)
               
                if (pPlayer:GetGold() < iCost) then return true, false end
                if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
                if pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_INDUSTRIAL"] then return true, false end
                if (religionID <= 0) then return true, false end
                if not (Teams[pPlayer:GetTeam()]:IsHasTech(tTheology)) then return true, false end     
                return true, true
        end
        )
       
        Decisions_KievanFaith.DoFunc = (
        function(pPlayer)
                local iCost = math.ceil(200 * iMod)
                pPlayer:ChangeGold(-iCost);
                pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
               
                for pCity in pPlayer:Cities() do
                        if pPlayer:GetReligionCreatedByPlayer() >= 1 then
                                local foundReligion = pPlayer:GetReligionCreatedByPlayer();
                                pCity:ConvertPercentFollowers(foundReligion, -1, 100);
                        else
                                local pcCity = pPlayer:GetCapitalCity();
                                local capitalReligion = pcCity:GetReligiousMajority();
                                pCity:ConvertPercentFollowers(capitalReligion, -1, 100);
                        end
                end
 
                local pcCity = pPlayer:GetCapitalCity();
                if not (pcCity:IsHasBuilding(bCathedral)) then
                        pcCity:SetNumRealBuilding(bCathedral, 1);
                elseif (pcCity:IsHasBuilding(bCathedral)) then
                        for pCity in pPlayer:Cities() do
                                if not (pCity:IsHasBuilding(bCathedral)) then
                                        pCity:SetNumRealBuilding(bCathedral, 1);
                                        break
                                end
                        end
                end
 
                save(pPlayer, "Decisions_KievanFaith", true)
        end
        )
 
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_KIEVAN_RUS_MOD"], "Decisions_KievanFaith", Decisions_KievanFaith)
 
GameEvents.PlayerDoTurn.Add(
function(iPlayer)
        local pPlayer = Players[iPlayer];
        if (pPlayer:IsAlive()) then
                if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_KIEVAN_RUS_MOD) then
                        if load(pPlayer, "Decisions_KievanJustice") == true then
                                local pcCity = pPlayer:GetCapitalCity();
                                if not (pcCity:GetNumBuilding(bVechePolicy) > 0) then
                                        pcCity:SetNumRealBuilding(bVechePolicy, 1);
                                end
                        end
                end
        end
end)

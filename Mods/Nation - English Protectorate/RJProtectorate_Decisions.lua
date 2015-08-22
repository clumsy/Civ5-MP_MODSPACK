-- Decisions
-- Author: DJSHenninger
-- DateCreated: 3/1/2015 9:15:39 AM
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
        local player = Players[playerID]
        local playerTeam = Teams[player:GetTeam()]
        local activePlayer = Players[Game.GetActivePlayer()]
        if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
                Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
        end
end
--------------------------------------------------------------------------------------------------------------------------
-- New Model and Self Denying Ordinance
--------------------------------------------------------------------------------------------------------------------------
local Decisions_RJNewModel = {}
        Decisions_RJNewModel.Name = "TXT_KEY_DECISIONS_RJ_NEW_MODEL_ORDINANCE"
        Decisions_RJNewModel.Desc = "TXT_KEY_DECISIONS_RJ_NEW_MODEL_ORDINANCE_DESC"
        HookDecisionCivilizationIcon(Decisions_RJNewModel, "CIVILIZATION_PROTECTORATE")
        Decisions_RJNewModel.CanFunc = (
        function(player)
                if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PROTECTORATE"] then
                return false, false
                end
                if load(player, "Decisions_RJNewModel") == true then
                        Decisions_RJNewModel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RJ_NEW_MODEL_ORDINANCE_ENACTED_DESC")
                        return false, false, true
                end
 
                local goldCost = math.ceil(400 * iMod)
                Decisions_RJNewModel.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RJ_NEW_MODEL_ORDINANCE_DESC", goldCost)
 
                if player:GetGold() < goldCost                                                  then return true, false end
                if player:GetNumResourceAvailable(iMagistrate, false) < 2       then return true, false end
                if player:GetCurrentEra() < GameInfoTypes["ERA_RENAISSANCE"]    then return true, false end
 
                return true, true
        end
        )
 
Decisions_RJNewModel.DoFunc = (
        function(player)
                local goldCost = math.ceil(400 * iMod)
                local playerID = player:GetID()
                local capitalX = player:GetCapitalCity():GetX()
                local capitalY = player:GetCapitalCity():GetY()
                player:InitUnit(GameInfoTypes["UNIT_GREAT_GENERAL"], capitalX, capitalY)
                player:ChangeGold(-goldCost)
                player:ChangeNumResourceTotal(iMagistrate, -2)
                player:SetNumFreePolicies(1)
                player:SetNumFreePolicies(0)
                player:SetHasPolicy(GameInfoTypes["POLICY_RJ_NEW_MODEL_ORDINANCE"], true)
 
                JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_RJ_NEW_MODEL_ORDINANCE"))
                save(player, "Decisions_RJNewModel", true)
        end
        )
       
        Decisions_RJNewModel.Monitors = {}
        Decisions_RJNewModel.Monitors[GameEvents.PlayerDoTurn] =  (
        function(player)
                local playerID = player:GetID()
                if (player:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_PROTECTORATE) then return end
                if load(player, "Decisions_RJNewModel") == true then
                        for unit in player:Units() do
                                unit:SetHasPromotion(GameInfoTypes["PROMOTION_RJ_NEW_MODEL_ORDINANCE"], true)
                        end
                end
        end
        )
 
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PROTECTORATE"], "Decisions_RJNewModel", Decisions_RJNewModel)
--------------------------------------------------------------------------------------------------------------------------
-- Institute rule of the Major Generals
--------------------------------------------------------------------------------------------------------------------------
local Decisions_RJInstituteMajorGenerals = {}
        Decisions_RJInstituteMajorGenerals.Name = "TXT_KEY_DECISIONS_RJ_INSTITUTE_MAJOR_GENERALS"
        Decisions_RJInstituteMajorGenerals.Desc = "TXT_KEY_DECISIONS_RJ_INSTITUTE_MAJOR_GENERALS_DESC"
        HookDecisionCivilizationIcon(Decisions_RJInstituteMajorGenerals, "CIVILIZATION_PROTECTORATE")
        Decisions_RJInstituteMajorGenerals.CanFunc = (
        function(player)
                if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PROTECTORATE"] then
                return false, false
                end
                if load(player, "Decisions_RJInstituteMajorGenerals") == true then
                        Decisions_RJInstituteMajorGenerals.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RJ_INSTITUTE_MAJOR_GENERALS_ENACTED_DESC")
                        return false, false, true
                end
 
                local goldCost = math.ceil(200 * iMod)
                local cultureCost = math.ceil(300 * iMod)
                Decisions_RJInstituteMajorGenerals.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_RJ_INSTITUTE_MAJOR_GENERALS_DESC", goldCost, cultureCost)
 
                if player:GetNumResourceAvailable(iMagistrate, false) < 1       then return true, false end
                if player:GetGold() < goldCost                                                          then return true, false end
                if player:GetJONSCulture() < cultureCost                                        then return true, false end
                if player:GetCurrentEra() < GameInfoTypes["ERA_MEDIEVAL"]       then return true, false end
 
                return true, true
        end
        )              
 
Decisions_RJInstituteMajorGenerals.DoFunc = (
        function(player)
                local goldCost = math.ceil(200 * iMod)
                local cultureCost = math.ceil(300 * iMod)
                player:ChangeGold(-goldCost)
                player:ChangeNumResourceTotal(iMagistrate, -1)
                player:ChangeJONSCulture(-cultureCost)
                JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_RJ_INSTITUTE_MAJOR_GENERALS"))
                save(player, "Decisions_RJInstituteMajorGenerals", true)
        end
        )
 
        Decisions_RJInstituteMajorGenerals.Monitors = {}
        Decisions_RJInstituteMajorGenerals.Monitors[GameEvents.PlayerDoTurn] =  (
        function(iPlayer)
                local player = Players[iPlayer]
                if (player:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_PROTECTORATE) then return end
                if load(player, "Decisions_RJInstituteMajorGenerals") == true then
                        for city in player:Cities() do
                                local faithBoost = math.floor((city:GetFaithPerTurn() - city:GetNumBuilding(GameInfoTypes["BUILDING_RJ_INSTITUTE_MAJOR_GENERALS"])) * 0.25)
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RJ_INSTITUTE_MAJOR_GENERALS"], faithBoost)
                        end
                end
        end
        )
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PROTECTORATE"], "Decisions_RJInstituteMajorGenerals", Decisions_RJInstituteMajorGenerals)
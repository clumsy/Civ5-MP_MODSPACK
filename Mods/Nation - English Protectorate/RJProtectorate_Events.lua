-- Lua Script1
-- Author: Gebruiker
-- DateCreated: 3/1/2015 9:13:53 PM
--------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
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
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--  Execution of Charles I
--------------------------------------------------------------------------------------------------------------------------
local Event_RJExecutionCharlesI = {}
        Event_RJExecutionCharlesI.Name = "TXT_KEY_EVENT_RJ_EXECUTION_CHARLES_I"
        Event_RJExecutionCharlesI.Desc = "TXT_KEY_EVENT_RJ_EXECUTION_CHARLES_I_DESC"
        Event_RJExecutionCharlesI.Weight = 10
        Event_RJExecutionCharlesI.CanFunc = (
                function(player)       
                        local goldenAgeCost = math.ceil(300 * iMod)            
                        if load(player, "Event_RJExecutionCharlesI") == true then return false end
                        if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PROTECTORATE"]   then return false end
                        if player:GetCurrentEra() ~= GameInfoTypes["ERA_RENAISSANCE"]   then return false end
                        if player:GetGoldenAgeProgressMeter() < goldenAgeCost   then return false end
                        return true
                end
                )
        Event_RJExecutionCharlesI.Outcomes = {}
        --=========================================================
        -- Outcome 1
        --=========================================================
        Event_RJExecutionCharlesI.Outcomes[1] = {}
        Event_RJExecutionCharlesI.Outcomes[1].Name = "TXT_KEY_EVENT_RJ_EXECUTION_CHARLES_I_OUTCOME_1"
        Event_RJExecutionCharlesI.Outcomes[1].Desc = "TXT_KEY_EVENT_RJ_EXECUTION_CHARLES_I_OUTCOME_RESULT_1"
        Event_RJExecutionCharlesI.Outcomes[1].CanFunc = (
                function(player)       
                        local goldenAgeCost = math.ceil(300 * iMod)    
                        Event_RJExecutionCharlesI.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_RJ_EXECUTION_CHARLES_I_OUTCOME_RESULT_1", goldenAgeCost)
                        return true
                end
                )
        Event_RJExecutionCharlesI.Outcomes[1].DoFunc = (
                function(player)
                        local playerID = player:GetID()
                        local goldenAgeCost = math.ceil(300 * iMod)    
                        player:SetNumFreePolicies(1)
                        player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
                        JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_RJ_EXECUTION_CHARLES_I_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_RJ_EXECUTION_CHARLES_I"))
                        JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_RJ_EXECUTION_CHARLES_I"))
                        save(player, "Event_RJExecutionCharlesI", true)
                end)
 
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PROTECTORATE"], "Event_RJExecutionCharlesI", Event_RJExecutionCharlesI, true)
--------------------------------------------------------------------------------------------------------------------------
--  The Case of James Nayler
--------------------------------------------------------------------------------------------------------------------------
local Event_DJSHRJCaseJamesNayler = {}
        Event_DJSHRJCaseJamesNayler.Name = "TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER"
        Event_DJSHRJCaseJamesNayler.Desc = "TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER_DESC"
        Event_DJSHRJCaseJamesNayler.Weight = 10
        Event_DJSHRJCaseJamesNayler.CanFunc = (
                function(player)
                        if load(player, "Event_DJSHRJCaseJamesNayler") == true then return false end                                           
                        if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_PROTECTORATE"] then return false end
                        if player:GetCurrentEra() ~= GameInfoTypes["ERA_RENAISSANCE"]   then return false end
                        return true
                end
                )
        Event_DJSHRJCaseJamesNayler.Outcomes = {}
        --=========================================================
        -- Outcome 1
        --=========================================================
        Event_DJSHRJCaseJamesNayler.Outcomes[1] = {}
        Event_DJSHRJCaseJamesNayler.Outcomes[1].Name = "TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER_OUTCOME_1"
        Event_DJSHRJCaseJamesNayler.Outcomes[1].Desc = "TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER_OUTCOME_RESULT_1"
        Event_DJSHRJCaseJamesNayler.Outcomes[1].CanFunc = (
                function(player)                       
                        local goldenAgeCost = math.ceil(200 * iMod)
                        local faithCost = math.ceil(200 * iMod)
                        if player:GetGoldenAgeProgressMeter() < faithCost then return false end
                        if player:GetGoldenAgeProgressMeter() < goldenAgeCost then return false end
                        Event_DJSHRJCaseJamesNayler.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER_OUTCOME_RESULT_1", faithCost, goldenAgeCost)
                        return true
                end
                )
        Event_DJSHRJCaseJamesNayler.Outcomes[1].DoFunc = (
                function(player)
                        local playerID = player:GetID()
                        local capitalX = player:GetCapitalCity():GetX()
                        local capitalY = player:GetCapitalCity():GetY()
                        local plotX = capitalX + JFD_GetRandom(1,3)
                        local plotY = capitalY + JFD_GetRandom(1,3)
                        player:InitUnit(GameInfoTypes["UNIT_PROPHET"], capitalX, capitalY)
                        local goldenAgeCost = math.ceil(200 * iMod)
                        local faithCost = math.ceil(200 * iMod)
                        player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
                        player:ChangeFaith(-faithCost)
                        JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_RJ_CASE_JAMES_NAYLER_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER"))
                        JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_RJ_CASE_JAMES_NAYLER"))
                end)
        --=========================================================
        -- Outcome 2
        --=========================================================
        Event_DJSHRJCaseJamesNayler.Outcomes[2] = {}
        Event_DJSHRJCaseJamesNayler.Outcomes[2].Name = "TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER_OUTCOME_2"
        Event_DJSHRJCaseJamesNayler.Outcomes[2].Desc = "TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER_OUTCOME_RESULT_2"
        Event_DJSHRJCaseJamesNayler.Outcomes[2].CanFunc = (
                function(player)                       
                        local faithReward = math.ceil(450 * iMod)
                        Event_DJSHRJCaseJamesNayler.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER_OUTCOME_RESULT_2", faithReward)
                        return true
                end
                )
        Event_DJSHRJCaseJamesNayler.Outcomes[2].DoFunc = (
                function(player)
                        local playerID = player:GetID()
                        local faithReward = math.ceil(450 * iMod)
                        player:ChangeFaith(faithReward)
                        JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_RJ_CASE_JAMES_NAYLER_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_RJ_CASE_JAMES_NAYLER"))
                        JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_RJ_CASE_JAMES_NAYLER"))
                end)
       
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PROTECTORATE"], "Event_DJSHRJCaseJamesNayler", Event_DJSHRJCaseJamesNayler)

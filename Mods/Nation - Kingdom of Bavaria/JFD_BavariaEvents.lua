-- JFD_BavariaEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Bavaria Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingMuisiciansGuildID = GameInfoTypes["BUILDING_MUSICIANS_GUILD"]
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_BAVARIA"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"] 
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"] 
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  The Illuminati
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBavariaIlluminati = {}
	Event_JFDBavariaIlluminati.Name = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI"
	Event_JFDBavariaIlluminati.Desc = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_DESC"
	Event_JFDBavariaIlluminati.Weight = 10
	Event_JFDBavariaIlluminati.CanFunc = (
		function(player)			
			if load(player, "Event_JFDBavariaIlluminati") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			
			local cultureCost = mathCeil(90 * iMod)
			if player:GetJONSCulture() < cultureCost then return false end
			
			return true
		end
		)
	Event_JFDBavariaIlluminati.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBavariaIlluminati.Outcomes[1] = {}
	Event_JFDBavariaIlluminati.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_1"
	Event_JFDBavariaIlluminati.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_1"
	Event_JFDBavariaIlluminati.Outcomes[1].Weight = 4
	Event_JFDBavariaIlluminati.Outcomes[1].CanFunc = (
		function(player)			
			local cultureCost = mathCeil(90 * iMod)
			local goldenAgeReward = mathCeil(120 * iMod)
			local faithReward = mathCeil(44 * iMod)
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFDBavariaIlluminati.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_1", cultureCost, faithReward, goldenAgeReward)
			return true
		end
		)
	Event_JFDBavariaIlluminati.Outcomes[1].DoFunc = (
		function(player) 
			local cultureCost = mathCeil(90 * iMod)
			local goldenAgeReward = mathCeil(120 * iMod)
			local faithReward = mathCeil(44 * iMod)
			player:ChangeJONSCulture(-cultureCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			player:ChangeFaith(faithReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BAVARIA_ILLUMINATI")) 
			save(player, "Event_JFDBavariaIlluminati", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDBavariaIlluminati.Outcomes[2] = {}
	Event_JFDBavariaIlluminati.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_2"
	Event_JFDBavariaIlluminati.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_2"
	Event_JFDBavariaIlluminati.Outcomes[2].Weight = 0
	Event_JFDBavariaIlluminati.Outcomes[2].CanFunc = (
		function(player)			
			if not player:IsHuman() then return false end
			Event_JFDBavariaIlluminati.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDBavariaIlluminati.Outcomes[2].DoFunc = (
		function(player) 
			if JFD_GetRandom(1, 100) <= 10 then
				save(player, "Event_JFDBavariaIlluminatiNewWorldOrder", true)	
			end
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI"))
			save(player, "Event_JFDBavariaIlluminati", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDBavariaIlluminati.Outcomes[3] = {}
	Event_JFDBavariaIlluminati.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_3"
	Event_JFDBavariaIlluminati.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_3"
	Event_JFDBavariaIlluminati.Outcomes[3].Weight = 1
	Event_JFDBavariaIlluminati.Outcomes[3].CanFunc = (
		function(player)			
			local goldCost = mathCeil(230 * iMod)
			local faithCost = mathCeil(160 * iMod)
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 60 / 100)
			if player:GetGold() < goldCost then return false end
			if player:GetFaith() < faithCost then return false end

			Event_JFDBavariaIlluminati.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_3", goldCost, faithCost, goldenAgeCost)
			return true
		end
		)
	Event_JFDBavariaIlluminati.Outcomes[3].DoFunc = (
		function(player)
			local goldCost = mathCeil(230 * iMod)
			local faithCost = mathCeil(160 * iMod)
			local goldenAgeCost = mathCeil(player:GetGoldenAgeProgressMeter() * 60 / 100)
			player:ChangeGold(-goldCost)
			player:ChangeFaith(-iFaithCost)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes["BUILDING_JFD_BAVARIA_ILLUMINATI"], 1)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_ILLUMINATI_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_ILLUMINATI"))
			save(player, "Event_JFDBavariaIlluminati", true)	
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BAVARIA"], "Event_JFDBavariaIlluminati", Event_JFDBavariaIlluminati)
--------------------------------------------------------------------------------------------------------------------------
--  New World Order
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBavariaNewWorldOrder = {}
	Event_JFDBavariaNewWorldOrder.Name = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER"
	Event_JFDBavariaNewWorldOrder.Desc = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER_DESC"
	Event_JFDBavariaNewWorldOrder.Weight = 100
	Event_JFDBavariaNewWorldOrder.CanFunc = (
		function(player)			
			if load(player, "Event_JFDBavariaIlluminatiNewWorldOrder") == false then return false end
			if load(player, "Event_JFDBavariaNewWorldOrder") == true then return false end
			if player:GetCurrentEra() < GameInfoTypes["ERA_POSTMODERN"] then return false end
			
			return true
		end
		)
	Event_JFDBavariaNewWorldOrder.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBavariaNewWorldOrder.Outcomes[1] = {}
	Event_JFDBavariaNewWorldOrder.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_1"
	Event_JFDBavariaNewWorldOrder.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_RESULT_1"
	Event_JFDBavariaNewWorldOrder.Outcomes[1].CanFunc = (
		function(player)
			Event_JFDBavariaNewWorldOrder.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDBavariaNewWorldOrder.Outcomes[1].DoFunc = (
		function(player) 
			for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local otherPlayer = Players[playerID]
				otherPlayer:ChangeAnarchyNumTurns(2)
				otherPlayer:InitUnit(GameInfoTypes["UNIT_SCIENTIST"], otherPlayer:GetCapitalCity():GetX(), otherPlayer:GetCapitalCity():GetY())
			end

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER"))
			save(player, "Event_JFDBavariaNewWorldOrder", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDBavariaNewWorldOrder.Outcomes[2] = {}
	Event_JFDBavariaNewWorldOrder.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_2"
	Event_JFDBavariaNewWorldOrder.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_RESULT_1"
	Event_JFDBavariaNewWorldOrder.Outcomes[2].CanFunc = (
		function(player)
			Event_JFDBavariaNewWorldOrder.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDBavariaNewWorldOrder.Outcomes[2].DoFunc = (
		function(player) 
			for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 2 do
				local otherPlayer = Players[playerID]
				otherPlayer:ChangeAnarchyNumTurns(2)
				Players[63]:AcquireCity(Players[playerID]:GetCapitalCity(), true)
				otherPlayer:InitUnit(GameInfoTypes["UNIT_SCIENTIST"], otherPlayer:GetCapitalCity():GetX(), otherPlayer:GetCapitalCity():GetY())
			end

			Events.GameplayAlertMessage(Locale.ConvertTextKey("The [COLOR_POSITIVE_TEXT]Illuminati[ENDCOLOR] have captured the world's major Capitals!"))
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_NEW_WORLD_ORDER_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_WORLD_ORDER"))
			save(player, "Event_JFDBavariaNewWorldOrder", true)	
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BAVARIA"], "Event_JFDBavariaNewWorldOrder", Event_JFDBavariaNewWorldOrder)
--------------------------------------------------------------------------------------------------------------------------
--  Pressure to Produce an Heir
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBavariaPressureToProduceAnHeir = {}
	Event_JFDBavariaPressureToProduceAnHeir.Name = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR"
	Event_JFDBavariaPressureToProduceAnHeir.Desc = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_DESC"
	Event_JFDBavariaPressureToProduceAnHeir.Weight = 10
	Event_JFDBavariaPressureToProduceAnHeir.CanFunc = (
		function(player)			
			if load(player, "Event_JFDBavariaPressureToProduceAnHeir") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end

			return true
		end
		)
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[1] = {}
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_1"
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_1"
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[1].Weight = 5
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[1].CanFunc = (
		function(player)			

			Event_JFDBavariaPressureToProduceAnHeir.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[1].DoFunc = (
		function(player) 
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(10)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BAVARIA_PRESSURE_HEIR")) 
			save(player, "Event_JFDBavariaPressureToProduceAnHeir", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[2] = {}
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_2"
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_2"
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[2].Weight = 5
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[2].CanFunc = (
		function(player)			
			local cultureReward = mathCeil(67 * iMod)
			
			Event_JFDBavariaPressureToProduceAnHeir.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(67 * iMod)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BAVARIA_PRESSURE_HEIR")) 
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[3] = {}
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_3"
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_3"
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[3].Weight = 5
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFDBavariaPressureToProduceAnHeir.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDBavariaPressureToProduceAnHeir.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			player:ChangeGoldenAgeTurns(5)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_PRESSURE_HEIR_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_PRESSURE_HEIR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BAVARIA_PRESSURE_HEIR"))
			save(player, "Event_JFDBavariaPressureToProduceAnHeir", true)	
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BAVARIA"], "Event_JFDBavariaPressureToProduceAnHeir", Event_JFDBavariaPressureToProduceAnHeir)
--------------------------------------------------------------------------------------------------------------------------
--  New Opera
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDBavariaNewOpera = {}
	Event_JFDBavariaNewOpera.Name = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA"
	Event_JFDBavariaNewOpera.Desc = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_DESC"
	Event_JFDBavariaNewOpera.Weight = 10
	Event_JFDBavariaNewOpera.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			if player:CountNumBuildings(buildingMuisiciansGuildID) == 0 then return false end
			
			local goldCost = math.ceil(90 * iMod)
			if player:GetGold() < goldCost then return false end
			
			return true
		end
		)
	Event_JFDBavariaNewOpera.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDBavariaNewOpera.Outcomes[1] = {}
	Event_JFDBavariaNewOpera.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_1"
	Event_JFDBavariaNewOpera.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_1"
	Event_JFDBavariaNewOpera.Outcomes[1].Weight = 2
	Event_JFDBavariaNewOpera.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(90 * iMod)
			local cultureReward = mathCeil(120 * iMod)
			if player:GetGold() < goldCost then return false end
			
			Event_JFDBavariaNewOpera.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_1", goldCost, cultureReward)
			return true
		end
		)
	Event_JFDBavariaNewOpera.Outcomes[1].DoFunc = (
		function(player) 
			local goldCost = mathCeil(90 * iMod)
			local cultureReward = mathCeil(120 * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDBavariaNewOpera.Outcomes[2] = {}
	Event_JFDBavariaNewOpera.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_2"
	Event_JFDBavariaNewOpera.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_2"
	Event_JFDBavariaNewOpera.Outcomes[2].Weight = 5
	Event_JFDBavariaNewOpera.Outcomes[2].CanFunc = (
		function(player)			
			if load(player, "Event_JFDBavariaNewOpera") == true then return false end
			local goldCost = mathCeil(300 * iMod)
			local cultureReward = mathCeil(90 * iMod)
			if player:GetGold() < goldCost then return false end
			
			Event_JFDBavariaNewOpera.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_2", goldCost, cultureReward)
			return true
		end
		)
	Event_JFDBavariaNewOpera.Outcomes[2].DoFunc = (
		function (player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(300 * iMod)
			player:ChangeGold(-goldCost)
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(GameInfoTypes["POLICY_JFD_BAVARIA_NEW_OPERA"], true)

			local cultureReward = mathCeil(90 * iMod)
			for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
				if Players[iPlayer] ~= player then
					Players[iPlayer]:ChangeJONSCulture(cultureReward)
				end
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_BAVARIA_NEW_OPERA")) 
			save(player, "Event_JFDBavariaNewOpera", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDBavariaNewOpera.Outcomes[3] = {}
	Event_JFDBavariaNewOpera.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_3"
	Event_JFDBavariaNewOpera.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_3"
	Event_JFDBavariaNewOpera.Outcomes[3].Weight = 1
	Event_JFDBavariaNewOpera.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFDBavariaNewOpera.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_BAVARIA_NEW_OPERA_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDBavariaNewOpera.Outcomes[3].DoFunc = (
		function(player)
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_BAVARIA"], "Event_JFDBavariaNewOpera", Event_JFDBavariaNewOpera)
--=======================================================================================================================
--=======================================================================================================================



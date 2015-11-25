--------------------------------------------------------------------------------------------------------------------------
-- Minoa: Phaistos Disk
--------------------------------------------------------------------------------------------------------------------------
local Event_MinoanPhaistos = {}
    Event_MinoanPhaistos.Name = "TXT_KEY_EVENT_MINOANPHAISTOS"
    Event_MinoanPhaistos.Desc = "TXT_KEY_EVENT_MINOANPHAISTOS_DESC"
    Event_MinoanPhaistos.Weight = 30
    Event_MinoanPhaistos.CanFunc = (
		function(pPlayer)
	    	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_MINOA then return false end
			if pPlayer:GetCurrentEra() < GameInfoTypes.ERA_CLASSICAL then return false end
			if load(pPlayer, "Event_MinoanPhaistos") then return false end
			
			local bContinue = false
			for pCity in pPlayers:Cities() do
				if pCity:GetName() == "Phaistos" then
					bContinue = true
					break
				end
			end
			if not(bContinue) then return false end
			
			return true
		end
		)
	Event_MinoanPhaistos.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_MinoanPhaistos.Outcomes[1] = {}
	Event_MinoanPhaistos.Outcomes[1].Name = "TXT_KEY_EVENT_MINOANPHAISTOS_OUTCOME_1"
	Event_MinoanPhaistos.Outcomes[1].Desc = "TXT_KEY_EVENT_MINOANPHAISTOS_OUTCOME_1_DESC"
	Event_MinoanPhaistos.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_MinoanPhaistos.Outcomes[1].DoFunc = (
		function(pPlayer)
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes.POLICY_EVENT_MINOANPHAISTOSGOLD, true)
			
			save(pPlayer, "Event_MinoanPhaistos", true)		
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_MINOANPHAISTOS_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_MINOANPHAISTOS"))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_MinoanPhaistos.Outcomes[2] = {}
	Event_MinoanPhaistos.Outcomes[2].Name = "TXT_KEY_EVENT_MINOANPHAISTOS_OUTCOME_2"
	Event_MinoanPhaistos.Outcomes[2].Desc = "TXT_KEY_EVENT_MINOANPHAISTOS_OUTCOME_2_DESC"
	Event_MinoanPhaistos.Outcomes[2].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_MinoanPhaistos.Outcomes[2].DoFunc = (
		function(pPlayer)
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes.POLICY_EVENT_MINOANPHAISTOSCULTURE, true)
			
			save(pPlayer, "Event_MinoanPhaistos", true)		
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_MINOANPHAISTOS_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_MINOANPHAISTOS"))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_MinoanPhaistos.Outcomes[3] = {}
	Event_MinoanPhaistos.Outcomes[3].Name = "TXT_KEY_EVENT_MINOANPHAISTOS_OUTCOME_3"
	Event_MinoanPhaistos.Outcomes[3].Desc = "TXT_KEY_EVENT_MINOANPHAISTOS_OUTCOME_3_DESC"
	Event_MinoanPhaistos.Outcomes[3].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_MinoanPhaistos.Outcomes[3].DoFunc = (
		function(pPlayer)
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes.POLICY_EVENT_MINOANPHAISTOSSCIENCE, true)
			
			save(pPlayer, "Event_MinoanPhaistos", true)		
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_MINOANPHAISTOS_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_MINOANPHAISTOS"))
		end
		)
	
Events_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_MINOA, "Event_MinoanPhaistos", Event_MinoanPhaistos)
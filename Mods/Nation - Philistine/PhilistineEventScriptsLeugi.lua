-- JFD_RussiaNicholasIIEvents
-- Author: JFD
--=======================================================================================================================
print("Leugi's Philistine Events: loaded")
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
--  Contention in the State Duma
--------------------------------------------------------------------------------------------------------------------------
local Event_Leugi_Philistines_Goliath = {}
	Event_Leugi_Philistines_Goliath.Name = "TXT_KEY_EVENT_PHILISTINE_GOLIATH"
	Event_Leugi_Philistines_Goliath.Desc = "TXT_KEY_EVENT_PHILISTINE_GOLIATH_DESC"
	Event_Leugi_Philistines_Goliath.Weight = 25
	Event_Leugi_Philistines_Goliath.CanFunc = (
		function(pPlayer)
			--
			-- Check if the event fired before			
			if load(pPlayer, "Event_GoliathPhilistine") == true then return false end
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_PHILISTINE"] then return false end
			--
			-- Check the Era
			if pPlayer:GetCurrentEra() > GameInfoTypes["ERA_CLASSICAL"] then return false end
			--
			-- Check war!
			local isWar = 0;
			for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
				local oPlayer = Players[oPlayer];
				if oPlayer ~= pPlayer then
					if (oPlayer:IsAlive()) then
						local oTeam = oPlayer:GetTeam();
						if Teams[pTeam]:IsAtWar(oTeam) then
							isWar = isWar + 1;
							break
						end
					end
				end
			end
			if isWar <= 0 then return false end
			--
			-- Fire the Event! (if chances are met)
			Event_Leugi_Philistines_Goliath.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_OTHERS_ALERT"))
						end
					end
				end
			end
			return true
		end
		)
	Event_Leugi_Philistines_Goliath.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Philistines_Goliath.Outcomes[1] = {}
	Event_Leugi_Philistines_Goliath.Outcomes[1].Name = "TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_1"
	Event_Leugi_Philistines_Goliath.Outcomes[1].Desc = "TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_1"
	Event_Leugi_Philistines_Goliath.Outcomes[1].Weight = 5
	Event_Leugi_Philistines_Goliath.Outcomes[1].CanFunc = (
		function(pPlayer)			
			local iGoldCost = math.ceil((500) * iMod)
			local iFaithCost = math.ceil((500) * iMod)
			if pPlayer:GetGold() < iGoldCost then return false end
			if pPlayer:GetFaith() < iFaithCost then return false end

			Event_Leugi_Philistines_Goliath.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_1", iCost, iFaithCost)
			
			return true
		end
		)
	Event_Leugi_Philistines_Goliath.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil((500) * iMod)
			local iFaithCost = math.ceil((500) * iMod)
			pPlayer:ChangeGold(-iGoldCost)
			pPlayer:ChangeFaith(-iFaithCost)
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_PHILISTINE_GOLIATH_1, 1)
			save(pPlayer, "Event_GoliathPhilistine", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Leugi_Philistines_Goliath.Outcomes[2] = {}
	Event_Leugi_Philistines_Goliath.Outcomes[2].Name = "TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_2"
	Event_Leugi_Philistines_Goliath.Outcomes[2].Desc = "TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_2"
	Event_Leugi_Philistines_Goliath.Outcomes[2].Weight = 3
	Event_Leugi_Philistines_Goliath.Outcomes[2].CanFunc = (
		function(pPlayer)			
			local iGoldCost = math.ceil((250) * iMod)
			if pPlayer:GetGold() < iGoldCost then return false end

			Event_Leugi_Philistines_Goliath.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_2", iGoldCost)
			return true
		end
		)
	Event_Leugi_Philistines_Goliath.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil((250) * iMod)
			pPlayer:ChangeGold(-iGoldCost)
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_PHILISTINE_GOLIATH_2, 1)
			save(pPlayer, "Event_GoliathPhilistine", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_Leugi_Philistines_Goliath.Outcomes[3] = {}
	Event_Leugi_Philistines_Goliath.Outcomes[3].Name = "TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_3"
	Event_Leugi_Philistines_Goliath.Outcomes[3].Desc = "TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_3"
	Event_Leugi_Philistines_Goliath.Outcomes[3].Weight = 1
	Event_Leugi_Philistines_Goliath.Outcomes[3].CanFunc = (
		function(pPlayer)			
			
			Event_Leugi_Philistines_Goliath.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_Leugi_Philistines_Goliath.Outcomes[3].DoFunc = (
		function(pPlayer)
		
			save(pPlayer, "Event_GoliathPhilistine", true)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_PHILISTINE_GOLIATH"))
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_PHILISTINE"], "Event_Leugi_Philistines_Goliath", Event_Leugi_Philistines_Goliath)


--=======================================================================================================================
--=======================================================================================================================

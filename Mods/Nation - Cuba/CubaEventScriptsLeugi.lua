-- Leugi Cuban Events
-- Author: Leugi
--=======================================================================================================================
print("Leugi's Cuban Events: loaded")
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
--  José Marti
--------------------------------------------------------------------------------------------------------------------------
local Event_Leugi_Cuban_JoseMarti = {}
	Event_Leugi_Cuban_JoseMarti.Name = "TXT_KEY_EVENT_CUBAN_JOSEMARTI"
	Event_Leugi_Cuban_JoseMarti.Desc = "TXT_KEY_EVENT_CUBAN_JOSEMARTI_DESC"
	Event_Leugi_Cuban_JoseMarti.Weight = 7
	Event_Leugi_Cuban_JoseMarti.CanFunc = (
		function(pPlayer)
			--
			-- Check if the event fired before			
			if load(pPlayer, "Event_JoseMarti") == true then return false end
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_CUBA"] then return false end
			--
			-- Check the Era
			if pPlayer:GetCurrentEra() < GameInfoTypes["ERA_INDUSTRIAL"] then return false end
			--
			-- Check the min Culture
			local iCost = math.ceil((50) * iMod)
			if pPlayer:GetJONSCulture() < iCost then return false end
			--
			-- Fire the Event! (if chances are met)
			Event_Leugi_Cuban_JoseMarti.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_OTHERS_ALERT"))
						end
					end
				end
			end
			return true
		end
		)
	Event_Leugi_Cuban_JoseMarti.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Cuban_JoseMarti.Outcomes[1] = {}
	Event_Leugi_Cuban_JoseMarti.Outcomes[1].Name = "TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_1"
	Event_Leugi_Cuban_JoseMarti.Outcomes[1].Desc = "TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_1"
	Event_Leugi_Cuban_JoseMarti.Outcomes[1].Weight = 1
	Event_Leugi_Cuban_JoseMarti.Outcomes[1].CanFunc = (
		function(pPlayer)			
			local iCost = math.ceil((50) * iMod)
	
			if pPlayer:GetJONSCulture() < iCost then return false end
			
			Event_Leugi_Cuban_JoseMarti.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_1", iCost)
			
			return true
		end
		)
	Event_Leugi_Cuban_JoseMarti.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iCost = math.ceil((50) * iMod)
			pPlayer:ChangeJONSCulture(-iCost)

			pPlayer:ChangeGoldenAgeTurns(10)

			save(pPlayer, "Event_JoseMarti", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Leugi_Cuban_JoseMarti.Outcomes[2] = {}
	Event_Leugi_Cuban_JoseMarti.Outcomes[2].Name = "TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_2"
	Event_Leugi_Cuban_JoseMarti.Outcomes[2].Desc = "TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_2"
	Event_Leugi_Cuban_JoseMarti.Outcomes[2].Weight = 4
	Event_Leugi_Cuban_JoseMarti.Outcomes[2].CanFunc = (
		function(pPlayer)			
			local iCost = math.ceil((250) * iMod)
	
			if pPlayer:GetJONSCulture() < iCost then return false end
			
			Event_Leugi_Cuban_JoseMarti.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_2", iCost)
			
			return true
		end
		)
	Event_Leugi_Cuban_JoseMarti.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iCost = math.ceil((250) * iMod)
			pPlayer:ChangeJONSCulture(-iCost)
			pPlayer:ChangeNumFreePolicies(1)
			
			save(pPlayer, "Event_JoseMarti", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI"))
		end)

	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_Leugi_Cuban_JoseMarti.Outcomes[3] = {}
	Event_Leugi_Cuban_JoseMarti.Outcomes[3].Name = "TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_3"
	Event_Leugi_Cuban_JoseMarti.Outcomes[3].Desc = "TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_3"
	Event_Leugi_Cuban_JoseMarti.Outcomes[3].Weight = 10
	Event_Leugi_Cuban_JoseMarti.Outcomes[3].CanFunc = (
		function(pPlayer)			
			local iCost = math.ceil((400) * iMod)
	
			if pPlayer:GetJONSCulture() < iCost then return false end
			
			Event_Leugi_Cuban_JoseMarti.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_3", iCost)
			
			return true
		end
		)
	Event_Leugi_Cuban_JoseMarti.Outcomes[3].DoFunc = (
		function(pPlayer) 
			local iCost = math.ceil((400) * iMod)
			pPlayer:ChangeJONSCulture(-iCost)
			pPlayer:ChangeNumFreeGreatPeople(1)
			
			save(pPlayer, "Event_JoseMarti", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_JOSEMARTI"))
		end)
	

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_CUBA"], "Event_Leugi_Cuban_JoseMarti", Event_Leugi_Cuban_JoseMarti)


--=======================================================================================================================
--=======================================================================================================================
--  Destitucion
--------------------------------------------------------------------------------------------------------------------------
local Event_Leugi_Cuban_Destitucion = {}
	Event_Leugi_Cuban_Destitucion.Name = "TXT_KEY_EVENT_CUBAN_DESTITUTION"
	Event_Leugi_Cuban_Destitucion.Desc = "TXT_KEY_EVENT_CUBAN_DESTITUTION_DESC"
	Event_Leugi_Cuban_Destitucion.Weight = 0
	Event_Leugi_Cuban_Destitucion.CanFunc = (
		function(pPlayer)
			--
			-- Check if the event fired before			
			if load(pPlayer, "Event_CespedesDestitucion") == true then return false end
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_CUBA"] then return false end
			--
			-- Fire the Event!
			Event_Leugi_Cuban_Destitucion.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_OTHERS_ALERT"))
						end
					end
				end
			end
			return true
		end
		)
	Event_Leugi_Cuban_Destitucion.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Cuban_Destitucion.Outcomes[1] = {}
	Event_Leugi_Cuban_Destitucion.Outcomes[1].Name = "TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_1"
	Event_Leugi_Cuban_Destitucion.Outcomes[1].Desc = "TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_1"
	Event_Leugi_Cuban_Destitucion.Outcomes[1].Weight = 1
	Event_Leugi_Cuban_Destitucion.Outcomes[1].CanFunc = (
		function(pPlayer)			
			Event_Leugi_Cuban_Destitucion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_Leugi_Cuban_Destitucion.Outcomes[1].DoFunc = (
		function(pPlayer) 
		
			pPlayer:ChangeAnarchyNumTurns(10)
			save(pPlayer, "Event_CespedesDestitucion", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION"))
		end)
	
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Leugi_Cuban_Destitucion.Outcomes[2] = {}
	Event_Leugi_Cuban_Destitucion.Outcomes[2].Name = "TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_2"
	Event_Leugi_Cuban_Destitucion.Outcomes[2].Desc = "TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_2"
	Event_Leugi_Cuban_Destitucion.Outcomes[2].Weight = 4
	Event_Leugi_Cuban_Destitucion.Outcomes[2].CanFunc = (
		function(pPlayer)			
			local iCost = math.ceil((300) * iMod)
			if pPlayer:GetJONSCulture() < iCost then return false end

			Event_Leugi_Cuban_Destitucion.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_2", iCost)
			return true
		end
		)
	Event_Leugi_Cuban_Destitucion.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iCost = math.ceil((300) * iMod)
			pPlayer:ChangeJONSCulture(-iCost)
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_CUBAN_REVOLUCIONARIO, 1)

			save(pPlayer, "Event_CespedesDestitucion", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION"))
		end)

	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_Leugi_Cuban_Destitucion.Outcomes[3] = {}
	Event_Leugi_Cuban_Destitucion.Outcomes[3].Name = "TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_3"
	Event_Leugi_Cuban_Destitucion.Outcomes[3].Desc = "TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_3"
	Event_Leugi_Cuban_Destitucion.Outcomes[3].Weight = 1
	Event_Leugi_Cuban_Destitucion.Outcomes[3].CanFunc = (
		function(pPlayer)			
			if (pPlayer:IsEmpireUnhappy()) then return false end
			if (pPlayer:IsEmpireVeryUnhappy()) then return false end
			if (pPlayer:IsEmpireSuperUnhappy()) then return false end
			local iUnhappy = 4
			Event_Leugi_Cuban_Destitucion.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_3", iUnhappy)
			return true
		end
		)
	Event_Leugi_Cuban_Destitucion.Outcomes[3].DoFunc = (
		function(pPlayer) 
			
			pPlayer:ChangeUnhappinessFromUnits(400)
			pPlayer:ChangeNumFreePolicies(1)

			save(pPlayer, "Event_CespedesDestitucion", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_DESTITUTION"))
		end)
	


Events_AddCivilisationSpecificScheduled(GameInfoTypes["CIVILIZATION_LEUGI_CUBA"], "Event_Leugi_Cuban_Destitucion", Event_Leugi_Cuban_Destitucion, 1873, true)


--=======================================================================================================================
--=======================================================================================================================
--  Chess Laws
--------------------------------------------------------------------------------------------------------------------------
local Event_Leugi_Cuban_Ajedrez = {}
	Event_Leugi_Cuban_Ajedrez.Name = "TXT_KEY_EVENT_CUBAN_CHESS"
	Event_Leugi_Cuban_Ajedrez.Desc = "TXT_KEY_EVENT_CUBAN_CHESS_DESC"
	Event_Leugi_Cuban_Ajedrez.Weight = 4
	Event_Leugi_Cuban_Ajedrez.CanFunc = (
		function(pPlayer)
			--
			-- Check if the event fired before			
			if load(pPlayer, "Event_CubanChess") == true then return false end
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_CUBA"] then return false end
			--
			-- Check the Era
			if pPlayer:GetCurrentEra() < GameInfoTypes["ERA_INDUSTRIAL"] then return false end
			--
			-- Fire the Event! (if chances are met)
			Event_Leugi_Cuban_Ajedrez.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS_OTHERS_ALERT"))
						end
					end
				end
			end
			return true
		end
		)
	Event_Leugi_Cuban_Ajedrez.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Cuban_Ajedrez.Outcomes[1] = {}
	Event_Leugi_Cuban_Ajedrez.Outcomes[1].Name = "TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_1"
	Event_Leugi_Cuban_Ajedrez.Outcomes[1].Desc = "TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_RESULT_1"
	Event_Leugi_Cuban_Ajedrez.Outcomes[1].Weight = 3
	Event_Leugi_Cuban_Ajedrez.Outcomes[1].CanFunc = (
		function(pPlayer)	
			local iCultureFromCities = pPlayer:GetJONSCulturePerTurnFromCities();		
			local iCulture = iCultureFromCities * 2
			
			Event_Leugi_Cuban_Ajedrez.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_RESULT_1", iCulture)
			
			return true
		end
		)
	Event_Leugi_Cuban_Ajedrez.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iCultureFromCities = pPlayer:GetJONSCulturePerTurnFromCities();		
			local iCulture = iCultureFromCities * 2
			pPlayer:ChangeJONSCulture(iCulture)

			save(pPlayer, "Event_CubanChess", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS"))
		end)


	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Cuban_Ajedrez.Outcomes[2] = {}
	Event_Leugi_Cuban_Ajedrez.Outcomes[2].Name = "TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_2"
	Event_Leugi_Cuban_Ajedrez.Outcomes[2].Desc = "TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_RESULT_2"
	Event_Leugi_Cuban_Ajedrez.Outcomes[2].Weight = 3
	Event_Leugi_Cuban_Ajedrez.Outcomes[2].CanFunc = (
		function(pPlayer)	
		
			local iHappiness = pPlayer:GetHappiness()
			if iHappiness < 1 then return false end
			local GABoost = iHappiness * 10

			Event_Leugi_Cuban_Ajedrez.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_RESULT_2", GABoost)
			
			return true
		end
		)
	Event_Leugi_Cuban_Ajedrez.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iHappiness = Player:GetHappiness()
			local GABoost = iHappiness * 10
			pPlayer:ChangeGoldenAgeProgressMeter(GABoost)

			save(pPlayer, "Event_CubanChess", true)

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_CUBAN_CHESS"))
		end)
	


Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LEUGI_CUBA"], "Event_Leugi_Cuban_Ajedrez", Event_Leugi_Cuban_Ajedrez)


--=======================================================================================================================
--=======================================================================================================================

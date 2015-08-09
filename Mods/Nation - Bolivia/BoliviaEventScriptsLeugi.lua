-- Leugi Bolivian Events
-- Author: Leugi
--=======================================================================================================================
print("Leugi's Bolivian Events: loaded")
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
--  Carnaval de Oruro
--------------------------------------------------------------------------------------------------------------------------
local Event_Leugi_Bolivian_Carnaval = {}
	Event_Leugi_Bolivian_Carnaval.Name = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL"
	Event_Leugi_Bolivian_Carnaval.Desc = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_DESC"
	Event_Leugi_Bolivian_Carnaval.Weight = 9
	Event_Leugi_Bolivian_Carnaval.CanFunc = (
		function(pPlayer)
			-- Check if the event fired before			
			if load(pPlayer, "Event_BolivianCarnaval") == true then return false end
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_BOLIVIA"] then return false end
			--
			-- Check the Era
			if pPlayer:GetCurrentEra() < GameInfoTypes["ERA_INDUSTRIAL"] then return false end
			--
			-- Check Number of Leagues
			if Game.GetNumActiveLeagues() < 1 then return false end 

			--
			-- Fire the Event! (if chances are met)
			Event_Leugi_Bolivian_Carnaval.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OTHERS_ALERT"))
						end
					end
				end
			end
			return true
		end
		)
	Event_Leugi_Bolivian_Carnaval.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Bolivian_Carnaval.Outcomes[1] = {}
	Event_Leugi_Bolivian_Carnaval.Outcomes[1].Name = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_1"
	Event_Leugi_Bolivian_Carnaval.Outcomes[1].Desc = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_1"
	Event_Leugi_Bolivian_Carnaval.Outcomes[1].Weight = 10
	Event_Leugi_Bolivian_Carnaval.Outcomes[1].CanFunc = (
		function(pPlayer)			
			-- Check Magistrates
			numMagistrates = 3
			if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return false end	
			-- Create Description			
			Event_Leugi_Bolivian_Carnaval.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_1", numMagistrates)
			return true
		end
		)
	Event_Leugi_Bolivian_Carnaval.Outcomes[1].DoFunc = (
		function(pPlayer) 
			
			-- Remove Magistrates
			pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
			-- Create Comparsa
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_COMPARSA_FOLKLORICA, 1)
			-- Grant Delegates
			for pCity in pPlayer:Cities() do
				if pCity:IsCapital() then
					local iBuilding1 = GameInfoTypes.BUILDING_BOLIVIAN_DELEGATE
					pCity:SetNumRealBuilding(iBuilding1, 1)
				end
			end
			-- Save the event
			save(pPlayer, "Event_BolivianCarnaval", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL"))
		end)

	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Leugi_Bolivian_Carnaval.Outcomes[2] = {}
	Event_Leugi_Bolivian_Carnaval.Outcomes[2].Name = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_2"
	Event_Leugi_Bolivian_Carnaval.Outcomes[2].Desc = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_2"
	Event_Leugi_Bolivian_Carnaval.Outcomes[2].Weight = 5
	Event_Leugi_Bolivian_Carnaval.Outcomes[2].CanFunc = (
		function(pPlayer)			
			-- Check Culture
			local iCost = math.ceil((250) * iMod)
			if pPlayer:GetJONSCulture() < iCost then return false end
			-- Create Description			
			Event_Leugi_Bolivian_Carnaval.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_2", iCost)
			return true
		end
		)
	Event_Leugi_Bolivian_Carnaval.Outcomes[2].DoFunc = (
		function(pPlayer) 
			-- Remove Culture
			local iCost = math.ceil((250) * iMod)
			pPlayer:ChangeJONSCulture(-iCost)
			-- Create Engineer
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_ENGINEER, 1)
			-- Save the event
			save(pPlayer, "Event_BolivianCarnaval", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL"))
		end)

	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_Leugi_Bolivian_Carnaval.Outcomes[3] = {}
	Event_Leugi_Bolivian_Carnaval.Outcomes[3].Name = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_3"
	Event_Leugi_Bolivian_Carnaval.Outcomes[3].Desc = "TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_3"
	Event_Leugi_Bolivian_Carnaval.Outcomes[3].Weight = 5
	Event_Leugi_Bolivian_Carnaval.Outcomes[3].CanFunc = (
		function(pPlayer)			
			-- Create Description			
			Event_Leugi_Bolivian_Carnaval.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_Leugi_Bolivian_Carnaval.Outcomes[3].DoFunc = (
		function(pPlayer) 
			-- Create Comparsa
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_COMPARSA_FOLKLORICA, 1)
			-- Save the event
			save(pPlayer, "Event_BolivianCarnaval", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_CARNAVAL"))
		end)


Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BOLIVIA"], "Event_Leugi_Bolivian_Carnaval", Event_Leugi_Bolivian_Carnaval)


--=======================================================================================================================
--=======================================================================================================================
--  Uprising
--------------------------------------------------------------------------------------------------------------------------
local Event_Leugi_Bolivian_Uprising = {}
	Event_Leugi_Bolivian_Uprising.Name = "TXT_KEY_EVENT_BOLIVIAN_UPRISING"
	Event_Leugi_Bolivian_Uprising.Desc = "TXT_KEY_EVENT_BOLIVIAN_UPRISING_DESC"
	Event_Leugi_Bolivian_Uprising.Weight = 10
	Event_Leugi_Bolivian_Uprising.CanFunc = (
		function(pPlayer)
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_BOLIVIA"] then return false end
			--
			-- Check the Era
			if pPlayer:GetCurrentEra() ~= GameInfoTypes["ERA_INDUSTRIAL"] then return false end
			--
			-- Fire the Event! (if chances are met)
			Event_Leugi_Bolivian_Uprising.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_UPRISING_DESC")
			for _, nPlayer in pairs(Players) do
				if (nPlayer:IsAlive()) then
					local pteamID = pPlayer:GetTeam();
					local pTeam = Teams[pteamID];
					local notifyteamID = nPlayer:GetTeam();
					local nTeam = Teams[notifyteamID];
					if (nTeam:IsHasMet(pTeam)) then
						if nPlayer:IsHuman() then
							Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_UPRISING_OTHERS_ALERT"))
						end
					end
				end
			end
			return true
		end
		)
	Event_Leugi_Bolivian_Uprising.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Bolivian_Uprising.Outcomes[1] = {}
	Event_Leugi_Bolivian_Uprising.Outcomes[1].Name = "TXT_KEY_EVENT_BOLIVIAN_UPRISING_OUTCOME_1"
	Event_Leugi_Bolivian_Uprising.Outcomes[1].Desc = "TXT_KEY_EVENT_BOLIVIAN_UPRISING_OUTCOME_RESULT_1"
	Event_Leugi_Bolivian_Uprising.Outcomes[1].Weight = 10
	Event_Leugi_Bolivian_Uprising.Outcomes[1].CanFunc = (
		function(pPlayer)			
			-- Set Culture Bonus
			local iBonus = math.ceil((250) * iMod)
			-- Create Description			
			Event_Leugi_Bolivian_Uprising.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_UPRISING_OUTCOME_RESULT_1", iBonus)
			return true
		end
		)
	Event_Leugi_Bolivian_Uprising.Outcomes[1].DoFunc = (
		function(pPlayer) 
			-- Add Culture
			local iBonus = math.ceil((250) * iMod)
			pPlayer:ChangeJONSCulture(iBonus)
			-- Create Barbarians
			Events.SerialEventUnitCreated.Add(CaudilloNames)
			local x = pPlayer:GetCapitalCity():GetX() + 1
			local y = pPlayer:GetCapitalCity():GetY() + 1
			local tPrereq = GameInfoTypes.TECH_RIFLING;
			local pTeam = pPlayer:GetTeam();
			Players[63]:InitUnit(GameInfoTypes["UNIT_BOLIVIA_COLORADO"], x, y):JumpToNearestValidPlot()
			Players[63]:InitUnit(GameInfoTypes["UNIT_BOLIVIA_COLORADO"], x, y):JumpToNearestValidPlot()
			Players[63]:InitUnit(GameInfoTypes["UNIT_CAUDILLO"], x, y):JumpToNearestValidPlot()
			
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_UPRISING_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_UPRISING"))
		end)


Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BOLIVIA"], "Event_Leugi_Bolivian_Uprising", Event_Leugi_Bolivian_Uprising)

-- Caudillo Names

local iGeneralID = GameInfo.Units.UNIT_GREAT_GENERAL.ID
function CaudilloNames(iPlayer, iUnit)
	local pPlayer = Players[iPlayer];
	--if (pPlayer:IsEverAlive()) then
		 if pPlayer:GetUnitByID(iUnit) ~= nil then
			pUnit = pPlayer:GetUnitByID(iUnit);
            		if (pUnit:GetUnitType() == iGeneralID) then
				rNum = (Game.Rand(10, "Caudillo names"))
				nn = rNum + 1
				if nn < 10 then
					pUnit:SetName(Locale.ConvertTextKey("TXT_KEY_CAUDILLO_0" .. nn));
				else
					pUnit:SetName(Locale.ConvertTextKey("TXT_KEY_CAUDILLO_" .. nn));
				end
				Events.SerialEventUnitCreated.Remove(CaudilloNames)
			end
		end
	--end
end

--=======================================================================================================================
--=======================================================================================================================
-- The Peruvian Diplomat
----------------------------------------------------------------------------------------
local Event_Bolivian_Diplomat = {}
    Event_Bolivian_Diplomat.Name = "TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT"
	Event_Bolivian_Diplomat.Desc = "TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_DESC"
	Event_Bolivian_Diplomat.Data1 = nil
	Event_Bolivian_Diplomat.Weight = 10
	Event_Bolivian_Diplomat.CanFunc = (
		function(pPlayer)
			if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BOLIVIA then return false end
			--
			-- Check the Era
			if pPlayer:GetCurrentEra() < GameInfoTypes["ERA_INDUSTRIAL"] then return false end
			-- Check if the event fired before			
			if load(pPlayer, "Event_BolivianDiplomat") == true then return false end
			--
			Event_Bolivian_Diplomat.Data1 = nil
			local tPossibleWar = {}
			for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				if iPlayer ~= pPlayer:GetID() then
				
					pTeam = Teams[pPlayer:GetTeam()]
					iEnemy = iPlayer
					pEnemy = Players[iEnemy]
					iEnemyTeam = pEnemy:GetTeam()
					
					if pEnemy:IsEverAlive() and pEnemy:IsAlive() and pTeam:IsHasMet(iEnemyTeam) and pTeam:CanDeclareWar(iEnemyTeam) and not(pTeam:IsAtWar(iEnemyTeam)) then
						table.insert(tPossibleWar, pEnemy)
					end
				end
			end
			Event_Bolivian_Diplomat.Data1 = tPossibleWar[GetRandom(1, #tPossibleWar)]
			if not Event_Bolivian_Diplomat.Data1 == nil then
			Event_Bolivian_Diplomat.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_DESC", Event_Bolivian_Diplomat.Data1:GetName())
			
			return true
			end
		end
		)
	Event_Bolivian_Diplomat.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Bolivian_Diplomat.Outcomes[1] = {}
	Event_Bolivian_Diplomat.Outcomes[1].Name = "TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_1"
	Event_Bolivian_Diplomat.Outcomes[1].Desc = "TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_RESULT_1"
	Event_Bolivian_Diplomat.Outcomes[1].CanFunc = (
		function(pPlayer)
			-- Create Description			
			Event_Bolivian_Diplomat.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_Bolivian_Diplomat.Outcomes[1].DoFunc = (
		function(pPlayer)
			pPlayer:SetGold(0)
			-- Save the event
			save(pPlayer, "Event_Event_BolivianDiplomat", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT"))
		
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_Bolivian_Diplomat.Outcomes[2] = {}
	Event_Bolivian_Diplomat.Outcomes[2].Name = "TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_2"
	Event_Bolivian_Diplomat.Outcomes[2].Desc = "TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_RESULT_2"
	Event_Bolivian_Diplomat.Outcomes[2].CanFunc = (
		function(pPlayer, pEnemy)
			local iReward = math.ceil(500 * iMod)
			Event_Bolivian_Diplomat.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_RESULT_2", pEnemy:GetName(), iReward)
			return true
		end
		)
	Event_Bolivian_Diplomat.Outcomes[2].DoFunc = (
		function(pPlayer, pEnemy)
			local iReward = math.ceil(500 * iMod)
			Teams[pPlayer:GetTeam()]:DeclareWar(pEnemy:GetTeam())
			pPlayer:ChangeJONSCulture(iReward)
			-- Save the event
			save(pPlayer, "Event_Event_BolivianDiplomat", true)
			-- Send the notification
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_BOLIVIAN_DIPLOMAT"))
		
		end
		)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_BOLIVIA"], "Event_Bolivian_Diplomat", Event_Bolivian_Diplomat)

-- JFD_HolyRomeEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Holy Rome Events: loaded")
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
function JFD_SendWorldEvent(description)
	Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end    
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
--  Magellan
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDHolyRomeMagellan = {}
	Event_JFDHolyRomeMagellan.Name = "TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN"
	Event_JFDHolyRomeMagellan.Desc = "TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_DESC"
	Event_JFDHolyRomeMagellan.Weight = 10
	Event_JFDHolyRomeMagellan.CanFunc = (
		function(pPlayer)			
			if load(pPlayer, "Event_JFDHolyRomeMagellan") == true then return false end
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"] then return false end
			
			local iGoldCost = math.ceil(1500 * iMod)
			if pPlayer:GetGold() < iGoldCost then return false end
			if not (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes["TECH_ASTRONOMY"])) then return true, false end

			Event_JFDHolyRomeMagellan.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_DESC", iGoldCost)			
			return true
		end
		)
	Event_JFDHolyRomeMagellan.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDHolyRomeMagellan.Outcomes[1] = {}
	Event_JFDHolyRomeMagellan.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_OUTCOME_1"
	Event_JFDHolyRomeMagellan.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_OUTCOME_RESULT_1"
	Event_JFDHolyRomeMagellan.Outcomes[1].Weight = 5
	Event_JFDHolyRomeMagellan.Outcomes[1].CanFunc = (
		function(pPlayer)		
			local iGoldCost = math.ceil(1500 * iMod)
			
			Event_JFDHolyRomeMagellan.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_OUTCOME_RESULT_1", iGoldCost)
			return true
		end
		)
	Event_JFDHolyRomeMagellan.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil(1000 * iMod)
			pPlayer:ChangeGold(-iGoldCost)
			local magellan = pPlayer:InitUnit(GameInfoTypes["UNIT_GREAT_ADMIRAL"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY())
			magellan:SetName("Ferdinand Magellan")
			magellan:JumpToNearestValidPlot()
			pPlayer:InitUnit(GameInfoTypes["UNIT_CARAVEL"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
			pPlayer:InitUnit(GameInfoTypes["UNIT_CARAVEL"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
			pPlayer:InitUnit(GameInfoTypes["UNIT_CARAVEL"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
			pPlayer:InitUnit(GameInfoTypes["UNIT_CARAVEL"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ROME_MAGELLAN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN"))
			if not pPlayer:IsHuman() and Teams[pPlayer:GetTeam()]:IsHasMet(Players[Game.GetActivePlayer()]:GetTeam()) then
				JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ROME_MAGELLAN")) 
			end
			save(pPlayer, "Event_JFDHolyRomeMagellan", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDHolyRomeMagellan.Outcomes[2] = {}
	Event_JFDHolyRomeMagellan.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_OUTCOME_2"
	Event_JFDHolyRomeMagellan.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_OUTCOME_RESULT_2"
	Event_JFDHolyRomeMagellan.Outcomes[2].Weight = 3
	Event_JFDHolyRomeMagellan.Outcomes[2].CanFunc = (
		function(pPlayer)
			Event_JFDHolyRomeMagellan.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_JFDHolyRomeMagellan.Outcomes[2].DoFunc = (
		function(pPlayer) 
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ROME_MAGELLAN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_MAGELLAN"))
			if not pPlayer:IsHuman() and Teams[pPlayer:GetTeam()]:IsHasMet(Players[Game.GetActivePlayer()]:GetTeam()) then
				JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ROME_MAGELLAN_2")) 
			end
			save(pPlayer, "Event_JFDHolyRomeMagellan", true)
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"], "Event_JFDHolyRomeMagellan", Event_JFDHolyRomeMagellan)
--------------------------------------------------------------------------------------------------------------------------
-- Schmlkaldic League
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDHolyRomeSchmlkaldicLeague = {}
	Event_JFDHolyRomeSchmlkaldicLeague.Name = "TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE"
	Event_JFDHolyRomeSchmlkaldicLeague.Desc = "TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_DESC"
	Event_JFDHolyRomeSchmlkaldicLeague.Weight = 10
	Event_JFDHolyRomeSchmlkaldicLeague.CanFunc = (
		function(pPlayer)			
			if load(pPlayer, "Event_JFDHolyRomeSchmlkaldicLeague") == true then return false end
			Event_JFDHolyRomeSchmlkaldicLeague.Desc = "TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_DESC"
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"] then return false end
			if pPlayer:GetReligionCreatedByPlayer() <= 0 and pPlayer:GetCapitalCity():GetReligiousMajority() <= 0 then return false end

			if not (Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes["TECH_CHIVALRY"])) then return true, false end
			if not pPlayer:IsHuman() and Teams[pPlayer:GetTeam()]:IsHasMet(Players[Game.GetActivePlayer()]:GetTeam()) then
				JFD_SendWorldEvent(Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HOLY_ROME_PRAGUE_DEFENESTRATION")) 
			end
			return true
		end
		)
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[1] = {}
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_1"
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_RESULT_1"
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[1].CanFunc = (
		function(pPlayer)
			Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iX = pPlayer:GetCapitalCity():GetX() + 3
			local iY = pPlayer:GetCapitalCity():GetY() + 2
			pPlayer:InitUnit(GameInfoTypes["UNIT_KNIGHT"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
			pPlayer:InitUnit(GameInfoTypes["UNIT_KNIGHT"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
			pPlayer:InitUnit(GameInfoTypes["UNIT_KNIGHT"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
			Players[63]:InitUnit(GameInfoTypes["UNIT_GREAT_GENERAL"], iX, iY):SetName("Philip of Hesse")
			Players[63]:InitUnit(GameInfoTypes["UNIT_GREAT_GENERAL"], iX, iY):SetName("John Frederick I")
			Players[63]:InitUnit(GameInfoTypes["UNIT_KNIGHT"], iX, iY):JumpToNearestValidPlot()
			Players[63]:InitUnit(GameInfoTypes["UNIT_KNIGHT"], iX, iY):JumpToNearestValidPlot()
			Players[63]:InitUnit(GameInfoTypes["UNIT_KNIGHT"], iX, iY):JumpToNearestValidPlot()
			Players[63]:InitUnit(GameInfoTypes["UNIT_KNIGHT"], iX, iY):JumpToNearestValidPlot()
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE"))
			save(pPlayer, "Event_JFDHolyRomeSchmlkaldicLeague", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[2] = {}
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_2"
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_RESULT_2"
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[2].CanFunc = (
		function(pPlayer)		
			local iGoldCost = math.ceil(400 * iMod)
			if (pPlayer:GetGold() < iGoldCost) then return false end

			Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_RESULT_2", iGoldCost)
			return true
		end
		)
	Event_JFDHolyRomeSchmlkaldicLeague.Outcomes[2].DoFunc = (
		function(pPlayer) 
			local iGoldCost = math.ceil(400 * iMod)
			pPlayer:ChangeGold(-iGoldCost)

			local iX = pPlayer:GetCapitalCity():GetX() + 3
			local iY = pPlayer:GetCapitalCity():GetY() + 2
			pPlayer:InitUnit(GameInfoTypes["UNIT_KNIGHT"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
			pPlayer:InitUnit(GameInfoTypes["UNIT_KNIGHT"], pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY()):JumpToNearestValidPlot()
				
			if JFD_GetRandom(1, 100) > 60 then
				Players[63]:InitUnit(GameInfoTypes["UNIT_GREAT_GENERAL"], iX, iY):SetName("Philip of Hesse")
				Players[63]:InitUnit(GameInfoTypes["UNIT_KNIGHT"], iX, iY):JumpToNearestValidPlot()
				Players[63]:InitUnit(GameInfoTypes["UNIT_KNIGHT"], iX, iY):JumpToNearestValidPlot()
			end

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HOLY_ROME_SCHMLKALDIC_LEAGUE"))
			save(pPlayer, "Event_JFDHolyRomeSchmlkaldicLeague", true)
		end)
	
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_HOLY_ROME"], "Event_JFDHolyRomeSchmlkaldicLeague", Event_JFDHolyRomeSchmlkaldicLeague)
--=======================================================================================================================
--=======================================================================================================================



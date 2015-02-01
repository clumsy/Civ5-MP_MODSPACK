-- JFD_ArmeniaEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Armenia Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
include("JFD_ArmeniaDynamicTopPanelSupport")
--------------------------------------------------------------------------------------------------------------------------
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_ARMENIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local playerBarbarianID = Players[63]
local policyArmenianApostolicChurchID = GameInfoTypes["POLICY_JFD_ARMENIAN_APOSTOLIC_CHURCH"]
local unitHorsemanID = GameInfoTypes["UNIT_HORSEMAN"]
local unitMamikonianID = GameInfoTypes["UNIT_JFD_MAMIKONIAN"]
--------------------------------------------------------------------------------------------------------------------------
--  Nakharar Conspiracy
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDArmeniaNakhararConspiracy = {}
	Event_JFDArmeniaNakhararConspiracy.Name = "TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY"
	Event_JFDArmeniaNakhararConspiracy.Desc = "TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_DESC"
	Event_JFDArmeniaNakhararConspiracy.Weight = 10
	Event_JFDArmeniaNakhararConspiracy.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID then return false end
			local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
			if religionID <= 0 then return false end

			Event_JFDArmeniaNakhararConspiracy.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_DESC", Game.GetReligionName(religionID))
			return true
		end
		)
	Event_JFDArmeniaNakhararConspiracy.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDArmeniaNakhararConspiracy.Outcomes[1] = {}
	Event_JFDArmeniaNakhararConspiracy.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_1"
	Event_JFDArmeniaNakhararConspiracy.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_1"
	Event_JFDArmeniaNakhararConspiracy.Outcomes[1].Weight = 3
	Event_JFDArmeniaNakhararConspiracy.Outcomes[1].CanFunc = (
		function(player)			
			local iGoldenAgeReward = mathCeil(player:GetGoldenAgeProgressMeter() * 30 / 100)
			Event_JFDArmeniaNakhararConspiracy.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_1", iGoldenAgeReward)
			return true
		end
		)
	Event_JFDArmeniaNakhararConspiracy.Outcomes[1].DoFunc = (
		function(player) 
			local goldenAgeReward = mathCeil(player:GetGoldenAgeProgressMeter() * 30 / 100)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			if JFD_GetRandom(1, 100) >= 30 then
				local capitalX = player:GetCapitalCity():GetX() + 1
				local capitalY = player:GetCapitalCity():GetY() + 1
				local unitID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MOUNTED") or unitHorsemanID
				playerBarbarianID:InitUnit(unitID, capitalX, capitalY):JumpToNearestValidPlot()
				playerBarbarianID:InitUnit(unitID, capitalX, capitalY):JumpToNearestValidPlot()
				playerBarbarianID:InitUnit(unitMamikonianID, capitalX, capitalY):JumpToNearestValidPlot()
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY"))
			else
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY"))
			end
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDArmeniaNakhararConspiracy.Outcomes[2] = {}
	Event_JFDArmeniaNakhararConspiracy.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_2"
	Event_JFDArmeniaNakhararConspiracy.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_2"
	Event_JFDArmeniaNakhararConspiracy.Outcomes[2].Weight = 5
	Event_JFDArmeniaNakhararConspiracy.Outcomes[2].CanFunc = (
		function(player)			
			local faithReward = mathCeil(98 * iMod)
			Event_JFDArmeniaNakhararConspiracy.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_2", faithReward)
			return true
		end
		)
	Event_JFDArmeniaNakhararConspiracy.Outcomes[2].DoFunc = (
		function(player) 
			local faithReward = mathCeil(98 * iMod)
			if JFD_GetRandom(1, 100) >= 30 then
				for city in player:Cities() do
					if not (city:IsCapital()) then
						city:ChangeResistanceTurns(1)
					end
				end
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY"))
			else
				JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ARMENIA_NAKHARAR_CONSPIRACY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY"))
			end
			player:ChangeFaith(faithReward)
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARMENIA_NAKHARAR_CONSPIRACY")) 
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDArmeniaNakhararConspiracy", Event_JFDArmeniaNakhararConspiracy)
--------------------------------------------------------------------------------------------------------------------------
-- Comet Sighted
--------------------------------------------------------------------------------------------------------------------------
local Event_ArmeniaCometSighteded = {}
	Event_ArmeniaCometSighteded.Name = "TXT_KEY_EVENT_COMETSIGHTED"
	Event_ArmeniaCometSighteded.Desc = "TXT_KEY_EVENT_COMETSIGHTED_DESC"
	Event_ArmeniaCometSighteded.Weight = 5
	Event_ArmeniaCometSighteded.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() > eraRenaissanceID 		then Event_ArmeniaCometSighteded.Desc = "TXT_KEY_EVENT_COMETSIGHTED_DESC_2" end
			return true
		end
		)
	Event_ArmeniaCometSighteded.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ArmeniaCometSighteded.Outcomes[1] = {}
	Event_ArmeniaCometSighteded.Outcomes[1].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_1"
	Event_ArmeniaCometSighteded.Outcomes[1].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE"
	Event_ArmeniaCometSighteded.Outcomes[1].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(100 * iMod)
			Event_ArmeniaCometSighteded.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE", goldenAgeCost)
			return true
		end
		)
	Event_ArmeniaCometSighteded.Outcomes[1].DoFunc = (
		function(player) 
			local goldenAgeCost = mathCeil(100 * iMod)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_NEGATIVE"), Locale.ConvertTextKey(Event_ArmeniaCometSighteded.Name))
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_ArmeniaCometSighteded.Outcomes[2] = {}
	Event_ArmeniaCometSighteded.Outcomes[2].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_2"
	Event_ArmeniaCometSighteded.Outcomes[2].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE"
	Event_ArmeniaCometSighteded.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(100 * iMod)
			Event_ArmeniaCometSighteded.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE", goldenAgeCost)
			return true
		end
		)
	Event_ArmeniaCometSighteded.Outcomes[2].DoFunc = (
		function(player) 
			local goldenAgeCost = mathCeil(100 * iMod)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_NEGATIVE"), Locale.ConvertTextKey(Event_ArmeniaCometSighteded.Name))
		end
		)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_ArmeniaCometSighteded.Outcomes[3] = {}
	Event_ArmeniaCometSighteded.Outcomes[3].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_3"
	Event_ArmeniaCometSighteded.Outcomes[3].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE"
	Event_ArmeniaCometSighteded.Outcomes[3].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil(100 * iMod)
			Event_ArmeniaCometSighteded.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_NEGATIVE", goldenAgeCost)
			if player:GetCurrentEra() > eraRenaissanceID then return false end
			return true
		end
		)
	Event_ArmeniaCometSighteded.Outcomes[3].DoFunc = (
		function(player) 
			local goldenAgeCost = mathCeil(100 * iMod)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_NEGATIVE"), Locale.ConvertTextKey(Event_ArmeniaCometSighteded.Name))
		end
		)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_ArmeniaCometSighteded.Outcomes[4] = {}
	Event_ArmeniaCometSighteded.Outcomes[4].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_4"
	Event_ArmeniaCometSighteded.Outcomes[4].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE"
	Event_ArmeniaCometSighteded.Outcomes[4].CanFunc = (
		function(player)			
			local goldenAgeReward = mathCeil(100 * iMod)
			Event_ArmeniaCometSighteded.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE", goldenAgeReward)
			if player:GetCurrentEra() > eraRenaissanceID then return true end
			return false
		end
		)
	Event_ArmeniaCometSighteded.Outcomes[4].DoFunc = (
		function(player) 
			local goldenAgeReward = mathCeil(100 * iMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_POSITIVE"), Locale.ConvertTextKey(Event_ArmeniaCometSighteded.Name))
		end
		)
	--=========================================================
	-- Outcome 5
	--=========================================================
	Event_ArmeniaCometSighteded.Outcomes[5] = {}
	Event_ArmeniaCometSighteded.Outcomes[5].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_5"
	Event_ArmeniaCometSighteded.Outcomes[5].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE"
	Event_ArmeniaCometSighteded.Outcomes[5].CanFunc = (
		function(player)			
			local goldenAgeReward = mathCeil(100 * iMod)
			Event_ArmeniaCometSighteded.Outcomes[5].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_POSITIVE", goldenAgeReward)
			if player:GetCurrentEra() > eraRenaissanceID then return true end
			return false
		end
		)
	Event_ArmeniaCometSighteded.Outcomes[5].DoFunc = (
		function(player) 
			local goldenAgeReward = mathCeil(100 * iMod)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_POSITIVE"), Locale.ConvertTextKey(Event_ArmeniaCometSighteded.Name))
		end
		)
	--=========================================================
	-- Outcome 6
	--=========================================================
	Event_ArmeniaCometSighteded.Outcomes[6] = {}
	Event_ArmeniaCometSighteded.Outcomes[6].Name = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_6"
	Event_ArmeniaCometSighteded.Outcomes[6].Desc = "TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_RESULT_6"
	Event_ArmeniaCometSighteded.Outcomes[6].Weight = 10
	Event_ArmeniaCometSighteded.Outcomes[6].CanFunc = (
		function(player)			
			local faithReward = mathCeil(50 * iMod)
			local goldReward = mathCeil(100 * iMod)
			if player:GetCivilizationType() ~= civilisationID then return false end
			Event_ArmeniaCometSighteded.Outcomes[6].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_OUTCOME_RESULT_6", faithReward, goldReward)
			return true
		end
		)
	Event_ArmeniaCometSighteded.Outcomes[6].DoFunc = (
		function(player) 
			local faithReward = mathCeil(50 * iMod)
			local goldReward = mathCeil(100 * iMod)
			player:ChangeFaith(faithReward)
			player:ChangeGold(goldReward)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_COMETSIGHTED_NOTIFICATION_POSITIVE"), Locale.ConvertTextKey(Event_ArmeniaCometSighteded.Name))
		end
		)

Events_AddCivilisationSpecificScheduled(civilisationID, "Event_ArmeniaCometSighteded", Event_ArmeniaCometSighteded, -87, true)
--------------------------------------------------------------------------------------------------------------------------
-- Alphabet
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDArmeniaAlphabet = {}
	Event_JFDArmeniaAlphabet.Name = "TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET"
	Event_JFDArmeniaAlphabet.Desc = "TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET_DESC"
	Event_JFDArmeniaAlphabet.Weight = 10
	Event_JFDArmeniaAlphabet.CanFunc = (
		function(player)			
			if load(player, "Event_JFDArmeniaAlphabet") == true 		then return false end
			if player:GetCivilizationType() ~= civilisationID 			then return false end
			if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return false end
			if not (player:HasPolicy(policyArmenianApostolicChurchID)) 	then return false end
			return true
		end
		)
	Event_JFDArmeniaAlphabet.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDArmeniaAlphabet.Outcomes[1] = {}
	Event_JFDArmeniaAlphabet.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET_OUTCOME_1"
	Event_JFDArmeniaAlphabet.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET_OUTCOME_RESULT_1"
	Event_JFDArmeniaAlphabet.Outcomes[1].Weight = 5
	Event_JFDArmeniaAlphabet.Outcomes[1].CanFunc = (
		function(player)	
			local faithReward = mathCeil(100 * iMod)
			Event_JFDArmeniaAlphabet.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET_OUTCOME_RESULT_1", faithReward)
			return true
		end
		)
	Event_JFDArmeniaAlphabet.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithReward = mathCeil(100 * iMod)
			player:ChangeNumResourceTotal(iMagistrate, -1)
			player:ChangeFaith(faithReward)
			player:ChangeGoldenAgeTurns(12)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ARMENIA_ALPHABET_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARMENIA_ALPHABET")) 
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDArmeniaAlphabet.Outcomes[2] = {}
	Event_JFDArmeniaAlphabet.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET_OUTCOME_2"
	Event_JFDArmeniaAlphabet.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET_OUTCOME_RESULT_2"
	Event_JFDArmeniaAlphabet.Outcomes[2].Weight = 2
	Event_JFDArmeniaAlphabet.Outcomes[2].CanFunc = (
		function(player)	
			local cultureReward = mathCeil(150 * iMod)
			Event_JFDArmeniaAlphabet.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET_OUTCOME_RESULT_2", cultureReward)
			return true
		end
		)
	Event_JFDArmeniaAlphabet.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local cultureReward = mathCeil(150 * iMod)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_ARMENIA_ALPHABET_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_ARMENIA_ALPHABET"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ARMENIA_ALPHABET")) 
			save(player, "Event_JFDArmeniaAlphabet", true)
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDArmeniaAlphabet", Event_JFDArmeniaAlphabet)
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDArmeniaAlphabet", Event_JFDArmeniaAlphabet, 405, true)
--=======================================================================================================================
--=======================================================================================================================



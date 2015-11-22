-- JFD_HungaryEvents
-- Author: JFD
--=======================================================================================================================
print("JFD's Hungary Events: loaded")
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
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_HUNGARY"]
local eraIndustrialID = GameInfoTypes["ERA_INDUSTRIAL"]
local eraMedievalID = GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil = math.ceil
local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local unitPromotionForeignHeroID = GameInfoTypes["PROMOTION_JFD_HUGNARY_FOREIGN_HERO"]
--------------------------------------------------------------------------------------------------------------------------
--  The Blood Countess
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDHungaryBloodCountess = {}
	Event_JFDHungaryBloodCountess.Name = "TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS"
	Event_JFDHungaryBloodCountess.Desc = "TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_DESC"
	Event_JFDHungaryBloodCountess.Weight = 10
	Event_JFDHungaryBloodCountess.CanFunc = (
		function(player)			
			if load(player, "Event_JFDHungaryBloodCountess") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < eraMedievalID then return false end
			Event_JFDHungaryBloodCountess.Desc = "TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_DESC"
			return true
		end
		)
	Event_JFDHungaryBloodCountess.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDHungaryBloodCountess.Outcomes[1] = {}
	Event_JFDHungaryBloodCountess.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_1"
	Event_JFDHungaryBloodCountess.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_RESULT_1"
	Event_JFDHungaryBloodCountess.Outcomes[1].Weight = 5
	Event_JFDHungaryBloodCountess.Outcomes[1].CanFunc = (
		function(player)			
			local goldCost = mathCeil(65 * iMod)
			local goldenAgeReward = mathCeil(155 * iMod)

			if player:GetGold() < goldCost then return false end
			Event_JFDHungaryBloodCountess.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_RESULT_1", goldCost, goldenAgeReward)
			return true
		end
		)
	Event_JFDHungaryBloodCountess.Outcomes[1].DoFunc = (
		function(player) 
			local goldCost = mathCeil(65 * iMod)
			local goldenAgeReward = mathCeil(155 * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS"))
			JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_HUNGARY_BLOOD_COUNTESS")) 
			save(player, "Event_JFDHungaryBloodCountess", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDHungaryBloodCountess.Outcomes[2] = {}
	Event_JFDHungaryBloodCountess.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_2"
	Event_JFDHungaryBloodCountess.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_RESULT_2"
	Event_JFDHungaryBloodCountess.Outcomes[2].Weight = 1
	Event_JFDHungaryBloodCountess.Outcomes[2].CanFunc = (
		function(player)			
			local goldenAgeCost = mathCeil((player:GetGoldenAgeProgressMeter() * 15 / 100) * iMod)
			local cultureReward = mathCeil(46 * iMod)

			Event_JFDHungaryBloodCountess.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_RESULT_2", goldenAgeCost, cultureReward)
			return true
		end
		)
	Event_JFDHungaryBloodCountess.Outcomes[2].DoFunc = (
		function(player) 
			local goldenAgeCost = mathCeil((player:GetGoldenAgeProgressMeter() * 15 / 100) * iMod)
			local cultureReward = mathCeil(46 * iMod)
			player:ChangeGoldenAgeProgressMeter(-goldenAgeCost)
			player:ChangeJONSCulture(cultureReward)

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_BLOOD_COUNTESS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_BLOOD_COUNTESS"))
			save(player, "Event_JFDHungaryBloodCountess", true)
		end)

Events_AddCivilisationSpecific(civilisationID, "Event_JFDHungaryBloodCountess", Event_JFDHungaryBloodCountess)
--------------------------------------------------------------------------------------------------------------------------
-- A Foreign Hero
--------------------------------------------------------------------------------------------------------------------------
local Event_JFDHungaryForeignHero = {}
	Event_JFDHungaryForeignHero.Name = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO"
	Event_JFDHungaryForeignHero.Desc = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_DESC"
	Event_JFDHungaryForeignHero.Weight = 10
	Event_JFDHungaryForeignHero.CanFunc = (
		function(player)			
			if load(player, "Event_JFDHungaryForeignHero") == true then return false end
			Event_JFDHungaryForeignHero.Desc = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_DESC"
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < eraIndustrialID then return false end

			return true
		end
		)
	Event_JFDHungaryForeignHero.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDHungaryForeignHero.Outcomes[1] = {}
	Event_JFDHungaryForeignHero.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_1"
	Event_JFDHungaryForeignHero.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_1"
	Event_JFDHungaryForeignHero.Outcomes[1].Weight = 5
	Event_JFDHungaryForeignHero.Outcomes[1].CanFunc = (
		function(player)			
			local cultureCost = mathCeil(120 * iMod)
			if player:GetJONSCulture() < cultureCost then return false end
			
			Event_JFDHungaryForeignHero.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_1", cultureCost)
			return true
		end
		)
	Event_JFDHungaryForeignHero.Outcomes[1].DoFunc = (
		function(player) 
			local cultureCost = mathCeil(120 * iMod)
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY =  player:GetCapitalCity():GetY()
			player:ChangeJONSCulture(-cultureCost)
			
			local unit = player:InitUnit(unitGreatGeneralID, capitalX, capitalY)
			unit:SetHasPromotion(unitPromotionForeignHeroID, true)
			unit:SetName(Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_JOZEF_BEM"))
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO"))
			save(player, "Event_JFDHungaryForeignHero", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDHungaryForeignHero.Outcomes[2] = {}
	Event_JFDHungaryForeignHero.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_2"
	Event_JFDHungaryForeignHero.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_2"
	Event_JFDHungaryForeignHero.Outcomes[2].Weight = 3
	Event_JFDHungaryForeignHero.Outcomes[2].CanFunc = (
		function(player)			
			local cultureCost = mathCeil(70 * iMod)

			Event_JFDHungaryForeignHero.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_2", cultureCost)
			return true
		end
		)
	Event_JFDHungaryForeignHero.Outcomes[2].DoFunc = (
		function(player) 
			local cultureCost = mathCeil(70 * iMod)
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY =  player:GetCapitalCity():GetY()
			player:ChangeJONSCulture(-cultureCost)
			local unit = player:InitUnit(unitGreatGeneralID, capitalX, capitalY)
			unit:SetName(Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_JOZEF_BEM"))
			
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO"))
			save(player, "Event_JFDHungaryForeignHero", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFDHungaryForeignHero.Outcomes[3] = {}
	Event_JFDHungaryForeignHero.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_3"
	Event_JFDHungaryForeignHero.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_3"
	Event_JFDHungaryForeignHero.Outcomes[3].Weight = 1
	Event_JFDHungaryForeignHero.Outcomes[3].CanFunc = (
		function(player)			
			Event_JFDHungaryForeignHero.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_JFDHungaryForeignHero.Outcomes[3].DoFunc = (
		function(player) 
			local randomPlayer = Players[3]
			local capitalX = randomPlayer:GetCapitalCity():GetX()
			local capitalY =  randomPlayer:GetCapitalCity():GetY()
			local unit = randomPlayer:InitUnit(unitGreatGeneralID, capitalX, capitalY)
			unit:SetName(Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_JOZEF_BEM"))

			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_HUNGARY_FOREIGN_HERO_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_HUNGARY_FOREIGN_HERO"))
			save(player, "Event_JFDHungaryForeignHero", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_JFDHungaryForeignHero", Event_JFDHungaryForeignHero)
--=======================================================================================================================
--=======================================================================================================================



------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_LITE_TARCISIO_PTOLEMIES"]
--------------------------------------------------------------------------------------------------------------------------
-- Event_LITE_Nile_Famine
--------------------------------------------------------------------------------------------------------------------------
local Event_LITE_Nile_Famine = {}
	Event_LITE_Nile_Famine.Name = "TXT_KEY_EVENT_NILE_FAMINE"
	Event_LITE_Nile_Famine.Desc = "TXT_KEY_EVENT_NILE_FAMINE_DESC"
	Event_LITE_Nile_Famine.Weight = 5
	Event_LITE_Nile_Famine.CanFunc = (
		function(player)			
			if load(player, "Event_LITE_Nile_Famine") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			return true
		end
		)
	Event_LITE_Nile_Famine.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_LITE_Nile_Famine.Outcomes[1] = {}
	Event_LITE_Nile_Famine.Outcomes[1].Name = "TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_1"
	Event_LITE_Nile_Famine.Outcomes[1].Desc = "TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_RESULT_1"
	Event_LITE_Nile_Famine.Outcomes[1].Data1 = nil
	Event_LITE_Nile_Famine.Outcomes[1].CanFunc = (
		function(player)
			local affectedCity
			for city in player:Cities() do
				if city:GetNumRealBuilding(GameInfoTypes["BUILDING_TEMPLE"]) < 0 then
					local affectedCity = city
					break
				end
			end

			if affectedCity == nil then
				affectedCity = player:GetCapitalCity()
			end

			local faithGained = math.ceil(20 * iMod * (player:GetCurrentEra() + 1))
			local gold = math.ceil(200 + (50 * iMod * (player:GetCurrentEra() + 1)))

			Event_LITE_Nile_Famine.Outcomes[1].Data1 = affectedCity
			Event_LITE_Nile_Famine.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_RESULT_1", affectedCity:GetName(), faithGained, gold)
			if player:GetGold() < gold then return false end
			return true
		end
		)
	Event_LITE_Nile_Famine.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()

			local faithGained = math.ceil(20 * iMod * (player:GetCurrentEra() + 1))
			local gold = math.ceil(200 + (50 * iMod * (player:GetCurrentEra() + 1)))

			player:ChangeFaith(faithGained)
			player:ChangeGold(-gold)

			local city = Event_LITE_Nile_Famine.Outcomes[1].Data1
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_TEMPLE"], 1)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_NILE_FAMINE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_NILE_FAMINE"))
			save(player, "Event_LITE_Nile_Famine", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_LITE_Nile_Famine.Outcomes[2] = {}
	Event_LITE_Nile_Famine.Outcomes[2].Name = "TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_2"
	Event_LITE_Nile_Famine.Outcomes[2].Desc = "TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_RESULT_2"
	Event_LITE_Nile_Famine.Outcomes[2].Data1 = nil
	Event_LITE_Nile_Famine.Outcomes[2].CanFunc = (
		function(player)
			local affectedCity
			for city in player:Cities() do
				if city:GetNumRealBuilding(GameInfoTypes["BUILDING_GRANARY"]) < 0 or city:GetNumRealBuilding(GameInfoTypes["BUILDING_AQUEDUCT"]) < 0 then
					local affectedCity = city
					break
				end
			end

			if affectedCity == nil then
				affectedCity = player:GetCapitalCity()
			end

			local gold = math.ceil(325 + (25 * iMod * (player:GetCurrentEra() + 1)))

			Event_LITE_Nile_Famine.Outcomes[2].Data1 = affectedCity
			Event_LITE_Nile_Famine.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_RESULT_2", affectedCity:GetName(), gold)
			if player:GetGold() < gold then return false end
			return true
		end
		)
	Event_LITE_Nile_Famine.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()

			local gold = math.ceil(325 + (25 * iMod * (player:GetCurrentEra() + 1)))

			player:ChangeGold(-gold)

			local city = Event_LITE_Nile_Famine.Outcomes[2].Data1
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_GRANARY"], 1)
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_AQUEDUCT"], 1)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_NILE_FAMINE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_NILE_FAMINE"))
			save(player, "Event_LITE_Nile_Famine", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_LITE_Nile_Famine.Outcomes[3] = {}
	Event_LITE_Nile_Famine.Outcomes[3].Name = "TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_3"
	Event_LITE_Nile_Famine.Outcomes[3].Desc = "TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_RESULT_3"
	Event_LITE_Nile_Famine.Outcomes[3].CanFunc = (
		function(player)
			local affectedCity = player:GetCapitalCity()

			Event_LITE_Nile_Famine.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_NILE_FAMINE_OUTCOME_RESULT_3", affectedCity:GetName())

			return true
		end
		)
	Event_LITE_Nile_Famine.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()

			local city = player:GetCapitalCity()
			city:ChangeResistanceTurns(3)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_NILE_FAMINE_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_NILE_FAMINE"))
			save(player, "Event_LITE_Nile_Famine", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_LITE_Nile_Famine", Event_LITE_Nile_Famine)	
--------------------------------------------------------------------------------------------------------------------------
-- Event_LITE_Mark_Antony
--------------------------------------------------------------------------------------------------------------------------
local Event_LITE_Mark_Antony = {}
	Event_LITE_Mark_Antony.Name = "TXT_KEY_EVENT_MARK_ANTONY"
	Event_LITE_Mark_Antony.Desc = "TXT_KEY_EVENT_MARK_ANTONY_DESC"
	Event_LITE_Mark_Antony.Weight = 5
	Event_LITE_Mark_Antony.CanFunc = (
		function(player)			
			if load(player, "Event_LITE_Mark_Antony") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			return true
		end
		)
	Event_LITE_Mark_Antony.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_LITE_Mark_Antony.Outcomes[1] = {}
	Event_LITE_Mark_Antony.Outcomes[1].Name = "TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_1"
	Event_LITE_Mark_Antony.Outcomes[1].Desc = "TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_RESULT_1"
	Event_LITE_Mark_Antony.Outcomes[1].CanFunc = (
		function(player)
			local culture = math.ceil((player:GetJONSCulturePerTurnFromCities() * 3) + (150 * iMod))
			Event_LITE_Mark_Antony.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_RESULT_1", culture)
			return true
		end
		)
	Event_LITE_Mark_Antony.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			capital:ChangeResistanceTurns(3)

			local culture = math.ceil((player:GetJONSCulturePerTurnFromCities() * 3) + (150 * iMod))
			player:ChangeJONSCulture(culture)

			player:InitUnit(GameInfoTypes["UNIT_GREAT_GENERAL"], capital:GetX(), capital:GetY()):SetName("Marcus Antonius")

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_MARK_ANTONY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY_WORLD")) 
			save(player, "Event_LITE_Mark_Antony", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_LITE_Mark_Antony.Outcomes[2] = {}
	Event_LITE_Mark_Antony.Outcomes[2].Name = "TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_2"
	Event_LITE_Mark_Antony.Outcomes[2].Desc = "TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_RESULT_2"
	Event_LITE_Mark_Antony.Outcomes[2].CanFunc = (
		function(player)
			local gold = math.ceil(350 + (20 * iMod * (player:GetCurrentEra() + 1)))
			Event_LITE_Mark_Antony.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_RESULT_2", gold)
			if player:GetGold() < gold then return false end
			return true
		end
		)
	Event_LITE_Mark_Antony.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()

			local gold = math.ceil(350 + (25 * iMod * (player:GetCurrentEra() + 1)))

			local tcmunit1 = GameInfoTypes["UNIT_MECHANIZED_INFANTRY"]
			local tcmunit2 = GameInfoTypes["UNIT_INFANTRY"]
			local tcmunit3 = GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"]
			local tcmunit4 = GameInfoTypes["UNIT_RIFLEMAN"]
			local tcmunit5 = GameInfoTypes["UNIT_MUSKETMAN"]
			local tcmunit6 = GameInfoTypes["UNIT_PIKEMAN"]
			local tcmunit7 = GameInfoTypes["UNIT_SPEARMAN"]
			local tcmunit8 = GameInfoTypes["UNIT_WARRIOR"]

			local tcmunitList = {
				tcmunit1,
				tcmunit2,
				tcmunit3,
				tcmunit4,
				tcmunit5,
				tcmunit6,
				tcmunit7,
				tcmunit8
				}

			local militaryUnit
			for _, unitID in ipairs(tcmunitList) do
				if player:CanTrain(unitID) then
					militaryUnit = unitID
					break
				end
			end

			if militaryUnit == tcmunit7 then
				if player:GetNumResourceAvailable(GameInfoTypes["RESOURCE_IRON"], true) > 2 then
					militaryUnit = GameInfoTypes["UNIT_ROMAN_LEGION"]
				end
			end

			local unitOne = player:InitUnit(militaryUnit, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY()) 
			local unitTwo = player:InitUnit(militaryUnit, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY()) 
			local unitThree = player:InitUnit(militaryUnit, player:GetCapitalCity():GetX(), player:GetCapitalCity():GetY()) 
			player:ChangeGold(-gold) 
			unitOne:ChangeLevel(2)
			unitTwo:ChangeLevel(2)
			unitThree:ChangeLevel(2)
			unitOne:SetHasPromotion(GameInfoTypes["PROMOTION_DRILL_1"], true)
			unitOne:SetHasPromotion(GameInfoTypes["PROMOTION_DRILL_2"], true)
			unitTwo:SetHasPromotion(GameInfoTypes["PROMOTION_SHOCK_1"], true)
			unitTwo:SetHasPromotion(GameInfoTypes["PROMOTION_SHOCK_2"], true)
			unitThree:SetHasPromotion(GameInfoTypes["PROMOTION_SHOCK_1"], true)
			unitThree:SetHasPromotion(GameInfoTypes["PROMOTION_DRILL_1"], true)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_MARK_ANTONY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY_WORLD")) 
			save(player, "Event_LITE_Mark_Antony", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_LITE_Mark_Antony.Outcomes[3] = {}
	Event_LITE_Mark_Antony.Outcomes[3].Name = "TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_3"
	Event_LITE_Mark_Antony.Outcomes[3].Desc = "TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_RESULT_3"
	Event_LITE_Mark_Antony.Outcomes[3].CanFunc = (
		function(player)
			local affectedCity = player:GetCapitalCity()
			Event_LITE_Mark_Antony.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_LITE_Mark_Antony.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_MARK_ANTONY_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_EVENT_MARK_ANTONY_WORLD")) 
			save(player, "Event_LITE_Mark_Antony", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_LITE_Mark_Antony", Event_LITE_Mark_Antony)
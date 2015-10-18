--Shirley Brothers

local Event_SafavidShirleyBrothers = {}
	Event_SafavidShirleyBrothers.Name = "TXT_KEY_EVENT_SHIRLEY_BROTHERS"
	Event_SafavidShirleyBrothers.Desc = "TXT_KEY_EVENT_SHIRLEY_BROTHERS_DESC"
	Event_SafavidShirleyBrothers.Weight = 10
	Event_SafavidShirleyBrothers.CanFunc = (
		function(pPlayer)				
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_SAFAVIDS"] then return false end
			if load(pPlayer, "Event_SafavidShirleyBrothers") == true then return false end
			Event_SafavidShirleyBrothers.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SHIRLEY_BROTHERS_DESC")
			return true
		end
		)

	Event_SafavidShirleyBrothers.Outcomes = {}

	Event_SafavidShirleyBrothers.Outcomes[1] = {}
	Event_SafavidShirleyBrothers.Outcomes[1].Name = "TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_1"
	Event_SafavidShirleyBrothers.Outcomes[1].Desc = "TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_RESULT_1"
	Event_SafavidShirleyBrothers.Outcomes[1].Weight = 10
	Event_SafavidShirleyBrothers.Outcomes[1].CanFunc = (
		function(pPlayer)	
			Event_SafavidShirleyBrothers.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_SafavidShirleyBrothers.Outcomes[1].DoFunc = (

		function(pPlayer) 

			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes["POLICY_SHIRLEY_BROTHERS"], true)

			save(pPlayer, "Event_SafavidShirleyBrothers", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SHIRLEY_BROTHERS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidShirleyBrothers.Name))

		end)

	Event_SafavidShirleyBrothers.Outcomes[2] = {}
	Event_SafavidShirleyBrothers.Outcomes[2].Name = "TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_2"
	Event_SafavidShirleyBrothers.Outcomes[2].Desc = "TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_RESULT_2"
	Event_SafavidShirleyBrothers.Outcomes[2].Weight = 0
	Event_SafavidShirleyBrothers.Outcomes[2].CanFunc = (
		function(pPlayer)	
			Event_SafavidShirleyBrothers.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_SafavidShirleyBrothers.Outcomes[2].DoFunc = (

		function(pPlayer) 

			local uGeneral = GameInfo.Units.UNIT_GREAT_GENERAL.ID;
			local pcCity = pPlayer:GetCapitalCity();
			pUnit = pPlayer:InitUnit(uGeneral, pcCity:GetX(), pcCity:GetY(), UNITAI_GENERAL);
			pUnit:JumpToNearestValidPlot()

			for pUnit in pPlayer:Units() do
				if pUnit:IsCombatUnit() then
					local unitlevel = pUnit:GetLevel()
					if unitlevel == 1 then
						pUnit:SetExperience(0)
					elseif unitlevel == 2 then
						pUnit:SetExperience(10)
					elseif unitlevel == 3 then
						pUnit:SetExperience(30)
					elseif unitlevel == 4 then
						pUnit:SetExperience(60)
					elseif unitlevel == 5 then
						pUnit:SetExperience(100)
					elseif unitlevel == 6 then
						pUnit:SetExperience(150)
					elseif unitlevel == 7 then
						pUnit:SetExperience(210)
					elseif unitlevel == 8 then
						pUnit:SetExperience(280)
					else
						pUnit:SetExperience(360)
					end
				end
			end

			save(pPlayer, "Event_SafavidShirleyBrothers", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SHIRLEY_BROTHERS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidShirleyBrothers.Name))
	
		end)

	Event_SafavidShirleyBrothers.Outcomes[3] = {}
	Event_SafavidShirleyBrothers.Outcomes[3].Name = "TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_3"
	Event_SafavidShirleyBrothers.Outcomes[3].Desc = "TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_RESULT_3"
	Event_SafavidShirleyBrothers.Outcomes[3].Weight = 0
	Event_SafavidShirleyBrothers.Outcomes[3].CanFunc = (
		function(pPlayer)	
			Event_SafavidShirleyBrothers.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SHIRLEY_BROTHERS_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_SafavidShirleyBrothers.Outcomes[3].DoFunc = (

		function(pPlayer) 

			save(pPlayer, "Event_SafavidShirleyBrothers", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SHIRLEY_BROTHERS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidShirleyBrothers.Name))
	
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_SAFAVIDS"], "Event_SafavidShirleyBrothers", Event_SafavidShirleyBrothers)

--Crown Prince

local Event_SafavidCrownPrince = {}
	Event_SafavidCrownPrince.Name = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE"
	Event_SafavidCrownPrince.Desc = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_DESC"
	Event_SafavidCrownPrince.Weight = 5
	Event_SafavidCrownPrince.CanFunc = (
		function(pPlayer)				
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_SAFAVIDS"] then return false end
			if load(pPlayer, "Event_SafavidCrownPrince") == true then return false end
			Event_SafavidCrownPrince.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_DESC")
			return true
		end
		)

	Event_SafavidCrownPrince.Outcomes = {}

	Event_SafavidCrownPrince.Outcomes[1] = {}
	Event_SafavidCrownPrince.Outcomes[1].Name = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_1"
	Event_SafavidCrownPrince.Outcomes[1].Desc = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_1"
	Event_SafavidCrownPrince.Outcomes[1].Weight = 10
	Event_SafavidCrownPrince.Outcomes[1].CanFunc = (
		function(pPlayer)	
			Event_SafavidCrownPrince.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_SafavidCrownPrince.Outcomes[1].DoFunc = (

		function(pPlayer) 

			local pcCity = pPlayer:GetCapitalCity();
			pcCity:ChangeResistanceTurns(5);

			save(pPlayer, "Event_SafavidCrownPrince", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidCrownPrince.Name))

		end)

	Event_SafavidCrownPrince.Outcomes[2] = {}
	Event_SafavidCrownPrince.Outcomes[2].Name = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_2"
	Event_SafavidCrownPrince.Outcomes[2].Desc = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_2"
	Event_SafavidCrownPrince.Outcomes[2].Weight = 0
	Event_SafavidCrownPrince.Outcomes[2].CanFunc = (
		function(pPlayer)	
			Event_SafavidCrownPrince.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_SafavidCrownPrince.Outcomes[2].DoFunc = (

		function(pPlayer) 

			pPlayer:SetGoldenAgeProgressMeter(0);

			save(pPlayer, "Event_SafavidCrownPrince", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidCrownPrince.Name))
	
		end)

	Event_SafavidCrownPrince.Outcomes[3] = {}
	Event_SafavidCrownPrince.Outcomes[3].Name = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_3"
	Event_SafavidCrownPrince.Outcomes[3].Desc = "TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_3"
	Event_SafavidCrownPrince.Outcomes[3].Weight = 0
	Event_SafavidCrownPrince.Outcomes[3].CanFunc = (
		function(pPlayer)	
			Event_SafavidCrownPrince.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_SafavidCrownPrince.Outcomes[3].DoFunc = (

		function(pPlayer) 

			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes["POLICY_SAFAVID_CROWN_PRINCE"], true)

			save(pPlayer, "Event_SafavidCrownPrince", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SAFAVID_CROWN_PRINCE_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidCrownPrince.Name))
	
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_SAFAVIDS"], "Event_SafavidCrownPrince", Event_SafavidCrownPrince)

--Qizilbash

local uLancer = GameInfoTypes.UNITCLASS_LANCER;
local uQizilbash = GameInfo.Units.UNIT_QIZILBASH.ID;
local uCavalry = GameInfo.Units.UNIT_CAVALRY.ID;

local Event_SafavidQizilbash = {}
	Event_SafavidQizilbash.Name = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION"
	Event_SafavidQizilbash.Desc = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_DESC"
	Event_SafavidQizilbash.Weight = 5
	Event_SafavidQizilbash.CanFunc = (
		function(pPlayer)				

			local iCost = math.ceil(1000 * iMod)
			local cLancer = pPlayer:GetUnitClassCount(uLancer) 
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_SAFAVIDS"] then return false end
			if (cLancer < 1) then return false end
			if load(pPlayer, "Event_SafavidQizilbash") == true then return false end
			if (pPlayer:GetGold() < iCost) then return false end

			Event_SafavidQizilbash.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_DESC")

			return true
		end
		)

	Event_SafavidQizilbash.Outcomes = {}

	Event_SafavidQizilbash.Outcomes[1] = {}
	Event_SafavidQizilbash.Outcomes[1].Name = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_1"
	Event_SafavidQizilbash.Outcomes[1].Desc = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_1"
	Event_SafavidQizilbash.Outcomes[1].Weight = 0
	Event_SafavidQizilbash.Outcomes[1].CanFunc = (
		function(pPlayer)	
			local iCost = math.ceil(500 * iMod)
			Event_SafavidQizilbash.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_1", iCost)
			return true
		end
		)
	Event_SafavidQizilbash.Outcomes[1].DoFunc = (

		function(pPlayer) 

			local iCost = math.ceil(500 * iMod)
			pPlayer:ChangeGold(iCost);

			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes["POLICY_SAFAVID_QIZILBASH"], true)

			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == uQizilbash then
					pUnit:Kill();
				end
			end

			save(pPlayer, "Event_SafavidQizilbash", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidQizilbash.Name))

		end)

	Event_SafavidQizilbash.Outcomes[2] = {}
	Event_SafavidQizilbash.Outcomes[2].Name = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_2"
	Event_SafavidQizilbash.Outcomes[2].Desc = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_2"
	Event_SafavidQizilbash.Outcomes[2].Weight = 0
	Event_SafavidQizilbash.Outcomes[2].CanFunc = (
		function(pPlayer)	
			local iCost = math.ceil(1000 * iMod)
			Event_SafavidQizilbash.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_2", iCost)
			return true
		end
		)
	Event_SafavidQizilbash.Outcomes[2].DoFunc = (

		function(pPlayer) 

			local iCost = math.ceil(1000 * iMod)
			pPlayer:ChangeGold(-iCost);

			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == uQizilbash then
					local newUnit = pPlayer:InitUnit(uCavalry, pUnit:GetX(), pUnit:GetY())
					newUnit:Convert(pUnit);
				end
			end

			save(pPlayer, "Event_SafavidQizilbash", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidQizilbash.Name))
	
		end
		)

	Event_SafavidQizilbash.Outcomes[3] = {}
	Event_SafavidQizilbash.Outcomes[3].Name = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_3"
	Event_SafavidQizilbash.Outcomes[3].Desc = "TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_3"
	Event_SafavidQizilbash.Outcomes[3].Weight = 10
	Event_SafavidQizilbash.Outcomes[3].CanFunc = (
		function(pPlayer)	
			Event_SafavidQizilbash.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_3")
			return true
		end
		)
	Event_SafavidQizilbash.Outcomes[3].DoFunc = (

		function(pPlayer) 

			local speed = Game.GetGameSpeedType();
			if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
				pPlayer:ChangeGoldenAgeTurns(6)
			elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
				pPlayer:ChangeGoldenAgeTurns(8)
			elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
				pPlayer:ChangeGoldenAgeTurns(10)
			elseif speed == GameInfo.GameSpeeds['GAMESPEED_MARATHON'].ID then
				pPlayer:ChangeGoldenAgeTurns(16)
			else
				pPlayer:ChangeGoldenAgeTurns(16)
			end

			save(pPlayer, "Event_SafavidQizilbash", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_SAFAVID_QIZILBASH_SECESSION_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey(Event_SafavidQizilbash.Name))
	
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_SAFAVIDS"], "Event_SafavidQizilbash", Event_SafavidQizilbash)

local pQizilbash = GameInfoTypes.POLICY_SAFAVID_QIZILBASH;
local pQizilbashSecession = GameInfoTypes.PROMOTION_QIZILBASH_SECESSION;

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SAFAVIDS"]) then
			if pPlayer:HasPolicy(pQizilbash) then
				for pUnit in pPlayer:Units() do
					if pUnit:GetUnitType() == uQizilbash then
						if not pUnit:IsHasPromotion(pQizilbashSecession) then
							pUnit:SetHasPromotion(pQizilbashSecession,true);
						end
					end
				end
			end
		end
	end
end)
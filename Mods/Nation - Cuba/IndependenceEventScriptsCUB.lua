-- Leugi Latin American Event
-- Author: Leugi
--=======================================================================================================================
print("Leugi's Latin American Event: loaded for Cuba")
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
--  Destitucion
--------------------------------------------------------------------------------------------------------------------------
local Event_Leugi_Cuba_Independence = {}
	Event_Leugi_Cuba_Independence.Name = "TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE"
	Event_Leugi_Cuba_Independence.Desc = "TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE_DESC"
	Event_Leugi_Cuba_Independence.Weight = 0
	Event_Leugi_Cuba_Independence.CanFunc = (
		function(pPlayer)
			--
			-- Check if the event fired before			
			if load(pPlayer, "Event_LatinAmericanIndie") == true then return false end
			--
			-- Check the Civ
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_LEUGI_CUBA"] then return false end
			--
			-- Fire the Event!
			Event_Leugi_Cuba_Independence.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE_DESC")
		
			return true
		end
		)
	Event_Leugi_Cuba_Independence.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_Leugi_Cuba_Independence.Outcomes[1] = {}
	Event_Leugi_Cuba_Independence.Outcomes[1].Name = "TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE_OUTCOME_1"
	Event_Leugi_Cuba_Independence.Outcomes[1].Desc = "TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE_OUTCOME_CUBA_RESULT_1"
	Event_Leugi_Cuba_Independence.Outcomes[1].Weight = 1
	Event_Leugi_Cuba_Independence.Outcomes[1].CanFunc = (
		function(pPlayer)			
			Event_Leugi_Cuba_Independence.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE_OUTCOME_CUBA_RESULT_1")
			return true
		end
		)
	Event_Leugi_Cuba_Independence.Outcomes[1].DoFunc = (
		function(pPlayer) 
			pPlayer:ChangeGoldenAgeTurns(30)
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_CUBAN_REVOLUCIONARIO, 1)
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes.POLICY_LATINAMERICAN_INDEPENDENCE, true);
		

			save(pPlayer, "Event_LatinAmericanIndie", true)
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_LATIN_AMERICAN_INDEPENDENCE"))
		end)

Events_AddCivilisationSpecificScheduled(GameInfoTypes["CIVILIZATION_LEUGI_CUBA"], "Event_Leugi_Cuba_Independence", Event_Leugi_Cuba_Independence, 1810, true)


--=======================================================================================================================
--=======================================================================================================================

-- IndependenceScripts
--------------------------------------------------------------

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "LatinAmericanIndependence";


function RemoveIndependence(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		PlayerInTurn = pPlayer
		if (pPlayer:GetGoldenAgeTurns() < 1) then
			if (pPlayer:HasPolicy(GameInfo.Policies["POLICY_LATINAMERICAN_INDEPENDENCE"].ID)) then
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				pPlayer:SetHasPolicy(GameInfoTypes.POLICY_LATINAMERICAN_INDEPENDENCE, false);
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(RemoveIndependence);

--

function UnitKilledIndependence(iKiller, iPlayer, iUnitType)
	local pPlayer = Players[iKiller]
	if (pPlayer:IsAlive()) then
		if (pPlayer:HasPolicy(GameInfo.Policies["POLICY_LATINAMERICAN_INDEPENDENCE"].ID)) then
			InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_KILLING_TOURISM, 1)
			pPlayer:ChangeGoldenAgeTurns(1)
		end
	end
end



GameEvents.UnitKilledInCombat.Add(UnitKilledIndependence)


local iTourismKillID = GameInfo.Units.UNIT_KILLING_TOURISM.ID
local iTourismConquerID = GameInfo.Units.UNIT_CONQUER_TOURISM.ID

function KillTourism(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if pPlayer:GetUnitByID(iUnit) ~= nil then
			pUnit = pPlayer:GetUnitByID(iUnit);
            if (pUnit:GetUnitType() == iTourismKillID)  or (pUnit:GetUnitType() == iTourismConquerID) then
				Events.SerialEventUnitCreated.Remove(KillTourism)
				pUnit:Kill();
				Events.SerialEventUnitCreated.Add(KillTourism)
            end
        end
    end
end

Events.SerialEventUnitCreated.Add(KillTourism)

function OnCityCaptureComplete(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
  --print("A city has been acquired by someone ...")
	local pPlayer = Players[iNewOwner] -- new owner
	local plotCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
	pCity = plotCity:GetID()
	if (pPlayer:HasPolicy(GameInfo.Policies["POLICY_LATINAMERICAN_INDEPENDENCE"].ID)) then
	
			WasCapturedBefore = load ( pPlayer, "LatinAmericanCapture" .. iCityX .. iCityY .. "")
			if (WasCapturedBefore ~= true) or (pCity:GetOriginalOwner() ~= pPlayer) then
				local ResourceDesc = nil
				save ( pPlayer, "LatinAmericanCapture" .. iCityX .. iCityY .. "", true)
				pPlayer:ChangeGoldenAgeTurns(1)
				InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_CONQUER_TOURISM, 1)
			end	
		end
end

GameEvents.CityCaptureComplete.Add(OnCityCaptureComplete)
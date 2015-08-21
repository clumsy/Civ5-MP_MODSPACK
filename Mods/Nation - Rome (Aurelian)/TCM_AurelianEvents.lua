--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Mint Workers
--------------------------------------------------------------------------------------------------------------------------
local Event_TCMAurelianMintWorkers = {}
	Event_TCMAurelianMintWorkers.Name = "TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS"
	Event_TCMAurelianMintWorkers.Desc = "TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_DESC"
	Event_TCMAurelianMintWorkers.Weight = 5
	Event_TCMAurelianMintWorkers.CanFunc = (
		function(pPlayer)			
			Event_TCMAurelianMintWorkers.Desc = "TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_DESC"
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"] then return false end
			if pPlayer:GetCurrentEra() < GameInfoTypes["ERA_CLASSICAL"] then return false end

			return true
		end
		)
	Event_TCMAurelianMintWorkers.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TCMAurelianMintWorkers.Outcomes[1] = {}
	Event_TCMAurelianMintWorkers.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_1"
	Event_TCMAurelianMintWorkers.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_RESULT_1"
	Event_TCMAurelianMintWorkers.Outcomes[1].CanFunc = (
		function(pPlayer)			
			Event_TCMAurelianMintWorkers.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_TCMAurelianMintWorkers.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local capital = pPlayer:GetCapitalCity()
			capital:ChangeResistanceTurns(3)
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_MINT_WORKERS_1"], true)
			for city in pPlayer:Cities() do
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_AURELIAN_MINT"], 1)
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TCMAurelianMintWorkers.Outcomes[2] = {}
	Event_TCMAurelianMintWorkers.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_2"
	Event_TCMAurelianMintWorkers.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_RESULT_2"
	Event_TCMAurelianMintWorkers.Outcomes[2].CanFunc = (
		function(pPlayer)			
			Event_TCMAurelianMintWorkers.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AURELIAN_MINT_WORKERS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_TCMAurelianMintWorkers.Outcomes[2].DoFunc = (
		function(pPlayer) 
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_MINT_WORKERS_2"], true)
		end)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_AURELIAN_ROME"], "Event_TCMAurelianMintWorkers", Event_TCMAurelianMintWorkers)

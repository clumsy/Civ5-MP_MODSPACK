--Tomatekh

print("Goth Events")

local bVisiDummy = GameInfoTypes.BUILDING_GOTHS_EVENTS_VISIGOTHS_DUMMY;
local bOstroDummy = GameInfoTypes.BUILDING_GOTHS_EVENTS_OSTROGOTHS_DUMMY;

function gothsGetRandom(lower, upper)
    return (Game.Rand((upper + 1) - lower, "")) + lower
end

local Event_TomatekhVisiOstrogoths = {}
	Event_TomatekhVisiOstrogoths.Name = "TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS"
	Event_TomatekhVisiOstrogoths.Desc = "TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_DESC"
	Event_TomatekhVisiOstrogoths.Weight = 0
	Event_TomatekhVisiOstrogoths.CanFunc = (
		function(pPlayer)		
				
			if pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"] then return false end

			if load(pPlayer, "Event_TomatekhVisiOstrogoths") == true then return false end

			if (Game.GetGameTurnYear() >= 500) then return false end

			Event_TomatekhVisiOstrogoths.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_DESC")

			return true

		end
		)

	Event_TomatekhVisiOstrogoths.Outcomes = {}

	Event_TomatekhVisiOstrogoths.Outcomes[1] = {}
	Event_TomatekhVisiOstrogoths.Outcomes[1].Name = "TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_1"
	Event_TomatekhVisiOstrogoths.Outcomes[1].Desc = "TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_RESULT_1"
	Event_TomatekhVisiOstrogoths.Outcomes[1].Weight = 10
	Event_TomatekhVisiOstrogoths.Outcomes[1].CanFunc = (
		function(pPlayer)	
			Event_TomatekhVisiOstrogoths.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_TomatekhVisiOstrogoths.Outcomes[1].DoFunc = (

		function(pPlayer) 
		
			local pcCity = pPlayer:GetCapitalCity();
			if not (pcCity:IsHasBuilding(bVisiDummy)) then
				pcCity:SetNumRealBuilding(bVisiDummy, 1);
			end

			save(pPlayer, "Tomatekh_Visgoths", true)
			save(pPlayer, "Event_TomatekhVisiOstrogoths", true)

			local vGothDesc = "The Visigoths"
			local tquery = {"UPDATE Language_en_US SET Text = '".. vGothDesc .."' WHERE Tag = 'TXT_KEY_VISIGOTHS_MOD_SHORT_DESC'"}
			for i,iQuery in pairs(tquery) do
				for result in DB.Query(iQuery) do
				end
			end
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhVisiOstrogoths.Name))
			Events.GameplayAlertMessage("The Visigoths have emerged!")

		end)

	Event_TomatekhVisiOstrogoths.Outcomes[2] = {}
	Event_TomatekhVisiOstrogoths.Outcomes[2].Name = "TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_2"
	Event_TomatekhVisiOstrogoths.Outcomes[2].Desc = "TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_RESULT_2"
	Event_TomatekhVisiOstrogoths.Outcomes[2].Weight = 0
	Event_TomatekhVisiOstrogoths.Outcomes[2].CanFunc = (
		function(pPlayer)	
			Event_TomatekhVisiOstrogoths.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_TomatekhVisiOstrogoths.Outcomes[2].DoFunc = (

		function(pPlayer) 

			for pCity in pPlayer:Cities() do
				if not (pCity:IsHasBuilding(bOstroDummy)) then
					pCity:SetNumRealBuilding(bOstroDummy, 1);
				end
			end

			save(pPlayer, "Tomatekh_Ostrogoths", true)
			save(pPlayer, "Event_TomatekhVisiOstrogoths", true)

			local oGothDesc = "The Ostrogoths"
			local tquery = {"UPDATE Language_en_US SET Text = '".. oGothDesc .."' WHERE Tag = 'TXT_KEY_VISIGOTHS_MOD_SHORT_DESC'"}
			for i,iQuery in pairs(tquery) do
				for result in DB.Query(iQuery) do
				end
			end
			Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TOMATEKH_VISI_OSTRO_GOTHS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey(Event_TomatekhVisiOstrogoths.Name))
			Events.GameplayAlertMessage("The Ostrogoths have emerged!")

		end)
	
tEvents.Event_TomatekhVisiOstrogoths = Event_TomatekhVisiOstrogoths
for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"] then
		if gothsGetRandom(1,4) == 4 then
			Events_ScheduleOnce(iPlayer, "Event_TomatekhVisiOstrogoths", 400, true)
		end
	end
end


GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_VISIGOTHS_MOD"]) then
			if load(pPlayer, "Event_TomatekhVisiOstrogoths") == true then 
				if load(pPlayer, "Tomatekh_Visgoths") == true then 
					local pcCity = pPlayer:GetCapitalCity();
					if not (pcCity:IsHasBuilding(bVisiDummy)) then
						pcCity:SetNumRealBuilding(bVisiDummy, 1);
					end			
				elseif load(pPlayer, "Tomatekh_Ostrogoths") == true then 
					for pCity in pPlayer:Cities() do
						if not (pCity:IsHasBuilding(bOstroDummy)) then
							pCity:SetNumRealBuilding(bOstroDummy, 1);
						end
					end
				end
			end
		end
	end
end)


function VisiOstroGoths(arg0, currPlayer)

	for pPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local pPlayer = Players[pPlayer];
		if pPlayer:IsEverAlive() then
			if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_VISIGOTHS_MOD) then			
				if load(pPlayer, "Event_TomatekhVisiOstrogoths") == true then 

					if load(pPlayer, "Tomatekh_Visgoths") == true then 

						local vGothDesc = "The Visigoths"
						local tquery = {"UPDATE Language_en_US SET Text = '".. vGothDesc .."' WHERE Tag = 'TXT_KEY_VISIGOTHS_MOD_SHORT_DESC'"}
						for i,iQuery in pairs(tquery) do
							for result in DB.Query(iQuery) do
							end
						end
						Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

					elseif load(pPlayer, "Tomatekh_Ostrogoths") == true then 

						local oGothDesc = "The Ostrogoths"
						local tquery = {"UPDATE Language_en_US SET Text = '".. oGothDesc .."' WHERE Tag = 'TXT_KEY_VISIGOTHS_MOD_SHORT_DESC'"}
						for i,iQuery in pairs(tquery) do
							for result in DB.Query(iQuery) do
							end
						end
						Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )

					end
				end
			end
		end
	end
end

Events.LoadScreenClose.Add(VisiOstroGoths)
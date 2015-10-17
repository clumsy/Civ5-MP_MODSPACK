-- Random Events Popup
--=======================================================================================================================

print("loaded")
include("IconSupport")
include("InstanceManager")
include("PlotIterators.lua")
include("EventsAndDecisions_Utilities.lua")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "Sukritact_EnactDecisions_Popup";

--=======================================================================================================================
-- Globals
--=======================================================================================================================
g_tInstanceManager = InstanceManager:new("EventOptionInstance", "EventOptionBox", Controls.EventOptionStack)
g_bIsPopupOpen = false

ButtonPopupTypes.BUTTONPOPUP_RANDOMEVENTSSCREEN = "BUTTONPOPUP_RANDOMEVENTSSCREEN"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_RANDOMEVENTSSCREEN}
--=======================================================================================================================
-- Open/Close Functions
--=======================================================================================================================
function ShowHideHandler(bIsHide, bInitState)
    if(not bInitState) then
       if(not bIsHide) then
        	UI.incTurnTimerSemaphore()
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo)
        else
            UI.decTurnTimerSemaphore()
            if(g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0)
			end
        end
    end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
--=======================================================================================================================
-- Event Scheduler
--=======================================================================================================================
tEvents = {}
g_tScheduledEvents = {}

function SerialiseEventSchedule(tTable)
    local sStr = ""
	for iKey, tVal in ipairs(tTable) do
		sStr = sStr .. iKey .. "_%name_" .. tVal.Event
		if tVal.Turns then
			sStr = sStr .. "_%turn_" .. tVal.Turns .. "_%newline_"
		else
			sStr = sStr .. "_%year_" .. tVal.Year .. "_%newline_"
		end
	end
	return sStr
end

function DeserialiseEventSchedule(sStr)
    local tTable = {}
	while string.find(sStr, "_%%newline_") do
		local iS, iE = string.find(sStr, "_%%newline_")
		local sEntry = string.sub(sStr, 0, iS-1)
        
        local iSE, iEE = string.find(sEntry, "_%%name_")
        local iSN, iEN = nil, nil
        local bYear = false
        if string.find(sEntry, "_%%turn_") then
            iSN, iEN = string.find(sEntry, "_%%turn_")
        else
			bYear = true
            iSN, iEN = string.find(sEntry, "_%%year_")
        end
		
		tTable[tonumber(string.sub(sEntry, 0, iSE-1))] = {["Event"] = string.sub(sEntry, iEE+1, iSN-1), [bYear and "Year" or "Turns"] = tonumber(string.sub(sEntry, iEN+1))}
    	sStr = string.sub(sStr, iE+1)
	end
	return tTable
end

for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do

	local pPlayer = Players[iPlayer]
	local tData = load(pPlayer, "g_tScheduledEvents")
	
	if tData then
		g_tScheduledEvents[iPlayer] = DeserialiseEventSchedule(tData)
	else
		g_tScheduledEvents[iPlayer] = {}
		save(pPlayer, "g_tScheduledEvents", SerialiseEventSchedule(g_tScheduledEvents[iPlayer]))
	end
end

function EventScheduler(iPlayer, sEvent, iNum, bYear)

	if tEvents[sEvent] == nil then return end
	local iYear = nil
	local iTurn = nil

	if not(bYear) then
		iTurn = Game.GetGameTurn() + iNum
	else
		iYear = iNum
	end
	
	local tData = {}
		tData.Turns	= iTurn 
		tData.Year 	= iYear
		tData.Event = sEvent
	
	table.insert(g_tScheduledEvents[iPlayer], tData)
	save(Players[iPlayer], "g_tScheduledEvents", SerialiseEventSchedule(g_tScheduledEvents[iPlayer]))
end

LuaEvents.ScheduleEvent.Add(EventScheduler)

function ShowEventSchedule()
	for iPlayer, tTable in pairs (g_tScheduledEvents) do
		local sName = Players[iPlayer]:GetName()
		for iKey, tData in ipairs(tTable) do
			print(sName, tData.Event, tData.Turns, tData.Year)
		end
	end
end

g_tScheduledEventsToPush = {}
function ScheduledEventsHandler(pPlayer)
	for iKey, tEvent in ipairs(g_tScheduledEventsToPush) do
		if g_bIsPopupOpen then return end
		PushPopup(pPlayer, tEvent)
		table.remove(g_tScheduledEventsToPush, iKey)
	end
end
--=======================================================================================================================
-- Import Events/Enable Monitory Functions
--=======================================================================================================================
if g_CoreEvents_Enabled then
	include("CoreEvents.lua")
	include("CivEvents.lua")
	include("ReligiousEvents.lua")
end

for row in GameInfo.EventsAddin_Support() do
	include(row.FileName)
end

for sKey, tEvent in pairs(tEvents) do

	tEvent.ID = sKey

	for iKey, tOutcome in pairs(tEvent.Outcomes) do
		if load("GAME", sKey .. "_Monitors_" .. iKey) == true then
			for eEvent, fFunc in pairs(tOutcome.Monitors) do
				eEvent.Remove(fFunc)
				eEvent.Add(fFunc)
			end		
		end
	end
end

save("Game", "Initial_Scheduled", true)
--=======================================================================================================================
-- Random Events Handler
--=======================================================================================================================
iEventsThreshold = g_TurnBetweenEvents

function EventsHandler(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if not(pPlayer:IsAlive()) then return end
	if not(pPlayer:GetCapitalCity()) then return end
	if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then return end
	
	if g_ScheduledEvents_Enabled then
		if #g_tScheduledEvents[iPlayer] > 0 then
		
			g_tScheduledEventsToPush = {}
			
			local iCurrentTurn = Game.GetGameTurn()
			local iCurrentYear = Game.GetGameTurnYear()
			
			local tEventstoKeep = {}
			
			for iKey, tData in ipairs(g_tScheduledEvents[iPlayer]) do
			
				local tEvent 	= tEvents[tData.Event]
				local iTurn 	= tData.Turns
				local iYear 	= tData.Year
				
				if (iTurn and iTurn <= iCurrentTurn) or (iYear and iYear <= iCurrentYear) then
					table.insert(g_tScheduledEventsToPush, tEvent)
				else
					table.insert(tEventstoKeep, tData)
				end
			end
			if #g_tScheduledEventsToPush > 0 then
				
				g_tScheduledEvents[iPlayer] = {}
				for iKey, tData in ipairs(tEventstoKeep) do
					table.insert(g_tScheduledEvents[iPlayer], tData)
				end
				
				save(pPlayer, "g_tScheduledEvents", SerialiseEventSchedule(g_tScheduledEvents[iPlayer]))	
				ScheduledEventsHandler(pPlayer)
				return
			end
		end
	end
	-----------------------------------------------------------
	--Random Events
	-----------------------------------------------------------
	if g_RandomEvents_Enabled then
		local iCurrentLevel = load(pPlayer, "iCurrentLevel")
		if iCurrentLevel == nil then
			save(pPlayer, "iCurrentLevel", GetRandom(1, 19))
			return
		end
		
		if iCurrentLevel >= iEventsThreshold then
			local tRandomEvents = {}
			for sKey, tEvent in pairs(tEvents) do
				if (tEvent.Weight ~= nil and tEvent.Weight > 0) then
					if (((tEvent.CanFunc) == nil) or (tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2))) then
						for iVal = 1, tEvent.Weight do
							table.insert(tRandomEvents, sKey)
						end
					end
				end
			end
			if #tRandomEvents > 0 then
				local iRandomKey = tRandomEvents[GetRandom(1, #tRandomEvents)]
				LuaEvents.ShowRandomEventPopup(pPlayer, tEvents[iRandomKey])
			end
			save(pPlayer, "iCurrentLevel", 0)
			return
		end
		
		iCurrentLevel = iCurrentLevel + GetRandom(1, 19)
		save(pPlayer, "iCurrentLevel", iCurrentLevel)
	end
end
--=======================================================================================================================
-- Show Popup
--=======================================================================================================================

function ShowPopup(pPlayer, tEvent)
	-----------------------------------------------------------
	--Human Handler
	-----------------------------------------------------------
	if pPlayer:IsHuman() then
	
		g_bIsPopupOpen = true
		Controls.EventTitle:SetText(Locale.ConvertTextKey(tEvent.Name))
		Controls.EventDescription:SetText(Locale.ConvertTextKey(tEvent.Desc))
		
		g_tInstanceManager:ResetInstances()
		local iOffsY = 0
		
		for iKey, tOutcome in pairs(tEvent.Outcomes) do
			if ((tOutcome.CanFunc) == nil or (tOutcome.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2))) then
			
				g_tInstanceManager:BuildInstance()
				local tOutcomeInstance = g_tInstanceManager:GetInstance()
				
				tOutcomeInstance.FlavorText:SetText(Locale.ConvertTextKey(tOutcome.Name))
				tOutcomeInstance.EventOptionButton:RegisterCallback(Mouse.eLClick, 
				function()
					if g_PopupType then
						ContextPtr:SetHide(true)
					else
						UIManager:DequeuePopup(ContextPtr)
					end
					g_bIsPopupOpen = false
					
					tOutcome.DoFunc(pPlayer, tEvent.Data1, tEvent.Data2)
					
					if tOutcome.Monitors then
						save("GAME", tEvent.ID .. "_Monitors_" .. iKey, true)
						for eEvent, fFunc in pairs(tOutcome.Monitors) do
							eEvent.Remove(fFunc)
							eEvent.Add(fFunc)
						end
					end
					
					ScheduledEventsHandler(pPlayer)
				end
				)
				if tOutcome.Desc ~= nil then tOutcomeInstance.EventOptionButton:SetToolTipString(Locale.ConvertTextKey(tOutcome.Desc)) else tOutcomeInstance.EventOptionButton:EnableToolTip(false) end
				
				tOutcomeInstance.EventOptionButton:SetOffsetVal(0, iOffsY)
				iOffsY = iOffsY + tOutcomeInstance.EventOptionButton:GetSizeY() + 20
			end
		end
		
		Controls.EventOptionStack:CalculateSize()
		Controls.EventOptionStack:SetSizeY(iOffsY)
		Controls.EventOptionStack:SetOffsetVal(0, Controls.EventInfoStack:GetSizeY() + 50)
		Controls.EventOptionStack:ReprocessAnchoring()
		Controls.MainGrid:SetSizeY(Controls.EventInfoStack:GetSizeY() + iOffsY + 20)
		Controls.BlackGridFrame:SetSizeY(Controls.MainGrid:GetSizeY() + 60)
		
		if g_PopupType then
			ContextPtr:SetHide(false)
		else
			UIManager:QueuePopup(ContextPtr, PopupPriority.BarbarianCamp)
		end		
		
		--print(Locale.ConvertTextKey(tEvent.Name) .. " has been processed for Player " .. pPlayer:GetID())
	-----------------------------------------------------------
	--AI Handler
	-----------------------------------------------------------
	else
		local tOutcomes = {}
		
		for iKey, tOutcome in pairs(tEvent.Outcomes) do
			if ((tOutcome.CanFunc) == nil or (tOutcome.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2))) then
			
				if tOutcome.Weight == nil then
					table.insert(tOutcomes, iKey)
				elseif tOutcome.Weight > 0 then
					for iVal = 1, tOutcome.Weight do
						table.insert(tOutcomes, iKey)
					end
				end
				
			end
		end

		local iRandomKey = tOutcomes[GetRandom(1, #tOutcomes)]
		tEvent.Outcomes[iRandomKey].DoFunc(pPlayer, tEvent.Data1, tEvent.Data2)		
		
		--print(Locale.ConvertTextKey(tEvent.Name) .. " has been processed for Player " .. pPlayer:GetID() .. ", AI has selected " .. Locale.ConvertTextKey(tEvent.Outcomes[iRandomKey].Name))
	end
end

LuaEvents.ShowRandomEventPopup.Add(ShowPopup)

function PushPopup(pPlayer, tEvent)
	local bCan = true
	if tEvent.CanFunc ~= nil then
		bCan = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
	end
	if bCan then
		LuaEvents.ShowRandomEventPopup(pPlayer, tEvent)
	else
		print(Locale.ConvertTextKey(tEvent.Name) .. ": Not available")
	end
end

LuaEvents.PushRandomEventPopup.Add(PushPopup)
--=======================================================================================================================
-- Initialise
--=======================================================================================================================
UIManager:QueuePopup(ContextPtr, PopupPriority.BarbarianCamp)
UIManager:DequeuePopup(ContextPtr)

function OnEnterGame()
	if (g_RandomEvents_Enabled or g_ScheduledEvents_Enabled) then 
		GameEvents.PlayerDoTurn.Add(EventsHandler)
		EventsHandler(Game.GetActivePlayer())
	end
end
Events.LoadScreenClose.Add(OnEnterGame)
--=======================================================================================================================
--=======================================================================================================================
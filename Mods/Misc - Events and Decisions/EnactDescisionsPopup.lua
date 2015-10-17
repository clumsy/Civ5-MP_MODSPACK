-- Enact Decisions Popup
--=======================================================================================================================

include("PlotIterators.lua")
include("EventsAndDecisions_Utilities.lua")
include("Sukritact_SaveUtils.lua"); MY_MOD_NAME = "Sukritact_EnactDecisions_Popup";
print("loaded")

--=======================================================================================================================
-- Globals
--=======================================================================================================================

include("IconSupport")
include("InstanceManager")
include("CommonBehaviors")

-- Used for Piano Keys
local ltBlue = {19/255,32/255,46/255,120/255}
local dkBlue = {12/255,22/255,30/255,120/255}

local g_ItemManagers = {
	InstanceManager:new("ItemInstance", "DecisionBox", Controls.EnactedStack),
	InstanceManager:new("ItemInstance", "DecisionBox", Controls.EnactableStack),
	InstanceManager:new("ItemInstance", "DecisionBox", Controls.LockedStack),
}

local bHidden = false

local screenSizeX, screenSizeY = UIManager:GetScreenSizeVal()
local spWidth, spHeight = Controls.ItemScrollPanel:GetSizeVal()

-- Original UI designed at 1050px 
local heightOffset = screenSizeY - 1020

spHeight = spHeight + heightOffset
Controls.ItemScrollPanel:SetSizeVal(spWidth, spHeight) 
Controls.ItemScrollPanel:CalculateInternalSize()
Controls.ItemScrollPanel:ReprocessAnchoring()

local bpWidth, bpHeight = Controls.BottomPanel:GetSizeVal()
bpHeight = bpHeight + heightOffset 


Controls.BottomPanel:SetSizeVal(bpWidth, bpHeight)
Controls.BottomPanel:ReprocessAnchoring()

ButtonPopupTypes.BUTTONPOPUP_ENACTDECISIONSPANEL = "BUTTONPOPUP_ENACTDECISIONSPANEL"
g_PopupInfo = {["Type"] = ButtonPopupTypes.BUTTONPOPUP_ENACTDECISIONSPANEL}
--=======================================================================================================================
-- Import Decisions/Enable Monitory Functions
--=======================================================================================================================

tDecisions = {}
tTempDecisions = {}

if g_CoreDecisions_Enabled then
	include("CoreDecisions.lua")
	include("CivDecisions.lua")
	include("ReligiousDecisions.lua")
end

for row in GameInfo.DecisionsAddin_Support() do
	include(row.FileName)
end

local sType_Generic = "Z" --This way, generic decisions will come last

for sKey, tEvent in pairs(tDecisions) do

	if tEvent.Type == nil then tEvent.Type = sType_Generic end

	if load("GAME", sKey .. "_Monitors") == true then
		for eEvent, fFunc in pairs(tEvent.Monitors) do
			eEvent.Remove(fFunc)
			eEvent.Add(fFunc)
		end		
	end
end
--=======================================================================================================================
-- Opening
--=======================================================================================================================
function ShowHideHandler(bIsHide, bInitState)
	bHidden = bIsHide
    if (not bInitState) then
        if (not bIsHide) then
        	UI.incTurnTimerSemaphore()
        	Events.SerialEventGameMessagePopupShown(g_PopupInfo)
        	
        	RefreshList()
        
			local unitPanel = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/Base")
			if (unitPanel ~= nil) then
				unitPanel:SetHide(true)
			end
			
			local infoCorner = ContextPtr:LookUpControl("/InGame/WorldView/InfoCorner")
			if (infoCorner ~= nil) then
				infoCorner:SetHide(true)
			end
               	
        else
      
			local unitPanel = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/Base")
			if (unitPanel ~= nil) then
				unitPanel:SetHide(false)
			end
			
			local infoCorner = ContextPtr:LookUpControl("/InGame/WorldView/InfoCorner")
			if (infoCorner ~= nil) then
				infoCorner:SetHide(false)
			end
			
			if (g_PopupInfo ~= nil) then
				Events.SerialEventGameMessagePopupProcessed.CallImmediate(g_PopupInfo.Type, 0)
			end
            UI.decTurnTimerSemaphore()
        end
    end
end
ContextPtr:SetShowHideHandler(ShowHideHandler)
--=======================================================================================================================
-- Closing
--=======================================================================================================================
function OnClose()
    UIManager:DequeuePopup(ContextPtr)
end
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)

function OnDirty()
	-- If the user performed any action that changes selection states, just close this UI.
	if not bHidden then
		OnClose()
	end
end
Events.UnitSelectionChanged.Add(OnDirty)
Events.ActivePlayerTurnEnd.Add(OnDirty)

function InputHandler(uiMsg, wParam, lParam)

    if uiMsg == KeyEvents.KeyDown then
        if (wParam == Keys.VK_RETURN or wParam == Keys.VK_ESCAPE) then
			OnClose()
		end	
    end
end
ContextPtr:SetInputHandler(InputHandler)
Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnClose)
--=======================================================================================================================
-- Include "Enact Decisions" in drop-down
--=======================================================================================================================
function OnEnactDecisionsPopup()
	if bHidden then
		UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
	else
		OnClose()
	end
end 

function OnAdditionalInformationDropdownGatherEntries(additionalEntries)
	table.insert(additionalEntries,
	{
    text = Locale.ConvertTextKey("TXT_KEY_ENACT_DECISIONS"), 
	art = "DC45_EnactDecision.dds",
    call = OnEnactDecisionsPopup
	}
	)
end
LuaEvents.AdditionalInformationDropdownGatherEntries.Add(OnAdditionalInformationDropdownGatherEntries)
LuaEvents.RequestRefreshAdditionalInformationDropdownEntries()
--=======================================================================================================================
-- Sorting
--=======================================================================================================================
function SortByDecisionName(a, b)
	return Locale.Compare(a.Name, b.Name) < 0
end

function SortByDecisionType(a, b)
	if a.Type == nil then a.Type = sType_Generic end
	if b.Type == nil then b.Type = sType_Generic end
	
	if a.Type == b.Type then
		return Locale.Compare(a.Name, b.Name) < 0
	else
		return Locale.Compare(a.Type, b.Type) < 0
	end
end

g_SortOptions = {
	{"TXT_KEY_DECISION_TYPE_SORT", SortByDecisionType},
	{"TXT_KEY_DECISION_NAME_SORT", SortByDecisionName},
}

g_CurrentSortOption = 1

local g_SortByPulldown = Controls.SortByPullDown
g_SortByPulldown:ClearEntries()

for i, v in ipairs(g_SortOptions) do

	local Sort_ControlTable = {}
	g_SortByPulldown:BuildEntry("InstanceOne", Sort_ControlTable)
	Sort_ControlTable.Button:LocalizeAndSetText(v[1])
	
	Sort_ControlTable.Button:RegisterCallback(Mouse.eLClick, 
	function()
		g_SortByPulldown:GetButton():LocalizeAndSetText(v[1])
		g_CurrentSortOption = i
		
		RefreshList()
	end
	)
	
end

g_SortByPulldown:CalculateInternals()
g_SortByPulldown:GetButton():LocalizeAndSetText(g_SortOptions[g_CurrentSortOption][1])
--=======================================================================================================================
-- Push Decision Function
--=======================================================================================================================

function PushDecision(pPlayer, tDecision)

	print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Enacting " .. tDecision.Name)

	tDecision.DoFunc(pPlayer, tDecision.Data1, tDecision.Data2)
	if not(bHidden) then RefreshList() end
	if pPlayer:GetID() == Game.GetActivePlayer() then
		if tDecision.NotificationFunc ~= nil then
			tDecision.NotificationFunc(pPlayer, tDecision.Data1, tDecision.Data2)
		else
			Events.AudioPlay2DSound("AS2D_INTERFACE_POLICY")
			local StrMessage = Locale.ConvertTextKey("TXT_KEY_ENACT_ALERT", tDecision.Name)
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, StrMessage, tDecision.Name, -1, -1)
		end
	end
	if tDecision.Monitors ~= nil then 
		for eEvent, fFunc in pairs(tDecision.Monitors) do
			eEvent.Remove(fFunc)
			eEvent.Add(fFunc)
		end	
		save("GAME", tDecision.ID .. "_Monitors", true)
	end
	LuaEvents.DecisionEnacted(pPlayer:GetID(), tDecision.ID)
end

LuaEvents.PushDecisions.Add(PushDecision)

--=======================================================================================================================
-- Pedia Callback: Adapted from EUI
--=======================================================================================================================

CivilopediaControl = "/FrontEnd/MainMenu/Other/Civilopedia"

local getPedia

local function getPediaB(...)
	Events.SearchForPediaEntry(...)
end

local function getPediaA(...)
	UIManager:QueuePopup(LookUpControl(CivilopediaControl), PopupPriority.eUtmost)
	getPedia = getPediaB
	getPedia(...)
end

getPedia = CivilopediaControl and getPediaA

--=======================================================================================================================
-- Decision Type Defines
--=======================================================================================================================

tInfo = {}
	tInfo.tEnacted = {}
		tInfo.tEnacted.iKey = 1
		tInfo.tEnacted.sButton = "EnactedButton"
		tInfo.tEnacted.bFunction = false
		tInfo.tEnacted.Hide_Enacted = false
		tInfo.tEnacted.Hide_Enactable = true
		tInfo.tEnacted.Hide_Available = true
	tInfo.tEnactable = {}
		tInfo.tEnactable.iKey = 2
		tInfo.tEnactable.sButton = "EnactableButton"
		tInfo.tEnactable.bFunction = true
		tInfo.tEnactable.Hide_Enacted = true
		tInfo.tEnactable.Hide_Enactable = false
		tInfo.tEnactable.Hide_Available = true
	tInfo.tAvailable = {}
		tInfo.tAvailable.iKey = 3
		tInfo.tAvailable.sButton = "AvailableButton"
		tInfo.tAvailable.bFunction = false
		tInfo.tAvailable.Hide_Enacted = true
		tInfo.tAvailable.Hide_Enactable = true
		tInfo.tAvailable.Hide_Available = false
		
--=======================================================================================================================
-- Refresh Decisions Functions
--=======================================================================================================================

tToRemove = {}

function RefreshList()
	print("")
	print("--=======================================================================================================================")
	print("Refresh list")

	for _, itemManager in ipairs(g_ItemManagers) do
		itemManager:ResetInstances()
	end
		
	local pPlayer = Players[Game.GetActivePlayer()]
	CivIconHookup(pPlayer:GetID(), 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
	Controls.PanelTitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS")
	Controls.PanelSubtitle:LocalizeAndSetText("TXT_KEY_ENACT_DECISIONS_SUB", pPlayer:GetNumResourceAvailable(GameInfoTypes.RESOURCE_MAGISTRATES, false))

	local tEnacted = {}
	local tEnactable = {}
	local tAvailable = {}
	
	print("Processing Decisions")
	print("")
	for sKey, tEvent in pairs(tDecisions) do
		local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
		tEvent.Name = Locale.ConvertTextKey(tEvent.Name)
		tEvent.ID = sKey
		
		if bAvailable then
			if bEnactable then
				table.insert(tEnactable, tEvent)
			else
				table.insert(tAvailable, tEvent)
			end
		end
		if bEnacted then
			table.insert(tEnacted, tEvent)
		end
		
		print(tEvent.Name, bAvailable, bEnactable, bEnacted)
	end
	print("")

	print("Processing Generated Decisions")
	print("")
	for sKey, tEvent in pairs(tTempDecisions) do
		local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
		tEvent.Name = Locale.ConvertTextKey(tEvent.Name)
		tEvent.ID = sKey
		
		if bAvailable then
			if bEnactable then
				table.insert(tEnactable, tEvent)
			else
				table.insert(tAvailable, tEvent)
			end
		end
		if bEnacted then
			table.insert(tEnacted, tEvent)
		end
		
		print(tEvent.Name, bAvailable, bEnactable, bEnacted)
	end
	tTempDecisions = {}
	print("")
	
	print("Sort by " ..  Locale.ConvertTextKey(g_SortOptions[g_CurrentSortOption][1]))
	table.sort(tEnacted, 	g_SortOptions[g_CurrentSortOption][2])
	table.sort(tEnactable, 	g_SortOptions[g_CurrentSortOption][2])
	table.sort(tAvailable, 	g_SortOptions[g_CurrentSortOption][2])
	print("End sort")
	
	local tPopulate = {}
	tPopulate.tEnacted = tEnacted
	tPopulate.tEnactable = tEnactable
	tPopulate.tAvailable = tAvailable

	print("Populating screen")
	--Populate list with Decisions
	local bSetColor = false
	for sKey, tTable in pairs(tPopulate) do
		for iKey, tEvent in pairs(tTable) do
		
			g_ItemManagers[tInfo[sKey].iKey]:BuildInstance()
			local itemInstance = g_ItemManagers[tInfo[sKey].iKey]:GetInstance()
			
			local Pedia = CivilopediaControl and (tEvent.Pedia)
			if Pedia then
				itemInstance[tInfo[sKey].sButton]:RegisterCallback(Mouse.eRClick, function() getPedia(Pedia) end)
				
				local sPediaTitle = Locale.ConvertTextKey(tEvent.Pedia)
				local sHelpPedia = Locale.ConvertTextKey("TXT_KEY_RIGHT_CLICK_NOTE", sPediaTitle)
				tEvent.Desc = tEvent.Desc .. sHelpPedia
			end

			itemInstance[tInfo[sKey].sButton]:SetToolTipString(tEvent.Desc)
			itemInstance.Name:SetText(tEvent.Name)
			
			itemInstance.EnactedButton:SetHide(tInfo[sKey].Hide_Enacted)
			itemInstance.EnactableButton:SetHide(tInfo[sKey].Hide_Enactable)
			itemInstance.AvailableButton:SetHide(tInfo[sKey].Hide_Available)
			itemInstance.OptionalIcon:SetHide(true)
			
			if tEvent.IconAtlas ~= nil and tEvent.IconIndex ~= nil then
			
				local iSize = 48
				
				IconHookup(tEvent.IconIndex, iSize, tEvent.IconAtlas, itemInstance.OptionalIcon)
				--if iSize == 45 then iSize = 48 end
				--itemInstance.Name:SetOffsetX(10 + iSize + 8)
				--itemInstance.Name:SetWrapWidth(300 - (iSize + 8))
				itemInstance.OptionalIcon:SetHide(false)
			end
			
			if (tInfo[sKey].bFunction) then
				itemInstance.EnactableButton:RegisterCallback(Mouse.eLClick, 
				function() 
					LuaEvents.PushDecisions(pPlayer, tEvent)
				end)
			end
		
			if (bSetColor == false) then
				itemInstance.Box:SetColorVal(unpack(ltBlue))
			else
				itemInstance.Box:SetColorVal(unpack(dkBlue))
			end
			bSetColor = not bSetColor
			
			local buttonWidth, buttonHeight = itemInstance.DecisionBox:GetSizeVal()
			local descWidth, descHeight = itemInstance.Name:GetSizeVal()
			local newHeight = descHeight + 40	
			itemInstance.DecisionBox:SetSizeVal(buttonWidth, newHeight)
			itemInstance.Box:SetSizeVal(buttonWidth + 20, newHeight)
		end
	end
	print("End populate")
	
	print("Calculating size and anchoring")
	Controls.EnactedStack:CalculateSize()
	Controls.EnactedStack:ReprocessAnchoring()
	Controls.EnactableStack:CalculateSize()
	Controls.EnactableStack:ReprocessAnchoring()
	Controls.LockedStack:CalculateSize()
	Controls.LockedStack:ReprocessAnchoring()
	Controls.ItemScrollPanel:CalculateInternalSize()
	print("Refresh list end")
	print("--=======================================================================================================================")
	print("")
end

function RefreshData()
	if not(bHidden) then
		if not(Players[Game.GetActivePlayer()]:IsTurnActive()) then
			return
		end
		RefreshList()
	end
end

Events.SerialEventCityInfoDirty.Add(RefreshData)

--=======================================================================================================================
-- Collapse/Expand Behavior
--=======================================================================================================================

function OnCollapseExpand()
	Controls.EnactedStack:CalculateSize()
	Controls.EnactedStack:ReprocessAnchoring()
	Controls.EnactableStack:CalculateSize()
	Controls.EnactableStack:ReprocessAnchoring()
	Controls.LockedStack:CalculateSize()
	Controls.LockedStack:ReprocessAnchoring()
	Controls.ItemScrollPanel:CalculateInternalSize()
end

RegisterCollapseBehavior{	
	Header = Controls.EnactedHeader, 
	HeaderLabel = Controls.EnactedHeaderLabel, 
	HeaderExpandedLabel = Locale.Lookup("TXT_KEY_ENACTED_HEADER"),
	HeaderCollapsedLabel = Locale.Lookup("TXT_KEY_ENACTED_HEADER_COLLAPSED"),
	Panel = Controls.EnactedStack,
	Collapsed = false,
	OnCollapse = OnCollapseExpand,
	OnExpand = OnCollapseExpand,
};
							
RegisterCollapseBehavior{
	Header = Controls.EnactableHeader,
	HeaderLabel = Controls.EnactableHeaderLabel,
	HeaderExpandedLabel = Locale.Lookup("TXT_KEY_ENACTABLE_HEADER"),
	HeaderCollapsedLabel = Locale.Lookup("TXT_KEY_ENACTABLE_HEADER_COLLAPSED"),
	Panel = Controls.EnactableStack,
	Collapsed = false,
	OnCollapse = OnCollapseExpand,
	OnExpand = OnCollapseExpand,
};

RegisterCollapseBehavior{
	Header = Controls.LockedHeader,
	HeaderLabel = Controls.LockedHeaderLabel,
	HeaderExpandedLabel = Locale.Lookup("TXT_KEY_LOCKED_HEADER"),
	HeaderCollapsedLabel = Locale.Lookup("TXT_KEY_LOCKED_HEADER_COLLAPSED"),
	Panel = Controls.LockedStack,
	Collapsed = false,
	OnCollapse = OnCollapseExpand,
	OnExpand = OnCollapseExpand,
}

--=======================================================================================================================
-- AI and Notification Support
--=======================================================================================================================

function AIProcessEventsTable(pPlayer, tTable)
	for sKey, tEvent in pairs(tTable) do
		local sType = type(tEvent.Weight)
		if sType == "number" then
			if tEvent.Weight < 1 then
				if GetRandom(0, 1000) <= tEvent.Weight then
					local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
					if bAvailable and bEnactable then
			
						--print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Can Enact " .. tEvent.Name)
				
						LuaEvents.PushDecisions(pPlayer, tEvent)
					end
				end
			end
		elseif sType == "function" then
			local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
			if bAvailable and bEnactable then
			
				--print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Can Enact " .. tEvent.Name)
				
				if tEvent.Weight(pPlayer, tEvent.Data1, tEvent.Data2) then
					LuaEvents.PushDecisions(pPlayer, tEvent)
				end
			end
		else
			local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
			if bAvailable and bEnactable then
			
				--print(pPlayer:GetName() .. "(" .. pPlayer:GetID() .. ") Can Enact " .. tEvent.Name)
				
				LuaEvents.PushDecisions(pPlayer, tEvent)
			end
		end
	end
end

local tDecisionsStorage = {}

function AISupport(iPlayer)
	local pPlayer = Players[iPlayer]
	
	if pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then
		return
	end
	--=========================================================
	--Run this block for Humans
	--=========================================================
	if pPlayer:IsHuman() then
		local tAvailableNotify = {}
		local bNotify = false
		
		for sKey, tEvent in pairs(tDecisions) do
			local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
			if bAvailable and bEnactable then
				table.insert(tAvailableNotify, sKey)
				if tDecisionsStorage[sKey] == nil then
					bNotify = true
				end
			end
		end
		for sKey, tEvent in pairs(tTempDecisions) do
			local bAvailable, bEnactable, bEnacted = tEvent.CanFunc(pPlayer, tEvent.Data1, tEvent.Data2)
			if bAvailable and bEnactable then
				table.insert(tAvailableNotify, sKey)
				if tDecisionsStorage[sKey] == nil then
					bNotify = true
				end
			end
		end
		tTempDecisions = {}
		
		if bNotify then
			local strTitle = Locale.ConvertTextKey("TXT_KEY_DECISION_NOTIFICATION_TITLE")
			local strTooltip = Locale.ConvertTextKey("TXT_KEY_DECISION_NOTIFICATION")
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, strTooltip, strTitle, -1, -1)
		end
	
		tDecisionsStorage = {}
		for iKey, sVal in ipairs(tAvailableNotify) do tDecisionsStorage[sVal] = 1 end
		
		return
	end
	--=========================================================
	--Run this block for Major AIs
	--=========================================================
	if pPlayer:GetCapitalCity() == nil then
		return
	end
	
	AIProcessEventsTable(pPlayer, tDecisions)
	AIProcessEventsTable(pPlayer, tTempDecisions)
	
	tTempDecisions = {}
end
GameEvents.PlayerDoTurn.Add(AISupport)
--=======================================================================================================================
-- Initialise
--=======================================================================================================================
UIManager:QueuePopup(ContextPtr, PopupPriority.SocialPolicy)
UIManager:DequeuePopup(ContextPtr)
--=======================================================================================================================
--=======================================================================================================================
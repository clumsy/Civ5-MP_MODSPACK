function OnModLoaded() --called from end of last mod file to load

	local bNewGame = not TableLoad(gT, "BaneSriLanka")

	-- < mod-specific init code here depending on bNewGame >

	TableSave(gT, "BaneSriLanka")  --before the initial autosave that runs for both new and loaded games
end

function OnEnterGame()   --Runs when Begin or Continue Your Journey pressed
	print("Player entering game ...")
	ContextPtr:LookUpControl("/InGame/GameMenu/SaveGameButton"):RegisterCallback(Mouse.eLClick, SaveGameIntercept)
	ContextPtr:LookUpControl("/InGame/GameMenu/QuickSaveButton"):RegisterCallback(Mouse.eLClick, QuickSaveIntercept)
end
Events.LoadScreenClose.Add(OnEnterGame)

	TableSave(gT, "BaneSriLanka")
function SaveGameIntercept()	--overrides Civ5 code when player presses Save Game from Game Menu or Cntr-s
	UIManager:QueuePopup(ContextPtr:LookUpControl("/InGame/GameMenu/SaveMenu"), PopupPriority.SaveMenu)
end

function QuickSaveIntercept()	--overrides Civ5 code when player presses Quick Save from Game Menu or F11
	TableSave(gT, "BaneSriLanka")
	UI.QuickSave()
end

local autoSaveFreq = OptionsManager.GetTurnsBetweenAutosave_Cached()
function OnGameOptionsChanged()
	autoSaveFreq = OptionsManager.GetTurnsBetweenAutosave_Cached()
end
Events.GameOptionsChanged.Add(OnGameOptionsChanged)

function OnAIProcessingEndedForPlayer(iPlayer)
	if iPlayer == 63 then					--runs on barb turn AFTER barb unit moves (very close to the regular autosave)
		if Game.GetGameTurn() % autoSaveFreq == 0 then	--only need to do on autosave turns
			TableSave(gT, "BaneSriLanka")
		end
	end
end
Events.AIProcessingEndedForPlayer.Add(OnAIProcessingEndedForPlayer)

function InputHandler(uiMsg, wParam, lParam)
	if uiMsg == KeyEvents.KeyDown then
		if wParam == Keys.VK_F11 then
			QuickSaveIntercept()		--F11 Quicksave
        		return true
		elseif wParam == Keys.S and UIManager:GetControl() then
			SaveGameIntercept()			--ctrl-s
			return true
		end
	end
end
ContextPtr:SetInputHandler(InputHandler)


OnModLoaded() --add at bottom of whatever file loads last for your mod
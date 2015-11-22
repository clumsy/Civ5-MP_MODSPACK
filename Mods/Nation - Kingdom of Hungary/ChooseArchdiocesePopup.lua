-- ChooseStateReligionPopup
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- ShowPopup
------------------------------------------------------------------------------------------------------------------------
function ShowPopup()
	Controls.JFDArchdiocesePopupBG:SetHide(false)
	Controls.JFDArchdiocesePopup:SetHide(false)
	JFD_UpdateCityList()
end
LuaEvents.JFDChooseArchdiocese.Add(function() ShowPopup() end)
------------------------------------------------------------------------------------------------------------------------
-- OnSelectButton
------------------------------------------------------------------------------------------------------------------------
function OnSelectButton()
	Controls.JFDArchdiocesePopupBG:SetHide(true)
	Controls.JFDArchdiocesePopup:SetHide(true)	
	Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):SetNumRealBuilding(GameInfoTypes["BUILDING_CATHEDRAL"], 1)
	Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):SetName("Archdiocese of " .. Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):GetName())
end
Controls.SelectButton:RegisterCallback(Mouse.eLClick, OnSelectButton)
------------------------------------------------------------------------------------------------------------------------
-- OnCloseButton 
------------------------------------------------------------------------------------------------------------------------
function OnCloseButton()
	ContextPtr:SetHide(true)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_OnStateReligionChosen
------------------------------------------------------------------------------------------------------------------------
function JFD_OnCityChosen(cityID)
	local player = Players[Game.GetActivePlayer()]
	local cityDesc = player:GetCityByID(cityID):GetName()
	Controls.ArchdioceseMenu:GetButton():LocalizeAndSetText(cityDesc)
	citySelectedID = cityID

	Controls.SelectButton:SetDisabled(false)
	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHOOSE_ARCHDIOCESE_MENU_TOOLTIP", cityDesc)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateCityList
------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateCityList()
	Controls.ArchdioceseMenu:ClearEntries()
	local activePlayerID = Game.GetActivePlayer()
	
	for city in Players[activePlayerID]:Cities() do
		local cityDesc = city:GetName()
		local entry = {}
		Controls.ArchdioceseMenu:BuildEntry("InstanceOne", entry)
		entry.Button:SetVoid1(city:GetID())
		entry.Button:LocalizeAndSetText(cityDesc)
	end
	
	Controls.SelectButton:SetDisabled(true)
	Controls.ArchdioceseMenu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_CHOOSE_ARCHDIOCESE_MENU")
	Controls.ArchdioceseMenu:CalculateInternals()
	Controls.ArchdioceseMenu:RegisterSelectionCallback(JFD_OnCityChosen)
end
--==========================================================================================================================
--==========================================================================================================================

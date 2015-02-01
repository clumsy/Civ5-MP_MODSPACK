-- ChooseStateReligionPopup
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- ShowPopup
------------------------------------------------------------------------------------------------------------------------
function ShowPopup()
	Controls.JFDBavarianWonderPopupBG:SetHide(false)
	Controls.JFDBavarianWonderPopup:SetHide(false)
	JFD_UpdateCityList()
end
LuaEvents.JFDChooseBavarianWonder.Add(function() ShowPopup() end)
------------------------------------------------------------------------------------------------------------------------
-- OnSelectButton
------------------------------------------------------------------------------------------------------------------------
function OnSelectButton()
	Controls.JFDBavarianWonderPopupBG:SetHide(true)
	Controls.JFDBavarianWonderPopup:SetHide(true)	
	local iProductionReward = math.ceil(Players[Game.GetActivePlayer()]:GetTotalJONSCulturePerTurn() * 5)
	Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):ChangeBuildingProduction(Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):GetProductionBuilding(), iProductionReward)
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
	Controls.BavarianWonderMenu:GetButton():LocalizeAndSetText(cityDesc)
	citySelectedID = cityID

	local iProductionReward = math.ceil(Players[Game.GetActivePlayer()]:GetTotalJONSCulturePerTurn() * 5)
	Controls.SelectButton:SetDisabled(false)
	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHOOSE_CITY_MENU_TOOLTIP", cityDesc, iProductionReward)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateCityList
------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateCityList()
	Controls.BavarianWonderMenu:ClearEntries()
	local activePlayerID = Game.GetActivePlayer()
	
	for city in Players[activePlayerID]:Cities() do
		if city:GetProductionBuilding() ~= -1 then
			local currentBuildingClass = GameInfo.Buildings[city:GetProductionBuilding()].BuildingClass
			if GameInfo.BuildingClasses[currentBuildingClass].MaxGlobalInstances == 1 then
				local cityDesc = city:GetName()
				local entry = {}
				Controls.BavarianWonderMenu:BuildEntry("InstanceOne", entry)
				entry.Button:SetVoid1(city:GetID())
				entry.Button:LocalizeAndSetText(cityDesc)
			end
		end
	end
	
	Controls.SelectButton:SetDisabled(true)
	Controls.BavarianWonderMenu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_CHOOSE_CITY_MENU")
	Controls.BavarianWonderMenu:CalculateInternals()
	Controls.BavarianWonderMenu:RegisterSelectionCallback(JFD_OnCityChosen)
end
--==========================================================================================================================
--==========================================================================================================================

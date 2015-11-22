-- ChooseStateReligionPopup
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- ShowPopup
------------------------------------------------------------------------------------------------------------------------
function ShowPopup()
	for city in Players[Game.GetActivePlayer()]:Cities() do
		if city:GetProductionUnit() ~= -1 or city:GetProductionBuilding() ~= -1 then
			Controls.JFDProductionCityPopupBG:SetHide(false)
			Controls.JFDProductionCityPopup:SetHide(false)
			JFD_UpdateCityList()
			break
		end
	end
end
LuaEvents.JFDChooseProductionCity.Add(function() ShowPopup() end)
------------------------------------------------------------------------------------------------------------------------
-- OnSelectButton
------------------------------------------------------------------------------------------------------------------------
function OnSelectButton()
	Controls.JFDProductionCityPopupBG:SetHide(true)
	Controls.JFDProductionCityPopup:SetHide(true)	
	local productionBoost = math.ceil(Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):GetBaseYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) * 3)
	Players[Game.GetActivePlayer()]:GetCityByID(citySelectedID):ChangeProduction(productionBoost)
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
	local city = player:GetCityByID(cityID)
	local cityDesc = city:GetName()
	Controls.ProductionCityMenu:GetButton():LocalizeAndSetText(cityDesc)
	citySelectedID = cityID

	Controls.SelectButton:SetDisabled(false)
	local currentProduction
	local productionBoost = math.ceil(city:GetBaseYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) * 5)
	if city:GetProductionBuilding() ~= -1 then
		currentProduction = GameInfo.Buildings[city:GetProductionBuilding()].Description
	elseif city:GetProductionUnit() ~= -1 then
		currentProduction = GameInfo.Units[city:GetProductionUnit()].Description
	end

	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHOOSE_PRODUCTION_CITY_MENU_TOOLTIP", currentProduction, productionBoost)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateCityList
------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateCityList()
	Controls.ProductionCityMenu:ClearEntries()
	local activePlayerID = Game.GetActivePlayer()
	
	for city in Players[activePlayerID]:Cities() do
		if city:GetProductionUnit() ~= -1 or city:GetProductionBuilding() ~= -1 then
			local cityDesc = city:GetName()
			local entry = {}
			Controls.ProductionCityMenu:BuildEntry("InstanceOne", entry)
			entry.Button:SetVoid1(city:GetID())
			entry.Button:LocalizeAndSetText(cityDesc)
		end
	end
	
	Controls.SelectButton:SetDisabled(true)
	Controls.ProductionCityMenu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_CHOOSE_PRODUCTION_CITY_MENU")
	Controls.ProductionCityMenu:CalculateInternals()
	Controls.ProductionCityMenu:RegisterSelectionCallback(JFD_OnCityChosen)
end
--==========================================================================================================================
--==========================================================================================================================

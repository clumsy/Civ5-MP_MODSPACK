-- ChooseStateReligionPopup
-- Author: JFD
-- DateCreated: 5/28/2014 5:24:04 AM
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local activePlayer = Players[Game.GetActivePlayer()]
local buildingArmouryID =GameInfoTypes["BUILDING_ARMORY"]
local buildingBarracksID = GameInfoTypes["BUILDING_BARRACKS"]
local buildingCastleID = GameInfoTypes["BUILDING_CASTLE"]
local buildingWallsID = GameInfoTypes["BUILDING_WALLS"]
------------------------------------------------------------------------------------------------------------------------
-- ShowPopup
------------------------------------------------------------------------------------------------------------------------
function ShowPopup()
	Controls.JFDMarchPopupBG:SetHide(false)
	Controls.JFDMarchPopup:SetHide(false)
	JFD_UpdateCityList()
end
LuaEvents.JFDChooseMarch.Add(function() ShowPopup() end)
------------------------------------------------------------------------------------------------------------------------
-- OnSelectButton
------------------------------------------------------------------------------------------------------------------------
function OnSelectButton()
	Controls.JFDMarchPopupBG:SetHide(true)
	Controls.JFDMarchPopup:SetHide(true)	
	local city = activePlayer:GetCityByID(citySelectedID)
	city:SetNumRealBuilding(buildingArmouryID, 1)
	city:SetNumRealBuilding(buildingBarracksID, 1)
	city:SetNumRealBuilding(buildingCastleID, 1)
	city:SetNumRealBuilding(buildingWallsID, 1)
	city:SetName("March of " .. city:GetName())
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
	Controls.MarchMenu:GetButton():LocalizeAndSetText(cityDesc)
	citySelectedID = cityID

	Controls.SelectButton:SetDisabled(false)
	Controls.SelectButton:LocalizeAndSetToolTip("TXT_KEY_JFD_CHOOSE_MARCH_MENU_TOOLTIP", cityDesc)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_UpdateCityList
------------------------------------------------------------------------------------------------------------------------
function JFD_UpdateCityList()
	Controls.MarchMenu:ClearEntries()
	local activePlayerID = Game.GetActivePlayer()
	
	for city in Players[activePlayerID]:Cities() do
		if not (city:IsHasBuilding(buildingArmouryID)) and not (city:IsHasBuilding(buildingBarracksID)) and not (city:IsHasBuilding(buildingCastleID)) and not (city:IsHasBuilding(buildingWallsID)) then
			local cityDesc = city:GetName()
			local entry = {}
			Controls.MarchMenu:BuildEntry("InstanceOne", entry)
			entry.Button:SetVoid1(city:GetID())
			entry.Button:LocalizeAndSetText(cityDesc)
		end
	end
	
	Controls.SelectButton:SetDisabled(true)
	Controls.MarchMenu:GetButton():LocalizeAndSetText("TXT_KEY_JFD_CHOOSE_MARCH_MENU")
	Controls.MarchMenu:CalculateInternals()
	Controls.MarchMenu:RegisterSelectionCallback(JFD_OnCityChosen)
end
--==========================================================================================================================
--==========================================================================================================================

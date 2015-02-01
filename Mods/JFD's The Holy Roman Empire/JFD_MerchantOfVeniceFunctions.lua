-- JFD_GreatGalleassFunctions
-- Author: JFD
-- DateCreated: 11/7/2014 2:57:31 PM
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
local civilisationVeniceID = GameInfoTypes["CIVILIZATION_VENICE"]

function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
--==========================================================================================================================
-- CORE VENICE FUNCTIONS
--==========================================================================================================================
-- JFD_VenetianGlass
----------------------------------------------------------------------------------------------------------------------------
g_CustomsHousePlayerID = 0
g_CustomsHouseiX = 0
g_CustomsHouseiY = 0
g_CustomsHouseID = 0

function JFD_VenetianGlass(playerID, iX, iY, improvementID)
	if g_CustomsHousePlayerID == playerID and g_CustomsHouseiX == iX and g_CustomsHouseiY == iY and g_CustomsHouseID == improvementID then return end

	g_CustomsHousePlayerID = playerID
	g_CustomsHouseiX = iX
	g_CustomsHouseiY = iY
	g_CustomsHouseID = improvementID

	local player = Players[playerID]
	if player:IsAlive() and not player:IsMinorCiv() and not player:IsBarbarian() then 
		if improvementID == GameInfoTypes["IMPROVEMENT_CUSTOMS_HOUSE"] then
			if Map.GetPlot(iX, iY) and not Map.GetPlot(iX, iY):IsImprovementPillaged() then
				local plot = Map.GetPlot(iX, iY)
				local merchant = plot:GetUnit()
				if merchant:GetUnitType() == GameInfoTypes["UNIT_VENETIAN_MERCHANT"] then
					player:ChangeNumResourceTotal(GameInfoTypes["RESOURCE_JFD_VENETIAN_GLASS"], 1)
					if player:IsHuman() then
						player:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], Locale.ConvertTextKey("TXT_KEY_JFD_VENETIAN_GLASS"), Locale.ConvertTextKey("TXT_KEY_JFD_VENETIAN_GLASS_SHORT"))
					end
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(civilisationVeniceID) then
	GameEvents.BuildFinished.Add(JFD_VenetianGlass)
end 
--==========================================================================================================================
--==========================================================================================================================
print("Romania is of working!?!")

ARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "GE_RomCulturefromFaith";

--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------
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
-- CORE FUNCTIONS
--==========================================================================================================================
function CheckNumFaithBuildings(iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer:IsAlive() then
		for pCity in pPlayer:Cities() do
			n = 0
			if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_GE_ROMANIA"] then
				for bRow in GameInfo.Building_YieldChanges("YieldType = 'YIELD_FAITH'") do
					local faithBuilding = bRow.BuildingType
					if GameInfo.Buildings[faithBuilding].GreatWorkCount >= 0 then
						
						if pCity:IsHasBuilding(GameInfoTypes["" .. faithBuilding .. ""]) then
							n = n + 1
						end
					end
				end
			end
			CultureBonus = n
			CityID = pCity:GetID()
			iOldCulture = load( pPlayer, "" .. CityID .. "romCulturefromFaith")
			save( pPlayer, "" .. CityID .. "romCulturefromFaith", CultureBonus)
			if iOldCulture == nil then
				pCity:ChangeJONSCulturePerTurnFromBuildings(CultureBonus)
			else
				pCity:ChangeJONSCulturePerTurnFromBuildings(CultureBonus - iOldCulture)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CheckNumFaithBuildings)

local buildingRomanianCultureID = GameInfoTypes["BUILDING_GE_ROMANIA_CULTURE_TRAIT"]
local civilisationID = GameInfoTypes["CIVILIZATION_GE_ROMANIA"]
local isGERomaniaCivActive = JFD_IsCivilisationActive(civilisationID)
 
function JFD_GetNumDoFs(playerID)
        local numDoFs = 0
        for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
                local otherPlayer = Players[otherPlayerID]
                local capital = otherPlayer:GetCapitalCity()
                if (otherPlayer:IsDoF(playerID) and capital) then
                        print("We are friends with: " .. otherPlayer:GetName())
                         numDoFs = numDoFs + 1
                         if not (capital:IsHasBuilding(buildingRomanianCultureID)) then
                                capital:SetNumRealBuilding(buildingRomanianCultureID, 1)
                         end
                else
                         if (capital and capital:IsHasBuilding(buildingRomanianCultureID)) then
                                capital:SetNumRealBuilding(buildingRomanianCultureID, 0)
                         end
                end
        end
 
        return numDoFs
end
 
 function JFD_RomanianCulture(playerID)
        local player = Players[playerID]
        local capital = player:GetCapitalCity()
        if (player:GetCivilizationType(playerID) == civilisationID and player:IsEverAlive() and capital) then
                 capital:SetNumRealBuilding(buildingRomanianCultureID, JFD_GetNumDoFs(playerID))
        end
 end
 
if isGERomaniaCivActive then
        GameEvents.PlayerDoTurn.Add(JFD_RomanianCulture)
end

function DanubeInfantryRiverBonus(playerID)
local LupatorDunariiID = GameInfoTypes["PROMOTION_GE_LUPATOR_DUNARII"]
local LupatorDunariiIIID = GameInfoTypes["PROMOTION_GE_LUPATOR_DUNARII_II"]
local player = Players[playerID]         
	if player:IsEverAlive() and not player:IsMinorCiv() and not player:IsBarbarian() then
		for unit in player:Units() do
		if unit:IsHasPromotion(LupatorDunariiID) and unit:GetPlot() then
		local plot = unit:GetPlot()
			if plot:IsRiver() then 
				unit:SetHasPromotion(LupatorDunariiID, false)
				unit:SetHasPromotion(LupatorDunariiIIID, true)
			else
				unit:SetHasPromotion(LupatorDunariiID, true)
				unit:SetHasPromotion(LupatorDunariiIIID, false)
				end
			end 
		end
	end
end
GameEvents.PlayerDoTurn.Add(DanubeInfantryRiverBonus)







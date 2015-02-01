-- Prussia Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--=======================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_AddPromotion
--------------------------------------------------------------------------------------------------------------------------
function JFD_AddPromotion(unit, promotionID)
	if not unit:IsHasPromotion(promotionID) then
		unit:SetHasPromotion(promotionID, true)
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
--------------------------------------------------------------------------------------------------------------------------
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
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_PRUSSIA"]
local isPrussiaCivActive = JFD_IsCivilisationActive(civilisationID)
local unitDeathsHeadHussar = GameInfoTypes["UNIT_JFD_DEATHS_HEAD"]
local unitCombatGunID = GameInfoTypes["UNITCOMBAT_GUN"]
local unitCombatMeleeID = GameInfoTypes["UNITCOMBAT_MELEE"]
local unitCombatMountedID = GameInfoTypes["UNITCOMBAT_MOUNTED"]
local unitPromotionVeteran1 = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_1"]
local unitPromotionVeteran2 = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_2"]
local unitPromotionVeteran3 = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_3"]
local unitPromotionVeteran4 = GameInfoTypes["PROMOTION_JFD_PRUSSIAN_VETERAN_4"]
				
if isPrussiaCivActive then
	print("King Frederick is in this game")
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrussianVeterans
--------------------------------------------------------------------------------------------------------------------------
function JFD_PrussianVeterans(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		for unit in player:Units() do
			local level = unit:GetLevel()
			if level >= 3 then
				local unitCombatType = unit:GetUnitCombatType()
				if (unitCombatType == unitCombatGunID or unitCombatType == unitCombatMeleeID or unitCombatType == unitCombatMountedID) then
					if level >= 10 then
						JFD_AddPromotion(unit, unitPromotionVeteran4)
					end
					
					if level >= 7 then
						JFD_AddPromotion(unit, unitPromotionVeteran3)
					end
					
					if level >= 5 then
						JFD_AddPromotion(unit, unitPromotionVeteran2)
					end
					
					if level >= 3 then
						JFD_AddPromotion(unit, unitPromotionVeteran1)
					end
				end
			end
		end
	end
end

if isPrussiaCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_PrussianVeterans)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_DeathsHeadHussar
--------------------------------------------------------------------------------------------------------------------------
 local direction_types = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_NORTHWEST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,
	}
	
function JFD_DeathsHeadHussar(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == unitDeathsHeadHussar then
			local plot = unit:GetPlot()
			if plot then
				for loop, direction in ipairs(direction_types) do
					local adjPlot = Map.PlotDirection(plot:GetX(), plot:GetY(), direction)
					if adjPlot:IsUnit() then
						local adjUnit = adjPlot:GetUnit(i)
						if adjUnit:IsCombatUnit() then
							local adjUnitPlayer = Players[adjUnit:GetOwner()]
							if Teams[adjUnitPlayer:GetTeam()]:IsAtWar(playerID) then
								if JFD_GetRandom(1,100) <= 50 then
									adjUnit:ChangeDamage(5, playerID)
								end
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_DeathsHeadHussar) 
--=======================================================================================================================
--=======================================================================================================================

print("successfully loaded")

local civilizationID = GameInfoTypes["CIVILIZATION_FINNS"]

function Hyp_IsCivilizationActive(civilizationID)  --Thanks JFD
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end

	return false
end

if Hyp_IsCivilizationActive(civilizationID) then
	print("Marshal C.G.E. Mannerheim is in this game")
end

function BlockRuneSingers(playerID, unitID)
	if unitID == GameInfoTypes["UNIT_RUNE_SINGER"] then
		return
	end

	return true
end
GameEvents.PlayerCanTrain.Add(BlockRuneSingers)

-------------------------------------------------------------------------------------------------
--KALEVALA PROMOTION
-------------------------------------------------------------------------------------------------

local Kalevala = GameInfoTypes.PROMOTION_KALEVALA --Strength from Culture per turn

function KalevalaCalc(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(Kalevala) then
			local iCultureRate = pPlayer:GetTotalJONSCulturePerTurn()
			if iCultureRate >= 50 then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_FINNISH_SPIRIT"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_FINNISH_SPIRIT"], true)
				end	
			else
				pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_FINNISH_SPIRIT"], false)
			end

			if iCultureRate >= 100 then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_NATIONAL_UNITY"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_NATIONAL_UNITY"], true)
				end
			else
				pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_NATIONAL_UNITY"], false)
			end

			if iCultureRate >= 150 then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_HERITAGE_OF_KALEVALA"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_HERITAGE_OF_KALEVALA"], true)
				end	
			else
				pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_HERITAGE_OF_KALEVALA"], false)
			end

			if iCultureRate >= 250 then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_FINNISH_TOUGHNESS"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_FINNISH_TOUGHNESS"], true)
			else
				pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_FINNISH_TOUGHNESS"], false)
			end

			if iCultureRate >= 500 then
				if not pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_PATRIOTIC_FERVOR"]) then
					pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_PATRIOTIC_FERVOR"], true)
				end
			else
				pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_PATRIOTIC_FERVOR"], false)
			end
		end
	end	
end	
end

------------------------------------------------------------------------------------
-- FINNISH TRAIT
------------------------------------------------------------------------------------

local finnishrunepoints = 0
local RuneSingersTotalGiven = 0
local RunePointMultiplier = 1
	

function Hyp_FinnishRunePointsCalculate(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID and player:IsEverAlive() then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_CATHEDRAL"]) then
				finnishrunepoints = finnishrunepoints + 1
			end
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TEMPLE"]) then
				finnishrunepoints = finnishrunepoints + 1
			end	
			if city:IsHasBuilding(GameInfoTypes["BUILDING_FINNISH_SAUNA"]) then
				finnishrunepoints = finnishrunepoints + 1
			end
			if city:IsHasBuilding(GameInfoTypes["BUILDING_MONASTERY"]) then
				finnishrunepoints = finnishrunepoints + 1
			end
			if city:IsHasBuilding(GameInfoTypes["BUILDING_MOSQUE"]) then
				finnishrunepoints = finnishrunepoints + 1
			end
			if city:IsHasBuilding(GameInfoTypes["BUILDING_PAGODA"]) then
				finnishrunepoints = finnishrunepoints + 1
			end
		print ("Rune points =" ..finnishrunepoints)
		end
	end
end

function Hyp_GiveRuneSingers(playerID)
	local player = Players[playerID]
	RunePointMultiplier = 1 * 1.5 ^ (RuneSingersTotalGiven + 1)
	if player:GetCivilizationType() == civilizationID and player:IsEverAlive() then
		if finnishrunepoints > 15 * RunePointMultiplier then
			player:AddFreeUnit (GameInfo.Units["UNIT_FINNIC_RUNE_SINGER"].ID, UNITAI_CULTURE)
			finnishrunepoints = 0
			RuneSingersTotalGiven = RuneSingersTotalGiven + 1
		end
	print ("Rune Singers Total Given ="  ..RuneSingersTotalGiven)
	end
end	

	GameEvents.PlayerDoTurn.Add(KalevalaCalc)
	GameEvents.PlayerDoTurn.Add(Hyp_FinnishRunePointsCalculate)
	GameEvents.PlayerDoTurn.Add(Hyp_GiveRuneSingers)



		
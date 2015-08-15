-- Lydian_trait
-- Author: User
-- DateCreated: 5/1/2015 5:08:17 PM
--------------------------------------------------------------
include("FLuaVector.lua")
function RJ_LydianGoldenAgePoints(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RLYDIA"] and player:IsAlive() then
		for city in player:Cities() do
			local goldenAgeMerchants = math.floor(city:GetSpecialistCount(GameInfoTypes["SPECIALIST_MERCHANT"]) * 3)
			player:ChangeGoldenAgeProgressMeter(goldenAgeMerchants)
			if goldenAgeMerchants > 0 then
				if Game.GetActivePlayer() == playerID then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), "+".. goldenAgeMerchants .." [ICON_GOLDEN_AGE] from Merchant Specialists", goldenAgeMerchants)	
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(RJ_LydianGoldenAgePoints)

function RJ_UBGoldFromRivers(playerID)
        local player = Players[playerID]
        if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RLYDIA"] and player:IsAlive() then
                for city in player:Cities() do
                        local lydianGoldRivers = city:CountNumRiverPlots()
                        if (city:GetNumRealBuilding(GameInfoTypes["BUILDING_RLYDIAN_DUMMY"]) > 0) then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RLYDIAN_DUMMY"], 0)
                        end
                        if (city:GetNumRealBuilding(GameInfoTypes["BUILDING_ELECTRUM_REFINERY"]) > 0) then
                                city:SetNumRealBuilding(GameInfoTypes["BUILDING_RLYDIAN_DUMMY"], lydianGoldRivers)
                        end
                end
        end
end
GameEvents.PlayerDoTurn.Add(RJ_UBGoldFromRivers)



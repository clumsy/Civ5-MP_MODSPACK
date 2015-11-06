--==============================================================================================================================================================================================================================================
--Programmed by TarcisioCM
--Handles all the mechanics that require Lua for the Emporion
--==============================================================================================================================================================================================================================================
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "TarcisioCMEmporion";
--==============================================================================================================================================================================================================================================
--==~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~==
--==============================================================================================================================================================================================================================================
local buildingName = GameInfoTypes["BUILDING_LITE_TARCISIO_PTOLEMIES_EMPORION"]
local dummyGold = GameInfoTypes["BUILDING_LITE_TARCISIO_PTOLEMIES_GOLD_DUMMY"]
local dummyCulture = GameInfoTypes["BUILDING_LITE_TARCISIO_PTOLEMIES_CULTURE_DUMMY"]
--==============================================================================================================================================================================================================================================
--==============================================================================================================================================================================================================================================
function CleopatraEmporion(playerID)
	local player = Players[playerID]
	if load(player, "tcmCleopatraResetTradeRouteBonus") == true then
		for city in player:Cities() do
			city:SetNumRealBuilding(dummyGold, 0)
			city:SetNumRealBuilding(dummyCulture, 0)
		end
		save(player, "tcmCleopatraResetTradeRouteBonus", nil)
	end
	if player:CountNumBuildings(buildingName) > 0 then
		save(player, "tcmCleopatraResetTradeRouteBonus", true)
		local tradeRoutes = player:GetTradeRoutes()
		local anyInternalTradeRoute = false
		for tradeRouteID, tradeRoute in ipairs(tradeRoutes) do
			local originatingCity = tradeRoute.FromCity
			local targetCity = tradeRoute.ToCity
			if tradeRoute.FromID == tradeRoute.ToID then
				local extraGold = targetCity:GetNumBuilding(dummyGold) + 1
				targetCity:SetNumRealBuilding(dummyGold, extraGold)
				print(extraGold)
				anyInternalTradeRoute = true
			end
			if tradeRoute.FromID ~= tradeRoute.ToID then
				if player:IsDoF(tradeRoute.ToID) then
					local extraCulture = originatingCity:GetNumBuilding(dummyCulture) + 2
					if anyInternalTradeRoute == true then
						for secondTradeRouteID, secondTradeRoute in ipairs(tradeRoutes) do
							if secondTradeRoute.ToCity == originatingCity then
								extraCulture = extraCulture + 2.5
							end
						end
					end
					extraCulture = math.ceil(extraCulture)
					originatingCity:SetNumRealBuilding(dummyCulture, extraCulture)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CleopatraEmporion)
--==============================================================================================================================================================================================================================================
--==============================================================================================================================================================================================================================================
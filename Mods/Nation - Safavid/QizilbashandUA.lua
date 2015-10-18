include("FLuaVector.lua")
local iCiv = GameInfoTypes["CIVILIZATION_SAFAVIDS"]
local iDummySafavidID = GameInfoTypes["BUILDING_DUMMY_SAFAVID"]
local iQilzibash = GameInfoTypes["UNIT_QIZILBASH"]


function SafavidsUAandUU(iPlayer)
	local pPlayer = Players[iPlayer]
	if Game.GetElapsedGameTurns() > 0 and pPlayer:GetCivilizationType() == iCiv then
		local pCapital = pPlayer:GetCapitalCity()
		local iDummySafavidQt = 0
		for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pOtPlayer = Players[i]
			if pOtPlayer:IsDoF(iPlayer) and i ~= iPlayer then
				iDummySafavidQt = iDummySafavidQt + 1
				local sDescription = Locale.ConvertTextKey(GameInfo.Civilizations[pOtPlayer:GetCivilizationType()].ShortDescription)
				local pOtCapital = pOtPlayer:GetCapitalCity()
				pOtCapital:SetNumRealBuilding(iDummySafavidID, 1)
			end
		end
		pCapital:SetNumRealBuilding(iDummySafavidID, iDummySafavidQt)
		for pUnit in pPlayer:Units() do
			local pPlot = pUnit:GetPlot() 
			local iPlotOwner = pPlot:GetOwner()
			if pUnit:GetUnitType() == iQilzibash then
				if iPlotOwner > -1 and iPlotOwner ~= iPlayer then
					local pOurTeam = Teams[pPlayer:GetTeam()]
					local iTheirTeam = Players[iPlotOwner]:GetTeam()
					if pOurTeam:IsAtWar(iTheirTeam) then
						pPlayer:ChangeFaith(1)
						pPlayer:ChangeGold(1)
						pPlayer:ChangeJONSCulture(1)
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "+1[ICON_PEACE] +1[ICON_GOLD] +1[ICON_CULTURE]", 0)
					end
				end
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(SafavidsUAandUU)
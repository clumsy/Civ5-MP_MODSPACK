--UA: Embassies established in your Capital grant X% of their Capital’s highest yield. Receive an amount of Culture when signing a deal with another Civilization.

local ePtolemies = GameInfoTypes["CIVILIZATION_LITE_TARCISIO_PTOLEMIES"]

function EmbassyOnTheNile(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == ePtolemies then
		local pCapital = pPlayer:GetCapitalCity()
		for i = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pOtPlayer = Players[i]
			if Teams[pPlayer:GetTeam()]:HasEmbassyAtTeam(pOtPlayer:GetTeam()) then
				local eYieldType, iYield = GrantUABonus(pPlayer, pOtPlayer)
				if eYieldType == 0 then
					pCapital:ChangeFood(iYield)
				elseif eYieldType == 1 then
					pCapital:ChangeProduction(iYield)
				elseif eYieldType == 2 then
					pPlayer:ChangeGold(iYield)
				elseif eYieldType == 3 then
					local eCurrentTech = pPlayer:GetCurrentResearch()
					local pPlayerTeamTechs = Teams[Players[Game.GetActivePlayer()]:GetTeam()]:GetTeamTechs()
					pPlayerTeamTechs:ChangeResearchProgress(eCurrentTech, iYield, pPlayer)
				elseif eYieldType == 4 then
					pPlayer:ChangeJONSCulture(iYield)
				elseif eYieldType == 5 then
					pPlayer:ChangeFaith(iYield)
				end
			end
		end
	end
end

function GrantUABonus(pPlayer, pOtPlayer)
	local pCapital = pOtPlayer:GetCapitalCity()
	local iHighestYieldQt = 0
	local eHighestYieldTp
	local eFood = GameInfoTypes["YIELD_FOOD"]
	local eGold = GameInfoTypes["YIELD_GOLD"]
	local eProd = GameInfoTypes["YIELD_PRODUCTION"]
	local eFaith = GameInfoTypes["YIELD_FAITH"]
	local eScience = GameInfoTypes["YIELD_SCIENCE"]
	local eCulture = GameInfoTypes["YIELD_CULTURE"]
	if pCapital:GetBaseJONSCulturePerTurn() > 0 then
		if pCapital:GetBaseJONSCulturePerTurn() > pCapital:GetFood() then
			iHighestYieldQt = pCapital:GetBaseJONSCulturePerTurn()
			eHighestYieldTp = eCulture
		else
			iHighestYieldQt = pCapital:GetFood()
			eHighestYieldTp = eFood
		end
	else
		iHighestYieldQt = pCapital:GetFood()
		eHighestYieldTp = eFood
	end
	if pCapital:GetProduction() > iHighestYieldQt then
		iHighestYieldQt = pCapital:GetProduction()
		eHighestYieldTp = eProd
	elseif pCapital:GetFaithPerTurn() > iHighestYieldQt then
		iHighestYieldQt = pCapital:GetFaithPerTurn()
		eHighestYieldTp = eFaith
	elseif GetScienceTooltip(pCapital) > iHighestYieldQt then
		iHighestYieldQt = GetScienceTooltip(pCapital)
		eHighestYieldTp = eScience
	elseif GetGoldTooltip(pCapital) > iHighestYieldQt then
		iHighestYieldQt = GetGoldTooltip(pCapital)
		eHighestYieldTp = eGold
	end
	return eHighestYieldTp, math.floor(iHighestYieldQt * 0.05)
end



GameEvents.PlayerDoTurn.Add(EmbassyOnTheNile)
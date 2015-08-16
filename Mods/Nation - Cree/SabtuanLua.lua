-- Sabtuan Script by Neirai the Forgiven

gMTP = {}

function DetectMajorPlayer(playerID)
	print("Detecting a city state!")
	local cityStateCiv = GameInfo.Civilizations["CIVILIZATION_MINOR"];
	local cityStateCivID = cityStateCiv and cityStateCiv.ID or -1;
	local civType = PreGame.GetCivilization(playerID);
	local civ = GameInfo.Civilizations[civType];
	if(civ.ID == cityStateCivID) then
		print("It's a city state!")
		return false
	else
		print("It's not a city state.")
		return true
	end
end

function GetMajorTradeRoutes(player, data)
	--new version
	print("Detecting Major Trade Partners")
	local pPlayer = Players[player]
	local globalNumMajorTrades = 0
	--clear data
	for i, pPartner in pairs(Players) do
		gMTP[i] = false
	end
	--figure out which players you are trading with
	for i,v in ipairs(data) do
		if Players[v.FromCity:GetOwner()]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION and Players[v.ToCity:GetOwner()]:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
			local partnerClass = DetectMajorPlayer(v.ToID)
			if partnerClass == true then
				for i, pPartner in pairs(Players) do
					if pPartner == Players[v.ToCity:GetOwner()] then
						print(pPartner:GetName() .. " is our trading partner!")
						gMTP[i] = true
					end
				end
			end
		end
	end
	--detect number of trading partners
	for i, pPartner in pairs(Players) do
		if gMTP[i] == true then
			globalNumMajorTrades = globalNumMajorTrades + 1
		end
	end

	--old version
--	print("Getting Our Major Trade Routes!")
--	local pPlayer = Players[player]
--	local globalNumMajorTrades = 0
--	for i,v in ipairs(data) do
--		print(pCity:GetName())
--		print(v.FromCity:GetName())
	--	if v.FromCity:GetName() == pCity:GetName() then
--			print("Match Found")
--			if Players[v.FromCity:GetOwner()]:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
--				print("Time to detect Major Players!")
--				local CivStuff = DetectMajorPlayer(v.ToID)
--				if CivStuff == true then
--					globalNumMajorTrades = globalNumMajorTrades + 1
--				end
--			end
--		end
--	end
	print("Number of major trading partners is " .. globalNumMajorTrades)
	return globalNumMajorTrades
end

function SabtuanBonusFood(player)
	local pPlayer = Players[player]
	if pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_THECREEFIRSTNATION then
		for pCity in pPlayer:Cities() do
			local pTrades = GetMajorTradeRoutes(player, pPlayer:GetTradeRoutes(), pCity)
			print("pTrades is " .. pTrades)
			if pTrades ~= nil and pTrades > 0 and pCity ~= nil then
				print("Setting the bonus trade buildings!!")
				pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_SABTUANWIDGETS, pTrades)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(SabtuanBonusFood)
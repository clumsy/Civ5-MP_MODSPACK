-- By Leugi


function OnCityFoundCheck (player, numBuilds, iBuilding, iTech, pTeam)
	local player = Players[iPlayer];
	local numBuilds = GetNumFreeBuildingonTech(player);
	local b = GetFreeBuilding(player);
	if b ~= nil then
		local iBuilding = GameInfoTypes["" .. b .. ""]
	end
	local t = GetFreeBuildingTechPrereq(player);
	if t ~= nil then
		local iTech = GameInfo.Technologies["" .. t .. ""].ID
	end
	local i = player:CountNumBuildings(GameInfoTypes["" .. b .. ""])
	local teamID = player:GetTeam();
	local pTeam = Teams[teamID];
	if (pTeam:IsHasTech(iTech)) then
	for pCity in player:Cities() do
		if i < numBuilds then
			pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 1)
			local i = player:CountNumBuildings(GameInfoTypes["" .. b .. ""])
		end
	end
	end
	if i == numBuilds then
		GameEvents.PlayerCityFounded.Remove(OnCityFoundCheck);
	end
end



function TraitFreeBT(iPlayer)
	local player = Players[iPlayer];
	local numBuilds = GetNumFreeBuildingonTech(player);
	local b = GetFreeBuilding(player);
	local t = GetFreeBuildingTechPrereq(player);
	if b ~= nil and t ~= nil then
		local iTech = GameInfoTypes["" .. t .. ""]
		local teamID = player:GetTeam();
		local pTeam = Teams[teamID];
		if numBuilds == -1 then
			if (pTeam:IsHasTech(iTech)) then
				for pCity in player:Cities() do
					print ("Condition 1");
					pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 1)
				end
			end
		elseif (player:GetNumCities() == numBuilds) then
			if (pTeam:IsHasTech(iTech)) then
				for pCity in player:Cities() do
					print ("Condition 2");
					pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 1)
				end
			end
		elseif (player:GetNumCities() < numBuilds) then
			if (pTeam:IsHasTech(iTech)) then
				for pCity in player:Cities() do
					print ("Condition 3");
					print (t);
					print (iTech);
					pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 1)
					GameEvents.PlayerCityFounded.Add(OnCityFoundCheck);
				end
			end
		elseif (player:GetNumCities() > numBuilds) then
			if (pTeam:IsHasTech(iTech)) then
				for pCity in player:Cities() do
					print ("Condition 4");
					local i = player:CountNumBuildings(GameInfoTypes["" .. b .. ""])
					if i < numBuilds then
						pCity:SetNumRealBuilding(GameInfoTypes["" .. b .. ""], 1)
						local i = player:CountNumBuildings(GameInfoTypes["" .. b .. ""])
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TraitFreeBT);


function GetFreeBuilding(player)
	if player == nil or not player:IsAlive() or 
			player:IsBarbarian() or player:IsMinorCiv() then
		return nil;
	end
	local trait = GetMajorTrait(player);
	return trait.FreeBuildingonTech;
end

function GetFreeBuildingTechPrereq(player)
	if player == nil or not player:IsAlive() or 
			player:IsBarbarian() or player:IsMinorCiv() then
		return nil;
	end
	local trait = GetMajorTrait(player);
	return trait.FreeBuildingTechPrereq;
end

function GetNumFreeBuildingonTech(player)
	if player == nil or not player:IsAlive() or 
			player:IsBarbarian() or player:IsMinorCiv() then
		return -1;
	end
	local trait = GetMajorTrait(player);
	return trait.NumFreeBuildingonTech;
end

function GetMajorTrait(pPlayer)
	local leader = GameInfo.Leaders[pPlayer:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	return GameInfo.Traits[leaderTrait.TraitType];
end

-- numer of cities to grant bonus to:
cityMax = 4;
-- number of policies needed in a tree
policiesMin = 1;

buildingID = GameInfo.Buildings["BUILDING_GROTE_MARKT"].ID;
buildingClassID = GameInfo.BuildingClasses["BUILDINGCLASS_GRAND_PLACE"].ID;

function getDoubleGoldTech()
	local doubleGoldTech = GameInfoTypes["TECH_CURRENCY"];
	if GameInfoTypes["TECH_GUILDS"] ~= nil then
		doubleGoldTech = GameInfoTypes["TECH_GUILDS"];
	end
	return doubleGoldTech;
end

function flandersUA(iPlayer)
	-- applicable?
	if not applicable(iPlayer) then return end
	local player = Players[iPlayer];

	setBuildings(player);
	setGoldBonus(player);
end

function flandersPolicyAdopted(iPlayer, iPolicy)
	flandersUA(iPlayer);
end

function flandersCityFounded(iPlayer, iCityX, iCityY)
	flandersUA(iPlayer);
end

function flandersCityCaptured(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	flandersUA(iOldOwner);
	flandersUA(iNewOwner);
end

function flandersTechResearched(iTeam, iTech, iChange)
	if iTech == getDoubleGoldTech() then
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			if Players[iPlayer] ~= nil and Players[iPlayer]:GetTeam() == iTeam then
				flandersUA(iPlayer);
			end
	   end
   end
end

function applicable(iPlayer)
	local player = Players[iPlayer];
	if not IsMajorCiv(player) then return false end
	local leader = GameInfo.Leaders[player:GetLeaderType()];
	local leaderTrait = GameInfo.Leader_Traits("LeaderType ='" .. leader.Type .. "'")();
	local trait = GameInfo.Traits[leaderTrait.TraitType];
	if not trait.FourLargestBonus then return false end
	return true;
end

function IsMajorCiv(player)
	return IsValidPlayer(player) and player:GetID() <= GameDefines.MAX_MAJOR_CIVS-1;
end

function IsValidPlayer(player)
	return player ~= nil and player:IsAlive() and not player:IsBarbarian();
end


function setBuildings(player)
	local cities = {};
	local last = 0;

	for pCity in player:Cities() do
		if pCity:IsHasBuilding(buildingID) then
			pCity:SetNumRealBuilding(buildingID, 0); -- remove
		end
		local larger = true;
		local i = last; -- bottom to top
		while i > 0 and larger do
			larger = largerThan(pCity, cities[i]);
			if i ~= cityMax then
				if larger then -- move down
					cities[i+1] = cities[i];
				else -- insert
					cities[i+1] = pCity;
				end
			end
			i = i - 1;
		end
		if i == 0 and larger then -- top position
			cities[1] = pCity;
		end
		if last < cityMax then
			last = last + 1;
		end
	end

	for i,pCity in ipairs(cities) do
		pCity:SetNumRealBuilding(buildingID, 1); -- place
	end
end

function largerThan(pCity, cCity)
	return pCity:GetPopulation() > cCity:GetPopulation();
	-- or pCity:GetPopulation() == cCity:GetPopulation() and pCity:GetFood() > cCity:GetFood();
end


function setGoldBonus(player)
	local goldBonus = countTrees(player);
	if Teams[player:GetTeam()]:IsHasTech(getDoubleGoldTech()) then
		goldBonus = goldBonus * 2;
	end

	for pCity in player:Cities() do
		if pCity:IsHasBuilding(buildingID) then
			pCity:SetBuildingYieldChange(buildingClassID, YieldTypes["YIELD_GOLD"], goldBonus);
		end
	end
end

function countTrees(player)
	local totalCount = 0;

	local i = 0;
	local branches = {};
	local policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	while policyBranchInfo ~= nil do
		branches[policyBranchInfo.Type] = 0;
		i = i + 1;
		policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	end

	i = 0;
	local policy = GameInfo.Policies[i];
	while policy ~= nil do
		if player:HasPolicy(policy.ID) then
			if policy.PolicyBranchType ~= nil then
				branches[policy.PolicyBranchType] = branches[policy.PolicyBranchType] + 1;
			end
		end
		i = i + 1;
		policy = GameInfo.Policies[i];
	end

	i = 0;
	local policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	while policyBranchInfo ~= nil do
		if branches[policyBranchInfo.Type] >= policiesMin then
			totalCount = totalCount + 1;
		end
		i = i + 1;
		policyBranchInfo = GameInfo.PolicyBranchTypes[i];
	end

	return totalCount;
end


GameEvents.PlayerDoTurn.Add(flandersUA);
GameEvents.PlayerAdoptPolicy.Add(flandersPolicyAdopted);
GameEvents.PlayerCityFounded.Add(flandersCityFounded);
GameEvents.CityCaptureComplete.Add(flandersCityCaptured);
GameEvents.TeamTechResearched.Add(flandersTechResearched);


--[[
function BeguinagePrereqs(iPlayer, buildingTypeID)
	local pPlayer = Players[iPlayer];
	local buildingType = GameInfo.Buildings[buildingTypeID].Type;

	if buildingType == "BUILDING_BEGIJNHOF" then
		return pPlayer:IsPolicyBranchUnlocked(GameInfo.PolicyBranchTypes["POLICY_BRANCH_PIETY"].ID);
	end
	return true
end

GameEvents.PlayerCanConstruct.Add( BeguinagePrereqs );
--]]
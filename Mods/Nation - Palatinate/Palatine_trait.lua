-- Trait
-- Author: User
-- DateCreated: 3/26/2015 11:58:14 AM
--------------------------------------------------------------

function PalatineFaithFromScience (playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RPALATINATE"] and player:IsAlive() then
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_LIBRARY"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PALATINATE_FAITH_1"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_UNIVERSITY"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PALATINATE_FAITH_2"], 1)
			end
			if (city:GetNumBuilding(GameInfoTypes["BUILDING_PUBLIC_SCHOOL"]) > 0) then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_PALATINATE_FAITH_3"], 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(PalatineFaithFromScience)


function CallCityAdoptsReligionEvent(iOwner, eReligion, iX, iY)
	local plot = Map.GetPlot(iX, iY);
	-- Error check, if this isn't a city don't continue
	if(not plot:IsCity()) then
		return;
	end

	local city = plot:GetPlotCity();
	local eNewReligion = city:GetReligiousMajority();
	local newReligionBuilding = nil;

	-- If a city has no religious majority, eNewReligion will be -1
	if(eNewReligion < 1) then
		-- Case 1) no majority religion
		-- Remove any buildings marking what the old religion the city is (TODO: this check should be happening every turn to avoid having incorrect state for a few turns)
		for row in GameInfo.Religions() do
			local temp = "BUILDING_" .. row.Type;

			if (city:IsHasBuilding(GameInfoTypes[temp])) then
				city:SetNumRealBuilding(GameInfoTypes[temp], 0); -- Remove the building
			end
		end
		-- Do not continue because the city has no majority religion
		return;
	else
		-- Case 2.A) majority religion but city hasn't changed religion
		newReligionBuilding = "BUILDING_" .. GameInfo.Religions[eNewReligion].Type;
		if(city:IsHasBuilding(GameInfoTypes[newReligionBuilding])) then
			-- The city has not changed religion, don't continue
			return;
		end
	end

	-- Only way to get here is if: eNewReligion >= 1 and city does not have newReligionBuilding
	-- Case 2.B) majority religion and city has changed religion
	local eOldReligion = 0;
	-- Find any buildings marking what the old religion the city is
	for row in GameInfo.Religions() do
		local religionMarkingBuilding = "BUILDING_" .. row.Type;
		-- Skip the current local majority religion (eNewReligion) but remove all other religion marking buildings
		if (row.ID ~= eNewReligion and city:IsHasBuilding(GameInfoTypes[religionMarkingBuilding])) then
			city:SetNumRealBuilding(GameInfoTypes[religionMarkingBuilding], 0);

			-- Possible error check.  Just because there is a building marking for the old religion doesn't mean the city has been that religion recently.
			--    For example, if the city was hit by an Inquisitor the building marking old religion wouldn't be removed.
			--    For now, better to have old religion sometimes be the most recent religion than risk adding bugs with extra checks.
			--if(city:GetNumFollowers(row.ID) > 0 or city:GetPopulation() == 1) then
				
			-- Found the old religion of the city
			eOldReligion = row.ID;
			--end
		end
	end

	-- Is this the first time the city has adopted the majorityReligion
	local hasBeenReligionBuilding = "BUILDING_HAS_BEEN_" .. GameInfo.Religions[eNewReligion].Type;
	local bFirstConversion = false;

	if(not city:IsHasBuilding(GameInfoTypes[hasBeenReligionBuilding])) then
		bFirstConversion = true;
	end

	-- Update religion building state
	city:SetNumRealBuilding(GameInfoTypes[newReligionBuilding], 1);
	city:SetNumRealBuilding(GameInfoTypes[hasBeenReligionBuilding], 1);

	-- Call the lua event
	--print("Calling CityAdoptsReligionEvent(iOwner: " .. tostring(iOwner) .. " iX: " .. tostring(iX) .. " iY: " .. tostring(iY) .. " eOldReligion: " .. tostring(eOldReligion) .. " eNewReligion: " .. tostring(eNewReligion) .. " bFirstConversion: " .. tostring(bFirstConversion) .. ")");
	LuaEvents.CityAdoptsReligionEvent(iOwner, iX, iY, eOldReligion, eNewReligion, bFirstConversion);
end

local retVal = {};
LuaEvents.CityAdoptsReligionEvent_IsInitialized(retVal);

-- If retVal isn't changed, no other mod has initialized this code.
if (retVal.isInitialized == nil) then
	LuaEvents.CityAdoptsReligionEvent_IsInitialized.Add(function (retVal) retVal.isInitialized = true; end);
	-- Initialize the code
	GameEvents.CityConvertsReligion.Add(CallCityAdoptsReligionEvent);
end

function CSInfluence(iOwner, iX, iY, eOldReligion, eNewReligion, bFirstConversion)
	local plot = Map.GetPlot(iX, iY);
	local city = plot:GetPlotCity();

	print(city:GetName() .. " has adopted a new religion. Yay.");

	local pPlayer = Players[iOwner];

	if ( pPlayer:IsMinorCiv() ) then
		print "pPlayer is a Minor Civ";
		for iPlayerLoop = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
			local LoopPlayer = Players[iPlayerLoop];
			if ( LoopPlayer:IsAlive() and LoopPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_RPALATINATE"] ) then
				print ("LoopPlayer is alive and is Palatinate" );
				local PalatinateReligion = LoopPlayer:GetReligionCreatedByPlayer()
				if PalatinateReligion >= 1 then
					print("Palatinate has a religion ");
					if eNewReligion == PalatinateReligion then
						print("+++++ religions match +++++");
						pPlayer:ChangeMinorCivFriendshipWithMajor(LoopPlayer, 30)
					end
				end
			end
		end
	end
end
LuaEvents.CityAdoptsReligionEvent.Add(CSInfluence)
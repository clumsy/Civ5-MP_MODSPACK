local bDummy = GameInfoTypes.BUILDING_TIWANAKU_INFLUENCE;
local bNever = GameInfoTypes.BUILDING_TIWANAKU_NEVER;


include("IconSupport")
function OnOK()
ContextPtr:SetHide(true)
end

--IconHookup(1, 80, "CIV_COLOR_ATLAS_TIWANAKU", Controls.DialogTopIcon)

local csname = "";
Controls.Message:LocalizeAndSetText( "TXT_KEY_TEST_TIWAPOPUP", csname)
	
function TiwaPopup (pPlayer, eReligion, tPlayer, tCity)
	Controls.TiwaPopBox:SetHide(false)
	Controls.TiwaPop:SetHide(false)
	csname = Locale.ConvertTextKey(tCity:GetName());
	Controls.Message:LocalizeAndSetText( "TXT_KEY_TEST_TIWAPOPUP", csname)
	UI.LookAt(tCity:Plot(), 0);
	Controls.VIEW:RegisterCallback(Mouse.eLClick, function ()
	--UIManager:QueuePopup(Controls.EmptyPopup, PopupPriority.GenericPopup+1);
	--	local CityScreenClosed = function()
	--	UIManager:DequeuePopup(Controls.EmptyPopup);
	--	Events.SerialEventExitCityScreen.Remove(CityScreenClosed);
	--end
	--Events.SerialEventExitCityScreen.Add(CityScreenClosed);
	--UI.SetCityScreenViewingMode(true);
	--UI.DoSelectCityAtPlot( tCity:Plot() );
	Controls.TiwaPopBox:SetHide(true)
	Controls.TiwaPop:SetHide(true)
	Controls.TiwaPopBack:SetHide(false)
	Controls.TiwaPopBackBox:SetHide(false)
	UI.LookAt(tCity:Plot(), 0);
end)
Controls.BACK:RegisterCallback(Mouse.eLClick, function ()
	Controls.TiwaPopBox:SetHide(false)
	Controls.TiwaPop:SetHide(false)
	Controls.TiwaPopBack:SetHide(true)
	Controls.TiwaPopBackBox:SetHide(true)
	
end)
	Controls.OK:RegisterCallback(Mouse.eLClick, function ()
	Controls.TiwaPopBox:SetHide(true)
	Controls.TiwaPop:SetHide(true)
	TiwaDomination (pPlayer, eReligion, tPlayer, tCity)
	
end)
	Controls.NEVER:RegisterCallback(Mouse.eLClick, function ()
	Controls.TiwaPopBox:SetHide(true)
	Controls.TiwaPop:SetHide(true)
	tCity:SetNumRealBuilding(bNever, 1)
	--tPlayer:ChangeMinorCivFriendshipWithMajor(pPlayer, -30)

end)
	Controls.LATER:RegisterCallback(Mouse.eLClick, function ()
		Controls.TiwaPopBox:SetHide(true)
		Controls.TiwaPop:SetHide(true)
		tCity:SetNumRealBuilding(bDummy, 0)
		--tPlayer:ChangeMinorCivFriendshipWithMajor(pPlayer, -10)
end)

end

-- CSInfluenceScript
-- Author: LastSword and Tomatekh
-- DateCreated: 1/8/2014 7:47:57 AM
--------------------------------------------------------------


-- LS

function FakeMinorMarriage(pPlayer, tPlayer)
	FakeUnit(tPlayer)
	for iCity in tPlayer:Cities() do
		--if iCity:GetOriginalOwner() == tPlayer then
			iCity:SetNumRealBuilding(GameInfoTypes["BUILDING_PALACE"], 0);
			FakeBuildings(iCity)
			FakeName = iCity:GetName();
			FakeCitizens = iCity:GetPopulation();
			FakeCitizens = FakeCitizens - 5;
			FakeCityPlot = iCity:Plot();
			FakeDMG = iCity:GetDamage();
			FakePlots(iCity, iCity:GetX(), iCity:GetY(), tPlayer, pPlayer)
			tPlayer:Disband(iCity)
			FakeNewCity(pPlayer)
			
		--else
			--pPlayer:AcquireCity(iCity, false, true);
		--end
	end
	FakeNewUnits(pPlayer)
end

function FakeUnit(tPlayer)
	FMunits = {}
	for iUnit in tPlayer:Units() do
		FMunits[iUnit] = {}
		FMunits[iUnit][1] = iUnit:GetUnitType();
		FMunits[iUnit][2] = iUnit:GetPlot();
		FMunits[iUnit][3] = iUnit:GetDamage();
		iUnit:Kill();
	end
end

function FakePlots(iCity, x, y, tPlayer, pPlayer)
	FMplots = {}
	
	
	for i = 0, iCity:GetNumCityPlots() - 1, 1 do
		local iPlot = iCity:GetCityIndexPlot( i );
		if (iPlot ~= nil) then
			if ( iPlot:GetOwner() == iCity:GetOwner() ) then
					FMplots[iPlot] = {};
			end
				
			
			
		end
	end
end

function FakeBuildings(iCity)
	FMbuildings = {}
	for iBuilding in GameInfo.Buildings() do
		if iCity:IsHasBuilding(iBuilding.ID) then
--I don't know if CStates build national wonders; this might be an issue; just report if there are multiple.
			FMbuildings[iBuilding.ID] = 2;
		end
	end
end

function FakeNewUnits(pPlayer)
	for i, v in pairs(FMunits) do
		fmUnit = pPlayer:InitUnit(v[1], v[2]:GetX(), v[2]:GetY());
		fmUnit:SetDamage(v[3]);
	end
	FMunits = nil;
end

function FakeNewCity(pPlayer)
	pPlayer:InitCity(FakeCityPlot:GetX(), FakeCityPlot:GetY());
	NewCity = FakeCityPlot:GetPlotCity();
	NewCity:SetName(FakeName, true);
	NewCity:SetDamage(FakeDMG);
	NewCity:SetPopulation(FakeCitizens, true);
	local eReligion = pPlayer:GetReligionCreatedByPlayer();
	NewCity:AdoptReligionFully(eReligion);
	NewCityID = NewCity:GetID()
	for iPlot, etc in pairs(FMplots) do
		iPlot:SetOwner(pPlayer, NewCityID, true, true);
	end
	FMplots = nil;
	for iBuilding, meh in pairs(FMbuildings) do
		NewCity:SetNumRealBuilding(iBuilding, 1);
	end
	FMbuildings = nil;

end


--Tomatekh

local iUnitTiwa = GameInfo.Units.UNIT_FAKE_KALLAWAYA.ID

bDummy = GameInfoTypes.BUILDING_TIWANAKU_DUMMY_COUNT;

bTemple = GameInfoTypes.BUILDING_TEMPLE;
bShrine = GameInfoTypes.BUILDING_SHRINE;
bColosseum = GameInfoTypes.BUILDING_COLOSSEUM;

print ("Award the City State")



function LongestWordInit(csname)
    local tWords = {}
    for sWord in string.gmatch(csname, "%a+") do
       table.insert(tWords, sWord)
    end
    return tWords
end

function LongestWord(csname)
    local tWords = LongestWordInit(csname)
    local sLongest = ""
    for iKey, sWord in ipairs(tWords) do
        if string.len(sWord) > string.len(sLongest) then
            sLongest = sWord
        end
    end
    return sLongest
end

function TiwaDomination (pPlayer, eReligion, tPlayer, tCity)
	Toldname = csname
	CToldname = LongestWord(csname)
	pPlot = tCity:Plot()
	pt = pPlot:GetTerrainType()
	CTnewname = CToldname .. "marka";
	if pt == TerrainTypes.TERRAIN_DESERT then
		CTnewname = CToldname .. "tambo";
		print ("City on Desert")
	elseif pt == TerrainTypes.TERRAIN_PLAINS then
		CTnewname = CToldname .. "pampa";
		print ("City on Plains")
	elseif pt == TerrainTypes.TERRAIN_GRASS then
		CTnewname = CToldname .. "collo";
		print ("City on Grass")
	elseif pt ==  TerrainTypes.TERRAIN_HILL then
		CTnewname = CToldname .. "marka";
		print ("City on Hills")
	end
	print (CToldname);
	print (CTnewname);
	local Toldname = CToldname;
	local Tnewname = CTnewname;
	tCity:AdoptReligionFully(eReligion);
	FakeCitizens = tCity:GetPopulation();
	FakeCitizens = FakeCitizens / 2;
	tCity:SetPopulation(FakeCitizens, true);
	--pPlayer:AcquireCity(tCity, false, false);
	--Game.DoMinorBuyout(pPlayer, tPlayer);
	for iBuilding in GameInfo.Buildings() do
  		if tCity:IsHasBuilding(iBuilding.ID) then
   			if tCity:GetNumFreeBuilding(iBuilding.ID) < 1 then
				tCity:SetNumRealBuilding(iBuilding.ID, 0)
			end
		end
		tCity:SetNumRealBuilding(bTemple, 1)
		tCity:SetNumRealBuilding(bShrine, 1)
		tCity:SetNumRealBuilding(bColosseum, 1)
	end 
	unit = pPlayer:InitUnit(iUnitTiwa, tCity:GetX(), tCity:GetY(), UNITAI_MERCHANT, DirectionTypes.DIRECTION_SOUTH)
	unit:JumpToNearestValidPlot();
	unit:PopMission()
	unit:PushMission(MissionTypes.MISSION_BUY_CITY_STATE, x, y, 0, 0, 1, MissionTypes.MISSION_BUY_CITY_STATE, unit:GetPlot(), unit)
	tCity:SetName(Tnewname, false)
	tCity:SetNumRealBuilding(bDummy, 0)
	tCity:SetNeverLost(1)
	tCity:SetOccupied(false)
	local numrest = tCity:GetResistanceTurns()
	local restchange = (numrest - numrest - numrest)
	tCity:ChangeResistanceTurns(restchange)
	for _, nPlayer in pairs(Players) do
		if (nPlayer:IsAlive()) then
			local pteamID = pPlayer:GetTeam();
			local pTeam = Teams[pteamID];
			local csteamID = tPlayer:GetTeam();
			local tTeam = Teams[csteamID];
			local notifyteamID = nPlayer:GetTeam();
			local nTeam = Teams[notifyteamID];
			if (nTeam:IsHasMet(tTeam)) then
				if (nTeam:IsHasMet(pTeam)) then
					local title =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCED_NOTIFICATION_TITLE", Toldname);
					local descr =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCED_NOTIFICATION", Toldname, Tnewname);
					if (nPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIWANAKU"]) then
						nPlayer:AddNotification(NotificationTypes.NOTIFICATION_CAPITAL_RECOVERED, descr, title, tCity:GetX(), tCity:GetY());
						else
						nPlayer:AddNotification(NotificationTypes.NOTIFICATION_CAPITAL_LOST, descr, title, tCity:GetX(), tCity:GetY());
					end
				else
					local title =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCED_NOTIFICATION_UNMET_TITLE", Toldname);
					local descr =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCED_NOTIFICATION_UNMET", Toldname, Tnewname);
					nPlayer:AddNotification(NotificationTypes.NOTIFICATION_CAPITAL_LOST, descr, title, tCity:GetX(), tCity:GetY());
				end
			end
		end
		
	end
	--FakeMinorMarriage(pPlayer, tPlayer)
end

function TiwanakuCityStateAward (pPlayer, eReligion, tPlayer, tCity)
	print ( "Minor Civ has met the turn requirement." );
	if pPlayer:IsHuman() then
		-- Here we'll show the Popup!
		TiwaPopup (pPlayer, eReligion, tPlayer, tCity)
	else
		if not (pPlayer:GetMinorCivTrait() == MinorCivTraitTypes.MINOR_CIV_TRAIT_RELIGIOUS) then
			TiwaDomination (pPlayer, eReligion, tPlayer, tCity)
		else
			tCity:SetNumRealBuilding(bDummy, 0)
			tCity:SetNumRealBuilding(bNever, 1)
			tPlayer:ChangeMinorCivFriendshipWithMajor(pPlayer, -30)
		end
	end
end


print ("Check Game Speed and Counter Building")

function TiwanakuGameSpeedCheck (pPlayer, eReligion, tPlayer, tCity)
	speed = Game.GetGameSpeedType();
	local ReligionCount = tCity:GetNumBuilding(bDummy);
	local NeverCondition = tCity:GetNumBuilding(GameInfoTypes.BUILDING_TIWANAKU_NEVER);
	if NeverCondition == 0 then
	print ("Minor civ has been a continuos religious ally for:");
	print ( ReligionCount );
	if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
		if ReligionCount < 12 then
			tCity:SetNumRealBuilding(bDummy, ReligionCount + 1)
		elseif ReligionCount >= 12 then
			TiwanakuCityStateAward (pPlayer, eReligion, tPlayer, tCity)
		end
	elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
		if ReligionCount < 20 then
			tCity:SetNumRealBuilding(bDummy, ReligionCount + 1)
		elseif ReligionCount >= 20 then
			TiwanakuCityStateAward (pPlayer, eReligion, tPlayer, tCity)
		end
	elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
		if ReligionCount < 30 then
			tCity:SetNumRealBuilding(bDummy, ReligionCount + 1)
		elseif ReligionCount >= 30 then
			TiwanakuCityStateAward (pPlayer, eReligion, tPlayer, tCity)
		end
	else
		if ReligionCount < 40 then
			tCity:SetNumRealBuilding(bDummy, ReligionCount + 1)
		elseif ReligionCount >= 40 then
			TiwanakuCityStateAward (pPlayer, eReligion, tPlayer, tCity)
		end
	end

	local Toldname = Locale.ConvertTextKey(tCity:GetName());
	if speed == GameInfo.GameSpeeds['GAMESPEED_QUICK'].ID then
		if ReligionCount == 7 then
			local title =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION_TITLE", Toldname);
			local descr =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION", Toldname);
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MINOR, descr, title, tCity:GetX(), tCity:GetY());
		end
	elseif speed == GameInfo.GameSpeeds['GAMESPEED_STANDARD'].ID then
		if ReligionCount == 15 then
			local title =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION_TITLE", Toldname);
			local descr =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION", Toldname);
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MINOR, descr, title, tCity:GetX(), tCity:GetY());
		end
	elseif speed == GameInfo.GameSpeeds['GAMESPEED_EPIC'].ID then
		if ReligionCount == 25 then
			local title =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION_TITLE", Toldname);
			local descr =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION", Toldname);
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MINOR, descr, title, tCity:GetX(), tCity:GetY());
		end
	else
		if ReligionCount == 35 then
			local title =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION_TITLE", Toldname);
			local descr =  Locale.ConvertTextKey("TXT_KEY_TIWA_INFLUENCE_NOTIFICATION", Toldname);
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_MINOR, descr, title, tCity:GetX(), tCity:GetY());
		end
	end
	end
end

print ("Check City State Religion")

function TiwanakuCityStateReligionCheck (pPlayer, eReligion, tPlayer)
	for tCity in tPlayer:Cities() do
		if tCity:IsCapital() then
			if (tCity:GetReligiousMajority() == eReligion) then
				TiwanakuGameSpeedCheck (pPlayer, eReligion, tPlayer, tCity)
			elseif (tCity:GetReligiousMajority() ~= eReligion) then
				--[[ reset count --]] tCity:SetNumRealBuilding(bDummy, 0)
			end
		end
	end
end

print ("Check City State Friendship")

function TiwanakuCityStateAllyCheck (pPlayer, eReligion)
	for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
		local tPlayer = Players[i];
		if (tPlayer:GetMinorCivFriendshipLevelWithMajor(pPlayer:GetID()) >= 2) then
			TiwanakuCityStateReligionCheck (pPlayer, eReligion, tPlayer)
		elseif (tPlayer:GetMinorCivFriendshipLevelWithMajor(pPlayer:GetID()) < 2) then
			for tCity in tPlayer:Cities() do
				if tCity:IsCapital() then
					--[[ reset count --]] tCity:SetNumRealBuilding(bDummy, 0)
				end
			end
		end
	end
end

print ("Fire for this Civ")

function TiwanakuReligiousAllies(iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer:IsAlive() then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIWANAKU"]) then
			if (pPlayer:HasCreatedReligion()) then
				local eReligion = pPlayer:GetReligionCreatedByPlayer();
				if not (Game.GetNumActiveLeagues() > 0) then 
				TiwanakuCityStateAllyCheck (pPlayer, eReligion)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TiwanakuReligiousAllies)


function TiwanakuUnPuppet(iPlayer)
	pPlayer = Players[iPlayer];
	if pPlayer:IsAlive() then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TIWANAKU"]) then
			for pCity in pPlayer:Cities() do
				pCity:SetPuppet(false)
			end
		end
	end
end

--GameEvents.PlayerDoTurn.Add(TiwanakuUnPuppet)
--Events.SerialEventCityCaptured.Add(TiwanakuUnPuppet)

